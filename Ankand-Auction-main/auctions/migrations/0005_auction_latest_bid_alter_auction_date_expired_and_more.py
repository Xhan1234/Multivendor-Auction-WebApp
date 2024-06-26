# Generated by Django 5.0.2 on 2024-03-14 19:15

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0004_alter_auction_date_expired'),
    ]

    operations = [
        migrations.AddField(
            model_name='auction',
            name='latest_bid',
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='auction',
            name='date_expired',
            field=models.DateTimeField(default=datetime.datetime(2024, 3, 21, 19, 15, 5, 721863)),
        ),
        migrations.AlterField(
            model_name='auction',
            name='quantity',
            field=models.PositiveIntegerField(blank=True, default=1, null=True),
        ),
    ]
