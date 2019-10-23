# -*- coding:utf-8 -*-
 ######################################################
 #     > File Name: flask_client.py
 #     > Author: XiaoXiaoYu
 #     > Mail: 731958654@qq.com
 #     > Created Time: Fri 30 Oct 2019 18:18:00 PM CST
 ######################################################

from flask import Flask, send_file, render_template, request

app = Flask(__name__)

@app.route('/index')
def index():
    #首页
    return send_file('templates/index.html')

@app.route('/login')
def login():
    #登录
    return send_file('templates/login.html')

@app.route('/register')
def register():
    #注册
    return send_file('templates/register.html')

@app.route('/<username>/info')
def info(username):
    #个人信息
    return send_file('templates/about1.html')

@app.route('/<username>/change_info')
def change_info(username):
    #修改个人信息
    return send_file('templates/change_info.html')

@app.route('/goods')
def goods():
    #商品列表
    # return send_file('templates/shop.html')
    #flask 取查询字符串category(种类)值


    category=request.args.get('category')
    #将category变量返回给shop.html模板
    return render_template('shop.html',category=category)

@app.route('/goods/detail/<g_id>')
def goods_detail(g_id):
    #商品详细展示
    return send_file('templates/shop-detail.html')

@app.route('/<username>/cart')
def cart(username):
    #购物车
    return send_file('templates/shop-cart.html')

@app.route('/<username>/checkout')
def checkout(username):
    #结算
    return send_file('templates/check-out.html')


if __name__ == '__main__':
    app.run(debug=True)

