from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse
from django.shortcuts import render
from shop_server import settings
# Create your views here.
def test(request,username):
    result={'code':200}
    return JsonResponse(result)


import json

from django.http import JsonResponse
from django.shortcuts import render
from .models import *
from goods.models import *
from cart.models import *
from alipay import AliPay
import os
# Create your views here.
def checkout_handle(request,username=None):
    print("username:",username)
    #结算信息展示
    if request.method=='GET':
        #收件人详情信息展示
        try:
            user = UserProfile.objects.get(username=username)
        except:
            result={'code':210,'error':'数据库错误'}
            return JsonResponse(result)

        # 购物车信息展示
        try:
            cart_list_object = Cart.objects.all()
        except:
            result = {'code': 210, 'error': '数据库错误'}
            return JsonResponse(result)
        data = []
        dict_list = {}
        for item in cart_list_object:
            # print(item.goodsname)
            dict_list = {'id': item.id, 'goodsname': item.goods.goodsname, 'goods_num': item.goods_num,
                         'username': item.user.username, 'price': item.goods_price, 'unit': item.unit,
                         'image': str(item.image)}
            data.append(dict_list)
        #返回数据基本格式
        result = {'code': 200, 'username':user.username,'phone':user.phone,'address':user.address,'email':user.email,
                  'data':data}
        return JsonResponse(result)
    if request.method=='POST':
        # 这部分待做
        json_obj = json.loads(request.body)
        total_price = json_obj['total_price']
        user_address=json_obj['address']
        user_email=json_obj['email']
        user_phone=json_obj['phone']

        # 先存储结算总订单信息 存入到record_trade表当中
        try:

            #创建交易记录总表
            trade=record_trade.objects.create(total_price=total_price)
        except Exception as e:
            # 数据库down了,数据库错误
            result = {'code': 207, 'error': '数据库错误'}
            return JsonResponse(result)
        item_data=json_obj['data']
        print('item_data:',item_data)

        # try:
            #循环读data 存入checkout表
        for item in item_data:
            print('item:',item)
            print(item['goodsname'])
            try:
                goods = Goods.objects.filter(goodsname=item['goodsname'])
                print("goods:",goods)
                user = UserProfile.objects.filter(username=username)
                print("user:",user)
            except:
                result = {'code': 210, 'error': '数据库错误'}
                return JsonResponse(result)
            checkout.objects.create(user=user[0],goods=goods[0],goods_price=item['price'],name=item['username'],phone=user_phone,adress=user_address,r_id=trade.id)
            print("11111111")
        # except:
        #     # 数据库down了,数据库错误
        #     result = {'code': 207, 'error': '数据库错误'}
        #     return JsonResponse(result)


        print("request.body:",request.body)
        # print('privatekey:',os.path.join(settings.BASE_DIR, 'alipay_use/app_private.txt'))
        filename=os.path.join(settings.BASE_DIR, 'alipay_use/app_private.txt')
        f = open(filename, 'r')  # filename，文件路径、名称，如果有\，注意转义或者开头加r，mode读取的模式，r读取，w写入，，
        private_str= f.read()  # 获取内容并储存在变量里
        print(private_str)
        f.close()  # 关闭文件，节省内存

        filename=os.path.join(settings.BASE_DIR, 'alipay_use/alipay_public.txt')
        f = open(filename, 'r')  # filename，文件路径、名称，如果有\，注意转义或者开头加r，mode读取的模式，r读取，w写入，，
        alipay_public_str= f.read()  # 获取内容并储存在变量里
        print(alipay_public_str)
        f.close()  # 关闭文件，节省内存

        # 调用支付宝的支付接口
        alipay = AliPay(
            #沙箱app id 号 hedong支付宝
            appid="2016101300674685",
            # 默认回调url
            app_notify_url=None,
            app_private_key_string=private_str,
            # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            alipay_public_key_string=alipay_public_str,
            # RSA 或者 RSA2,官网推荐rsa2
            sign_type="RSA2",
            debug=True  # 默认False， true表示访问沙箱的dev接口
        )

        # 电脑网站支付，需要跳转到https://openapi.alipaydev.com/gateway.do? + order_string
        total_pay = json_obj['total_price']
        #将record_trade 主键 设置交易成 交易流水号
        trade_no=trade.id
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no=trade_no,
            total_amount=str(total_pay),
            subject='每日优鲜%s' %'支付',
            return_url="http://127.0.0.1:5000/index",
            notify_url="http://127.0.0.1:5000/index"  # 可选, 不填则使用默认notify url
        )

        # 返回应答,引导html页面跳转去接受支付的界面 要用沙箱支付链接
        pay_url = 'https://openapi.alipaydev.com/gateway.do?' + order_string
        #将交易流水返给前端
        result={'res':3,'pay_url':pay_url,'order_id':trade.id}
        return JsonResponse(result)

def check_result(request,username=None,order_id=None):
    # 接受参数 异步查询 交易是否成功
    # order_id = request.POST.get('order_id')
    print('order_id:',order_id)
    # 判断参数
    if not order_id:
        return JsonResponse({'res': 1, 'error': '无效订单id'})

    # try:
    #     order = record_trade.objects.get(
    #         order_id=int(order_id)
    #     )
    # except :
    #     return JsonResponse({'res': 2, 'error': '订单错误'})

    # 调用支付宝的支付接口
    alipay = AliPay(
        appid="2016101300674685",
        # 默认回调url
        app_notify_url='http://127.0.0.1:5000/index',
        app_private_key_path=os.path.join(settings.BASE_DIR, 'alipay_use/app_private.txt'),
        # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
        alipay_public_key_path=os.path.join(settings.BASE_DIR, 'alipay_use/alipay_public.txt'),
        # RSA 或者 RSA2,官网推荐rsa2
        sign_type="RSA2",
        debug=True  # 默认False， true表示访问沙箱的dev接口
    )

    # 手动查询结果
    # 调用支付宝的交易查询接口
    # while True:
    #     response = alipay.api_alipay_trade_query(out_trade_no=order_id)
    #
    #     code = response.get('code')
    #     print('code:',code)
    #
    #     if code == '10000' and response.get('trade_status') == 'TRADE_SUCCESS':
    #         # 支付成功
    #         # 获取支付宝交易号
    #         trade_no = response.get('trade_no')
    #         # 返回结果
    #         return JsonResponse({'res': 3, 'message': '支付成功'})
    #     elif code == '40004' or (code == '10000' and response.get('trade_status') == 'WAIT_BUYER_PAY'):
    #         # 等待买家付款
    #         # 业务处理失败，可能一会就会成功
    #         import time
    #         time.sleep(5)
    #         continue
    #     else:
    #         # 支付出错
    #         print(code)
    #         return JsonResponse({'res': 4, 'error': '支付失败'})
    return JsonResponse({'res': 3, 'message': '支付成功'})