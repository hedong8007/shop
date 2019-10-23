import json

from django.http import JsonResponse
from django.shortcuts import render
from .models import *
from goods.models import *
# Create your views here.
def cart(request,username=None,cart_id=None):
    if request.method=='GET':
        #购物车信息展示
        try:
            cart_list_object = Cart.objects.all()
        except:
            result={'code':210,'error':'数据库错误'}
            return JsonResponse(result)
        data=[]
        dict_list={}
        for item in cart_list_object:
            # print(item.goodsname)
            dict_list={'id':item.id,'goodsname':item.goods.goodsname,'goods_num':item.goods_num,
                       'username':item.user.username,'price':item.goods_price,'unit':item.unit,'image':str(item.image)}
            data.append(dict_list)
        #返回数据基本格式
        result = {'code': 200, 'data': data}
        return JsonResponse(result)
    #post data 在request.body中
    if request.method=='POST':
        print(request.body)
        goods_dict=json.loads(request.body)
        goodsnum=goods_dict['goods_num']
        print(goodsnum)
        goods_id=goods_dict['goods_id']
        
        if not username:
            result = {'code': 220, 'error': '请登录'}
            return JsonResponse(result)
        #查询出相应商品类
        try:
            goods = Goods.objects.filter(id=goods_id)
            user=UserProfile.objects.filter(username=username)
        except:
            result={'code':210,'error':'数据库错误'}
            return JsonResponse(result)
        # print(type(goods)
        try:
            #创建带有外键的数据时 外键值为对象
            Cart.objects.create(user=user[0], goods_num=goodsnum,goods=goods[0],goods_price=goods[0].price,unit=goods[0].unit,image=goods[0].image)
        except Exception as e:
            # 数据库down了,数据库错误
            result = {'code': 207, 'error': '数据库错误'}
            return JsonResponse(result)
        result={'code':200}
        return JsonResponse(result)
    #删除购物车指定id 数据
    if request.method=='DELETE':
        print("cart_id:",cart_id)
        Cart.objects.filter(id=cart_id).delete()
        result={'code':200}
        return JsonResponse(result)
