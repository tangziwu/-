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
 * ��ʾ�� ��struts2����
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
	   * jQuery ɾ��
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
	// ��¼
		public String login() {
			System.out.println("����action");
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
				System.out.println("��¼�ɹ�");
				return "success";
			} else {
				System.out.println("��¼ʧ��");
				message="������ȷ���û��������룡";
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
    	  //��pageBean ���뵽ֵջ��
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
	//�����б�
		public void exportExcel(){
			try {
				//����
				HttpServletResponse response=ServletActionContext.getResponse();
				//���������Ҫ�������ĵ�����
				response.setContentType("application/x-execl");
				//�������������ĵ�Ҫ��Ϊ��������������(��ֹ����������ݣ��ļ���Ҫ����)
				response.setHeader("Content-Disposition", "attachment;filename="+new String("�û��б�.xls".getBytes(),"ISO-8859-1"));
				//��ȡ�����
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
