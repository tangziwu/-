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
<link rel="stylesheet" href="css/show.css" />
<link rel="stylesheet" type="text/css"
	href="js/tree_themes/SimpleTree.css" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/mine.js"></script>
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
				<div class="show_title">
					<p>考勤管理</p>
				</div>

				<Div class="right_box">
					<div class="right_topBar">
						<ul>
							<span><li style="font-size:16px;margin-top:6px">员工考勤记录:</li></span>
							<li><input type="button" style="height:30px;width:63px;margin-top:7px;color: #FFFFFF;	background:#7FFFAA" value="导出" onclick="doExportExcel()"/></li>
						</ul>

					</div>
					<div class="content_box">
						<div class="content_right">
							<div class="content_wrap" style="height:500px">
								<table width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="grey">
									<tr>
										<td height="35" width="30" align="center" bgcolor="	#6495ED"><input
											type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">员工编号</td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">员工姓名</td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">考勤时间</td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">考勤日期</td>
										<td height="35" width="120" align="center" bgcolor="#6495ED">考勤记录</td>
									</tr>
									<c:forEach var="att" items="${sessionScope.pageBean.list }">
										<tr id="${att.id}">
											<td height="35" align="center" bgcolor="#FFFFFF"><input
												type="checkbox" name="selectedRow" /></td>
											<td height="35" align="center" bgcolor="#FFFFFF">${att.userId}</td>
											<td height="35" align="center" bgcolor="#FFFFFF">${att.name}</td>
											<td height="35" align="center" bgcolor="#FFFFFF">${att.utime}</td>
											<td height="35" align="center" bgcolor="#FFFFFF"><fmt:formatDate
													value="${att.dates}" /></td>
											<td height="35" bgcolor="#FFFFFF" align="center">${att.status}</td>
										</tr>
									</c:forEach>
									
								</table>
								<div style="margin-left: 45%;margin-top: 20px;">
									<span>第 ${sessionScope.pageBean.currPage}/${sessionScope.pageBean.totalPage}页</span>
									&nbsp;&nbsp;<span>总记录数:${sessionScope.pageBean.totalCount}</span>&nbsp;&nbsp;
									<span >
                                    <a style="color:red;" href="attendanceAction_findPage?currPage=1">[首页]</a>&nbsp;&nbsp;
                                     <c:if test="${pageBean.currPage!= 1}">
                                    <a style="color:red;" href="attendanceAction_findPage?currPage=${sessionScope.pageBean.currPage-1}">[上一页]</a>&nbsp;&nbsp;
                                    </c:if>
                                    <c:if test="${pageBean.currPage!=pageBean.totalPage}">
                                    <a  style="color:red;" href="attendanceAction_findPage?currPage=${sessionScope.pageBean.currPage+1}">[下一页]</a>&nbsp;&nbsp;
                                    </c:if>
                                    <a  style="color:red;" href="attendanceAction_findPage?currPage=${sessionScope.pageBean.totalPage}">[尾页]</a>&nbsp;&nbsp;
								    </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="left_nav" class="left_menu" style="height:770px">
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
	<script type="text/javascript">
	 //导出列表  
     function doExportExcel(){  
     window.open("attendanceAction_exportExcel");  
}  
	</script>
</body>
</html>
