<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="check.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据 报表</title>

<script src="js/echarts.js" charset="utf-8"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/show.css" />
<link rel="stylesheet" type="text/css"
	href="js/tree_themes/SimpleTree.css" />
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
					<p>数据报表</p>
				</div>

				<Div class="right_box">
					<div class="right_topBar">
						<ul>

							<li style="font-size:16px;margin-top:6px">数据报表</li>
							


						</ul>

					</div>


					<div class="content_box" style="height:550px">


						<div class="content_right">

							<div class="content_wrap">
								<table width="95%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="			#B0C4DE">

									<tr>
										<td height="35" width="30" align="center" bgcolor="	#6495ED"><input
											type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
										<td height="35" align="center" bgcolor="	#6495ED">报表标题</td>



										<td height="35" width="140" align="center" bgcolor="	#6495ED">信息发布时间</td>
										
									</tr>
									<tr>
										<td height="35" align="center" bgcolor="#FFFFFF"><input
											type="checkbox" name="selectedRow" /></td>
										<td height="35" align="center" bgcolor="#FFFFFF"><s:property
												value="title" /><a href="shuju-xiaoshou.jsp">投诉报表</a></td>
										<td height="35" align="center" bgcolor="#FFFFFF"><s:date
												name="createTime" format="yyyy-MM-dd HH:mm" />2017-11-18</td>

										
									</tr>
									<tr>
										<td height="35" align="center" bgcolor="#FFFFFF"><input
											type="checkbox" name="selectedRow" /></td>
										<td height="35" align="center" bgcolor="#FFFFFF"><s:property
												value="title" /><a href="shuju-ruzhu.jsp">入住报表</a></td>
										<td height="35" align="center" bgcolor="#FFFFFF"><s:date
												name="createTime" format="yyyy-MM-dd HH:mm" />2017-11-18</td>

									
									</tr>
                                    
                                    <tr>
										<td height="35" align="center" bgcolor="#FFFFFF"><input
											type="checkbox" name="selectedRow" /></td>
										<td height="35" align="center" bgcolor="#FFFFFF"><s:property
												value="title" /><a href="shuju-water.jsp">水电用量报表</a></td>
										<td height="35" align="center" bgcolor="#FFFFFF"><s:date
												name="createTime" format="yyyy-MM-dd HH:mm" />2017-11-18</td>

									
									</tr>
									
									
									
								











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
					<li><a href="shuju.jsp">数据报表</a></li>


				</ul>
			</div>
		</div>


	</div>

</body>
</html>