import json
import random

from django.http import JsonResponse
from django.shortcuts import render
from goods.models import *
# Create your views here.
def index(request):
    #返回商品数据
    #主页随机生成6个商品
    #goods id name image
    if request.method == 'GET':
        try:
            goods_list_object=[]
            for i in range(6):
                # goods_list_object=Goods.objects.all()
                rannum=random.randint(1, 8)
                print(rannum)
                if(i<2):
                    goods=Goods.objects.filter(id=random.randint(1,8))
                    goods_list_object.append(goods[0])
                if(i<4):
                    goods = Goods.objects.filter(id=random.randint(51, 57))
                    goods_list_object.append(goods[0])
                if (i < 6):
                    goods = Goods.objects.filter(id=random.randint(101, 108))
                    goods_list_object.append(goods[0])
            # print(goods_list_object)
        except:
            return JsonResponse('数据库错误')
        data=[]
        dict_list={}
        for item in goods_list_object:
            print(item.image)
            print(item.goodsname)
            dict_list={'id':item.id,'goodsname':item.goodsname,'image':str(item.image),'price':item.price}
            data.append(dict_list)
        #返回数据基本格式
        # result = {'code': 200 ,
        #           'data': [{'id':0,'goodsname':'香蕉','image':'1.jpg'}]}
        result = {'code': 200, 'data': data}
        return JsonResponse(result)
