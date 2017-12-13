<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="check.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知管理</title>
	<style>
		.a1{
			color:blue;
			background-color:white;
			
		}
		
		.a1:hover{
			color:blue;
			background-color:yellow;
		}
		
		.a2:hover{
			color:blue;
			background-color:yellow;
		}
		
		</style>
		<link rel="stylesheet" href="css/show.css" />
		<link rel="stylesheet" type="text/css" href="js/tree_themes/SimpleTree.css"/>
		<link rel="stylesheet" href="css/layer-animate.css"/>
		
		
		
		<script type="text/javascript" src="js/jquery-1.6.min.js" ></script>
		<script type="text/javascript" src="js/mine.js" ></script>
		<script type="text/javascript" src="js/SimpleTree.js"></script>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
		
	
	</head>
	<body>
		<div id="box">

			<div id="right_width" class="right_show">
				
				<div class="right_wrap">
					<div class="show_title" ><p>通知管理</p></div>
					
					<Div class="right_box" style="height:550px">
						<div class="right_topBar">
							<ul>
								
									<li style="font-size:16px;margin-top:6px">信息标题：</li>
									<li><input  id="t1" type="text" style="height:30px;margin-top:7px"></li>
									<li><input  id="f1" class="queding" type="button" style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF"  value="搜 索" /></li>

									
									<li>
										
									</li>
							</ul>

						</div>
					
						
						<div class="content_box" style="height:550px">
							
							
							<div class="content_right">
							
								<div class="content_wrap">
								<table  id="inform" width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="			#B0C4DE">
                
						 <tr>
                      
                            <td  height="35" width="120" align="center" bgcolor="	#6495ED">公告标题</td>
							<td height="35" width="120" align="center" bgcolor="#6495ED">公告分类</td>
                            <td  height="35" width="120" align="center" bgcolor="	#6495ED">发布人</td>
                            <td  height="35" width="140" align="center" bgcolor="	#6495ED">发布时间</td>
                            <td height="35"  align="center" bgcolor="	#6495ED">公告内容</td>
                            <td height="35" width="120" align="center" bgcolor="	#6495ED">操作</td>
                        </tr>
                  <s:iterator var="inform" value="list"> 
                   <tr id="<s:property value='#inform.id'/>">
                                
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#inform.title"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#inform.type"/></td>
                                <td  height="35" align="center" bgcolor="#FFFFFF"><s:property value="#inform.name"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="#inform.date" format="yyyy-MM-dd"/></td>
                                <td height="35" bgcolor="#FFFFFF"  id="show" align="center"><s:property value="#inform.context"/></td>
                                <td height="35" bgcolor="#FFFFFF"  align="center">
									
									<a  id="a2" class="a2" onclick="all1(<s:property value="#inform.id"/>)">内容详情</a>
                                </td>
					</tr>
															
                       </s:iterator>
							</table>
								<div style="margin-left: 45%;margin-top: 20px;">
                             
                            
                             <span>第<s:property value="currPage"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;
                             <span>总记录数:<s:property value="totalCount"/></span>&nbsp;&nbsp;
                             <span>
                              
              
                             <s:if test="currPage != 1">
                             <a href="informAction_findAll1.action?currPage=1">[首页]</a>&nbsp;&nbsp;
                             <a href="informAction_findAll.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
                             </s:if>
                             <s:if test="currPage != totalPage">
                             <a href="informAction_findAll1.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
                             <a href="informAction_findAll1.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
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
						
						<li><a href="informAction_find1">通知管理</a></li>	
													
					</ul>
				</div>
			</div>
			
		
		</div>
	</body>
	
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/method.js"></script>
	
	<script type="text/javascript">
		
		
		function all1(id){
		
		
	 var xhr = new XMLHttpRequest()
      xhr.open("post", "informAction_context", true)
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
      xhr.onreadystatechange = function () {
        if(xhr.readyState == 4){
          if(xhr.status == 200){
          
             var json = eval('(' + xhr.responseText + ')')
             for(k in json){
             var name=json[k].name
             var title=json[k].title
             var type=json[k].type
             var context=json[k].context
             }
            var obj={
          	 type:"layerFadeIn",
         	 title:"内容详情",
          	 close:"true",
          	 content:"<div>"+
           			"<span>公告标题："+title+"</span><br><br>"+
           			"<span>公告分类："+type+"</span><br><br>"+
           			"<span>发布人    ："+name+"</span><br><br>"+
           			"<span>公告内容："+context+"</span><br><br>"+
           			"</div>",
          	 area:["300px","350px"],
             btn:["取消",0]
      	 };
      	 method.msg_layer(obj);
            //document.getElementById("img").src = "images/"+xhr.responseText+".jpg"

     
          }
        }
      }
     
      xhr.send("id=" + id)
		//
			

		//
		}
		
		
		function foodall(){
			
			var wan = document.getElementsByName("selectedRow");
			
			var all = document.getElementById("selAll");
	
				if (all.checked) {
			
				for (var i = 0; i < wan.length; i++) {
					console.log("11");
					document.getElementsByName("selectedRow")[i].setAttribute("checked", true);
					}
				} else {
					for (var i = 0; i < wan.length; i++) {
						document.getElementsByName("selectedRow")[i].removeAttribute("checked");
	
					}
	
				}
		
		
		
		}

		$(()=>{
		
		
		
		

		$("body").delegate(".msg-layer-bg","click",function(){
        method.msg_close()
   	 });
		
		
		
			$("#next1").click(()=>{//上一页
			var page1 =parseInt($("#page").val());
				console.log("ss")
				$.post("informAction_find",{page:page1-1})
			
			});
			
		
			$("#next2").click(()=>{//下一页
			var page1 =parseInt($("#page").val());
				console.log("zz")
				$.post("informAction_find",{page:page1+1})
			
			});
		
		
		})
	
	
	</script>

</html>