# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-10-08 09:16
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('checkout', '0004_remove_checkout_goods_num_price'),
    ]

    operations = [
        migrations.AddField(
            model_name='checkout',
            name='goods_num',
            field=models.CharField(default='0', max_length=5, verbose_name='数量'),
        ),
    ]