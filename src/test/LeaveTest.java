package test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssh.dao.ComplaintDao;
import com.ssh.dao.LeaveDao;
import com.ssh.dao.LeaveDaoImpl;
import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;
import com.ssh.service.LeaveService;
import com.ssh.service.LeaveService2;

public class LeaveTest {
     
	private LeaveService2 leaveService2;
	
	@Before
	public void init() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		leaveService2=ctx.getBean("leaveservice2",LeaveService2.class);
		
	}
	@Test
	public void add(){
		PersonLeave leave=new PersonLeave();
		leave.setId(9);
		leave.setDays(9);
		leave.setName("����");
		leaveService2.add(leave);
		
	}
	
	
	
	@Test
	public void find(){
		for (PersonLeave leave : leaveService2.find()) {
			System.out.println(leave.getName());
		}
	}
}
