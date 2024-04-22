from .models import *
from django import forms
from django.forms import ModelForm
from users.widgets import StateWidget, CityWidget


class CreateauctionForm(ModelForm):
    class Meta:
        model = Auction
        fields = ['title', 'category', 'description', 'details_description', 'price', 'quantity', 'image', 'image1', 'image2', 'condition', 'date_created', 'date_expired', 'status']


class OrderForm(forms.Form):
    auction_id = forms.IntegerField(widget=forms.HiddenInput())
    quantity = forms.IntegerField(min_value=1)
    paid_amount = forms.IntegerField()
    first_name = forms.CharField()
    last_name = forms.CharField()
    phone = forms.CharField()
    email = forms.CharField()
    street = forms.CharField()
    state = forms.CharField()
    house = forms.CharField()
    postal_code = forms.CharField()
    zip_code = forms.CharField()
    address=forms.CharField()


class CommentForm(forms.Form):
    comment = forms.CharField(widget=forms.Textarea)


class ShippingAddressForm(forms.ModelForm):
    class Meta:
        model = ShippingAddress
        fields = ['first_name', 'last_name', 'address', 'phone', 'state', 'city', 'street', 'zip_code','postal_code', 'house']
        widgets = {
            'phone': forms.TextInput(attrs={'class': 'form-control'}),
            'state': StateWidget(),  # Use the custom StateWidget for the 'state' field
            'city': CityWidget(),    # Use the custom CityWidget for the 'city' field
        }
        