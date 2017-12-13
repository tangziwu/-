<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>浙江大桥实业有限公司 -安居物业软件管理系统</title>
<link rel="stylesheet" href="css/login.css" />
<script>
	function setContentHeight() {
		var web_subnav = document.getElementById("login_bj");
		//	        var height = document.documentElement.clientHeight - 40 - document.getElementById("web-topbd").offsetHeight;
		web_subnav.style.height = document.documentElement.clientHeight + 'px';
	}
	window.onload = setContentHeight;
	window.onresize = setContentHeight;
</script>
</head>
<body>
     <s:if test="message != null"> 
	   <script type="text/javascript">
	     var message="错误的用户名或密码请重新登录!"
	     alert(message)
	   </script>
         
           </s:if>
	<!--<div id="login_bj">-->
	<div id="login">
		<DIV class="logo"></DIV>
		<div class="login_box">
			<form action="userAction_login" name="f" method="post">
				<input class="admin" type="text" name="user.account" placeholder="用户名"/> 
				<input class="passWord" type="password" name="user.password" placeholder="密码"/>
				<input class="submit" type="submit" value="" />
			</form>
			<div class="clear"></div>
		</div>
	</div>
	<div id="copyright">技术支持：物业办公管理系统</div>
	<!--</div>-->
</body>
</html>
