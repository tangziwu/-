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
		<title>收费管理</title>
		<link rel="stylesheet" href="css/show.css" />
		
		<script type="text/javascript" src="js/mine.js" ></script>
	</head>
	<body>
		<div id="box">

			<div id="right_width" class="right_show">
				<div class="right_wrap">
				<div class="show_title"><p>收费管理</p></div>
				<Div class="right_box">
					<div class="right_topBar">
						<ul>
							<li style="font-size:16px;margin-top:6px">房屋编号：</li>
									<li><input type="text" style="height:30px;margin-top:7px"></li>
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF" value="搜 索" onclick="doSearch()"/></li>
                  
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;background:#98FB98;color: #FFFFFF" value="新增" onclick="add()"/></li>
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;color: #FFFFFF;	background:#7FFFAA" value="导出" onclick="doExportExcel()"/></li>

						</ul>
					</div>
					
					<div class="content_box" style="height:550px">
						<div class="content_all">
						<table  width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="#B0C4DE">
                
								   <tr>
                            <td  height="35"width="30" align="center" bgcolor="#6495ED">序号</td>
                            <td  height="35" align="center" bgcolor="#6495ED">房屋编号</td>
                            <td  height="35" width="120" align="center" bgcolor="#6495ED">物业费标准</td>
                            <td  height="35" width="140" align="center" bgcolor="#6495ED">车位编号</td>
                            <td height="35" width="80" align="center" bgcolor="#6495ED">停车费标准</td>
                            <td height="35" width="80" align="center" bgcolor="#6495ED">收房日期</td>
                             <td height="35" width="80" align="center" bgcolor="#6495ED">缴费日期</td>
                             <td height="35" width="80" align="center" bgcolor="#6495ED">应收金额</td>
                             <td height="35" width="80" align="center" bgcolor="#6495ED">实收金额</td>
                             <td height="35" width="80" align="center" bgcolor="#6495ED">账户余额</td>
                             
                            <td height="35" width="120" align="center" bgcolor="#6495ED">操作</td>
                        </tr>
                            <c:forEach var="cost" items="${costs}">
					                        	<tr>
					                        		<form action="costAction_modify" method="post" name="f">
					                        		<td height="35" align="center" bgcolor="#FFFFFF"><input name="cost.CId" style="display: none;" type="hidden" value="${cost.CId }">
					                        			${cost.CId }
					                        		</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.HId }</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.CProperty }</td>
					                        		
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.PId }</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.CPark }</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.CPurchase }</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF"><fmt:formatDate value="${cost.CPayment }" pattern="yyyy-MM-dd"/></td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.CAmount }</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">
					                        			<input name="cost.CAmountpaid" type="number" value="${cost.CAmountpaid }" step="0.01">
					                        		</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF">${cost.CAccount }</td>
					                        		<td height="35" align="center" bgcolor="#FFFFFF"><a><button type="submit" style="background: none;border: none;color: red;">缴费</button></a></td>
					                        		</form>
					                        	</tr>
				                        	</c:forEach>
        						
								
						
							</table>
							
							
						</div>
						<div class="clear"></div>
					</div>
				</Div>
			</div>
			<div class="clear"></div>
			</div>
			
			
			<div id="left_nav" class="left_menu" style="height:770px">
				<div class="back">
					<a href="main.jsp"></a>
				</div>
				<div class="menu_list">
					<ul>
						<ul>
						<li><a href="#">收费信息</a></li>
								
					</ul>			
					</ul>
				</div>
			</div>
			
			
			
		</div>
		<script src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		 
		</script>
	</body>
</html>
