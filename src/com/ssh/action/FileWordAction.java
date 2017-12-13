package com.ssh.action;

import java.io.File;
import java.io.FileInputStream;

import java.io.FileOutputStream;
import java.io.IOException;

import java.util.List;



import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.ssh.pojo.FileTransfer;
import com.ssh.pojo.PageBean;
import com.ssh.pojo.User;
import com.ssh.service.FileWordService;



public class FileWordAction {
     
	private FileWordService fileWordService;
	private FileTransfer fileTransfer;
	private List<FileTransfer> fileTransfers;
	private Integer currPage = 1;
	
	
	 public String findAll(){
   	  PageBean<FileTransfer> pageBean=fileWordService.findPage(currPage);
   	  //将pageBean 存入到值栈中
   	  ActionContext.getContext().getValueStack().push(pageBean);
   	  return "findAll";
   	  
     }
	public String add() {
		 
		fileWordService.add(fileTransfer);

		return "add";
	}
	
	public String find(){
		
		fileTransfers=fileWordService.find();
		return "find";
	}

	public FileWordService getFileWordService() {
		return fileWordService;
	}

	public void setFileWordService(FileWordService fileWordService) {
		this.fileWordService = fileWordService;
	}

	public FileTransfer getFileTransfer() {
		return fileTransfer;
	}

	public void setFileTransfer(FileTransfer fileTransfer) {
		this.fileTransfer = fileTransfer;
	}

	public List<FileTransfer> getFileTransfers() {
		return fileTransfers;
	}

	public void setFileTransfers(List<FileTransfer> fileTransfers) {
		this.fileTransfers = fileTransfers;
	}
	
	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}
	
	
	
	
	
	
	




	
	
}
