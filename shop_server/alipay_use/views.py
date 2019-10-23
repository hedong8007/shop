import os

from django.http import JsonResponse
from django.shortcuts import render

# Create your views here.
from alipay import AliPay
from shop_server import settings


class OrderPayView(object):
    """订单支付"""

    def post(self, request):

        # 调用支付宝的支付接口
        alipay = AliPay(
            #沙箱app id 号 hedong支付宝
            appid='2016101300674685',
            # 默认回调url
            app_notify_url=None,
            app_private_key_path=os.path.join(settings.BASE_DIR, 'alipay_use/app_private_key.txt'),
            # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,
            alipay_public_key_path=os.path.join(settings.BASE_DIR, 'alipay_use/alipay_public_key.txt'),
            # RSA 或者 RSA2,官网推荐rsa2
            sign_type="RSA2",
            debug=True  # 默认False， true表示访问沙箱的dev接口
        )

        # 电脑网站支付，需要跳转到https://openapi.alipay.com/gateway.do? + order_string
        # total_pay = 100 + order.transit_price
        order_string = alipay.api_alipay_trade_page_pay(
            out_trade_no="20161112",
            total_amount=str("1234"),
            subject='天天生鲜%s' % "1222",
            return_url="https://example.com",
            notify_url="https://example.com/notify"  # 可选, 不填则使用默认notify url
        )

        # 返回应答,引导html页面跳转去接受支付的界面
        pay_url = 'https://openapi.alipay.com/gateway.do?' + order_string
        return JsonResponse({'res': 3, 'pay_url': pay_url})