import uuid
from django.db import models
from django.utils import timezone
from datetime import datetime, timedelta
from autoslug import AutoSlugField
from users.models import UserProfile
from phonenumber_field.modelfields import PhoneNumberField
from PIL import Image
from django.urls import reverse
from django.core.validators import *


class Category(models.Model):
    STATUS_CHOICES = [
        (True, 'Active'),
        (False, 'Deactive'),
    ]
    DEFAULT = 'icons/314870_edit_clipboard_icon.svg'

    title = models.CharField(max_length=200, null=False , blank=False)
    slug = AutoSlugField(populate_from='title', unique=True)  # Populate from 'title' and ensure uniqueness
    status = models.BooleanField(default=True, choices=STATUS_CHOICES)
    icon = models.FileField(upload_to="icons", validators=[FileExtensionValidator(['svg'])], null=True, blank=True, default=DEFAULT)
    created_at = models.DateTimeField(default=timezone.now, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.title



class Auction(models.Model):
    STATUS_CHOICES = [
        (True, 'Active'),
        (False, 'Deactive'),
    ]

    CONDITION_CHOICES = [
        ('New', 'New'),
        ('Used', 'Used'),
        ('Brand New', 'Brand New'),
        ('Like New', 'Like New'),
        ('Very Good', 'Very Good'),
        ('New with tags', 'New with tags'),
        ('New without tags', 'New without tags'),
        ('New with defects', 'New with defects'),
        ('For parts or not working', 'FCR parts or not working'),
        ('Seller refurbished', 'Seller refurbished'),
    ]
    
    title = models.CharField(max_length=200, null=False , blank=False)
    slug = AutoSlugField(populate_from='title', unique=True)  # Populate from 'title' and ensure uniqueness
    author = models.ForeignKey(UserProfile, on_delete=models.CASCADE, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    description = models.TextField(max_length=200, null=True)
    details_description = models.TextField(max_length=1024, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2,  blank=False)
    latest_bid = models.DecimalField(max_digits=10, decimal_places=2, blank=False, null=True)
    quantity = models.PositiveIntegerField(default=1, null=True, blank=True)
    image = models.ImageField(upload_to='images/')
    image1 = models.ImageField(null=True, blank=True, upload_to='images/')
    image2 = models.ImageField(null=True, blank=True, upload_to='images/')
    condition = models.CharField(max_length=50, choices=CONDITION_CHOICES, default='New')
    date_created = models.DateTimeField(default=timezone.now)
    date_expired = models.DateTimeField(default=datetime.now()+timedelta(days=7))
    status = models.BooleanField(default=True, choices=STATUS_CHOICES)
    closed = models.BooleanField(default=False)
    winnerBid = models.ForeignKey('Bidder', blank=True, null=True, on_delete=models.CASCADE, related_name='winner')
    created_at = models.DateTimeField(default=timezone.now, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    @property
    def expired(self):
        expiry = self.date_expired.replace(tzinfo=None)
        now = timezone.now().replace(tzinfo=None)
        if now > expiry:
            return True
        return False

    def __str__(self):
        return self.title
    
    def get_absolute_url(self):
        return reverse('auction-details', kwargs={'slug' : self.slug})
    
    # override save method
    def save(self, *args, **kwargs):
        # call parent save method
        super(Auction, self).save(*args, **kwargs)
        img = Image.open(self.image.path)

        output_size = (600, 800)
        print(output_size)
        img.thumbnail(output_size)
        img.save(self.image.path)


class Comment(models.Model):
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.message


class Bidder(models.Model):
    numeric = RegexValidator(r'^[0-9]*$', 'Only numerics are allowed.')

    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    bid_amount = models.CharField(max_length=255, validators=[numeric])
    winningBid = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.user.username


class Order(models.Model):
    ORDERED ='ordered'
    SHIPPED = 'shipped'

    STATUS_CHOICES = (
        (ORDERED, 'Ordered'),
        (SHIPPED, 'Shipped')
    )

    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    paid = models.BooleanField(default=False)
    paid_amount = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default=ORDERED)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return f'Purchase of {self.quantity} {self.auction.title}'
    

class ShippingAddress(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    email = models.EmailField(blank=True, null=True)  # Include email as a separate field
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    address = models.TextField(blank=True, null=True, default='')
    state = models.CharField(max_length=100, blank=True, null=True, default='')
    city = models.CharField(max_length=100, blank=True, null=True, default='')
    street = models.CharField(max_length=150, blank=True, null=True, default='')
    house = models.CharField(max_length=150, blank=True, null=True, default='')
    zip_code = models.CharField(max_length=10, blank=True, null=True, default='')
    postal_code = models.CharField(max_length=10, blank=True, null=True, default='')
    phone = PhoneNumberField(default='')
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return f'Shipping Address For {self.order}'


class Transaction(models.Model):
    transaction_id = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    customer = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='customer_transactions', verbose_name='Customer')
    vendor = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='vendor_transactions', verbose_name='Vendor')
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    auction_title = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return f'Transaction for {self.auction_title}'
