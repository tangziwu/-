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
					<div class="show_title"><p>请假详情</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">请假详情</li>
									
							</ul>

						</div>
					
						
						<div class="content_box">
							
							
							<div class="content_right">
							
								<div class="content_wrap" style="height:500px">
								
									<table  width="95%" border="1" cellpadding="0" cellspacing="1" bgcolor="skyblue">
                
								       <tr>
										<td height="35" width="30" align="center" bgcolor="	#6495ED"><input
											type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">员工姓名</td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">请假开始日期</td>
										<td height="35" width="140" align="center" bgcolor="#6495ED">请假截止日期</td>
										<td height="35" width="140" align="center" bgcolor="#6495ED">天数</td>
										<td height="35" width="140" align="center" bgcolor="#6495ED">请假类型</td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">请假原因</td>
										<td height="35" width="120" bgcolor="#6495ED" align="center">审核状态</td>
										
									</tr>
									<s:iterator var="leave" value="leaves">
                        <tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#leave.name"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                <s:date name="#leave.sdate" format="yyyy-MM-dd"/>
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:date name="#leave.edate" format="yyyy-MM-dd"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#leave.days" /></td>
                                <td height="35" bgcolor="#FFFFFF"   align="center"><s:property value="#leave.type"/></td>
                                 <td height="35" bgcolor="#FFFFFF"   align="center"><s:property value='#leave.reson'/></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                	<s:property value="#leave.status"/>
                                </td>
								</tr>
								</s:iterator>
															

							</table>
									
									
								
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
