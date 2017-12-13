<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="check.jsp"%>
		<meta charset="utf-8" />
        <title>个人办公</title>
         <link rel="stylesheet" href="css/pintuer.css">
         <link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/show.css" />
        <link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
       
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript">
		
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
					<div class="show_title"><p>个人办公</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">个人请假条</li>
									
							</ul>

						</div>
					
						
						<div class="content_box">
							
							
							<div class="content_right">
							
								<div class="content_wrap" style="height:604px">
								
									<div class="body-content">
    <form method="post" class="form-x" action="leaveAction_add">  
      <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>请假人：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="leave.name" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>请假类型：</label>
        </div>
        <div class="field">
          <select name="leave.type" class="input w50">
              <option value="">请选择请假类型</option>
              <option value="事假">事假</option>
              <option value="病假">病假</option>
              <option value="其它">其它</option>
              
            </select>
         
         
        </div>
      </div>     
       <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>申请日期：</label>
        </div>
        <div class="field">
          <input type="date" class="input w50" value="" name="leave.shenqingdate" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>开始日期：</label>
        </div>
        <div class="field">
          <input type="date" id="start" class="input w50" value="" name="leave.sdate" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      
      
      <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>截至日期：</label>
        </div>
        <div class="field">
          <input type="date" id="end" class="input w50" value="" name="leave.edate" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      
     
      
     <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>请假天数：</label>
        </div>
        <div class="field">
          <input type="text" id="total" class="input w50" value="" name="leave.days" data-validate="required:请输入标题" onmouseover="count()"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label" style="font-size:14px">
          <label>详情描述：</label>
        </div>
        <div class="field">
          <textarea class="input" name="leave.reson" style=" height:90px;"></textarea>
          <div class="tips"></div>
           <input type="hidden" name="leave.status" value="未审核">
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
					
                   <li><a href="file-transfer.jsp">文件上传</a></li>
					<li><a href="leave.jsp">请假条</a></li>
					<li><a href="leaveAction_find">请假详情</a></li>				
					</ul>
				</div>
			</div>
			
			
		
		</div>
		
		 <script src="js/jquery-3.2.1.min.js"></script>
		 <script type="text/javascript">
		    
		    function count(){
		   
		      if(($("#start").val()!="") && ($('#end').val() !="")){
		         var start=$("#start").val()
		         var end=$("#end").val()
		         start = new Date(start.replace(/-/g, "/"));
                 end = new Date(end.replace(/-/g, "/"));
                   if(start.getTime()>end.getTime()){
                          alert("截至时间不能在开始时间之前！");
                   }
                   else{
                       var days = end.getTime() - start.getTime();
                       var time = parseInt(days / (1000 * 60 * 60 * 24));
                       $("#total").val(time);
                   }
                
               }else{ 
                   $("#total").val()=="";
               }
               
		    }
		    
		    
		 </script>
	</body>
</html>
