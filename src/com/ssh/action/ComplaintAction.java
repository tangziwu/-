package com.ssh.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.dao.ComplaintDao;
import com.ssh.pojo.Complaint;
import com.ssh.pojo.Inform;
import com.ssh.pojo.PageBean;
import com.ssh.service.ComplaintService;

import net.sf.json.JSONArray;


public class ComplaintAction {
	private Complaint  complaint;
	private List<Complaint> complaints;
	private ComplaintDao complaintDao;
	private ComplaintService  complaintService;
	
	private Integer currPage = 1;
	
	
	 public Integer getCurrPage() {
		return currPage;
	}



	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public String getAllPower(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			//查询数据库数据
			//方法 查询3个状态
			int shuju1 = complaintService.find1();
			int shuju2 = complaintService.find2();
			int shuju3= complaintService.find3();
			
			//集合 
			List sizes= new ArrayList();
			//把数据添加到集合 通过json发出去
			sizes.add(shuju1);
			sizes.add(shuju2);
			sizes.add(shuju3);
			
			
			
			JSONArray jsonArray1= JSONArray.fromObject(sizes);
			
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().print(jsonArray1);
		
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	//分页查询
	public  String  find(){
		
		complaints=complaintService.find();
		

		return "find";
	}
	public String findAll(){
	  	  PageBean<Complaint> pageBean=complaintService.findPage(currPage);
	  	  //将pageBean 存入到值栈中
	  	  ActionContext.getContext().getValueStack().push(pageBean);
	  	  return "findAll";
	  	  
	    }
	//修改
	public  String  modify(){
		System.out.println("modify=-------"+complaint.getCompreState());
		if(complaint!=null){
			//先按id查出数据
			complaint=complaintService.findById(complaint.getCompreId());
			
			//如果要拿到处理人的名字，则是在当前的用户登录下拿，
			//complaint.setCompreEmpid(里面填从Session里面拿到的名字或者id)
			
			if(complaint.getCompreState()!=null){
				
				
				if(complaint.getCompreState().equals("未处理")){
				complaint.setCompreState("正在审核");
				complaint.setCompreDisponseDate(new Date());
				}else{
				complaint.setCompreState("已处理");
				complaint.setCompreDisponseDate(new Date());
				}
				
				
			}
			
			complaintService.modify(complaint);
			
			
			
		}
		
		return "modify";
	}
	
	
	
	//删除
	public  String  remove(){
			System.out.println("remove()----------");
			if(complaint!=null){
				complaintService.remove(complaint);
				
			}
			
			return "remove";
		}
	
	
	//新增
	
	public  String  add(){
		System.out.println("add()----------");
		if(complaint!=null){
			if(complaint.getCompreState()==null){
				complaint.setCompreState("未处理");
			}
			complaintService.add(complaint);
			
		}
		
		return "add";
	}
	
	public Complaint getComplaint() {
		return complaint;
	}
	public void setComplaint(Complaint complaint) {
		this.complaint = complaint;
	}
	public List<Complaint> getComplaints() {
		return complaints;
	}
	public void setComplaints(List<Complaint> complaints) {
		this.complaints = complaints;
	}
	public ComplaintDao getComplaintDao() {
		return complaintDao;
	}
	public void setComplaintDao(ComplaintDao complaintDao) {
		this.complaintDao = complaintDao;
	}
	public ComplaintService getComplaintService() {
		return complaintService;
	}
	public void setComplaintService(ComplaintService complaintService) {
		this.complaintService = complaintService;
	}


	
	
	
	
	
}
