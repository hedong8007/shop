from django.conf.urls import url
from . import views

urlpatterns = [
    #http://127.0.0.1:8000/v1/users
    url(r'^$', views.users),
    #http://127.0.0.1:8000/v1/users/<username>
    #APPEND_SLASH 自动补全url后面的斜线，前提是你有一个 带 /的
    #修改个人页面路由
    url(r'^/(?P<username>[\w]{1,11})$', views.users),
    #http://127.0.0.1:8000/v1/users/<username>/avatar
    url(r'^/(?P<username>[\w]{1,11})/avatar$', views.user_avatar)
]
