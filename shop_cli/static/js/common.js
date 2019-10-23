//<script src='jquery.min.js' type='text/javascript'></script>
//<script src="jquery.min.js"></script>
//<script src="http://code.jquery.com/jquery-latest.js"></script>
//$(document).ready(function () {
//    //检测ie 6789
//    if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
//        window.scrollReveal = new scrollReveal({
//            reset: true
//        });
//    }
//    // 弹窗回复评论
//    // 弹窗回复评论
//    var list = document.getElementsByClassName('replyComment');
//    for (var i of list) {
//        i.addEventListener("click", function (ev) {
//            ev.preventDefault();
//            var txt=  "请输入回复：";
//            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.input,{
//                onOk:function(reply){
//                    console.log(reply);
//                }
//            });
//        }, false);
//    }
//
//    /*nav show or hide*/
//    $('.nav>li').hover(function () {
//        $(this).children('ul').stop(true, true).show(400);
//    }, function () {
//        $(this).children('ul').stop(true, true).hide(400);
//    });
//    /*search*/
//    $('.search_ico').click(function () {
//        $('.search_bar').toggleClass('search_open');
//        if ($('#keyboard').val().length > 2) {
//            $('#keyboard').val('');
//            $('#searchform').submit();
//        } else {
//            return false;
//        }
//    });
//    /*banner*/
//    $('#banner').easyFader();
//
//    /*topnav select*/
//    var obj = null;
//    var allMenu = document.getElementById('topnav').getElementsByTagName('a');
//    // console.log(allMenu);
//    obj = allMenu[0];
//    for (i = 1; i < allMenu.length; i++) {
//        if (window.location.href.indexOf(allMenu[i].href) >= 0) {
//            obj = allMenu[i];
//        }
//    }
//    obj.id = 'topnav_current';
//
//    /*mnav dl open*/
//    var oH2 = document.getElementsByTagName('h2')[0];
//    var oUl = document.getElementsByTagName('dl')[0];
//    oH2.onclick = function () {
//        var style = oUl.style;
//        style.display = style.display == 'block' ? 'none' : 'block';
//        oH2.className = style.display == 'block' ? 'open' : '';
//    };
//    //菜单点击效果
//    $('.list_dt').on('click', function () {
//        $('.list_dd').stop();
//        $(this).siblings('dt').removeAttr('id');
//        if ($(this).attr('id') == 'open') {
//            $(this).removeAttr('id').siblings('dd').slideUp();
//        } else {
//            $(this).attr('id', 'open').next().slideDown().siblings('dd').slideUp();
//        }
//    });
//
//    //设置固定关注我们
//
//    if ($('#follow-us')) {
//        var followUsPosition = $('#follow-us').offset().top;
//        window.onscroll = function () {
//            var nowPosition = document.documentElement.scrollTop;
//            if (nowPosition - followUsPosition > 0) {
//                setTimeout(function () {
//                    $('#follow-us').attr('class', 'guanzhu gd');
//                }, 150);
//            } else {
//                $('#follow-us').attr('class', 'guanzhu');
//            }
//        };
//    }
//
//
//    //回到顶部
//    // browser window scroll (in pixels) after which the "back to top" link is shown
//    var offset = 300,
//        //browser window scroll (in pixels) after which the "back to top" link opacity is reduced
//        offset_opacity = 1200,
//        //duration of the top scrolling animation (in ms)
//        scroll_top_duration = 700,
//        //grab the "back to top" link
//        $back_to_top = $('.cd-top');
//
//    //hide or show the "back to top" link
//    $(window).scroll(function () {
//        ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible'): $back_to_top.removeClass('cd-is-visible cd-fade-out');
//        if ($(this).scrollTop() > offset_opacity) {
//            $back_to_top.addClass('cd-fade-out');
//        }
//    });
//    //smooth scroll to top
//    $back_to_top.on('click', function (event) {
//        event.preventDefault();
//        $('body,html').animate({
//            scrollTop: 0,
//        }, scroll_top_duration);
//    });
//
//});


