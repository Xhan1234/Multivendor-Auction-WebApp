from django.shortcuts import render, redirect, get_object_or_404
<<<<<<< HEAD
from .models import Message, MessageDetails
from .forms import MessageForm
from django.contrib.auth.decorators import login_required
from users.models import UserProfile
from datetime import datetime
from django.db.models import Q, Count
from django.http import Http404, HttpResponseForbidden, HttpResponse
from django.http import HttpResponseRedirect
from django.contrib import messages


# Create your views here.
@login_required()
def index(request):
    message_list = Message.objects.filter(Q(sender=request.user) | Q(recipient=request.user)).order_by('created_at')    
    message_list = message_list.annotate(unread=Count('messagedetails', filter=Q(messagedetails__read=False, messagedetails__recipientdetails=request.user)))

    return render(request, 'messaging/index.html', {
        'message_list': message_list
    })

def message_details(request, id):
    msg = Message.objects.get(id=id)
    message_details = MessageDetails.objects.filter(message=msg).order_by('created_at')  
    message_list = Message.objects.filter(Q(sender=request.user) | Q(recipient=request.user)).order_by('created_at')
    message_list = message_list.annotate(unread=Count('messagedetails', filter=Q(messagedetails__read=False, messagedetails__recipientdetails=request.user)))

    last = message_details.last()
    if last.recipientdetails == request.user:
        # Save read true
        msg.sender_read = True
        msg.recipient_read = True
        msg.save()

        # Iterate through each message and print the unread count
        for details in message_details:
            details.read = True
            details.save()

    context = {
        'message': msg,
        'message_list': message_list,
        'message_details': message_details,
    }

    return render(request, 'messaging/index.html', context)



def message_post(request, id):
    msg = Message.objects.get(id=id)
    message_details = MessageDetails.objects.filter(message=msg).order_by('created_at')  
    message_list = Message.objects.filter(Q(sender=request.user) | Q(recipient=request.user)).order_by('created_at')
    message_list = message_list.annotate(unread=Count('messagedetails', filter=Q(messagedetails__read=False, messagedetails__recipientdetails=request.user)))

    if request.method == 'POST':
        message_details_text = request.POST.get('message_details')
        if message_details_text:
            if msg.sender == request.user:
                MessageDetails.objects.create(
                    message=msg,
                    message_details=message_details_text,
                    senderdetails=request.user,
                    recipientdetails=msg.recipient
                )
                msg.recipient_read = False
                msg.sender_read = True
                msg.save()
            else:
                MessageDetails.objects.create(
                    message=msg,
                    message_details=message_details_text,
                    senderdetails=request.user,
                    recipientdetails=msg.sender
                )
                msg.recipient_read = True
                msg.sender_read = False
                msg.save()

            messages.success(request, f"Message has been sent!")

    context = {
        'message': msg,
        'message_list': message_list,
        'message_details': message_details,
    }

    return render(request, 'messaging/index.html', context)



def message_delete(request, id):
    try:
        msg = Message.objects.get(id=id)
        msg.delete()
    except msg.DoesNotExist:
        raise Http404("Msg does not exist")

    message_list = Message.objects.filter(Q(sender=request.user) | Q(recipient=request.user)).order_by('created_at')    
    message_list = message_list.annotate(unread=Count('messagedetails', filter=Q(messagedetails__read=False, messagedetails__recipientdetails=request.user)))

    return render(request, 'messaging/index.html', {
        'message_list': message_list
    })
=======
from .models import Message, Reply, Chat
from .forms import MessageForm, ReplyForm
from django.contrib.auth.decorators import login_required
from users.models import UserProfile
from datetime import datetime
from django.db.models import Q
from django.http import Http404, HttpResponseForbidden
from django.http import HttpResponseRedirect


# Create your views here.

# @login_required(login_url='/log-in/')
def index(request):
    # Retrieve all messages (inbox and outbox) for the current user, ordered by the latest message.
    messages = Message.objects.filter(Q(sender=request.user) | Q(recipient=request.user)).order_by('-created_at')

    return render(request, 'chat/index.html', {
        'messages': messages,
    })


