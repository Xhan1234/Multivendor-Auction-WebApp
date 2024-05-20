from django.urls import path
from . import views

urlpatterns = [
    path('messages/', views.index, name='message'),
<<<<<<< HEAD
    path('messages/<str:id>', views.message_details, name='message-details'),
    path('messages-post/<str:id>', views.message_post, name='message-post'),
    path('messages-delete/<str:id>', views.message_delete, name='message-delete'),
=======
    path('messages/inbox/', views.inbox, name='inbox'),
    path('messages/outbox/', views.outbox, name='outbox'),
    path('send_message/<int:author_id>/<str:auction_title>/<int:auction_id>/', views.send_message, name='send_message'),
    path('read_message/<int:chat_id>/', views.read_message, name='read_message'),
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
]
