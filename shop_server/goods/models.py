from django.db import models

# Create your models here.

class Category(models.Model):
    id = models.AutoField(primary_key=True,default=0)

    typename=models.CharField(verbose_name='商品类别',max_length=30)

    class Meta:
        db_table='category'
class Goods(models.Model):
    id = models.AutoField(primary_key=True)
    goodsname=models.CharField(verbose_name='商品名字',max_length=30)
    price=models.DecimalField(verbose_name='价格',max_digits=5,decimal_places=2)
    unit=models.CharField(verbose_name='单位',max_length=10)
    introduction=models.CharField(verbose_name='商品介绍',max_length=30)
    image=models.ImageField(upload_to='goods/')
    #外键　类别约束　多对一
    category = models.ForeignKey(Category)

    class Meta:
        db_table='goods'