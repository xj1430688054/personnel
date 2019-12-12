<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/public/css/font.css">
    <link rel="stylesheet" href="${ctx}/public/css/xadmin.css">
    <script type="text/javascript" src="${ctx}/public/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/public/lib/laydate/laydate.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm"  action="${ctx}/leave/editor">
        <input type="hidden" name="id" id="id" value="${leave.id }" >
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用车开始时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="start_time" name="start_time" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" >
              </div>
             
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用车结束时间
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="stop_time" name="stop_time" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" >
              </div>
             
          </div>
<!--            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>时长
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="duration" name="duration" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" placeholder="点击此框自动计算时间" onclick="lala()" readonly="readonly" >
              </div>
          </div> -->
                    <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                     <span class="x-red">*</span> 用车理由
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="reqmessage" name="reqmessage" class="layui-textarea"></textarea>
                    </div>
           </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>
                 
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          
          laydate.render({
        	  elem: '#start_time' ,
        	  type: 'datetime'
        	});
        laydate.render({
      	  elem: '#stop_time' ,
      	  type: 'datetime'
      	});
          //监听提交
          form.on('submit(add)', function(data){
        	    var start = document.getElementById("start_time").value;
                var stop = document.getElementById("stop_time").value;
                if(start==""){
                	alter("请输入用车开始事件");
                	break;
                }
                if(stop==""){
                	alter("请输入用车结束时间");
                	break;
                }
                
                if(((new Date(start.replace(/-/g,"\/"))) > (new Date(stop.replace(/-/g,"\/"))))){
                	 alert("开始用车时间不能晚于接数用车时间");
                	 break;
                }
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
            	document.getElementById('deptForm').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
               
            });
            return false;
          });
          
          
        });
        
        function lala(){
            var start = document.getElementById("start_time").value;
            var stop = document.getElementById("stop_time").value;
            if(start==""){
            	alter("请输入用车开始事件")
            }
            if(stop==""){
            	alter("请输入用车结束时间")
            }
            getHoliday(start, stop);
            console.log(getHoliday(start, stop));
            $("#duration").trigger("input"); 
        	$("#duration").val(DateDifference(start, stop) + "天");
        }
        function DateDifference(faultDate,completeTime){
            // let d1 = new Date(faultDate);
            // let d2 = new Date(completeTime);
            var stime =new Date(faultDate).getTime();
            var etime = new Date(completeTime).getTime();
            var usedTime = etime - stime;  //两个时间戳相差的毫秒数
            var days=Math.floor(usedTime/(24*3600*1000));
            //计算出小时数
            var leave1=usedTime%(24*3600*1000);    //计算天数后剩余的毫秒数
            var hours=Math.floor(leave1/(3600*1000));
            //计算相差分钟数
            var leave2=leave1%(3600*1000);        //计算小时数后剩余的毫秒数
            var minutes=Math.floor(leave2/(60*1000));
            // var time = days + "天"+hours+"时"+minutes+"分";
            var time = days;
            return time;
          }
    </script>
    
  </body>

</html>