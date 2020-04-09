<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/less/modals.less" />
</head>
<style>
    .row {
        background-color: #95c4f94d;
        margin: auto 10%;
        border-width: 0 0 0 0;
        box-shadow: #080a0ecc 0px 0px 20px 3px;
        border-radius: 35px 35px 35px 35px;
    }
    /*a链接 在被选中和点击时  的字体颜色，粗度，大小*/

    a {
        color: #FFFFFFB3;
        font-weight: bolder;
        text-align: center;
        font-size: 18px;
    }

    a:hover {
        color: #FFFFFF;
        text-decoration-line: none;
        font-size: 16px;
    }

    a:hover,
    a:focus {
        color: #50ab9bcc;
    }
    /* body相关属性 */

    body {
        list-style: none;
        /*去掉ui和li的 点*/
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
        background-attachment: fixed;
        background-position: center bottom;
        color: #fff;
        background-color: #333;
        font-family: 'microsoft yahei', Arial, sans-serif;
    }

    #title {
        width: auto;
        text-align: center;
        font-size: 140px;
        margin-top: 200px;
        transition: font-size 2s;
    }

    #title:hover {
        font-size: 148px;
    }

    .aTopAndBottom {
        height: auto;
        text-align: center;
        padding: 10px 0px;
        min-width: 20px;
    }

    .netease_Player {
        position: absolute;
        display: none;
    }

    .dropdown-menu>li>a:hover,
    .dropdown-menu>li>a:focus {
        color: #fff !important;
        background-color: #fff0 !important;
        font-size: 19px;
    }

    .dropup .dropdown-menu {
        background-color: #fff0 !important;
        text-decoration: none;
        margin-bottom: 10px;
        border: 0px;
        border-radius: 16px 16px 0px 0px;
        box-shadow: none;
        margin-bottom: 14px;
    }

    .dropdown-menu>li>a {
        color: #fff;
        padding: 12px;
        font-weight: bolder;
    }

    .navbar {
        min-height: 46px;
    }
    /*登录框  最大宽度 与上边距 重构*/

    .modal-dialog {
        width: 350px;
        margin: 100px auto;
    }
    /*登录框 背景颜色与透明度，边框线粗度，边框弧度，边框阴影 重写*/

    .modal-content {
        background-color: #afd2ff66;
        border: 0px solid rgba(0, 0, 0, .2);
        border-radius: 31px;
        box-shadow: 0px 0px 40px 21px rgba(131, 151, 201, 0.5);
        -webkit-box-shadow: 0px 0px 40px 21px rgba(131, 151, 201, 0.5);
        box-shadow: 0px 0px 40px 21px rgba(131, 151, 201, 0.5);
    }
    /* 登录框位置重写 */

    .modal-body {
        position: relative;
        padding: 10px 34px;
    }
    /*输入框 背景颜色与透明度重构*/

    .form-control {
        background-color: #fffc;
    }
</style>
<body background="${pageContext.request.contextPath}/img/mainPageImg.jpg">
<!-- 顶部半透明容器 -->
<div class="navbar navbar-fixed-top row">
    <div class="col-xs-1 aTopAndBottom ">
        <a href=""><span class="glyphicon glyphicon-home "></span></a>
    </div>
    <!--登录按钮-->
    <div class="col-xs-1 col-xs-offset-9 aTopAndBottom">
        <a href="" data-toggle="modal" data-target="#login">
            <span class="glyphicon glyphicon-log-in"></span>
            <span id="loginText">登录</span>
        </a>
    </div>
    <!--注册按钮-->
    <div class="col-xs-1 aTopAndBottom">
        <a href="" data-toggle="modal" data-target="#register">
            <span class="glyphicon glyphicon-user"></span>
            <span id="registText" onclick="open_register()">注册</span>
        </a>
    </div>
    <span style="color: orangered; font-weight: 900; font-size: x-large; padding-left: 600px">${requestScope.msg}</span>
</div>
<!-- 中部容器 -->
<%--<div class="container">--%>
    <%--<div class="main">--%>
        <%--<h1 id="title">Hello world!</h1>--%>
        <%--<h2 id=""></h2>--%>
    <%--</div>--%>
