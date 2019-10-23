from django.conf.urls import url
from . import views

urlpatterns = [

    # url(r'^?g_id=(?P<g_id>[\d]{1,3})$', views.goods),
    url(r'^/(?P<username>[\w]{1,11})$', views.cart),
    url(r'^/(?P<username>[\w]{1,11})/add$', views.cart),
    url(r'^/delete/(?P<cart_id>[\d]{1,11})$', views.cart)

]