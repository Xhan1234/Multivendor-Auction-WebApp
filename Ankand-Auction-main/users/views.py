from .forms import CreateUserForm
from django.contrib import messages
from django.contrib.auth import login
from django.contrib.auth.models import Group
from django.shortcuts import render, redirect, get_object_or_404, HttpResponse
from django.urls import reverse
from .models import UserProfile
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from users.forms import EditUserProfileForm
from auctions.models import Auction
from auctions.models import Bidder


def register(request):
    if request.user.is_authenticated:
        # If the user is already authenticated, redirect them to their profile.
        return redirect(reverse('personal_profile', args=[request.user.username]))
    else:
        if request.method == 'POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                username = form.cleaned_data.get('username')
                email = form.cleaned_data.get('email')
                password = form.cleaned_data.get('password1')
                role = form.cleaned_data.get('role')
                business_name = form.cleaned_data.get('business_name')

                # Create a new UserProfile instance using the custom manager
                user = UserProfile.objects.create_user(username=username, email=email, password=password, role=role,
                                                       business_name=business_name)

                # Assign user to the corresponding group based on their role
                if role == 'customer':
                    group_name = 'customer'
                elif role == 'vendor':
                    group_name = 'vendor'
                else:
                    group_name = 'administrator'

                group, created = Group.objects.get_or_create(name=group_name)
                group.user_set.add(user)

                # Note: You don't need to create another UserProfile instance here.
                # You've already created the user with the CustomUserManager.

                login(request, user)
                messages.success(request, 'Account was created for ' + user.username)
                return redirect('dashboard')
        else:
            # If the request method is not POST, display the registration form.
            form = CreateUserForm()

        context = {'form': form}
        return render(request, 'users/auth/register.html', context)


@login_required()
def user_logout(request):
    logout(request)
    return redirect('login')


# def public_profile(request, username):
#     vendor_profile = get_object_or_404(UserProfile, username=username)
#     auctions = auction.objects.filter(author=vendor_profile)
#     return render(request, 'temp-files/store/index.html', {'vendor_profile': vendor_profile, 'auctions': auctions})


@login_required()
def profile(request, username):
    try:
        # Ensure the current user is the one who can edit this profile
        user_profile = UserProfile.objects.get(username=username)
    except UserProfile.DoesNotExist:
        # Handle the case where the requested user profile does not exist or does not belong to the current user
        messages.error(request, 'You do not have permission to edit this profile.')
        return redirect('profile_view')  # Redirect to a suitable view, e.g., user's profile

    if request.method == 'POST':
        form = EditUserProfileForm(request.POST, request.FILES, instance=user_profile)
        if form.is_valid():
            form.save()
            messages.success(request, 'Profile updated successfully.')

            # Check if a 'next' parameter is in the URL
            next_url = request.GET.get('next')
            if next_url and user_profile.is_profile_complete():
                # Redirect the user to the checkout page after profile completion
                return redirect('checkout')

            return redirect('profile', username=username)  # Redirect to a suitable view, e.g., user's profile
    else:
        # Fetch user data and use it to populate the form
        form = EditUserProfileForm(instance=user_profile)

    # Pass the user_profile data to the template
    context = {
        'form': form,
        'user_data': user_profile,  # This provides user data to populate placeholders in the template
    }

    return render(request, 'dashboard/_preview/_profile.html', context)


@login_required()
def dashboard(request):
    user = get_object_or_404(UserProfile, username=request.user)
    auctions = Auction.objects.filter(author=user)
    auction_count = Auction.objects.filter(author=user).count()
    bid_count = Bidder.objects.filter(user=user).count()

    return render(request, 'dashboard/_preview/_dashboard.html',
                  {
                      'user': user, 
                      'auctions': auctions, 
                      'auction_count': auction_count, 
                      'my_bid_count': bid_count,
                      })
