# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2019-10-08 08:45
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('checkout', '0003_auto_20191008_1511'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='checkout',
            name='goods_num_price',
        ),
    ]
