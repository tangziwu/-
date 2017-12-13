package com.ssh.action;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ssh.pojo.Home;
import com.ssh.pojo.Owner;
import com.ssh.service.HomeService;
import com.ssh.utils.JsonDateValueProcessor;
import com.ssh.utils.Pager;

import net.sf.json.JSON;
import net.sf.json.JSONSerializer;
import net.sf.json.JsonConfig;

public class HomeAction {
	private HomeService homeService;
	private Home home;
	private Integer id;
	private Owner owner;
	
	/**
	 * 房产注销
	 */
	public String removeOid(){
		try {
			Integer hnum = home.getHnumber();
			if(hnum!=null){
				home = new Home();
				home = homeService.findByHnum(hnum);
				home.setOid(null);
				home.setHstate("未入住");
				homeService.modifyHome(home);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "removeOid";
	}
	
	/**
	 * 房产变更
	 */
	public String addOid(){
		Integer oid = 0;
		try {
			Integer hnum = home.getHnumber();
			if(owner.getOname()!=null&&owner.getOcarder()!=null){
				oid = homeService.findOid(owner.getOname(),owner.getOcarder());
				System.out.println(oid+"-----------------------------");
			}
			if(hnum!=null){
				home = new Home();
				home = homeService.findByHnum(hnum);
				home.setOid(oid);
				home.setHstate("已入住");
				homeService.modifyHome(home);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return "addOid";
	}
	
	/**
	 * 分页
	 */
	public String pageHome(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			Integer h_page = Integer.parseInt((request.getParameter("h_page")==null||"".equals(
					request.getParameter("h_page")))?"1":request.getParameter("h_page"));
			Integer row = 14;
			String h_type = (request.getParameter("h_type")==null||"".equals(request.getParameter("h_type")))?null:request.getParameter("h_type");
			String h_state = (request.getParameter("h_state")==null||"".equals(request.getParameter("h_state")))?null:request.getParameter("h_state");
			String h_bulid = (request.getParameter("h_bulid")==null||"".equals(request.getParameter("h_bulid")))?null:request.getParameter("h_bulid");
			String h_unit = (request.getParameter("h_unit")==null||"".equals(request.getParameter("h_unit")))?null:request.getParameter("h_unit");
			String h_floor = (request.getParameter("h_floor")==null||"".equals(request.getParameter("h_floor")))?null:request.getParameter("h_floor");
			Integer total = homeService.getTotal(h_type,h_state,h_bulid,h_unit,h_floor);
			Integer sumPage = (total%row==0)?total/row:total/row+1;
			if(h_page>sumPage){
				h_page = sumPage;
			}
			List<Home> homes = homeService.findPageHome(h_page,row,h_type,h_state,h_bulid,h_unit,h_floor);
			Pager<Home> pager = new Pager<Home>();
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
	 * 添加/修改
	 * @return
	 */
	public String saveHome(){
			
			if(home !=null && home.getHid()==null){
				homeService.addHome(home);
			}else{
				homeService.modifyHome(home);
			}
		return "saveHome";
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String removeHome(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			Integer hid = Integer.parseInt(request.getParameter("hid"));
			home = new Home();
			home = homeService.findById(hid);
			if(home!=null){
				homeService.removeHome(home);
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
	public String modifyByIdHome(){
		home = new Home();
		home = homeService.findById(id);
		return "modifyByIdHome";
	}
	

	public HomeService getHomeService() {
		return homeService;
	}

	public void setHomeService(HomeService homeService) {
		this.homeService = homeService;
	}

	public Home getHome() {
		return home;
	}

	public void setHome(Home home) {
		this.home = home;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}
}
