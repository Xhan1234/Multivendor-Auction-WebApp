from django.db.models.signals import post_save
from django.dispatch import receiver
<<<<<<< HEAD
from .models import Order, Transaction, Invoice
from django.db.models.signals import pre_save
=======
from .models import Order, Transaction
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388

@receiver(post_save, sender=Order)
def create_transaction(sender, instance, created, **kwargs):
    if created:
        # A new order has been created, so create a transaction record here
        # You can access the order details like instance.auction, instance.user, etc.
        # Create a new model (Transaction) to store this data, if needed
        # Example:
<<<<<<< HEAD
        try:
            # Create a new transaction record
            transaction = Transaction(
                user=instance.user,
                author=instance.auction.author,
                auction=instance.auction,
                price=instance.paid_amount,
                order=instance,
                paid=True,
                product_type=instance.product_type,
                balance_type=instance.balance_type
            )
            transaction.save()

            # Update the 'transaction' attribute on the order instance
            instance.transaction = transaction
            instance.save()

        except Exception as e:
            # Handle any exceptions here (e.g., log the error)
            print(f"Error creating transaction: {e}")


@receiver(pre_save, sender=Invoice)
def increment_unique_number(sender, instance, **kwargs):
    if instance.invoice_no:
        instance.invoice_no = instance.invoice_no.pre_save(instance, kwargs.get('raw', False))
        
=======
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
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
