# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-10-05 08:04
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0003_cart_unit'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='image',
            field=models.ImageField(default='1.jpg', upload_to='goods/'),
        ),
    ]