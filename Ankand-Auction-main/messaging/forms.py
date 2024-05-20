from django import forms
<<<<<<< HEAD
from .models import Message
=======
from .models import Message, Reply
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388


class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
<<<<<<< HEAD
        fields = ['auction']
=======
        fields = ['auction_title', 'subject', 'message']


class ReplyForm(forms.ModelForm):
    class Meta:
        model = Reply
        fields = ('text', 'reply_to')


>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
