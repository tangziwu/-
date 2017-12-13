<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="check.jsp"%>
<meta charset="utf-8" />
<title>个人办公</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/webuploader.css">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
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
					<p>个人办公</p>
				</div>

				<Div class="right_box">
					<div class="right_topBar">
						<ul>

							<li style="font-size:16px;margin-top:6px">上传内容</li>

						</ul>

					</div>


					<div class="content_box">


						<div class="content_right">

							<div class="content_wrap">

								<div class="body-content">
									<form method="post" class="form-x" action="fileWordAction_add"
										enctype="multipart/form-data">
										<div class="form-group">
											<div class="label" style="font-size:14px">
												<label>标题：</label>
											</div>
											<div class="field">
												<input type="text" class="input w50" name="fileTransfer.title" />
												<div class="tips"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="label" style="font-size:14px">
												<label>文件：</label>
											</div>
											<div class="field">

												<input type="hidden" id="url1" name="fileTransfer.context" value=""/>

												<!-- 存放文件信息(容器-thelist,下载容器-uploader-list) -->
												<div id="thelist" class="uploader-list"></div>
												<div id="picker" style="margin-left:260px">浏览文件</div>



											</div>
										</div>


										 <div class="form-group">
          <div class="label" style="font-size:14px">
            <label>分类：</label>
          </div>
          <div class="field">
            <select name="fileTransfer.classfiy" class="input w50">
              <option value="-1">请选择分类</option>
              <option  value="小区公告">小区公告</option>
              <option  value="部门重要文件">部门重要文件</option>
              
            </select>
            <div class="tips"></div>
          </div>
        </div>


										<div class="form-group">
											<div class="label" style="font-size:14px">
												<label>描述：</label>
											</div>
											<div class="field">
												<textarea class="input" name="fileTransfer.remark"
													style=" height:90px;"></textarea>
												<div class="tips"></div>
											</div>
										</div>



										<div class="form-group">
											<div class="label" style="font-size:14px">

												<label>发布时间：</label>
											</div>
											<div class="field">
												<script src="js/laydate/laydate.js"></script>
												<input type="date" class="laydate-icon input w50"
													name="fileTransfer.date"
													onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})"
													value="" data-validate="required:日期不能为空"
													style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
												<div class="tips"></div>
											</div>
										</div>
										<div class="form-group">
											<div class="label" style="font-size:14px">
												<label>作者：</label>
											</div>
											<div class="field">
												<input type="text" class="input w50"
													name="fileTransfer.userName" value="${sessionScope.user1.name}" />
												<div class="tips"></div>
											</div>
										</div>

										<div class="form-group">
											<div class="label" style="font-size:14px">
												<label></label>
											</div>
											<div class="field">

												<button class="button bg-main icon-check-square-o"
													type="submit">提交</button>
												
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
				<a href="main.jsp"></a>
			</div>
			<div class="menu_list">
				<ul>

					<li><a href="file-transfer.jsp">文件上传</a></li>
					<li><a href="leave.jsp">请假条</a></li>
					<li><a href="leaveAction_find">请假详情</a></li>
				</ul>
			</div>
		</div>


	</div>

	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/webuploader.min.js"></script>
	<script type="text/javascript">
		$(function(){
		var $list=$("#thelist")   //这几个初始化全局的百度文档上没说明
	    var $btn =$("#ctlBtn")   //开始上传  
	    var $context=$("#url1")
	    var thumbnailWidth = 100   //缩略图高度和宽度 （单位是像素），当宽高度是0~1的时候，是按照百分比计算，具体可以看api文档  
	    var thumbnailHeight = 100
	    
		var uploader = WebUploader.create({
		// 选完文件后，是否自动上传。
    	auto: true,
		//swf文件路径
		swf:'js/Uploader.swf',
		//文件接收服务端
		server:'webUploaderAction_file',
		//选择文件的按钮
		pick:'#picker',
		//不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传
		resize:false,
		method:'POST'
		})
		
		//当有文件被添加进队列的时候
		uploader.on('fileQueued',function(file){
			$list.append( '<div id="' + file.id + '" class="item">' +
        	'<h4 class="info">' + file.name + '</h4>' +
        	'<p class="state">等待上传...</p>' +
    		'</div>' )
		})
		
		
   // 文件上传成功，给item添加成功class, 用样式标记上传成功。  
   uploader.on( 'uploadSuccess', function( file ) { 
       $("#url1").attr("value",file.name)
      
       
   });  
  
   
  });
		
	</script>
</body>
</html>
