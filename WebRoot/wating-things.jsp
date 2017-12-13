<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>个人办公</title>
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
		<%@ include file="check.jsp"%>
	</head>
	<body>
		<div id="box">

			<div id="right_width" class="right_show">
				
				<div class="right_wrap">
					<div class="show_title" ><p>个人办公</p></div>
					
					<Div class="right_box">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">待办事宜：</li>
									<li><input type="text" style="height:30px;margin-top:7px"></li>
									<li><input class="queding" type="button" style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF"  value="搜 索" onclick="doSearch()"/></li>
                                     <li style="font-size:16px;margin-top:6px" >待办事件状态：</li>
                                     <li style="width:54px"><select style="height:30px;margin-top:7px"><option>已完成</option><option>未完成</option></select></li>
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;margin-left:300px;	background:#98FB98;color: #FFFFFF" value="新增"/></li>
										<li><input type="button" style="height:30px;width:63px;margin-top:7px;color: #FFFFFF;	background:#7FFFAA" value="删除" /></li>
							</ul>

						</div>
					
						
						<div class="content_box">
							
							
							<div class="content_right"  style="height:550px">
							
								<div class="content_wrap">
								<table  width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="			#B0C4DE">
                
								   <tr>
                            <td  height="35"width="30" align="center" bgcolor="	#6495ED"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td  height="35" align="center" bgcolor="	#6495ED">待办事项</td>
                            <td height="35" width="120" align="center" bgcolor="#6495ED">指定完成日期</td>
                            <td  height="35" width="120" align="center" bgcolor="	#6495ED">事件交代人</td>
                            <td  height="35" width="140" align="center" bgcolor="	#6495ED">事件完成人</td>
                           <td  height="35" width="140" align="center" bgcolor="	#6495ED">备注</td>
                            <td height="35" width="120" align="center" bgcolor="	#6495ED">操作</td>
                        </tr>
                        
                   		<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/>1</td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                1
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/>1</td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/>1</td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center">1</td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    <a href="javascript:doEdit('<s:property value='infoId'/>')">编辑</a>  
                                </td>
						</tr>
						
						
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                      
                                </td>
						</tr>
						
						
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
						
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>

						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
						
						
						
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
						
						
						
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
						
						<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
							<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
							<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
							<tr>
                                <td height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" >
                                
                                </td>
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="creator"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="createTime" format="yyyy-MM-dd HH:mm"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show_<s:property value='infoId'/>" align="center"></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                    
                                </td>
						</tr>
						
						
													



							</table>
									
									<div align="center" style="margin-top:36px">
										<button>上一页</button>
										<input type="number" step="1" value="1"  style="width:50px" />
										<button>下一页</button>
									
									</div>
									
								
								</div>
							</div>
							
							
							
							
							
							
							
							
						</div>
						
						
						
					</div>
					
					
					
					
				
				</div>
				
			</div>
			
			<div id="left_nav" class="left_menu">
				<div class="back" style="width:200px;height:101px">
					<a href="index.jsp"></a>
				</div>
				<div class="menu_list" style="width:200px;height:253px">
					<ul>
					
						<li><a href="file-transfer.jsp">公文上传</a></li>
						 <li><a href="file-transfer.jsp">报表上传</a></li>
					
						
						<li><a href="phone.jsp">通讯录</a></li>
						<li><a href="wating-things.jsp">待办事宜</a></li>	
							<li><a href="leave.jsp">请假条</a></li>	
							<li><a href="leave-message.jsp">请假详情</a></li>							
					</ul>
				</div>
			</div>
			
		
		</div>
	</body>
</html>
