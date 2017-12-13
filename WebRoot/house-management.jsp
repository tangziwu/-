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
					<div class="show_title" ><p>房产管理</p></div>
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
									<li style="font-size:16px;margin-top:6px">房产管理</li>
							</ul>
						</div>
						<div class="content_box" style="height:550px;overflow:auto;">
							<div class="content_right">
								<div class="content_wrap">
								<div class="body-content">
    <form method="post" class="form-x" action="homeAction_saveHome" name="f">  
    	<input name="home.hid" type="hidden" value="${home.hid}">
    	<div class="form-group">	
        <div class="label">
          <label>门牌编号：</label>
        </div>
        <div class="field">
          <input type="number" min="1" step="1" class="input w50" value="${home.hnumber}" name="home.hnumber"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属楼栋：</label>
        </div>
        <div class="field">
          <select name="home.hbulid" class="input w50">
              <option value="-1">请选择分类</option>
              <option value="一栋" ${home.hbulid=="一栋"?"selected":""}>一栋</option>
              <option value="二栋" ${home.hbulid=="二栋"?"selected":""}>二栋</option>
              <option value="三栋" ${home.hbulid=="三栋"?"selected":""}>三栋</option>
              <option value="四栋" ${home.hbulid=="四栋"?"selected":""}>四栋</option>
              <option value="五栋" ${home.hbulid=="五栋"?"selected":""}>五栋</option>
            </select>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>所属单元：</label>
          </div>
          <div class="field">
          <select name="home.hunit" class="input w50">
              <option value="-1">请选择分类</option>
              <option value="一单元" ${home.hunit=="一单元"?"selected":""}>一单元</option>
              <option value="二单元" ${home.hunit=="二单元"?"selected":""}>二单元</option>
            </select>
        </div>
        </div>
      <div class="form-group">
          <div class="label">
            <label>所属楼层：</label>
          </div>
          <div class="field">
          <select name="home.hfloor" class="input w50">
              <option value="-1">请选择分类</option>
              <option value="1楼" ${home.hfloor=="1楼"?"selected":""}>1楼</option>
              <option value="2楼" ${home.hfloor=="2楼"?"selected":""}>2楼</option>
              <option value="3楼" ${home.hfloor=="3楼"?"selected":""}>3楼</option>
              <option value="4楼" ${home.hfloor=="4楼"?"selected":""}>4楼</option>
              <option value="5楼" ${home.hfloor=="5楼"?"selected":""}>5楼</option>
            </select>
        </div>
        </div>
        <div class="form-group">
        <div class="label">
          <label>所属房号：</label>
        </div>
        <div class="field">
          <select name="home.hno" class="input w50">
              <option value="-1">请选择分类</option>
              <option value="01" ${home.hno=="01"?"selected":""}>01</option>
              <option value="02" ${home.hno=="02"?"selected":""}>02</option>
              <option value="03" ${home.hno=="03"?"selected":""}>03</option>
              <option value="04" ${home.hno=="04"?"selected":""}>04</option>
            </select>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>所属户型：</label>
          </div>
          <div class="field">
          <select name="home.htype" class="input w50">
              <option value="-1">请选择分类</option>
              <option value="一室一厅" ${home.htype=="一室一厅"?"selected":""}>一室一厅</option>
              <option value="两室一厅" ${home.htype=="两室一厅"?"selected":""}>两室一厅</option>
              <option value="两室两厅" ${home.htype=="两室两厅"?"selected":""}>两室两厅</option>
              <option value="三室两厅" ${home.htype=="三室两厅"?"selected":""}>三室两厅</option>
            </select>
        </div>
        </div>
       <div class="form-group" ${home.hstate=="已入住"?"style='display:none'":""}>
          <div class="label">
            <label>房屋状态：</label>
          </div>
         <div class="field">
          <select name="home.hstate" class="input w50">
              <option value="-1">请选择分类</option>
              <option value="未入住" ${home.hstate=="未入住"?"selected":""}>未入住</option>
              <option value="已入住" ${home.hstate=="已入住"?"selected":""}>已入住</option>
            </select>
        </div>
        </div> 
     <div class="form-group">
        <div class="label">
          <label>房屋面积：</label>
        </div>
        <div class="field">
          <input type="number" min="0" step="0.01" class="input w50" value="${home.harea}" name="home.harea"/>
          <p style="height:42px;line-height:40px;padding-left:238px;">(平方米)</p>
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