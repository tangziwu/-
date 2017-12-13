<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/show.css" />
<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css" />
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="js/mine.js"></script>
<script type="text/javascript" src="js/SimpleTree.js"></script>
<script type="text/javascript"></script>
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
<style type="text/css">
th{background:#6495ED;text-align:center;width:11%;height:30px;}
td{background:#fff;text-align:center;width:11%;height:30px;}
#add_home:hover,#remove_home:hover,#sousuo:hover,#back:hover,#next:hover,.removeHome:hover,#first:hover,#last:hover{cursor:pointer;}
</style>
</head>
<body>
	<div id="box">

		<div id="right_width" class="right_show">
			<div class="right_wrap">
				<div class="show_title">
					<p>房产管理</p>
				</div>
				<Div class="right_box">
					<div class="right_topBar">
						<ul>
							<li style="font-size:16px;margin-top:6px">房屋户型：</li>
							<li><select style="height:30px;margin-top:7px;width:78px;" id="h_type">
								<option value="">请选择</option>
								<option value="一室一厅">一室一厅</option>
								<option value="两室一厅">两室一厅</option>
								<option value="两室两厅">两室两厅</option>
								<option value="三室两厅">三室两厅</option>
							</select></li>
							<li style="font-size:16px;margin-top:6px">房屋状态：</li>
							<li style="width:54px"><select style="height:30px;margin-top:7px" id="h_state">
									<option value="">请选择</option>
									<option value="已入住">已入住</option>
									<option value="未入住">未入住</option></select></li>
							<li style="font-size:16px;margin-top:6px">栋：</li>
							<li style="width:54px"><select style="height:30px;margin-top:7px" id="h_bulid">
									<option value="">请选择</option>
									<option value="一栋">一栋</option>
									<option value="二栋">二栋</option>
									<option value="三栋">三栋</option>
									<option value="四栋">四栋</option>
									<option value="五栋">五栋</option>
								</select></li>
							<li style="font-size:16px;margin-top:6px">单元：</li>
							<li style="width:54px"><select style="height:30px;margin-top:7px" id="h_unit">
									<option value="">请选择</option>
									<option value="一单元">一单元</option>
									<option value="二单元">二单元</option></select></li>
							<li style="font-size:16px;margin-top:6px">楼：</li>
							<li style="width:54px"><select style="height:30px;margin-top:7px" id="h_floor">
									<option value="">请选择</option>
									<option value="1楼">1楼</option>
									<option value="2楼">2楼</option>
									<option value="3楼">3楼</option>
									<option value="4楼">4楼</option>
									<option value="5楼">5楼</option>
								</select></li>
							<li><input class="queding" type="button" id="sousuo"
								style="height:30px;width:63px;margin-top:7px;background:#20B2AA;
								font-family:microsoft yahei;color: #FFFFFF;margin-left:28px;" value="搜 索"/></li>
						</ul>
					</div>
					<div class="content_box" style="height:550px">
						<div class="content_right">
							<div class="content_wrap">
								<table width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="#B0C4DE" id="data_table">
									
								</table>
								<div align="center" style="margin-top:18px;">
									<button id="first">首页</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="back">上一页</button>&nbsp;&nbsp;&nbsp;&nbsp;
									第<span id="h_page">1</span>页,共<span id="h_page_sum"></span>页
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="next">下一页</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button id="last">尾页</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="left_nav" class="left_menu">
			<div class="back">
				<a href="index.jsp"></a>
			</div>
			<div class="menu_list">
				<ul>
					<li><a href="house.jsp">房产信息</a></li>
					<li><a href="house-management.jsp">房产管理</a></li>
					<li><a href="house-guishu.jsp">房产归属</a></li>
					<li><a href="house-exit.jsp">房产注销</a></li>	
				</ul>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		var h_type = $("#h_type").val()
		var h_state = $("#h_state").val()
		var h_bulid = $("#h_bulid").val()
		var h_unit = $("#h_unit").val()
		var h_floor = $("#h_floor").val()
		var h_page = $("#h_page").text()
		var sumPage = 0
		var topNode = "<tr><th style='width:4%;'>门牌编号</th><th>所属楼栋</th><th>所属单元</th><th>所属楼层</th><th>所属房号</th><th>所属户型</th><th>房屋面积</th><th>房屋状态</th><th style='width:8%;'>操作</th></tr>"
	
		page_home()
	
		$("#sousuo").click(function(){
			$("#data_table").empty()
			page_home()
		})
		
		$("#back").click(function(){
			$("#data_table").empty()
			h_page = parseInt($("#h_page").text())-1
			page_home()
		})
		
		$("#next").click(function(){
			$("#data_table").empty()
			h_page = parseInt($("#h_page").text())+1
			page_home()
		})
		
		$("#first").click(function(){
			$("#data_table").empty()
			h_page = 1
			page_home()
		})
		
		$("#last").click(function(){
			$("#data_table").empty()
			h_page = sumPage
			page_home()
		})
		
		function page_home(){
			$("#h_type,#h_state,#h_bulid,#h_unit,#h_floor").change(function(){
				h_type = $("#h_type").find("option:selected").val()
				h_state = $("#h_state").find("option:selected").val()
				h_bulid = $("#h_bulid").find("option:selected").val()
				h_unit = $("#h_unit").find("option:selected").val()
				h_floor = $("#h_floor").find("option:selected").val()
			})
			$.ajax({
				url:"homeAction_pageHome",
				type:"post",
				data:{
					"h_page":h_page,
					"h_type":h_type,
					"h_state":h_state,
					"h_bulid":h_bulid,
					"h_unit":h_unit,
					"h_floor":h_floor
				},
				dataType:"json",
				success:function(json){
					var jsonPage = 0
					$("#h_page_sum").html(json.sumPage)
					sumPage = json.sumPage
					if(json.page<=1){
						jsonPage = 1
					}else if(json.page>1){
						jsonPage = json.page
					}
					$("#h_page").html(jsonPage)
					$("#data_table").append(topNode)
					$.each(json.rows, function(index){
						var rows = json.rows[index]
						var hid = rows.hid
						var oid = rows.oid
						var hnumber = rows.hnumber
						var hbulid = rows.hbulid
						var hstate = rows.hstate
						var hunit = rows.hunit
						var hfloor = rows.hfloor
						var htype = rows.htype
						var harea = rows.harea
						var hremarks = rows.hremarks
						var hno = rows.hno
						var childNode = "<tr><td style='width:4%;'>"+hnumber+"</td><td>"+hbulid+"</td><td>"+hunit+"</td>"
							childNode += "<td>"+hfloor+"</td><td>"+hno+"</td><td>"+htype+"</td><td>"+harea+"</td><td>"+hstate+"</td>"
							childNode += "<td style='width:8%;'><a href='homeAction_modifyByIdHome?id="+hid+"'>修改</a>"
							childNode += "&nbsp;&nbsp;&nbsp;<a class='removeHome' id='remove"+hid+"'>删除</a></td></tr>"	
						$("#data_table").append(childNode)
						$("#remove"+hid+"").click(function(){
							if(confirm("是否确认删除?")==false){
								return
							}
							$.ajax({
								url:"homeAction_removeHome",
								type:"post",
								data:{"hid":hid},
								success:function(data){
									if(data==1){
										alert("删除成功！")
										window.location.href="house.jsp"
									}else{
										alert("删除失败！")
									}
								}
							})
						})
					})
				}
			})
		}
	})
</script>
</body>
</html>