function makeHeader(blog_username, username){
    //blog_username 当前访问的博客的作者
    //username   登陆的用户

    //博客作者-用户信息url
    var user_info_url = '/' + blog_username + '/' + 'info'
    //登陆用户发博客url
    if (username){
        var topic_release_url = '/' + username + '/' + 'topic/release'
    }else{
        //没有登陆状态直接去登陆
        var topic_release_url = '/login'
    }

    //访问博主的博客文章
    var user_topics_url = '/' + blog_username + '/' + 'topics'

    var header_body = ''
    header_body += '<header id="header">';
    header_body += '<div class="menu">';
    header_body += ' <nav class="nav" id="topnav"> ';
    header_body += '<h1 class="logo"><a href="/index"> ' + blog_username + '的博客</a></h1>';
    header_body += '<li><a href="/index">网站首页</a></li>';
    header_body += '<li>';
    header_body += '<a href=' + '"' + user_topics_url + '"' + '>文章列表</a>';
    header_body += '<ul class="sub-nav">';
    header_body += '<li><a href=' + '"' + user_topics_url + '?category=tec"' + '>技术</a></li>';
    header_body += '<li><a href=' + '"' + user_topics_url + '?category=no-tec"' + '>非技术</a></li>';
    header_body += '</ul>';
    header_body += '</li>';
    header_body += '<li><a href="photo.html">我的相册</a> </li>';
    header_body += '<li><a href=' + '"' + user_info_url + '"' + '>关于我</a> </li>';
    header_body += '<li><a href=' + '"' + topic_release_url + '"' + '>发表博客</a> </li>';
    header_body += '</nav>';
    header_body += '</div>';
    if (username){
        header_body += '<li><a href= /' + username + '/change_info id="change_info" target="_blank">编辑</a></li>';
        //header_body += '<li><a href="/" id="login_out" target="_blank">登出</a></li>';
        header_body += '<li><span id="login_out" target="_blank">登出</span></li>';
    }else{
        header_body += '<a href="/login" id="login" target="_blank">登陆</a>';
        header_body += '<a href="register.html" id="register" target="_blank">注册</a>';
    }
    header_body += '</header>';

    return header_body
}


function loginOut(){

    $('#login_out').on('click', function(){

            if(confirm("确定登出吗？")){
                window.localStorage.removeItem('dnblog_token');
                window.localStorage.removeItem('dnblog_user');
                window.location.href= '/index';
            }
        }
    )

}

login_out=function log_out(){
    token=window.localStorage.getItem('dnblog_token');
    if(token)
      {
        $('#login01').on('click', function(){

              if(confirm("确定注销吗?")){
                  window.localStorage.removeItem('dnblog_token');
                  window.localStorage.removeItem('dnblog_user');
                  window.location.href= 'http://127.0.0.1:5000/index';
                  <!--flag=~flag;-->
              }
           <!--flag=~flag;-->
           window.localStorage.setItem('flag', flag);

           console.log("点击flag:",flag);


          });
          user=window.localStorage.getItem('dnblog_user');
          //给编辑加超链接
          href1='/'+user+'/change_info';
          //给个人信息加超链接
          href2='/'+user+'/info';
          //购物车加超链接
          href3='/'+user+'/cart'
          //给结算加超链接
          href4='/'+user+'/checkout'
          $('#personalinfo').attr('href',href2);
          $('#register01').attr('href',href1);
          $('#cart1').attr('href',href3);
          $('#checkout1').attr('href',href4);
          $('#register01').on('click', function(){
                  alert('进入'+user+'信息修改页面');
              }
      );}
    token=window.localStorage.getItem('dnblog_token');
    if (token){
      $('#login01').text('注销');
      $('#register01').text('编辑');
      $('#personalinfo').text('个人信息');
      }

}
quantity_post=function quantity_post(){
        console.log("准备添加购物车");
        var token = window.localStorage.getItem('dnblog_token');
        //登陆的用户名
        var username = window.localStorage.getItem('dnblog_user');
        var user = username;
        // goods_id
        var goods_id = Number($("#goods_id").text());
        console.log(goods_id)
        // goods_num
        //页面中取出goodsnum的值
        var goods_num = $("#goodsnum").val();
        console.log(goods_num);
        var post_data = { 'user': user, 'goods_id': goods_id, 'goods_num': goods_num }
         console.log(post_data);
        $.ajax({
            // 请求方式
            type: "post",
            // contentType
            contentType: "application/json",
            // dataType
            dataType: "json",
            // url
            url: "http://127.0.0.1:8000/v1/cart/" + username + "/add",
            // 把JS的对象或数组序列化一个json 字符串
            data: JSON.stringify(post_data),
            beforeSend: function (request) {
                request.setRequestHeader("Authorization", token);
            },
            success: function (result) {
                if (200 == result.code) {
                    // 转到结算页面
                    alert("添加购物车成功");
                } else {
                    alert(result.error);
                }
            }
        })

    }


