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
<<<<<<< HEAD
from django.core.validators import MaxValueValidator, MinValueValidator
=======
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388


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
<<<<<<< HEAD

    TYPE_CHOICES = [
        ('', 'Select One'), 
        ('auction', 'Auction'),
        ('buy-it-now', 'Buy-It-Now'),
        ('auction & buy-it-now', 'Auction & Buy-It-Now'),
    ]
=======
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    
    title = models.CharField(max_length=200, null=False , blank=False)
    slug = AutoSlugField(populate_from='title', unique=True)  # Populate from 'title' and ensure uniqueness
    author = models.ForeignKey(UserProfile, on_delete=models.CASCADE, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True)
    description = models.TextField(max_length=200, null=True)
    details_description = models.TextField(max_length=1024, null=True)
<<<<<<< HEAD
    type = models.CharField(max_length=50, choices=TYPE_CHOICES, default='', blank=False, null=False)
    price = models.DecimalField('Auction Starting Price', max_digits=10, decimal_places=2, blank=True, null=True, default=0.00)
    started_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0.00)
    reserve_price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True, default=0.00)
    direct_buy = models.DecimalField('Buy It Now Price', max_digits=10, decimal_places=2, blank=True, null=True, default=0.00)
    bid_increments = models.IntegerField(default=0)
    quantity = models.PositiveIntegerField(default=1, validators=[MinValueValidator(1)])
=======
    price = models.DecimalField(max_digits=10, decimal_places=2,  blank=False)
    latest_bid = models.DecimalField(max_digits=10, decimal_places=2, blank=False, null=True)
    quantity = models.PositiveIntegerField(default=1, null=True, blank=True)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    image = models.ImageField(upload_to='images/')
    image1 = models.ImageField(null=True, blank=True, upload_to='images/')
    image2 = models.ImageField(null=True, blank=True, upload_to='images/')
    condition = models.CharField(max_length=50, choices=CONDITION_CHOICES, default='New')
<<<<<<< HEAD
    started_date = models.DateTimeField(default=timezone.now)
    expired_date = models.DateTimeField(default=datetime.now()+timedelta(days=7))
    status = models.BooleanField(default=True, choices=STATUS_CHOICES)
    open_status = models.IntegerField(default=0)
    closed = models.BooleanField(default=False)
    amount_of_bids = models.IntegerField(default=0)
