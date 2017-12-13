<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="s" uri="/struts-tags" %>
     
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉管理</title>
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript">
		
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
								
									<li style="font-size:16px;margin-top:6px">投诉标题：</li>
									<li><input type="text" style="height:30px;margin-top:7px"></li>
									<li><input class="queding" type="button" style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF"  value="搜 索" onclick="doSearch()"/></li>
                                    <li style="font-size:16px;margin-top:6px" >投诉时间：</li>
                                    <li><input type="date" style="height:30px;margin-top:7px"></li>-
                                    <li><input type="date" style="height:30px;margin-top:7px"></li>
                                     <li style="font-size:16px;margin-top:6px" >投诉状态：</li>
                                     <li style="width:54px">
                                     	<select  onchang="state()" style="height:30px;margin-top:7px">
                                     		<option value="-1">请选择</option>
                                     		<option value="已受理">已受理</option>
                                     		<option value="未受理">未受理</option>
                                     		<option value="正在审核">正在审核</option>
                                     	</select>
                                     </li>
									<li><a  href="Mycomplaints.jsp" style="height:30px;width:63px;margin-top:7px;	background:#98FB98;color: #FFFFFF">新增</a></li>

							</ul>

						</div>
					
						
						<div class="content_box" style="height:550px">
							
							
							<div class="content_right">
							
								<div class="content_wrap">
								<table  width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="			#B0C4DE">
                
								   <tr>
                            <td  height="35"width="30" align="center" bgcolor="	#6495ED"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                             <td height="35" width="120" align="center" bgcolor="#6495ED">投诉标题</td>
                            <td height="35" width="120" align="center" bgcolor="#6495ED">投诉类型</td>
                            <td  height="35" width="120" align="center" bgcolor="	#6495ED">投诉人</td>
							<td  height="35" width="140" align="center" bgcolor="	#6495ED">投诉时间</td>
							<td  height="35" width="140" align="center" bgcolor="	#6495ED">投诉内容</td>
							<td  height="35" width="140" align="center" bgcolor="	#6495ED">投诉处理人</td>
							<td  height="35" width="140" align="center" bgcolor="	#6495ED">投诉处理时间</td>
                           <td  height="35" width="140" align="center" bgcolor="	#6495ED">受理状态</td>
                           <td  height="35" width="140" align="center" bgcolor="	#6495ED">操作</td>
                           
                        </tr>
                  
                   <s:iterator var="complaint" value="list"> 
                   <tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow"  /></td>
                                 <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#complaint.compreTitle"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                <s:property value="#complaint.compreType"/>
								</td>
							 <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#complaint.compreOwner"/></td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/><s:date name="#complaint.compreTime" format="yyyy-MM-dd"/></td>
                                <td height="35"  bgcolor="#FFFFFF" ><s:property value="#complaint.compreContext"/></td>
								<td height="35" bgcolor="#FFFFFF"  id="show" align="center"><s:property value="#complaint.compreEmpname"/></td>
								  <td height="35" bgcolor="#FFFFFF"  id="show/>" align="center"><s:date name="#complaint.compreDisponseDate" format="yyyy-MM-dd"/></td>
									  
									  
									<!-- 受理状态 判断状态-->
									<td  height="35" bgcolor="#FFFFFF"  id="show" align="center">
										
							           <s:if test="#complaint.compreState=='未处理'">
							                                 未处理
							           </s:if>
							           <s:if test="#complaint.compreState=='正在审核'">
							                                正在审核
							           </s:if>
										
										<s:if test="#complaint.compreState=='已处理'">
							                                已处理
							           </s:if>
										
										
										
									</td>
                                
                                 <td height="35" bgcolor="#FFFFFF"  id="show" align="center">
                           
                                 		<s:if test="#complaint.compreState=='未处理'">
							                    
							          
									     <a  href="complaintAction_modify?complaint.compreId=<s:property value="#complaint.compreId"/>&complaint.compreState=<s:property value="#complaint.compreState"/>" style="color:blue">受理</a>
										 </s:if>
							           
							           <s:if test="#complaint.compreState=='正在审核'">
							                                
									     <a  href="complaintAction_modify?complaint.compreId=<s:property value="#complaint.compreId"/>&complaint.compreState=<s:property value="#complaint.compreState"/>" >审核</a>
									 </s:if>
										
										 <s:if test="#complaint.compreState=='已处理'">
							                                
									     <a style="color:gray">完成</a>
									 </s:if>
										
										
                                 	
                                 </td>
                              
								</tr>
					</s:iterator>
							</table>
								<div style="margin-left: 45%;margin-top: 20px;">
                             
                            
                             <span>第<s:property value="currPage"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;
                             <span>总记录数:<s:property value="totalCount"/></span>&nbsp;&nbsp;
                             <span>
                              
              
                             <s:if test="currPage != 1">
                             <a href="complaintAction_findAll.action?currPage=1">[首页]</a>&nbsp;&nbsp;
                             <a href="complaintAction_findAll.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
                             </s:if>
                             <s:if test="currPage != totalPage">
                             <a href="complaintAction_findAll.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
                             <a href="complaintAction_findAll.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
                             </s:if>
                             
                             </span>
                            </div>	
								
								</div>
							</div>
							
							
							
							
							
							
							
							
						</div>
						
						
						
					</div>
					
					
					
					
				
				</div>
				
			</div>
			
			<div id="left_nav" class="left_menu" style="height:770px" >
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