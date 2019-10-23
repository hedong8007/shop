"""shop_server URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from .views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^test',test_api),
    #注册
    url(r'^v1/users', include('users.urls')),
    #登录
    url(r'^v1/tokens', include('btoken.urls')),
    url(r'^v1/index', include('index.urls')),
    url(r'^v1/goods', include('goods.urls')),
    url(r'^v1/cart', include('cart.urls')),
    url(r'^v1/check', include('check.urls')),
    url(r'^v1/checkout', include('checkout.urls')),

]

#生成媒体资源路由
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
