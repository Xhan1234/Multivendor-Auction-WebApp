# Generated by Django 5.0.2 on 2024-03-12 09:05

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0003_alter_slider_descriptions'),
    ]

    operations = [
        migrations.AlterField(
            model_name='slider',
            name='status',
            field=models.BooleanField(choices=[(True, 'Active'), (False, 'Deactive')], default=True),
        ),
    ]
