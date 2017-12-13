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
	//�����б�
			public String  exportExcel(){
				try {
					//����
					HttpServletResponse response=ServletActionContext.getResponse();
					//���������Ҫ�������ĵ�����
					response.setContentType("application/x-execl");
					//�������������ĵ�Ҫ��Ϊ��������������(��ֹ����������ݣ��ļ���Ҫ����)
					response.setHeader("Content-Disposition", "attachment;filename="+new String("�����б�.xls".getBytes(),"ISO-8859-1"));
					//��ȡ�����
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
		// ����ϰ�ʱ��
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		Date currentTime = new Date();
		String time1 = formatter.format(currentTime);
		attendance.setUtime(time1);
		attendance.setDates(new Date());
		if (time1.compareTo("09:00:00") == 0) {
			attendance.setStatus("��ǩ��");
		} else if (time1.compareTo("09:00:00") < 0) {
			attendance.setStatus("��ǩ��");
		} else {
			attendance.setStatus("�ٵ�");
		}
		attendanceService.add(attendance);
		return "add";

	}
	//��ҳ
	public String findPage() {
		PageBean<Attendance> pageBean = attendanceService.findPage(currPage);
		//��ֵ���session��
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
