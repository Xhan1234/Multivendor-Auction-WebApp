# Generated by Django 5.0.2 on 2024-03-30 10:25

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0023_alter_auction_expired_date_alter_invoice_invoice_no'),
    ]

    operations = [
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 6, 10, 25, 23, 214295)),
        ),
    ]
