from django.contrib import admin
from .models import *

class AuctionAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'date_expired', 'closed', 'status', 'author')
    list_filter = ('status', 'author')# Define the fields to display in the admin list view
    readonly_fields = ('created_at', 'updated_at',)

    def author_name(self, obj):
        return obj.author.business_name  # Replace 'business_name' with the actual field name in the UserProfile model that stores the author's name

    author_name.short_description = 'Author'  # Set a custom column header for the author's name

class TransactionAdmin(admin.ModelAdmin):
    list_display = ('customer', 'vendor', 'auction', 'auction_title', 'price', 'created_at', 'transaction_id')
    list_filter = ('customer', 'vendor', 'created_at')
    readonly_fields = ('created_at', 'updated_at',)


class AuctionBidder(admin.ModelAdmin):
    list_display = ('auction', 'user', 'bid_amount')
    readonly_fields = ('created_at', 'updated_at',)
    
admin.site.register(Auction, AuctionAdmin)  # Register the auction model with the custom admin class
admin.site.register(ShippingAddress)
admin.site.register(Order)
admin.site.register(Transaction, TransactionAdmin)
admin.site.register(Bidder, AuctionBidder)
admin.site.register(Comment)
admin.site.register(Category)