check1_out=function check1_out(){


                //结算按钮功能
        $("#checkout").click(function () {
            // 当前页面url： http://127.0.0.1:5000/<username>/cart
            // http://127.0.0.1:8000/v1/check/<username> POST
            // 待结算表： id user(外键多对一) goods_id(外键多对一) goods_num
            // {data:[{'goods_id':'xxx', 'goods_num':xxx},...]}
            // http://127.0.0.1:5000/<username>/checkout
            // 1. 想后端地址请求存储数据到待结算表

            var url = document.location.toString();
            var arrUrl = url.split("//");
            var cart_username = arrUrl[1].split('/')[1];
            var token = window.localStorage.getItem('dnblog_token');
            //登陆的用户名
            var username = window.localStorage.getItem('dnblog_user');

            var user = username;
            var data = [];
            for (i = 0; i < $("#cart-body>tr").length; i++) {
                var input_selector = "#cart" + i + " > td.product-quantity > input";
                // goods_num
                input_node = $(input_selector)[0];
                var goods_num = input_node.value;
                // goods_id
                // 'http://127.0.0.1:5000/goods/detail/' + result.data[i].id
                var a_selector = "#cart" + i + " > td.product-name > a";
                var id = $(a_selector)[0]["href"]
                var goods_id = id.split("//")[1].split("/")[3]
                data.push({ 'goods_id': goods_id, 'goods_num': goods_num })
            };
            var post_data = { 'user': user, 'data': data }
            // console.log(post_data);
            $.ajax({
                // 请求方式
                type: "post",
                // contentType
                contentType: "application/json",
                // dataType
                dataType: "json",
                // url
                url: "http://127.0.0.1:8000/v1/check/" + cart_username,
                // 把JS的对象或数组序列化一个json 字符串
                data: JSON.stringify(post_data),
                beforeSend: function (request) {
                    request.setRequestHeader("Authorization", token);
                },
                success: function (result) {
                    if (200 == result.code) {
                    //0.1:5000/<username>/checkout
            // 1. 想后端地址请求存储数据到待结算表
                        // 转到结算页面
                        window.location = "http://127.0.0.1:5000/"+username+"/checkout";
                    } else {
                        alert(result.error)
                    }
                }
            })
        });


}
//cart.html 删除指定购物车id
remove=function remove(cart_id){
                var username = window.localStorage.getItem('dnblog_user');

                console.log(cart_id);
                $.ajax({
                // 请求方式
                type: "delete",
                // contentType
                contentType: "application/json",
                // dataType
                dataType: "json",
                // url
                url: "http://127.0.0.1:8000/v1/cart/delete/" + cart_id,
                // 把JS的对象或数组序列化一个json 字符串
//                data: JSON.stringify(post_data),
                beforeSend: function (request) {
                    request.setRequestHeader("Authorization", token);
                },
                success: function (result) {
                    if (200 == result.code) {
                    //0.1:5000/<username>/checkout
            // 1. 想后端地址请求存储数据到待结算表
                        // 更新页面数据
                        window.location = "http://127.0.0.1:5000/"+username+"/cart";
                    } else {
                        alert(result.error)
                    }
                }
            })
};


buy_goods=function buy_goods(){

 $("#buy").click(function () {

            var url = document.location.toString();
            var arrUrl = url.split("//");
            var check_username = arrUrl[1].split('/')[1];
            var token = window.localStorage.getItem('dnblog_token');
            //登陆的用户名
            var username = window.localStorage.getItem('dnblog_user');
            console.log("进入buy",username)
            var user = username;

            var data;
            // name
            name = $("#name").val()
            // phone
            phone = $("#phone").val()
            // address
            address = $("#address").val()
            // email
            email = $("#phone").val()
            // data
            $.ajax({
                type: "get",
                url: "http://127.0.0.1:8000/v1/checkout/" + check_username,
                beforeSend: function (request) {
                    request.setRequestHeader("Authorization", token);
                },
                success: function (result)
                {
                    //数据返回成功 在发 ajax 后端服务器存储 相关订单信息
                    data = result.data
                    console.log("请求成功data:",data)
                    total_price=$("#totalPrice").text()
                    console.log('totalprice:',total_price)
                    console.log("存储数据:",data)
                    var post_data = { 'address':address, 'phone':phone, 'email':email, 'name':name, 'data': data,'total_price':total_price}
                // console.log(post_data);
                    $.ajax({
                        // 请求方式
                        type: "post",
                        // contentType
                        contentType: "application/json",
                        // dataType
                        dataType: "json",
                        // url
                        url: "http://127.0.0.1:8000/v1/checkout/pay/" + check_username,
                        // 把JS的对象或数组序列化一个json 字符串
                        data: JSON.stringify(post_data),
                        beforeSend: function (request) {
                            request.setRequestHeader("Authorization", token);
                        },
                        success: function (result)
                        {
                                //后端返回order_id
                                order_id=result.order_id
                                if (result.res == 3)
                                {
                                    // 引导用户到支付页面
                                    window.open(result.pay_url);
                                    // 浏览器访问/order/check, 获取支付交易的结果
                                    // ajax post 传递参数:order_id
                                     $.ajax({
                                            // 请求方式
                                            type: "post",
                                            // contentType
                                            contentType: "application/json",
                                            // dataType
                                            dataType: "json",
                                            // url
                                            url: "http://127.0.0.1:8000/v1/checkout/check/" + check_username+'/'+order_id,
                                            // 把JS的对象或数组序列化一个json 字符串
                                            data: JSON.stringify(post_data),
                                            beforeSend: function (request) {
                                                request.setRequestHeader("Authorization", token);
                                            },
                                            success: function (result)
                                            {
                                                    if (result.res == 3)
                                                    {
                                                             alert("支付成功")
                                                             window.location = "http://127.0.0.1:5000/index";

                                                     }
                                            }
                                           })


                                 }
                        }
                       })


                }
            });
            // 购物请求
            // { 'address':'xxx', 'phone':xxx, 'email':'xxx', 'name':'xxx'
            // 'data':[{'goods_id': xxx, 'goods_price':'xxx', 'goods_unit':'xxx', 'goods_num':xxx, 'total_price':xxx},...]}





        });
}





