# Generated by Django 5.0.2 on 2024-04-06 08:17

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0035_order_balance_type_alter_auction_expired_date_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='transaction',
            name='invoice',
        ),
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 13, 8, 17, 34, 198667)),
        ),
    ]