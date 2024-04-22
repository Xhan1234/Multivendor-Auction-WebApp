from django.conf import settings
from django.conf.urls.static import static
from django.urls import path
from . import views


urlpatterns = [
    path('auctions/', views.auctions, name='auctions'),
    path('auction-add', views.auction_add, name='auction-add'),
    path('auction/edit/<str:slug>', views.auction_edit, name='auction-edit'),
    path('auction-details/<str:slug>/', views.auction_details, name='auction-details'),
    path('auction/delete/<str:slug>', views.auction_delete, name='auction-delete'),

    # Auctions
    path('auctions-submit' , views.auctions_submit, name='auctions-submit'),
    path('auctions-mybids/' , views.auctions_mybids, name='auctions-mybids'),
    path('auctions-mybids/details/<str:slug>' , views.auctions_mybids_details, name='auctions-mybids-details'),
    path('auctions-winning', views.winning_bids, name='auctions-winning'),
    path('auctions-closed', views.closedAuctions, name='auction-closed'),

    # Auction Vendor Product List
    path('auctions/vendor/<str:author>', views.auctions_vendor_list, name='auctions-vendor'),
    
    ]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)