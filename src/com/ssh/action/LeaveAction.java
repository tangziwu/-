package com.ssh.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.pojo.Leave;
import com.ssh.pojo.PersonLeave;
import com.ssh.service.LeaveService;
import com.ssh.service.LeaveService2;

public class LeaveAction extends ActionSupport{
    
	private PersonLeave leave;
	private List<PersonLeave> leaves;
	private LeaveService2 leaveservice2;
	
	public String add(){
		leaveservice2.add(leave);
		return "add";
	}
    
	public String find(){
		leaves=leaveservice2.find();
		return "find";
	}
	public String find1(){
		leaves=leaveservice2.find1();
		return "find1";
	}
	public String findId(){
		if(leave!=null&&leave.getId()!=null){
			PersonLeave leave2=leaveservice2.findById(leave.getId());
			if(leave2.getStatus().equals("Î´ÉóºË")){
				System.out.println("1");
				leave2.setStatus("ÒÑÍ¨¹ý");
				leaveservice2.modify(leave2);
				return "findId";
			}
		}
		return null;
	}
	public String findById(){
		if(leave!=null&&leave.getId()!=null){
			PersonLeave leave2=leaveservice2.findById(leave.getId());
			if(leave2.getStatus().equals("Î´ÉóºË")){
				leave2.setStatus("ÒÑ¾Ü¾ø");
				leaveservice2.modify(leave2);
				return "findId";
			}
		}
		return null;
	}
	public PersonLeave getLeave() {
		return leave;
	}

	public void setLeave(PersonLeave leave) {
		this.leave = leave;
	}

	public List<PersonLeave> getLeaves() {
		return leaves;
	}

	public void setLeaves(List<PersonLeave> leaves) {
		this.leaves = leaves;
	}

	public LeaveService2 getLeaveservice2() {
		return leaveservice2;
	}

	public void setLeaveservice2(LeaveService2 leaveservice2) {
		this.leaveservice2 = leaveservice2;
	}
	
	
	
}
