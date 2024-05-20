# Generated by Django 5.0.2 on 2024-03-26 11:19

import datetime
import django.db.models.deletion
import phonenumber_field.modelfields
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0015_auction_direct_buy_alter_auction_expired_date'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 2, 11, 19, 47, 518542)),
        ),
        migrations.CreateModel(
            name='BillingAddress',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(blank=True, max_length=254, null=True)),
                ('first_name', models.CharField(max_length=150)),
                ('last_name', models.CharField(max_length=150)),
                ('address', models.TextField(blank=True, default='', null=True)),
                ('state', models.CharField(blank=True, default='', max_length=100, null=True)),
                ('city', models.CharField(blank=True, default='', max_length=100, null=True)),
                ('street', models.CharField(blank=True, default='', max_length=150, null=True)),
                ('house', models.CharField(blank=True, default='', max_length=150, null=True)),
                ('zip_code', models.CharField(blank=True, default='', max_length=10, null=True)),
                ('postal_code', models.CharField(blank=True, default='', max_length=10, null=True)),
                ('phone', phonenumber_field.modelfields.PhoneNumberField(default='', max_length=128, region=None)),
                ('same_as_shipping', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]