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
<title>请假管理</title>
<link rel="stylesheet" href="css/show.css" />
<link rel="stylesheet" type="text/css"
	href="js/tree_themes/SimpleTree.css" />
<link href="css/layer-animate.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/mine.js"></script>
<script type="text/javascript" src="js/SimpleTree.js"></script>
<script type="text/javascript">
		
		</script>
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
				<div class="show_title">
					<p>考勤管理</p>
				</div>

				<Div class="right_box">
					<div class="right_topBar">
						<ul>

							<li style="font-size:16px;margin-top:6px">请假人：</li>
							<li><input type="text" style="height:30px;margin-top:7px"></li>
							<li><input class="queding" type="submit"
								style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF"
								value="搜 索" onclick="doSearch()" /></li>
							<li style="font-size:16px;margin-top:6px">请假日期：</li>
							<li><input type="date" style="height:30px;margin-top:7px"></li>-
							<li><input type="date" style="height:30px;margin-top:7px"></li>
							<li><input type="button"
								style="height:30px;width:63px;margin-top:7px;margin-left:100px;	background:#98FB98;color: #FFFFFF"
								value="新增" /></li>
							<li><input type="button"
								style="height:30px;width:63px;margin-top:7px;color: #FFFFFF;	background:#7FFFAA"
								value="删除" /></li>
						</ul>

					</div>
					<div class="content_box">
						<div class="content_right">
							<div class="content_wrap"  style="height:500px">
								<table width="95%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="			#B0C4DE">

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
										<td height="35" width="120" align="center" bgcolor="#6495ED">审核</td>
									</tr>
									<s:iterator var="leave" value="leaves">
										<tr id="<s:property value="#leave.id"/>">
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
											<td height="35" bgcolor="#FFFFFF" align="center"><a href="leaveAction_findId?leave.id=<s:property value='#leave.id'/>" id="sta">通过</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="leaveAction_findById?leave.id=<s:property value="#leave.id"/>" id="stu">拒绝</a>
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
		<div id="left_nav" class="left_menu" style="height:757px">
			<div class="back">
				<a href="main.jsp"></a>
			</div>
			<div class="menu_list">
				<ul>
					<li><a href="leaveAction_find1">请假管理</a></li>
					<li><a href="attendanceAction_findPage">考勤总计</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
