package com.ssh.action;

import static org.hamcrest.CoreMatchers.nullValue;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.pojo.Attendance;
import com.ssh.pojo.PageBean;
//import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;
import com.ssh.service.AttendanceService;

public class AttendanceAction implements SessionAware {
	private AttendanceService attendanceService;
	private List<Attendance> list;
	private Attendance attendance;
	private Map<String, Object> session1;
	private Integer currPage = 1;
	//导出列表
			public String  exportExcel(){
				try {
					//导出
					HttpServletResponse response=ServletActionContext.getResponse();
					//告诉浏览器要弹出的文档类型
					response.setContentType("application/x-execl");
					//告诉浏览器这个文档要作为附件给别人下载(防止浏览器不兼容，文件名要编码)
					response.setHeader("Content-Disposition", "attachment;filename="+new String("考勤列表.xls".getBytes(),"ISO-8859-1"));
					//获取输出流
					ServletOutputStream outputStream= response.getOutputStream();
					attendanceService.exportExcel(attendanceService.find(),outputStream);
					if(outputStream !=null){
						outputStream.close();
					}
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return null;
			}
	public String add() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user1");
		System.out.println("1" + user.getId());
		attendance = new Attendance();
		attendance.setUserId(user.getId());
		attendance.setName(user.getName());
		// 添加上班时间
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		Date currentTime = new Date();
		String time1 = formatter.format(currentTime);
		attendance.setUtime(time1);
		attendance.setDates(new Date());
		if (time1.compareTo("09:00:00") == 0) {
			attendance.setStatus("已签到");
		} else if (time1.compareTo("09:00:00") < 0) {
			attendance.setStatus("已签到");
		} else {
			attendance.setStatus("迟到");
		}
		attendanceService.add(attendance);
		return "add";

	}
	//分页
	public String findPage() {
		PageBean<Attendance> pageBean = attendanceService.findPage(currPage);
		//将值存进session中
		session1.put("pageBean", pageBean);
		return "findAll";
	}

	public AttendanceService getAttendanceService() {
		return attendanceService;
	}

	public void setAttendanceService(AttendanceService attendanceService) {
		this.attendanceService = attendanceService;
	}

	public List<Attendance> getList() {
		return list;
	}

	public void setList(List<Attendance> list) {
		this.list = list;
	}

	public Attendance getAttendance() {
		return attendance;
	}

	public void setAttendance(Attendance attendance) {
		this.attendance = attendance;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session1 = session;
	}
}
