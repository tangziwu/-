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
    <form method="post" class="form-x" action="userAction_add">  
      <div class="form-group">
        <div class="label">
          <label>员工姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.name}" name="user.name" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>员工账号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.account}" name="user.account" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>员工密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" value="${user.password}" name="user.password" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>员工角色：</label>
       </div>
          <div class="field">
            <select name="user.URole" class="input w50"  >
              <option value="">请选择角色</option>
              <option value="1" ${user.URole=='1'?'selected':''} >管理员</option>
              <option value="2" ${user.URole=='2'?'selected':''} >一般用户</option>
              
            </select>
            <div class="tips"></div>
          </div>
        </div>
        <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.phone}" name="user.phone" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>  
     <div class="form-group">
        <div class="label">
            
         
         
          <label>性别：</label>
          </div>
  
          男<input type="radio"  value="男" name="user.sex" ${user.sex=='男'?'checked':''} />
          女<input type="radio"  value="女" name="user.sex"  ${user.sex=='女'?'checked':''}/>
          <div class="tips"></div>
        </div>
        
    <div class="form-group">
        <div class="label">
          <label>电子邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.email}" name="user.email" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
   
    <div class="form-group">
        <div class="label">
           
          <label>生日：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="date" class="laydate-icon input w50" value="${user.birth}"name="user.birth" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <textarea class="input" name="user.remark"  style=" height:90px;">${user.remark}</textarea>
          <div class="tips"></div>
        </div>
      </div>
      
     
     
      
      
     
      
    
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
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
						<li><a href="userAction_findAll">员工信息</a></li>
						<li><a href="emp-add2.jsp">员工管理</a></li>					
					</ul>
						
						
					
						
														
					
				</div>
			</div>
			
		
		</div>
	</body>
</html>
