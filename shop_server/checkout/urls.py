from django.conf.urls import url
from . import views

urlpatterns = [

    # url(r'^?g_id=(?P<g_id>[\d]{1,3})$', views.goods),

    url(r'^/(?P<username>[\w]{1,11})$', views.checkout_handle),
    url(r'^/pay/(?P<username>[\w]{1,11})$', views.checkout_handle),
    #检查支付宝是否交易成功
    url(r'^/check/(?P<username>[\w]{1,11})/(?P<order_id>[\d]{1,11})$', views.check_result),
    # url(r'^/(?P<username>[\w]{1,11})/add$', views.cart),
    # url(r'^/delete/(?P<cart_id>[\d]{1,11})$', views.cart)

]