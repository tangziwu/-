package com.ssh.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.pojo.Cost;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.Park;
import com.ssh.pojo.User;
import com.ssh.service.CostService;
import com.ssh.service.ParkService;



public class CostAction {
	private ParkService parkService;
	private CostService costService;
	private List<Cost> costs;
	private Cost cost;
	private Park park;
	private Integer currPage = 1;
	public String list() {
		try {
			System.out.println(123);

			Integer hid = cost.getHId();
			System.out.println(hid);
			costs = costService.find(hid);
			for (Cost cost : costs) {
				System.out.println(cost.getCId());
			}
			System.out.println("传输数据");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list";
	}
	
	public String modify(){
		try {
			Cost cost1 = new Cost();
			Double camountpaid = 0d;
			Double caccount = 0d;
			Double camount = 0d;
			System.out.println(cost.getCId());
			cost1 = costService.findById(cost.getCId());
			if(cost.getCAmountpaid() != null){
				camountpaid = cost.getCAmountpaid();
			
			if(cost1.getCAccount() != null){
				caccount = cost1.getCAccount();
			}
			if(cost1.getCAmount() != null){
				camount = cost1.getCAmount();
			}
			cost1.setCAccount(camountpaid+caccount-camount);
			cost1.setCPayment(new Date());
			}
			costService.modify(cost1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "modify";
	}
	public String add(){
		
		costService.add(cost);
		
		
		return "add";
	}
	public String findAll(){
  	  PageBean<Cost> pageBean=costService.findPage(currPage);
  	  //将pageBean 存入到值栈中
  	  ActionContext.getContext().getValueStack().push(pageBean);
  	  return "findAll";
  	  
    }
	
	public Cost getCost() {
		return cost;
	}
	public void setCost(Cost cost) {
		this.cost = cost;
	}
	public Park getPark() {
		return park;
	}

	public void setPark(Park park) {
		this.park = park;
	}

	public List<Cost> getCosts() {
		return costs;
	}
	public void setCostService(CostService costService) {
		this.costService = costService;
	}

	public void setParkService(ParkService parkService) {
		this.parkService = parkService;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public ParkService getParkService() {
		return parkService;
	}

	public CostService getCostService() {
		return costService;
	}

	public void setCosts(List<Cost> costs) {
		this.costs = costs;
	}
	
	
	
	
}
