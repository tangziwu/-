<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="check.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业主投诉</title>
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
					<div class="show_title" ><p>投诉管理</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">业主投诉</li>
							</ul>

						</div>
					
						
						<div class="content_box" style="height:550px">
							
							
							<div class="content_right">
							
								<div class="content_wrap">
								<div class="body-content">
    <form method="post" class="form-x" action="complaintAction_add">  
      <div class="form-group">
        <div class="label">
          <label>投诉标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="complaint.compreTitle" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
          
     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>投诉类型：</label>
          </div>
          <div class="field">
            <select name="complaint.compreType" class="input w50">
              <option value="维修管理">维修管理</option>
              <option value="业主矛盾">业主矛盾</option>
              <option value="小区设备问题">小区设备问题</option>
              
            </select>
            <div class="tips"></div>
          </div>
        </div>
        
       
      </if>
     <div class="form-group">
        <div class="label">
          <label>投诉人姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="complaint.compreOwner" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>投诉人联系方式：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="complaint.comprePhone" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>投诉内容：</label>
        </div>
        <div class="field">
          <textarea class="input" name="complaint.compreContext" style=" height:90px;"></textarea>
          <div class="tips"></div>
        </div>
      </div>
     
      
      
      <div class="form-group">
        <div class="label">
           
          <label>发布时间：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="date" class="laydate-icon input w50" name="complaint.compreTime" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      
    
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
        <input type="hidden" value="${sessionScope.user1.name}" name="complaint.compreEmpname">
      <input type="hidden" value="未处理" name="complaint.compreState">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
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
							<li><a href="complaintAction_findAll">投诉管理</a></li>
						<li><a href="Mycomplaints.jsp">业主投诉</a></li>
						
					
						
														
					</ul>
				</div>
			</div>
			
		
		</div>
	</body>
</html>
