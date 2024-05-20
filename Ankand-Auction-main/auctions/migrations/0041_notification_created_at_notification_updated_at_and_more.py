# Generated by Django 5.0.2 on 2024-04-08 19:08

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0040_alter_auction_expired_date'),
    ]

    operations = [
        migrations.AddField(
            model_name='notification',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
        migrations.AddField(
            model_name='notification',
            name='updated_at',
            field=models.DateTimeField(auto_now=True, null=True),
        ),
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 15, 19, 8, 8, 795953)),
        ),
    ]
