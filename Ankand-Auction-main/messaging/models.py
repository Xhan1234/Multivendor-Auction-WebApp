from django.db import models
from users.models import UserProfile
<<<<<<< HEAD
from auctions.models import Auction


class Message(models.Model):
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE, null=False, blank=False, default='')
    sender = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Sender")
    sender_read = models.BooleanField(default=True)
    recipient = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Receiver")
    recipient_read = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.recipient.username

class MessageDetails(models.Model):
    message = models.ForeignKey(Message, on_delete=models.CASCADE)
    message_details = models.TextField()
    senderdetails = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Senderdetails", null=True, blank=True)
    recipientdetails = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Receiverdetails", null=True, blank=True)
    read = models.BooleanField(default=False)
    status = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.message_details
=======

class Chat(models.Model):
    participants = models.ManyToManyField(UserProfile, related_name='chats')


class Message(models.Model):
    chat = models.ForeignKey(Chat, on_delete=models.CASCADE, null=True, blank=True)
    subject = models.CharField(max_length=255)
    message = models.TextField()
    auction_title = models.CharField(max_length=200, null=False, blank=False)
    sender = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Sender")
    recipient = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Receiver")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.subject

class Reply(models.Model):
    message = models.ForeignKey(Message, on_delete=models.CASCADE)
    text = models.TextField()
    author = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="Author")
    created_at = models.DateTimeField(auto_now_add=True)
    reply_to = models.ForeignKey('self', null=True, blank=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.text

    class Meta:
        ordering = ['created_at']





>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