@login_required(login_url='/log-in/')
def inbox(request):
    inbox = 'Inbox'
    outbox = 'Outbox'

    # Retrieve messages where the current user is either the sender or the recipient
    messages = Message.objects.filter(Q(sender=request.user) | Q(recipient=request.user)).order_by('-created_at')

    # Create a list of auction titles corresponding to each message
    auction_titles = [message.auction_title for message in messages]

    return render(request, 'chat/inbox.html', {
        'inbox': inbox,
        'outbox': outbox,
        'messages': messages,
        'auction_titles': auction_titles  # Pass the list of auction titles to the context
    })


@login_required(login_url='/log-in/')
def outbox(request):
    # Retrieve messages sent by the current user
    sent_messages = Message.objects.filter(sender=request.user).order_by('-created_at')

    return render(request, 'chat/outbox.html', {
        'sent_messages': sent_messages,
    })


@login_required(login_url='/log-in/')
def send_message(request, author_id, auction_title, auction_id):
    author = get_object_or_404(UserProfile, id=author_id)
    author_username = author.username

    if request.method == 'POST':
        form = MessageForm(request.POST)
        if form.is_valid():
            # Create a new message and set its attributes
            message = Message()
            message.auction_title = form.cleaned_data['auction_title']
            message.subject = form.cleaned_data['subject']
            message.message = form.cleaned_data['message']
            message.sender = request.user
            message.recipient = author
            message.created_at = datetime.now()
            message.save()

            # Create a new chat associated with the message
            chat = Chat.objects.create()
            chat.participants.add(request.user, author)  # Add participants to the chat

            # Associate the chat with the message and save it
            message.chat = chat
            message.save()

            return redirect('read_message', chat_id=chat.id)

    else:
        form = MessageForm()

    return render(request, 'temp-files/message_1/index.html', {
        'title': 'Send Message',
        'form': form,
        'author_username': author_username,
        'auction_title': auction_title,
        'auction_id': auction_id,


    })




@login_required(login_url='/log-in/')
def read_message(request, chat_id):
    title = "Read message"

    # Retrieve the chats related to the chat_id using get_object_or_404
    chats = get_object_or_404(Chat, id=chat_id)

    # Check if the user is a participant in this chat
    can_reply = chats.participants.filter(id=request.user.id).exists()


    participants = chats.participants.all()
    if request.user not in participants:
        # If the user is not a participant, handle it accordingly
        return HttpResponseForbidden("You do not have permission to access this chat.")

    # Initialize form variable
    form = ReplyForm()

    if not can_reply:
        # If the user is not a participant, handle it accordingly, e.g., return an error message or redirect
        messages = None  # Initialize messages as None
        replies = None  # Initialize replies as None
    else:
        # Retrieve messages related to the chat, ordered by created_at
        messages = chats.message_set.all().order_by('created_at')
        replies = Reply.objects.filter(message=messages.first()).order_by('created_at')


    if request.method == 'POST':
        form = ReplyForm(request.POST)
        if form.is_valid():
            reply = form.save(commit=False)
            reply.author = request.user  # Set the author
            reply.message = messages.first()
            reply_to_id = request.POST.get('reply_to_id')
            if reply_to_id:
                try:
                    reply_to = Reply.objects.get(id=reply_to_id)
                    reply.reply_to = reply_to
                except Reply.DoesNotExist:
                    raise Http404("Reply not found")
            else:
                reply.reply_to = None
            reply.save()
            form = ReplyForm()  # Clear the form after a successful reply

            return HttpResponseRedirect(request.path)  # This line redirects to the current page (PRG pattern)
        else:
            print(form.errors)

    return render(request, 'chat/read.html', {
        'title': title,
        'chats': chats,
        'messages': messages,
        'replies': replies,
        'form': form,  # Include the form in the context
        'can_reply': can_reply
    })
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
