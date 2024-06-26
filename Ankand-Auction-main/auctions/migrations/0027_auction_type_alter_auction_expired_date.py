# Generated by Django 5.0.2 on 2024-04-01 10:18

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0026_alter_auction_expired_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='auction',
            name='type',
            field=models.CharField(choices=[('', 'Select One'), ('auction', 'Auction'), ('buy-it-now', 'Buy-It-Now'), ('auction & buy-it-now', 'Auction & Buy-It-Now')], default='', max_length=50),
        ),
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 8, 10, 18, 11, 87975)),
        ),
    ]
