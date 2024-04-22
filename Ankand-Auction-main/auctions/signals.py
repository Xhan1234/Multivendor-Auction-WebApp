from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Order, Transaction

@receiver(post_save, sender=Order)
def create_transaction(sender, instance, created, **kwargs):
    if created:
        # A new order has been created, so create a transaction record here
        # You can access the order details like instance.auction, instance.user, etc.
        # Create a new model (Transaction) to store this data, if needed
        # Example:
        transaction = Transaction(
            customer=instance.user,
            vendor=instance.auction.author,
            auction=instance.auction,
            auction_title=instance.auction.title,
            price=instance.auction.price,
        )
        transaction.save()
        instance.transaction = transaction
        instance.save()
