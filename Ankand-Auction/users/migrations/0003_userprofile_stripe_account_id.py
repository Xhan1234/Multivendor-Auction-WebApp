# Generated by Django 5.0.2 on 2024-04-25 08:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_userprofile_paypal_recipient_email'),
    ]

    operations = [
        migrations.AddField(
            model_name='userprofile',
            name='stripe_account_id',
            field=models.CharField(blank=True, max_length=150, null=True),
        ),
    ]