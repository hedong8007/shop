from django.db import models
from users.models import *
from goods.models import *
# Create your models here.
class Cart(models.Model):
    id=models.AutoField(primary_key=True)
    user=models.ForeignKey(UserProfile)
    goods=models.ForeignKey(Goods)
    goods_num=models.IntegerField(default=0)
    goods_price=models.DecimalField(verbose_name='价格',max_digits=5,decimal_places=2,default=0.00)
    unit = models.CharField(verbose_name='单位', max_length=10,default='斤')
    image = models.ImageField(upload_to='goods/',default='1.jpg')
    class Meta:
        db_table='cart'