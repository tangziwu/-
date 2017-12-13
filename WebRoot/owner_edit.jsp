<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div class="show_title" ><p>业主管理</p></div>
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
									<li style="font-size:16px;margin-top:6px">业主管理</li>
							</ul>
						</div>
						<div class="content_box" style="height:550px;">
							<div class="content_right">
								<div class="content_wrap">
								<div class="body-content">
    <form method="post" class="form-x" action="ownerAction_saveOwner" name="f">  
    	<input name="owner.oid" type="hidden" value="${owner.oid}">
    	<div class="form-group">	
        <div class="label">
          <label>业主姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${owner.oname}" name="owner.oname"/>
        </div>
      </div>
      <div class="form-group">	
        <div class="label">
          <label>业主电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${owner.ophone}" name="owner.ophone"/>
        </div>
      </div>
       <div class="form-group">	
        <div class="label">
          <label>身份证号码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" maxlength="18" value="${owner.ocarder}" name="owner.ocarder"/>
        </div>
      </div>
     <div class="form-group">	
        <div class="label">
          <label>身份证地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${owner.oaddress}" name="owner.oaddress"/>
        </div>
      </div>
        <div class="form-group">	
        <div class="label">
          <label>现居地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${owner.oownership}" name="owner.oownership"/>
        </div>
      </div>
       <div class="form-group">	
        <div class="label">
          <label>备注信息：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${owner.oremark}" name="owner.oremark"/>
        </div>
      </div>
       <div class="form-group">	
        <div class="label">
          <label>入住时间：</label>
        </div>
        <div class="field">
          <input type="date" class="input w50" value="${owner.ojdata}" name="owner.ojdata"/>
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
	</body>
</html>