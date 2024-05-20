from django.contrib import admin
<<<<<<< HEAD
from .models import Message, MessageDetails

# Register your models here.
admin.site.register(Message)
admin.site.register(MessageDetails)
=======
from .models import Message, Reply, Chat

# Register your models here.
admin.site.register(Message)
admin.site.register(Reply)
admin.site.register(Chat)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
