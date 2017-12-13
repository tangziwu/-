<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="/struts-tags"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
		<title>公文管理</title>
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript">
		
		</script>
		<script type="text/javascript">
		window.onload=function(){
			
//			navLeft.style.height=(showRight.offsetHeight+150)+'px'
//			showRight.style.width=(document.documentElement.clientWidth-295)+'px'
			$(function(){
			$(".st_tree").SimpleTree({
				click:function(a){
					if(!$(a).attr("hasChild"))
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
					<div class="show_title"><p>个人办公</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">文档名字:</li>
									<li><input type="text" style="height:30px;margin-top:7px"></li>
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF" value="搜 索" onclick="doSearch()"/></li>

									<li><input type="button" style="height:30px;width:63px;margin-top:7px;background:#98FB98;color: #FFFFFF" value="新增" onclick="addfile()"/></li>
										
							</ul>

						</div>
					
						
						<div class="content_box">
							
							
							<div class="content_right">
							
								<div class="content_wrap" style="height:500px">
							<table  width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="			#B0C4DE">
                
								   <tr>
                            <td  height="35"width="30" align="center" bgcolor="	#6495ED"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td  height="35" align="center" bgcolor="	#6495ED">文件标题</td>
                            <td height="35" width="120" align="center" bgcolor="#6495ED">文件分类</td>
                            <td  height="35" width="120" align="center" bgcolor="	#6495ED">上传文档</td>
                            <td height="35" width="120" align="center" bgcolor="#6495ED">文件备注</td>
                            <td  height="35" width="140" align="center" bgcolor="	#6495ED">上传日期</td>
                            <td height="35" width="120" align="center" bgcolor="	#6495ED">上传者</td>
                        </tr>
                        <s:iterator  var="file" value="list" status="rows">
                   <tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#file.title"/></td>
                                 <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#file.classfiy"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><a href="upload/<s:property value="#file.context"/>"><s:property value="#file.context"/></a></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"><s:property value="#file.remark"/></td>
                                 <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"><s:date name="#file.date" format="yyyy-MM-dd"/></td>
                                  <td height="35" align="center" bgcolor="#FFFFFF" >
                                <s:property value="#file.userName"/>
                                </td>
								</tr>
							</s:iterator>								

							</table>
							<div style="margin-left: 45%;margin-top: 20px;">
                             
                            
                             <span>第<s:property value="currPage"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;
                             <span>总记录数:<s:property value="totalCount"/></span>&nbsp;&nbsp;
                             <span>
                              
              
                             <s:if test="currPage != 1">
                             <a href="fileWordAction_findAll.action?currPage=1">[首页]</a>&nbsp;&nbsp;
                             <a href="fileWordAction_findAll.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
                             </s:if>
                             <s:if test="currPage != totalPage">
                             <a href="fileWordAction_findAll.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
                             <a href="fileWordAction_findAll.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
                             </s:if>
                             
                             </span>
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
						
						<li><a href="file-transfer.jsp">公文上传</a></li>
						 						
					</ul>
				</div>
			</div>
			
		
		</div>
		<script type="text/javascript">
		   function addfile(){
		      window.location.href="file-transfer.jsp"
		   }
		</script>
	</body>
</html>
