from django.conf.urls import url
from . import views

urlpatterns = [

    # url(r'^?g_id=(?P<g_id>[\d]{1,3})$', views.goods),
    url(r'^$', views.goods)

]