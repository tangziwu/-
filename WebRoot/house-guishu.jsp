<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
        <link rel="stylesheet" href="css/pintuer.css">
         <link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
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
					<div class="show_title" ><p>房产管理</p></div>
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
									<li style="font-size:16px;margin-top:6px">房产归属</li>
							</ul>
						</div>
						<div class="content_box" style="height:550px;">
							<div class="content_right">
								<div class="content_wrap">
								<div class="body-content">
    <form method="post" class="form-x" action="homeAction_addOid" name="f">  
    	<div class="form-group">	
        <div class="label">
          <label>门牌编号：</label>
        </div>
        <div class="field">
          <input type="number" min="1" step="1" class="input w50" name="home.hnumber"/>
          <p style="height:42px;line-height:40px;padding-left:238px;color:gray;">&nbsp;&nbsp;*输入的门牌编号必须存在，否则无效</p>
        </div>
      </div>
      <div class="form-group">	
        <div class="label">
          <label>业主姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="owner.oname"/>
          <p style="height:42px;line-height:40px;padding-left:238px;color:gray;">&nbsp;&nbsp;*输入的信息必须已录入业主信息，否则无效</p>
        </div>
      </div>
      <div class="form-group">	
        <div class="label">
          <label>业主身份证：</label>
        </div>
        <div class="field">
          <input type="text" maxlength="18" class="input w50" name="owner.ocarder"/>
          <p style="height:42px;line-height:40px;padding-left:238px;color:gray;">&nbsp;&nbsp;*输入的信息必须已录入业主信息，否则无效</p>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div>
          <button class="button bg-main icon-check-square-o" type="submit">提交</button>
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
	</body>
</html>