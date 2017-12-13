<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
	    
		<meta charset="utf-8" />
		<title>安居物业管理系统</title>
		<link rel="stylesheet" href="css/main.css" />
		<link rel="stylesheet" href="css/layui.css" media="all">
		<script  src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
		window.onload=function(){
			var aDmin=document.getElementById('admin');
			btn_a=aDmin.getElementsByTagName('a')[0];
			uladmin=document.getElementById('ul_admin');
	
			btn_a.onclick=function()
			{
				uladmin.style.display='block';
				
			}
			uladmin.onmouseleave=function(){
				uladmin.style.display='none';
			}
			
			
		}
			
		</script>
		<%@ include file="check.jsp"%>
	</head>
	<body>
	
	   <input type="hidden" id="role" value="${sessionScope.user1.URole}">
	    <input type="hidden" id="name" value="${sessionScope.user1.name}">
		<div id="main">
		 
		 <div id="tq" style="height: 96px;margin-left: 50%;margin-top: -78px">
		  <iframe width="700" scrolling="no" height="70" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=2&icon=1&num=3&site=12"></iframe>
		 </div>
			<div class="top">
				<div class="logo"></div>
				<div class="admin" id="admin">
					<a href="#">${sessionScope.user1.name}</a>
					<ul id="ul_admin">
						<li><a href="emp-add.jsp">个人资料</a></li>
						<li><a href="userAction_findById?user.id=${sessionScope.user1.id}">修改密码</a></li>
						<li><a href="userAction_logout">安全退出</a></li>
					</ul>
				</div>
			</div>
			<!--标志和admin end-->
			
			<div id="block_list">
				
				
				<div class="block_left">

					<div class="wel_text">
						<div class="wel_black">欢迎登入安居物业管理系统</div>
					</div>
					<!--欢迎登入协同办公管理系统 end-->
					
					<div class="secend_box">
						<div class="weather">
							<a href="informAction_findAll1">查看通知</a>
						</div>
						<!--天气预报 end-->
						
						<div class="newscenter">
							<a href="https://www.toutiao.com/">
								<div class="new_title">
									新闻中心
								</div>
								<div class="news_show">
									柬埔寨首相回应美国停止援助选举：不会低头
								</div>
							</a>
						</div>
						<!--新闻中心 end-->
						<div class="clear"></div>
					</div>
					
					<div class="secend_box">
						<div class="send">
							<a href="#" onclick="doadvise()">通知管理</a>
						</div>
						
						<div class="accept">
							<a href="costAction_list?cost.HId=null">收费管理</a>
						</div>
						
						<div class="TOdeal">
							<a href="complaintAction_findAll">投诉管理</a>
						</div>
						
						<div class="clear"></div>
					</div>
					
					
					
				</div>
				
				<div class="block_right">
					<div class="right_box">
						<div class="talk">
							<a href="#" onclick="wechat()">网上聊天</a>
						</div>
						<div class="book">
							<a href="http://127.0.0.1:8080/Anju/owner.jsp">业主管理</a>
						</div>
						<div class="message">
							<a href="http://127.0.0.1:8080/Anju/message.jsp">短消息</a>
						</div>
						<div class="office">
							<a href="file-transfer.jsp">个人办公</a>
						</div>
						<div class="clear"></div>
					</div>
					
					<div class="right_box">
						<div class="attendance">
							<a href="#" onclick="doprivate()">考勤管理</a>
						</div>
						<div class="official ">
							<a href="fileWordAction_findAll">公文管理</a>
						</div>
						<div class="table">
							<a href="shuju.jsp">报表管理</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="right_box_end">
						<div class="folder">
							<a href="#" onclick="doemp()">员工管理</a>
						</div>
						<div class="system ">
							<a href="http://127.0.0.1:8080/Anju/house.jsp">房产管理</a>
						</div>


						<div class="clear"></div>
					</div>
					
					
				</div>
			</div>
			
			
			
			<div class="clear"></div>
		</div>
		<div class="layui-carousel" id="test1">
  <div carousel-item>
    <div>条目1</div>
    <div>条目2</div>
    <div>条目3</div>
    <div>条目4</div>
    <div>条目5</div>
  </div>
</div>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		    function doprivate(){
		          if($("#role").val()==2){
		              
		              alert("抱歉，您没有权限进去该管理！")
		             window.location.href="main.jsp";
		              
		          }
		          
		          
		          else if($("#role").val()==1){
		             window.location.href="attendanceAction_findPage"
		          }
		    }
		    
		    function doadvise(){
		          if($("#role").val()==2){
		              
		              alert("抱歉，您没有权限进去该管理！")
		             window.location.href="main.jsp";
		              
		          }
		          else if($("#role").val()==1){
		             window.location.href="informAction_findAll"
		          }
		    }
		     function doemp(){
		          if($("#role").val()==2){
		              
		              alert("抱歉，您没有权限进去该管理！")
		             window.location.href="main.jsp";
		              
		          }
		          else if($("#role").val()==1){
		             window.location.href="userAction_findAll"
		          }
		    }
		    function wechat(){
		       var chat=[];
		       var name=$("#name").val
		       chat.push(name)
		       window.location.href="http://127.0.0.1:8080/dynamic/index.jsp?name=${sessionScope.user1.name}"

		    }
		</script>
	</body>
</html>