=======
    date_created = models.DateTimeField(default=timezone.now)
    date_expired = models.DateTimeField(default=datetime.now()+timedelta(days=7))
    status = models.BooleanField(default=True, choices=STATUS_CHOICES)
    closed = models.BooleanField(default=False)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    winnerBid = models.ForeignKey('Bidder', blank=True, null=True, on_delete=models.CASCADE, related_name='winner')
    created_at = models.DateTimeField(default=timezone.now, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    @property
    def expired(self):
<<<<<<< HEAD
        expiry = self.expired_date.replace(tzinfo=None)
=======
        expiry = self.date_expired.replace(tzinfo=None)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
        now = timezone.now().replace(tzinfo=None)
        if now > expiry:
            return True
        return False

    def __str__(self):
<<<<<<< HEAD
        return self.title   
    
    def highest_bid(self):
        return Bidder.objects.filter(item=self).order_by('-bid_amount').first()
=======
        return self.title
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    
    def get_absolute_url(self):
        return reverse('auction-details', kwargs={'slug' : self.slug})
    
<<<<<<< HEAD
    # # override save method
    # def save(self, *args, **kwargs):
    #     # call parent save method
    #     super(Auction, self).save(*args, **kwargs)
    #     img = Image.open(self.image.path)

    #     output_size = (400, 600)
    #     img.thumbnail(output_size)
    #     img.save(self.image.path)


class Bidder(models.Model):
    TYPE_CHOICES = [
        ('auction', 'Auction'),
        ('buy-it-now', 'Buy-It-Now'),
    ]
        
    numeric = RegexValidator(r'^[0-9]*$', 'Only numerics are allowed.')

    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    bid_amount = models.CharField(max_length=255, validators=[numeric])
    winningBid = models.BooleanField(default=False)
    paid_status = models.BooleanField(default=False)
    type = models.CharField(max_length=50, choices=TYPE_CHOICES, default='', blank=False, null=False)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.user.username
=======
    # override save method
    def save(self, *args, **kwargs):
        # call parent save method
        super(Auction, self).save(*args, **kwargs)
        img = Image.open(self.image.path)

        output_size = (600, 800)
        print(output_size)
        img.thumbnail(output_size)
        img.save(self.image.path)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388


class Comment(models.Model):
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.message


<<<<<<< HEAD
class BillingAddress(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
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
    same_as_shipping = models.BooleanField(default=True)
=======
class Bidder(models.Model):
    numeric = RegexValidator(r'^[0-9]*$', 'Only numerics are allowed.')

    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    bid_amount = models.CharField(max_length=255, validators=[numeric])
    winningBid = models.BooleanField(default=False)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
<<<<<<< HEAD
        return f'Billing Address For {self.user}'
    

class ShippingAddress(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    billing = models.ForeignKey(BillingAddress, on_delete=models.CASCADE, blank=True, null=True)
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
        return f'Shipping Address For {self.user}'
=======
        return self.user.username
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388


class Order(models.Model):
    ORDERED ='ordered'
    SHIPPED = 'shipped'

    STATUS_CHOICES = (
        (ORDERED, 'Ordered'),
        (SHIPPED, 'Shipped')
    )

<<<<<<< HEAD
    PAYMENT_METHODS = [
        ('credit_card', 'Credit Card'),
        ('paypal', 'PayPal'),
        ('cash_on_delivery', 'Cash on Delivery'),
    ]

    PRODUCT_TYPE = [
        ('auction', 'Auction'),
        ('direct_buy', 'Direct Buy'),
    ]

    BALANCE_TYPE = [
        ('debit', 'Debit'),
        ('credit', 'Credit'),
    ]


    order_uuid = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False, unique=True, db_index=True)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    billing = models.ForeignKey(BillingAddress, on_delete=models.CASCADE, blank=True, null=True)
    payment_method = models.CharField(max_length=20, choices=PAYMENT_METHODS, blank=True, null=True)
    product_type = models.CharField(max_length=20, choices=PRODUCT_TYPE, blank=True, null=True)
    quantity = models.PositiveIntegerField()
    paid = models.BooleanField(default=False)
    paid_amount = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    balance_type = models.CharField(max_length=20, choices=BALANCE_TYPE, blank=True, null=True)
=======
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField()
    paid = models.BooleanField(default=False)
    paid_amount = models.IntegerField(blank=True, null=True)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default=ORDERED)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
<<<<<<< HEAD
        return str(self.order_uuid)


class AutoIncrementNumberField(models.CharField):
    def __init__(self, prefix='', *args, **kwargs):
        self.prefix = prefix
        super().__init__(*args, **kwargs)

    def pre_save(self, model_instance, add):
        if add:
            last_object = model_instance.__class__.objects.order_by('-id').first()
            if last_object:
                last_number = int(last_object.__dict__[self.attname][len(self.prefix):])
                new_number = last_number + 1
            else:
                new_number = 1
            setattr(model_instance, self.attname, f'{self.prefix}{new_number}')
            return f'{self.prefix}{new_number}'
        return super().pre_save(model_instance, add)


class Invoice(models.Model):
    ORDERED ='ordered'
    SHIPPED = 'shipped'

    STATUS_CHOICES = (
        (ORDERED, 'Ordered'),
        (SHIPPED, 'Shipped')
    )

    invoice_no = AutoIncrementNumberField(prefix='INVOICE-', max_length=20, unique=True)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default=ORDERED)
=======
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
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
<<<<<<< HEAD
        return f'{self.invoice_no}'
    

class Transaction(models.Model):
    PRODUCT_TYPE = [
        ('auction', 'Auction'),
        ('direct_buy', 'Direct Buy'),
    ]

    BALANCE_TYPE = [
        ('debit', 'Debit'),
        ('credit', 'Credit'),
    ]

    transaction_id = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE, blank=True, null=True, related_name='user')
    author = models.ForeignKey(UserProfile, on_delete=models.CASCADE, blank=True, null=True, related_name='author')
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE, blank=True, null=True)
    order = models.ForeignKey(Order, on_delete=models.CASCADE, blank=True, null=True)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    paid = models.BooleanField(default=False)
    product_type = models.CharField(max_length=20, choices=PRODUCT_TYPE, blank=True, null=True)
    balance_type = models.CharField(max_length=20, choices=BALANCE_TYPE, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return f'Transaction for {self.auction.title}'
    


class Review(models.Model):
    product = models.ForeignKey(Auction, on_delete=models.CASCADE)
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    comment = models.TextField(max_length=1000)
    rate = models.FloatField(default=0)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
        return self.user.username
    

class Notification(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE)
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    message = models.TextField()
    link = models.CharField(max_length=20, blank=True, null=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    is_read = models.BooleanField(default=False)
    mail_sent = models.BooleanField(default=False)
=======
        return f'Shipping Address For {self.order}'


class Transaction(models.Model):
    transaction_id = models.UUIDField(default=uuid.uuid4, unique=True, editable=False)
    customer = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='customer_transactions', verbose_name='Customer')
    vendor = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name='vendor_transactions', verbose_name='Vendor')
    auction = models.ForeignKey(Auction, on_delete=models.CASCADE)
    auction_title = models.CharField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=2)
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated_at = models.DateTimeField(auto_now=True, null=True, blank=True)

    def __str__(self):
<<<<<<< HEAD
        return self.message
=======
        return f'Transaction for {self.auction_title}'
>>>>>>> 41ce99e8504ce1f6a33fea582ca514a77751c388
