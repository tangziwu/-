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
th{background:#6495ED;text-align:center;width:10%;height:30px;}
td{background:#fff;text-align:center;height:30px;}
#add_home:hover,#remove_home:hover,#sousuo:hover,#back:hover,#next:hover,.removeOwner:hover,#first:hover,#last:hover{cursor:pointer;}
</style>
</head>
<body>
	<div id="box">

		<div id="right_width" class="right_show">
			<div class="right_wrap">
				<div class="show_title">
					<p>业主管理</p>
				</div>
				<Div class="right_box">
					<div class="right_topBar">
						<ul>
							<li style="font-size:16px;margin-top:6px">业主姓名：</li>
							<li><input type="text" id="o_name" style="height:30px;margin-top:7px"></li>
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
				<a href="http://127.0.0.1:8080/SSHWUYE/main.jsp"></a>
			</div>
			<div class="menu_list">
				<ul>
					<li><a href="owner.jsp">业主信息</a></li>
					<li><a href="owner_edit.jsp">业主管理</a></li>
				</ul>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		var h_page = $("#h_page").text()
		var sumPage = 0
		var topNode = "<tr><th style='width:4%;'>编号</th><th style='width:8%;'>业主姓名</th><th style='width:8%;'>业主电话</th><th>入住时间</th>		<th>身份证号码</th><th style='width:16%;'>身份证地址</th><th style='width:16%;'>现居地址</th><th style='width:20%;'>备注信息</th><th style='width:8%;'>操作</th></tr>"
	
		page_owner()
	
		$("#sousuo").click(function(){
			$("#data_table").empty()
			page_owner()
		})
		
		$("#back").click(function(){
			$("#data_table").empty()
			h_page = parseInt($("#h_page").text())-1
			page_owner()
		})
		
		$("#next").click(function(){
			$("#data_table").empty()
			h_page = parseInt($("#h_page").text())+1
			page_owner()
		})
		
		$("#first").click(function(){
			$("#data_table").empty()
			h_page = 1
			page_owner()
		})
		
		$("#last").click(function(){
			$("#data_table").empty()
			h_page = sumPage
			page_owner()
		})
		
		function page_owner(){
			$.ajax({
				url:"ownerAction_pageOwner",
				type:"post",
				data:{
					"h_page":h_page,
					"o_name":$("#o_name").val()
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
						var oid = rows.oid
						var oname = rows.oname
						var ophone = rows.ophone
						var ojdata = rows.ojdata
						var ocarder = rows.ocarder
						var oaddress = rows.oaddress
						var oownership = rows.oownership
						var oremark = rows.oremark
						var childNode = "<tr><td>"+oid+"</td><td>"+oname+"</td><td>"+ophone+"</td><td>"+ojdata+"</td><td>"+ocarder+"</td>"
							childNode += "<td>"+oaddress+"</td><td>"+oownership+"</td><td>"+oremark+"</td><td><a href='ownerAction_modifyByIdOwner?id="+oid+"'>"
							childNode += "修改</a>&nbsp;&nbsp;&nbsp;<a class='removeOwner' id='remove"+oid+"'>删除</a></td></tr>"	
						$("#data_table").append(childNode)
						$("#remove"+oid+"").click(function(){
							if(confirm("是否确认删除?")==false){
								return
							}
							$.ajax({
								url:"ownerAction_removeOwner",
								type:"post",
								data:{"oid":oid},
								success:function(data){
									if(data==1){
										alert("删除成功！")
										window.location.href="owner.jsp"
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