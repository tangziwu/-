package com.ssh.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.NumberUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;
import com.ssh.service.UserService;

/**
 * 显示层 由struts2管理
 * 
 * @author chen
 *
 */
public class UserAction extends ActionSupport implements SessionAware{
	private UserService userService;
	private List<User> users;
	private User user;
	private Map<String, Object> session;
    private String message;
	private Map<String, Object> application;
	private Integer currPage = 1;
	private String[] selectedRow; 
	/**
	   * jQuery 删除
	   * 
	   * @return
	   */
	  public String removejquery() {
	    HttpServletRequest request = ServletActionContext.getRequest();
	    HttpServletResponse response = ServletActionContext.getResponse();

	    Integer id = NumberUtils.createInteger(request.getParameter("userid"));
	    
	    user = new User();
	    user.setId(id);
	    userService.remove(user);
        System.out.println(user.getId());
	    try {
	      response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = response.getWriter();
	      out.println(1);
	      out.flush();
	      out.close();
	    } catch (IOException e) {
	      e.printStackTrace();
	    }
	    return null;
	  }
	// 登录
		public String login() {
			System.out.println("进入action");
			boolean b = false;
			User user1 = new User();
			if (user != null) {
				b = userService.find(user);
				users = userService.find(user.getAccount());
				for (int i = 0; i < users.size(); i++) {
					user1 = users.get(i);
					System.out.println(user1.getId());
				}
			}
			if (b) {
				
				
				session.put("user1", user1);
				//application.put("user2", user1);
				System.out.println("登录成功");
				return "success";
			} else {
				System.out.println("登录失败");
				message="输入正确的用户名或密码！";
				return "error";
			}
		}


	public String logout() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session1=request.getSession();
		session1.invalidate();
		
		return "logout";
	}
     
	public String list(){
		
		users=userService.find();
		
		return "list";
	}
	
	public String add() {
	  
        userService.add(user);
	    return "add";
}
	public String modify() {
		  
        userService.modify(user);
	    return "modify";
}   
	public String save(){
		if (user.getId()!=null) {
			userService.modify(user);
		}else {
			userService.add(user);
		}
		return "save";
	}
	public String modifypassword() {
		  
        userService.modifypassword(user);
	    return "modifypassword";
}
	
	public String remove(){
		if(user !=null){
			userService.remove(user);
		}
		
		return "remove";
	}
	  public String findAll(){
    	  PageBean<User> pageBean=userService.findPage(currPage);
    	  //将pageBean 存入到值栈中
    	  ActionContext.getContext().getValueStack().push(pageBean);
    	  return "findAll";
    	  
      }
	
	public String findById() {
	    user=userService.find(user.getId());
	    return "findById";
	  }
	public String findById1() {
	    user=userService.find1(user.getId());
	    return "findById1";
	  }
	public String findById2() {
	    user=userService.find2(user.getId());
	    return "findById2";
	  }
	//导出列表
		public void exportExcel(){
			try {
				//导出
				HttpServletResponse response=ServletActionContext.getResponse();
				//告诉浏览器要弹出的文档类型
				response.setContentType("application/x-execl");
				//告诉浏览器这个文档要作为附件给别人下载(防止浏览器不兼容，文件名要编码)
				response.setHeader("Content-Disposition", "attachment;filename="+new String("用户列表.xls".getBytes(),"ISO-8859-1"));
				//获取输出流
				ServletOutputStream outputStream= response.getOutputStream();
				userService.exportExcel(userService.find(),outputStream);
				if(outputStream !=null){
					outputStream.close();
				}
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public Map<String, Object> getSession() {
		return session;
	}


	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


	public Map<String, Object> getApplication() {
		return application;
	}


	public void setApplication(Map<String, Object> application) {
		this.application = application;
	}


	public Integer getCurrPage() {
		return currPage;
	}


	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	 

	
	
}
