# Generated by Django 5.0.2 on 2024-03-27 19:53

import datetime
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('auctions', '0018_remove_billingaddress_order_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='shippingaddress',
            name='billing',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='auctions.billingaddress'),
        ),
        migrations.AlterField(
            model_name='auction',
            name='expired_date',
            field=models.DateTimeField(default=datetime.datetime(2024, 4, 3, 19, 53, 4, 823392)),
        ),
    ]
