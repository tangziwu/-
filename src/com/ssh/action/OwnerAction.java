package com.ssh.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ssh.pojo.Owner;
import com.ssh.service.OwnerService;
import com.ssh.utils.JsonDateValueProcessor;
import com.ssh.utils.Pager;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

public class OwnerAction {
	
	private OwnerService ownerService;
	private Owner owner;
	private Integer id;
	
	/**
	 * 通讯录a
	 */
	public String checkMan(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			String oname = (request.getParameter("oname")==null||"".equals(request.getParameter("oname")))?null:request.getParameter("oname");
			List<Owner> owners = ownerService.findByName(oname);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
			JSON json = JSONSerializer.toJSON(owners,jsonConfig);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json.toString());
			
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 业主分页信息
	 */
	public String pageOwner(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			Integer h_page = Integer.parseInt((request.getParameter("h_page")==null||"".equals(
					request.getParameter("h_page")))?"1":request.getParameter("h_page"));
			Integer row = 14;
			String o_name = (request.getParameter("o_name")==null||"".equals(request.getParameter("o_name")))?null:request.getParameter("o_name");
			Integer total = ownerService.getTotal(o_name);
			Integer sumPage = (total%row==0)?total/row:total/row+1;
			if(h_page>sumPage){
				h_page = sumPage;
			}
			List<Owner> homes = ownerService.findPageOwner(h_page,row,o_name);
			Pager<Owner> pager = new Pager<Owner>();
			pager.setTotal(total);
			pager.setRows(homes);
			pager.setPage(h_page);
			pager.setSumPage(sumPage);
			
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Date.class,new JsonDateValueProcessor());
			JSON json = JSONSerializer.toJSON(pager,jsonConfig);
			
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json.toString());
			
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除
	 */
	public String removeOwner(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			Integer oid = Integer.parseInt(request.getParameter("oid"));
			owner = new Owner();
			owner = ownerService.findById(oid);
			if(owner!=null){
				ownerService.removeHome(owner);
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(1);
			}else{
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据ID查询跳转修改页面
	 * @return
	 */
	public String modifyByIdOwner(){
		owner = new Owner();
		owner = ownerService.findById(id);
		return "modifyByIdOwner";
	}
	
	/**
	 * 添加/修改
	 * @return
	 */
	public String saveOwner(){
			if(owner !=null && owner.getOid()==null){
				ownerService.addHome(owner);
			}else{
				ownerService.modifyHome(owner);
			}
		return "saveOwner";
	}
	

	public OwnerService getOwnerService() {
		return ownerService;
	}

	public void setOwnerService(OwnerService ownerService) {
		this.ownerService = ownerService;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