<%--</div>--%>
<!-- 注册 -->
<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="${pageContext.request.contextPath}/User/register.do" method="post">
                    <div class="form-group">
                        <label for="userName">用户名</label>
                        <input class="form-control" type="text" id="userName" name="name" placeholder="2-15位字母或数字" onblur="regName()">
                        <span class="help-block" style="color: red"></span>
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input class="form-control" type="password" id="password" name="password">
                    </div>
                    <div class="form-group">
                        <label for="password2">再次输入密码</label>
                        <input class="form-control" type="password" id="password2" onblur="regPassword()">
                        <span class="help-block" style="color: red"></span>
                    </div>
                    <div class="form-group">
                        <label for="userEmail">邮箱</label>
                        <input class="form-control" type="email" id="userEmail" name="email" placeholder="例如:***@***.com" onblur="regEmail()">
                        <span class="help-block" style="color: red"></span>
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit" style="background-color: #3a8cd2b3;border: 0px solid transparent;" id="register_btn">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal" style="background-color: #fb5e5999;border: 0px solid transparent;">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">
                        <font style="font-size: 13px;">已有账号？点我登录</font>
                    </a>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 注册 end-->
<!-- 登录 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">登录</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="${pageContext.request.contextPath}/User/login.do" method="post">
                    <div class="form-group">
                        <label>用户名</label>
                        <input class="form-control" type="text" name="name" placeholder="">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input class="form-control" type="password" name="password" placeholder="">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit" style="background-color: #3a8cd2b3; border: 0px solid transparent;">登录</button>
                        <button class="btn btn-danger" data-dismiss="modal" style="background-color: #fb5e5999;border: 0px solid transparent;">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">
                        <font style="font-size: 13px;" onclick="open_register()">还没有账号？点我注册</font>
                    </a>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 登录 end -->
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    <%--$().ready(function(){--%>
        <%--var src="${pageContext.request.contextPath}/img/xk.jpg"--%>
        <%--$("body").css("background-img","url("+ src+")")--%>
    <%--})--%>
    var regName=function(){
        $("#userName").next("span").text("")
        $("#userName").parent().removeClass("has-error has-success")
        var empName=$("#userName").val();
        var regName=/(^[a-zA-Z0-9]{2,15}$)|(^[\u2E80-\u9FFF]{2,8})/
        if(!regName.test(empName)){
            $("#userName").next("span").text("用户名至少2位且必须为数字或字母")
            $("#userName").parent().addClass("has-error")
        }
        else {
            $("#userName").parent().addClass("has-success")
        }
        return true;
    }
    var regPassword=function(){
        $("#password2").next("span").text("")
        $("#password2").parent().removeClass("has-error has-success")
        var pw=$("#password").val();
        var pw2=$("#password2").val();
        if(pw!=pw2){
            $("#password2").next("span").text("两次密码不一致")
            $("#password2").parent().addClass("has-error")
        }
        else {
            $("#password2").parent().addClass("has-success")
        }
    }
    var regEmail=function(){
        $("#userEmail").next("span").text("")
        $("#userEmail").parent().removeClass("has-error has-success")
        var empEmail=$("#userEmail").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
        if(!regEmail.test(empEmail)){
            $("#userEmail").next("span").text("邮箱格式不正确")
            $("#userEmail").parent().addClass("has-error")
        }
        else {
            $("#userEmail").parent().addClass("has-success")
        }
    }
    var open_register=function(){
        $("#register form")[0].reset();
        $("#register form").find(".help-block").text("");
    }
    setInterval(function(){
        if($("#userName").parent().hasClass("has-success") && $("#password2").parent().hasClass("has-success") && $("#userEmail").parent().hasClass("has-success")){
            $("#register_btn").attr("disabled",false);
        }
        else {
            $("#register_btn").attr("disabled",true)
        }

    },500)
    $().ready(function(){
        $("#login").modal({
            backdrop:"static",
            show:false
        })
    })
</script>
</html>
