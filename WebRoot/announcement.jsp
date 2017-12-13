<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布公告</title>
<link rel="stylesheet" href="css/pintuer.css">
         <link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript">
		 <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/lang/zh-cn/zh-cn.js"></script>
		</script>
		
	</head>
	<body>
		<div id="box">

			<div id="right_width" class="right_show">
				
				<div class="right_wrap">
					<div class="show_title" ><p>公告管理</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">我的公告</li>
							</ul>

						</div>
					
						
						<div class="content_box">
							
							
							<div class="content_right">
							
								<div class="content_wrap" style="height:550px">
								<div class="body-content">
    <form method="post" class="form-x" action="informAction_add">  
      <div class="form-group">
        <div class="label">
          <label>公告标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="inform.title" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
          
     
      
      
        <div class="form-group">
          <div class="label">
            <label>公告分类：</label>
          </div>
          <div class="field">
            <select name="inform.type" class="input w50">
              <option value="活动类">活动类</option>
              <option value="福利类">福利类</option>
              <option value="需求类">需求类</option>
              <option value="紧急事件类">紧急事件类</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
        
       
      
     <div class="form-group">
        <div class="label">
          <label>发布者：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="inform.name" data-validate="required:请输入标题" />
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>公告内容：</label>
        </div>
        <div class="field">
          <textarea class="input" name="inform.context" style=" height:90px;"></textarea>
          <div class="tips"></div>
        </div>
      </div>
     
      
      
      <div class="form-group">
        <div class="label">
           
          <label>发布时间：</label>
        </div>
        <div class="field"> 
          <script src="js/laydate/laydate.js"></script>
          <input type="date" class="laydate-icon input w50" name="inform.date" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />
          <div class="tips"></div>
        </div>
      </div>
      
    
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
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
						<li><a href="informAction_findAll">信息管理</a></li>
						<li><a href="announcement.jsp">发布公告</a></li>	
						
					
						
														
					</ul>
				</div>
			</div>
			
		
		</div>
	</body>
</html>
