from django.db import models
from users.models import *
from goods.models import *
# Create your models here.
class check(models.Model):
    id=models.AutoField(primary_key=True)
    user=models.ForeignKey(UserProfile)
    goods=models.ForeignKey(Goods)
    goods_num=models.IntegerField(default=0)

    class Meta:
        db_table='check'
class checkout(models.Model):
    id=models.AutoField(primary_key=True)
    user=models.ForeignKey(UserProfile)
    datetime=models.DateTimeField(auto_now=True)
    goods=models.ForeignKey(Goods)
    goods_num=models.CharField(verbose_name='数量',max_length=5,default='0')
    goods_price=models.DecimalField(max_digits=5,decimal_places=2,verbose_name='价格')
    name=models.CharField(max_length=10,verbose_name='收件人')
    phone=models.CharField(max_length=11,verbose_name='收件人电话')
    adress=models.CharField(max_length=50,verbose_name='实际收货地址')
    r_id=models.IntegerField(verbose_name='关联record_trade表id',default=0)
    class Meta:
        db_table='checkout'

#需要新增订单记录总 表
class record_trade(models.Model):
    id=models.AutoField(primary_key=True)
    total_price=models.DecimalField(max_digits=8,decimal_places=2,verbose_name='总价')