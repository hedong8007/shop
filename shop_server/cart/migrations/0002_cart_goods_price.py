# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-10-05 07:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='cart',
            name='goods_price',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=5, verbose_name='价格'),
        ),
    ]
