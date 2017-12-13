<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据报表-销售报表</title>

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
					<div class="show_title" ><p>销售报表</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
							</ul>

						</div>
						<div class="content_box" style="height:550px">

<!-- 中间白色框 放数据报表 -->
		<jsp:include page="yuan1.jsp"/>	



						</div>
					</div>
					
					
					
					
				
				</div>
				
			</div>
			
			<div id="left_nav" class="left_menu">
				<div class="back">
					<a href="shuju.jsp"></a>
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