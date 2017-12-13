<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="check.jsp"%>
		<meta charset="utf-8" />
        <title>员工管理</title>
        <link rel="stylesheet" href="css/pintuer.css">
         <link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript">
   <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/lang/zh-cn/zh-cn.js"></script>
		</script>
		<script type="text/javascript">
		window.onload=function(){
			
//			navLeft.style.height=(showRight.offsetHeight+150)+'px'
//			showRight.style.width=(document.documentElement.clientWidth-295)+'px'
			$(function(){
			$(".st_tree").SimpleTree({
				click:function(a){
					if(!$(a).attr("hasChild"))
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
					<div class="show_title" ><p>个人信息管理</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">员工信息</li>
							</ul>

						</div>
					
						
						<div class="content_box" style="height:550px">
							
							
							<div class="content_right">
							
								<div class="content_wrap"  style="position:absolute; height:550px; overflow:auto; width:1289px">
								<div class="body-content">
    <form method="post" class="form-x" action="">  
      <div class="form-group">
        <div class="label">
          <label>员工姓名：</label>
        </div>
        <div class="field">
          <input readonly="readonly" type="text" class="input w50" value="${sessionScope.user1.name}" name="title" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>员工账号：</label>
        </div>
        <div class="field">
          <input readonly="readonly" type="text" class="input w50" value="${sessionScope.user1.id}" name="title" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      
    
        <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input readonly="readonly" type="text" class="input w50" value="${sessionScope.user1.phone}" name="title" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>  
     
        <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field">
          <input readonly="readonly" type="text" class="input w50" value="${sessionScope.user1.sex}" name="title" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>  
    <div class="form-group">
        <div class="label">
          <label>电子邮箱：</label>
        </div>
        <div class="field">
          <input readonly="readonly" type="text" class="input w50" value="${sessionScope.user1.email}" name="title" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
   
    <div class="form-group">
        <div class="label">
           
          <label>生日：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input readonly="readonly" type="text" class="laydate-icon input w50" name="datetime" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="${sessionScope.user1.birth}"  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>

      
      
     
     
      
      
     
      
    
      
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
	</body>
</html>
