<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="check.jsp"%>
		<meta charset="utf-8" />
		<title>员工管理</title>
		<link rel="stylesheet" href="css/show.css" />
		
		<script type="text/javascript" src="js/mine.js" ></script>
	</head>
	<body>
		<div id="box">

			<div id="right_width" class="right_show">
				<div class="right_wrap">
				<div class="show_title"><p>员工管理</p></div>
				<Div class="right_box">
					<div class="right_topBar">
						<ul>
							<li style="font-size:16px;margin-top:6px">姓名：</li>
									<li><input type="text" style="height:30px;margin-top:7px"></li>
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;background:#20B2AA;font-family:microsoft yahei;color: #FFFFFF" value="搜 索" onclick="doSearch()"/></li>
                  
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;background:#98FB98;color: #FFFFFF" value="新增" onclick="add()"/></li>
									<li><input type="button" style="height:30px;width:63px;margin-top:7px;color: #FFFFFF;	background:#7FFFAA" value="导出" onclick="doExportExcel()"/></li>

						</ul>
					</div>
					
					<div class="content_box" style="height:550px">
						<div class="content_all">
						<table  width="95%" border="0" cellpadding="0" cellspacing="1" bgcolor="#B0C4DE">
                
								   <tr>
                            <td  height="35"width="30" align="center" bgcolor="#6495ED"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td  height="35" align="center" bgcolor="#6495ED">员工编号</td>
                          
                            <td  height="35" width="120" align="center" bgcolor="#6495ED">姓名</td>
                            <td  height="35" width="140" align="center" bgcolor="#6495ED">电话号码</td>
                            <td height="35" width="80" align="center" bgcolor="#6495ED">性别</td>
                            <td height="35" width="80" align="center" bgcolor="#6495ED">email</td>
                             <td height="35" width="80" align="center" bgcolor="#6495ED">生日</td>
                             
                            <td height="35" width="120" align="center" bgcolor="#6495ED">操作</td>
                        </tr>
                             <s:iterator var="user" value="list"> 
                               <tr id="userid" value="<s:property value='#user.id'/>">
                                <td   height="35" align="center" bgcolor="#FFFFFF"><input type="checkbox" name="selectedRow" /></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#user.id"/></td>
                               
                                <td  height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#user.name"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#user.phone"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#user.sex"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:property value="#user.email"/></td>
                                <td height="35" align="center" bgcolor="#FFFFFF" ><s:date name="#user.birth" format="yyyy-MM-dd"/></td>
                          
                                <td height="35" bgcolor="#FFFFFF"  align="center">
                                	
                                    <a href="userAction_findById2?user.id=<s:property value='#user.id'/>">编辑</a>
                                    <a href="#" onclick="removeUser(<s:property value="#user.id" />,'<s:property value="#user.name" />')">删除</a>
                                </td>
                                
								</tr>
								
							</s:iterator>
        						
								
						
							</table>
							
							<div style="margin-left: 45%;margin-top: 20px;">
                             
                            
                             <span>第<s:property value="currPage"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;
                             <span>总记录数:<s:property value="totalCount"/></span>&nbsp;&nbsp;
                             <span>
                              
              
                             <s:if test="currPage != 1">
                             <a href="userAction_findAll.action?currPage=1">[首页]</a>&nbsp;&nbsp;
                             <a href="userAction_findAll.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
                             </s:if>
                             <s:if test="currPage != totalPage">
                             <a href="userAction_findAll.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
                             <a href="userAction_findAll.action?currPage=<s:property value="totalPage"/>">[尾页]</a>&nbsp;&nbsp;
                             </s:if>
                             
                             </span>
                            </div>
						</div>
						<div class="clear"></div>
					</div>
				</Div>
			</div>
			<div class="clear"></div>
			</div>
			
			
			<div id="left_nav" class="left_menu" style="height:770px">
				<div class="back">
					<a href="main.jsp"></a>
				</div>
				<div class="menu_list">
					<ul>
						<li><a href="userAction_findAll">员工信息</a></li>
						<li><a href="emp-add2.jsp">员工管理</a></li>					
					</ul>
				</div>
			</div>
			
			
			
		</div>
		<script src="js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
		 function removeUser(id,name){
		  //alert(id+" "+name)
		  if(confirm("是否确认删除 "+name+" ?")){
			  $.post("userAction_removejquery",{userid:id},(data)=>{
				  if(data){
					  $("#userid").remove()
				  }
			  })
		  }
	  }
	    
	    function add(){
	       window.location.href="emp-add2.jsp"
	    }
	    //导出列表  
     function doExportExcel(){  
     window.open("userAction_exportExcel");  
}  
		</script>
	</body>
</html>
