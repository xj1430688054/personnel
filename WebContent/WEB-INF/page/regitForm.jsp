<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>注册-公务用车系统</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
	<link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>

</head>
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">公务用车系统-注册</div>
        <div id="darkbannerwrap"></div>
        <form method="post" class="layui-form" action="${ctx}/regit" id="form1">
            <input name="loginname" placeholder="用户名" value="${loginname }"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input name="username" lay-verify="required" placeholder="登录名"  type="username" class="layui-input">
            <hr class="hr15">
            <br>
<!--             <input value="注册" lay-submit lay-filter="redit" style="width:100%;" type="submit"> -->
            <input type="submit" value=" 注册" class="layui-btn" lay-filter="add" lay-submit=""/>
            <hr class="hr20" >
        </form>
    </div>
   <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form
            ,layer = layui.layer;

          //监听提交
          form.on('submit(add)', function(data){
        	  
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("注册成功", {icon: 6},function () {
            	document.getElementById('form1').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
               
            });
            return false;
          });
          
          
        });
    </script>

    
  
</body>
</html>