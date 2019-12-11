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
    <script type="text/javascript" src="${ctx}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/lib/laydate/laydate.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/public/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="leaveAddForm"  action="${ctx}/leave/add">
          <div class="layui-form-item">
              <label for="carname" class="layui-form-label">
                  <span class="x-red">*</span>车名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="carname" name="carname" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" >
              </div>
             
          </div>
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
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>时长
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="duration" name="duration" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" placeholder="点击此框自动计算时间" onclick="lala()" readonly="readonly" >
              </div>
          </div>
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>车类型
              </label>
              <div class="layui-input-inline">
                <select name="leaveid" id="leaveid" class="form-control" style="width: 235px;" >
											<option value="" >--请选择--</option>
  											<c:forEach var="map" items="${map}"> 
        										<option value="${map.key}" >${map.value}</option>
      										</c:forEach>
									</select>
              </div>
             
          </div>
        
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
      

          //监听提交
          form.on('submit(add)', function(data){
        	  
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
            	document.getElementById('leaveAddForm').submit();
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
               
            });
            return false;
          });
          
          
        });
        laydate.render({
        	  elem: '#start_time' ,
        	  type: 'datetime'
        	});
        laydate.render({
      	  elem: '#stop_time' ,
      	  type: 'datetime'
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
        	$("#duration").val(getHoliday(start, stop) + "天");
        }
        function getHoliday(sdate, edate) {
            var num = datedifference(sdate, edate);
            var lastday = num % 7;
            var weeknum = 0;
            if (num >= 7) {
                weeknum = parseInt(num / 7);
            }

            var weekday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
            var result = 0;
            for (var i = 0; i < lastday; i++) {
                var dd = new Date(addDate(sdate, i)).getDay();
                if (weekday[dd] != "星期六" && weekday[dd] != "星期日") {
                    result++;
                }
            }
            return result + weeknum * 5 + 1;
          //  return result + weeknum * 5;
        }

        //两个时间相差天数 兼容firefox chrome
        function datedifference(sDate1, sDate2) { //sDate1和sDate2是2006-12-18格式  
            var dateSpan, tempDate, iDays;
            sDate1 = Date.parse(sDate1);
            sDate2 = Date.parse(sDate2);
            dateSpan = sDate2 - sDate1;
            dateSpan = Math.abs(dateSpan);
            iDays = Math.floor(dateSpan / (24 * 3600 * 1000));
            return iDays
        };

        function addDate(date, days) {
            var d = new Date(date);
            d.setDate(d.getDate() + days);
            var m = d.getMonth() + 1;
            return d.getFullYear() + '-' + m + '-' + d.getDate();
        }
    </script>
    
  </body>

</html>