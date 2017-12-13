package com.ssh.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.dao.InformDao;
import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.Inform;
import com.ssh.pojo.PageBean;
import com.ssh.service.InformService;



import net.sf.json.JSONArray;

import net.sf.json.JSONSerializer;



public class InformAction {
	private  InformService  informService;
	private  InformDao  informDao;
	private  Inform  inform;
	private  List<Inform> informs;
	
	private Integer currPage = 1;
	
	
	 public Integer getCurrPage() {
		return currPage;
	}



	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}



	public String findAll(){
  	  PageBean<Inform> pageBean=informService.findPage(currPage);
  	  //将pageBean 存入到值栈中
  	  ActionContext.getContext().getValueStack().push(pageBean);
  	  return "findAll";
  	  
    }
	
	public String findAll1(){
	  	  PageBean<Inform> pageBean=informService.findPage(currPage);
	  	  //将pageBean 存入到值栈中
	  	  ActionContext.getContext().getValueStack().push(pageBean);
	  	  return "findAll1";
	  	  
	    }
	
	
	public  void  context(){//获取当前ID显示当前用户的详细信息(详细信息的单击事件发送请求来到这个方法)
		System.out.println("context---------");
		HttpServletRequest  request =ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		Integer  id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
	    Inform  inform = informService.findById(id);
		System.out.println(inform.getName());
		//Map<String, Object> session =ActionContext.getContext().getSession();
		inform.setDate(new java.util.Date(inform.getDate().getTime()));
		//session.put("inform", inform);
		//JSON  json =JSONSerializer.toJSON(inform);
		
		JSONArray json=JSONArray.fromObject(inform);
		//JSONObject  json =(JSONObject)JSONSerializer.toJSON(inform);
		System.out.println("-------------");
		System.out.println(json.toString());
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			out.println(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
	
	
	
	//新增的方法
	public String  add(){
		System.out.println("add()------------");
		if(inform!=null){
			informService.add(inform);
		}
		
		return "add";
	}
	
	
	
	//删除的方法
	public String remove(){      
		System.out.println("----------");
		if(inform!=null){
			System.out.println("remove---------------");
			informService.remove(inform);
		}
		
		return "remove";
	}
	
	
	public  String find(){
		
		
		informs=informService.find();
		

		return "find";
	}
	
    public  String find1(){
		
		
		informs=informService.find1();
		

		return "find1";
	}
	
	
	public InformService getInformService() {
		return informService;
	}
	public void setInformService(InformService informService) {
		this.informService = informService;
	}
	public InformDao getInformDao() {
		return informDao;
	}
	public void setInformDao(InformDao informDao) {
		this.informDao = informDao;
	}
	public Inform getInform() {
		return inform;
	}
	public void setInform(Inform inform) {
		this.inform = inform;
	}
	public List<Inform> getInforms() {
		return informs;
	}
	public void setInforms(List<Inform> informs) {
		this.informs = informs;
	}



	

}
