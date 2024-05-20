# Generated by Django 5.0.2 on 2024-03-24 17:43

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0014_alter_auction_expired_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='auction',
            name='direct_buy',
            field=models.DecimalField(decimal_places=2, max_digits=10, null=True),
        ),
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 3, 31, 17, 43, 37, 565002)),
        ),
    ]
