import hashlib
import json

from django.http import JsonResponse
from django.shortcuts import render
from .models import *

# Create your views here.
from btoken.views import make_token
from tools.login_check import login_check
def test(request):
    print(request.body)
    return JsonResponse({'code':200})

@login_check('PUT')
def users(request,username=None):
    if request.method =='GET':
        # 获取用户数据
        if username:
            # /v1/users/<username>
            # 拿指定用户数据
            try:
                user = UserProfile.objects.get(username=username)
            except Exception as e:
                user = None
            if not user:
                result = {'code': 208, 'error': 'no user'}
                return JsonResponse(result)
            # 检查是否有查询字符串
            if request.GET.keys():
                # 查询指定字段
                data = {}
                for k in request.GET.keys():
                    if hasattr(user, k):
                        v = getattr(user, k)
                        if k == 'avatar':
                            data[k] = str(v)
                        else:
                            data[k] = v
                result = {'code': 200, 'username': username, 'data': data}
                return JsonResponse(result)
            else:
                # 全量查询【password email address ...】
                result = {'code': 200, 'username': username,
                          'data': {'info': user.info, 'sign': user.sign, 'avatar': str(user.avatar),
                                   'nickname': user.nickname,'phone':user.phone,'address':user.address}}
                return JsonResponse(result)
    elif request.method=='POST':
        #前端页面地址　127.0.0.1/register.html
        #创建用户 符合restful规则
        #新建token
        json_str = request.body
        if not json_str:
            result = {'code': 201, 'error': 'Please give me data'}
            return JsonResponse(result)
        json_obj = json.loads(json_str)

        username = json_obj.get('username')
        if not username:
            result = {'code': 202, 'error': '请输入用户名'}
            return JsonResponse(result)

        email = json_obj.get('email')
        if not email:
            result = {'code': 203, 'error': '请输入邮箱'}
            return JsonResponse(result)
        password_1 = json_obj.get('password_1')
        password_2 = json_obj.get('password_2')
        if not password_1 or not password_2:
            result = {'code': 204, 'error': '请输入密码'}
            return JsonResponse(result)

        if password_1 != password_2:
            result = {'code': 205, 'error': '请输入相同的密码'}
            return JsonResponse(result)
        # 优先查询当前用户名是否已存在
        old_user = UserProfile.objects.filter(username=username)
        if old_user:
            result = {'code': 206, 'error': '用户名已存在'}
            return JsonResponse(result)
        #密码处理 md5哈希/散列
        m = hashlib.md5()
        m.update(password_1.encode())
        #======charfield 尽量避免使用 null=True
        sign = info = ''
        try:
            UserProfile.objects.create(username=username,nickname=username,password=m.hexdigest(),sign=sign,info=info,email=email)
        except Exception as e:
            #数据库down了， 用户名已存在
            result = {'code': 207, 'error': 'Server is busy'}
            return JsonResponse(result)
        #make token
        token = make_token(username)
        #正常返回给前端
        result = {'code':200, 'username':username, 'data':{'token':token.decode()}}
        return JsonResponse(result)


    if request.method=='PUT':
        #http://127.0.0.1:5000/<username>/change_info
        #更新数据

        json_str=request.body
        if not json_str:
            result='please give me data'
            return  JsonResponse(result)
        json_dict=json.loads(json_str)

        #取出用户名
        # username = json_dict.get('username')
        print('用户名:',username)
        #数据库中取出用户数据
        userobj = UserProfile.objects.filter(username=username)[0]
        print(userobj)
        list_str=['sign','nickname','info']
        #取出put字段值,存到数据库
        for item in list_str:
            if item in json_dict:
                #设置数据属性
                setattr(userobj,item,json_dict[item])

        #保存结果
        userobj.save()
        result = {'code':200, 'username':request.user.username}
        return JsonResponse(result)


@login_check('POST')
def user_avatar(request,username=None):
    '''
    上传用户头像
    :param request:
    :return:
    '''
    if request.method=='POST':
        #上传头像处理
        json_str=request.body
        # json_dict=json.loads(json_str)
        #文件数据在FILES
        avatar=request.FILES.get('avatar')
        print(avatar)

        #查询出相应数据
        userobj=UserProfile.objects.filter(username=username)[0]
        userobj.avatar=avatar
        userobj.save()

        result={'code':200}
        return JsonResponse(result)


