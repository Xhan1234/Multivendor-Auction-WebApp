# Generated by Django 5.0.2 on 2024-04-05 09:17

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0031_alter_auction_direct_buy_alter_auction_expired_date_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 12, 9, 17, 35, 58232)),
        ),
    ]