<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="check.jsp"%>
<meta charset="utf-8">
<title></title>
        <link rel="stylesheet" href="css/pintuer.css">
         <link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript">
			window.onload = function() {
		
				//			navLeft.style.height=(showRight.offsetHeight+150)+'px'
				//			showRight.style.width=(document.documentElement.clientWidth-295)+'px'
				$(function() {
					$(".st_tree").SimpleTree({
						click : function(a) {
							if (!$(a).attr("hasChild"))
								alert($(a).attr("ref"));
						}
					});
				});
		
			}
		</script>
	</head>
	<body>
		<div id="box">
			<div id="right_width" class="right_show">
				<div class="right_wrap">
					<div class="show_title" ><p>修改密码</p></div>
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
									<li style="font-size:16px;margin-top:6px">修改密码</li>
							</ul>
						</div>
						<div class="content_box" style="height:550px;">
							<div class="content_right">
								<div class="content_wrap">
								<div class="body-content">
    <form method="post" class="form-x" action="userAction_modifypassword" name="f">  
    	<div class="form-group">	
        <div class="label">
          <label>原始密码：</label>
        </div>
        <div class="field">
          <input type="password"  class="input w50" />
        
        </div>
      </div>
      <div class="form-group">	
        <div class="label">
          <label>新密码：</label>
        </div>
        <div class="field">
          <input type="password"  class="input w50" id="newPassword"/>
         
        </div>
      </div>
      <div class="form-group">	
        <div class="label">
          <label>重复输入密码：</label>
        </div>
        <div class="field">
          <input type="password" id="confirm" class="input w50" name="user.password" onblur="please()"/>
          <span id="tips1" style="height:42px;line-height:40px;color:red;">&nbsp;&nbsp;</span>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div>
          <button class="button bg-main icon-check-square-o" type="submit" onclick="subm()">提交</button>
        </div>
      </div>
    </form>
  </div>			
								</div>
							</div>				
						</div>
					</div>
				</div>
			</div>
			<div id="left_nav" class="left_menu">
				<div class="back">
					<a href="main.jsp"></a>
				</div>
				<div class="menu_list">
					<ul>
						<li><a href="password.jsp">修改密码</a></li>
						<li><a href="emp-add.jsp">个人信息</a></li>					
					</ul>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript">
		$(()=>{
		    function please(){
		       var newPassword=$("#newPassword").val()
		       var confirm=$("#confirm").val()
		       if(newPassword!=confirm){
		           $("#tips1").html(" * 您输入的密码不一致，请重新输入!")
		          
		       }else if(newPassword==confirm){
		          $("#tips1").html(" ")
		       }
		       
		 }
		 })
		</script>
	</body>
</html>