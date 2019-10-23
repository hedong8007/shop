import random

from django.http import JsonResponse
from django.shortcuts import render
from .models import *
# Create your views here.
def goods(request):
    #通过g_id 查出相应商品
    if request.method=='GET':
        g_id=request.GET.get("g_id")
        g_category=request.GET.get("category")
        g_quantity=request.GET.get("quantity")
        #根据goods id返回相应信息
        print("g_quantity",g_quantity)

        if g_id :
            try:

                goods=Goods.objects.filter(id=g_id)

                print(goods[0].category)
            except:
                result={'code':210,'error':'数据库错误'}
                return JsonResponse(result)
            # print(goods.category)
            data=[]
            dict_list={}
            for item in goods:
                dict_list={'id':item.id,'goodsname':item.goodsname,'image':str(item.image),'price':item.price,
                           'introduction':item.introduction,'category':item.category.typename}
                data.append(dict_list)

            print("进入related查找")
            #查出相关产品
            try:
                #返回不超过6个相关产品
                related_goods=Goods.objects.filter(id__lt=5)

            except:
                result={'code':210,'error':'数据库错误'}
                return JsonResponse(result)
            # print(goods.category)
            related_data=[]
            related_dict_list={}
            for item in related_goods:
                related_dict_list={'id':item.id,'goodsname':item.goodsname,'image':str(item.image),'price':item.price,
                           'introduction':item.introduction,'category':item.category.typename}
                related_data.append(related_dict_list)
            # related_data['length']=5
            result = {'code': 200, 'data': data,'related':related_data}
            return JsonResponse(result)

        print("进入类别查找")
        print(g_category)
        #根据种类返回相应信息
        if g_category:
            # 外键是根据category_id查找需要做映射
            category_dict={'vegetables':1,'meat':2,'fruits':3}
            category_id=category_dict[g_category]
            try:
                goods = Goods.objects.filter(category=category_id)
                print(goods[0].category)
            except:
                result = {'code': 210, 'error': '数据库错误'}
                return JsonResponse(result)
            # print(goods.category)
            data = []
            dict_list = {}
            for item in goods:
                dict_list = {'id': item.id, 'goodsname': item.goodsname, 'image': str(item.image), 'price': item.price,
                             'introduction': item.introduction, 'category': item.category.typename}
                data.append(dict_list)

            result = {'code': 200, 'data': data}
            return JsonResponse(result)
        else:
            #shop.html 请求后端路由为v1/goods
            #随机生成8个商品
            min=[1,51,101]
            min_dict={1:8,51:57,101:108}
            try:
                goods_list_object = []
                for i in range(8):
                    # goods_list_object=Goods.objects.all()
                    rannum = random.randint(0, 2)
                    print(rannum)
                    goods = Goods.objects.filter(id=random.randint(min[rannum], min_dict[min[rannum]]))
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
    if request.method == 'PUT':
        #添加购物车
        result = {'code': 200}
