import io
from PIL import Image
from django.contrib.auth.decorators import login_required
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.http import Http404
from django.shortcuts import render, redirect, get_object_or_404, HttpResponse
from django.utils import timezone
from django.urls import reverse
from .forms import CreateauctionForm, OrderForm
from .models import Auction, Order, ShippingAddress, Bidder, Comment
from django.contrib.auth.models import Group
from django.contrib.auth.decorators import permission_required
from django.contrib import messages
from decimal import Decimal
from django.db import transaction
from django.template.loader import get_template
from xhtml2pdf import pisa
from users.models import UserProfile
from django.http import Http404
from django.http import HttpResponseRedirect
from django.conf import settings
from django.core.mail import send_mail
from users.decorators import vendor_required, customer_required, profile_complete_required
from django.core.paginator import Paginator


# auctions Lists
@vendor_required
def auctions(request):
    auctions = Auction.objects.filter(author=request.user).order_by('-id')
    paginator = Paginator(auctions, 10) # Show 10 items per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'page_obj': page_obj,
        'is_paginated': paginator.num_pages > 1
    }

    return render(request, 'dashboard/_preview/_auctions.html', context)


# Create auction
@login_required
@vendor_required
def auction_add(request):
    # Check if the user belongs to the "vendor" group
    vendor_group = Group.objects.get(name='vendor')
    # return HttpResponse(vendor_group)
    is_vendor = vendor_group in request.user.groups.all()

    if is_vendor:
        print("User is a vendor")
        # Your existing code for handling vendor user
    else:
        print("User is not a vendor")
        # Your code for non-vendor users

    if request.method == 'POST':
        if is_vendor:  # Check if the user is a vendor before processing the form
            form = CreateauctionForm(request.POST, request.FILES)
            if form.is_valid():
                auction = form.save(commit=False)
                auction.author = request.user

                # # Open the uploaded image using Pillow
                # image = Image.open(auction.image)
                
                # # Resize and optimize the image
                # # For example, resize to maximum dimensions of 800x600
                # image.thumbnail((1920, 814), Image.ANTIALIAS)
                
                # # Save the optimized image
                # image.save(auction.image.path)
                
                auction.save()
                return redirect('auctions')
        else:
            return redirect('personal_profile', username=request.user.username)  # Redirect to a different dashboard for non-vendor users

    else:
        form = CreateauctionForm()

    return render(request, 'auctions/index.html', {'form': form, 'is_vendor': is_vendor})


# Update auction
@login_required
def auction_edit(request, slug):
    auction = get_object_or_404(Auction, slug=slug)
    if request.method == 'POST':
        form = CreateauctionForm(request.POST, request.FILES, instance=auction)
        if form.is_valid():
            auction = form.save(commit=False)
            auction.save()

            status = request.POST.get("status")
            if status == 'True':
                # Update the specific field
                auction_open = get_object_or_404(Auction, slug=slug)
                auction_open.closed = False
                # Save the object
                auction_open.save()
            return redirect('auctions')
    else:
        form = CreateauctionForm(instance=auction)
    return render(request, 'auctions/index.html', {'form': form, 'auction': auction})


# Delete auction
@login_required
def auction_delete(request, slug):
    try:
        auction = Auction.objects.get(slug=slug)
        auction.delete()
    except auction.DoesNotExist:
        raise Http404("auction does not exist")
    return redirect('auctions')

# Read auction
# views.py
@login_required
def auction_details(request, slug):
    auction = get_object_or_404(Auction, slug=slug)
    user = request.user

    # a comment was sent to the owner, create a comment object and save it
    if request.method == 'POST':
        message = request.POST.get("comment")
        Comment.objects.create(user=user, auction=auction, message=message)
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

    if not auction.slug:  # Check if the slug is empty
        raise Http404("auction does not exist")

    # Pass the auction title to the context
    auction_title = auction.title
    auction_id = auction.id
    comments = Comment.objects.filter(auction=auction_id, user=user).order_by('created_at')

    context = {
        'auction': auction, 
        'auction_title': auction_title, 
        'auction_id': auction_id, 
        'comments': comments
        }    
    return render(request, 'auctions/details.html', context)


