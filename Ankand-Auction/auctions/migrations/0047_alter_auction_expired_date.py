# Generated by Django 5.0.2 on 2024-04-24 11:41

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0046_bidder_paid_status_alter_auction_expired_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 5, 1, 11, 41, 44, 564224)),
        ),
    ]