@profile_complete_required
def auctions_submit(request):
    if request.method == 'POST':
        user = request.user
        bid_price = request.POST.get('bid_price')
        print(bid_price)
        auction_id = request.POST.get('auction_id')
        auction = Auction.objects.filter(id=auction_id)
        already_bid = Bidder.objects.filter(user=user, auction=auction[0])

        if auction[0].author == user:
            messages.error(request, "You cannot Bid your own auction!")
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

        if already_bid:
            messages.error(request, f"You already Bid this auction!")
            return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
        
        if auction[0].price < float(bid_price):
            if auction[0].latest_bid is not None and auction[0].latest_bid < float(bid_price):
                bid = Bidder(auction=auction[0], user=user, bid_amount=bid_price)
                bid.save()

                # Update the specific field
                auction_bid = get_object_or_404(Auction, id=auction_id)
                auction_bid.latest_bid = bid_price
                auction_bid.save()

                return redirect("auctions-mybids")
        
        messages.error(request, f"Bid Price must be more the auction Price! Your Bid is ${bid_price}.")

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))


def auctions_mybids(request):
    user = request.user
    mybids = Bidder.objects.filter(user=user)
    return render(request, 'auctions/auctions/index.html', {'mybids': mybids})


def auctions_mybids_details(request, slug):
    auction = get_object_or_404(Auction, slug=slug)
    user = request.user
    mybids = Bidder.objects.get(auction=auction, user=user)
    # return HttpResponse(mybids.auction.slug)
    return render(request, 'auctions/auctions/details.html', {'mybids': mybids})


def winning_bids(request):
    # Pass all auctions that I won here...
    # First find all those that are closed
    auctions = Auction.objects.filter(closed=True)
    # Now find the winningBid is equal to me
    myWins = []
    for aucs in auctions:
        # Are there any winning bids on this auction?
        if aucs.winnerBid:
            # Am i the winning bid?
            if aucs.winnerBid.user == request.user:
                myWins.append(aucs)

    context = {
        'myWins' : myWins
    }
    return render(request, 'auctions/auctions/winner.html', context)

def closedAuctions(request):
    checkAuctions()
    items = Auction.objects.filter(closed=True).order_by('-id')

    paginator = Paginator(items, 10) # Show 10 items per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'page_obj': page_obj,
        'is_paginated': paginator.num_pages > 1
    }

    return render(request, 'auctions/auctions/closed.html', context)


def auctions_vendor_list(request, author):
    items = Auction.objects.filter(closed=False, author__username=author)

    paginator = Paginator(items, 15)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'author': author,
        'page_obj': page_obj,
        'is_paginated': paginator.num_pages > 1
    }

    return render(request, 'auctions/auctions/vendor/index.html', context)


# This gets called whenever we want to check the auctions if theyre closed or finished etc..
def checkAuctions():
    auctions = Auction.objects.all()
    bids = Bidder.objects.all()
    valid_auctions = []
    sendMail = False
    subject = ""
    message = ""
    email_from = settings.EMAIL_HOST_USER
    recipient_list = ["",]
    for auc in auctions:
        if auc.expired and auc.closed == False:
            auc.closed = True
            auc.status = False
            # Set the last bid on here to maxed out and save it into auction
            last_bid = bids.filter(auction=auc).last()
            if last_bid is not None:
                auc.winnerBid = last_bid
                last_bid.winningBid = True
                last_bid.save()
                sendMail = True
            auc.save()
            # Sending the user email when they have won
            if sendMail:
                    subject = 'Won auction - ' + str(auc.title)
                    message = 'Congratulations on winning the auction titled ' + str(auc.title) + " please pay the user " + str(auc.author.username) + ", the sum of £" + str(auc.price) + "."

                    email_from = settings.EMAIL_HOST_USER
                    recipient_list = [last_bid.user.email,]
                    try:
                        send_mail( subject, message, email_from, recipient_list )
                    except:
                        pass
        else:
            valid_auctions.append(auc)
    
    return valid_auctions