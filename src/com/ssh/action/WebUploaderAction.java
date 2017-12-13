package com.ssh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class WebUploaderAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private File file;	//上传的文件
	private String contentType;	//文件内容类型
	private String fileName;	//文件名
	private String dir;			//上传文件的目录
	
	//拦截器
	//org.apache.struts2.interceptor.FileUploadInterceptor
	public String file(){
		//获得上传目录在（服务器）硬盘上的相对路径
		String path = ServletActionContext.getServletContext().getRealPath(dir);
		System.out.println(dir);
		//获得上传目录在（服务器）硬盘上的绝对路径
//		String path = "D:/Java/相关安装/apache-tomcat-9.0.0.M26/webapps/171024-国际化与文件上传/upload";
		
		//把指定文件从客户端复制到服务器指定目录
		try{
			File pathFile = new File(path);
			if(!pathFile.exists()){
				pathFile.mkdirs();
			}
			//客户端输入的文件
			FileInputStream in = new FileInputStream(file);
			//服务器端输出的文件
			FileOutputStream out = new FileOutputStream(pathFile+"/"+fileName);
			//设置缓存的大小
			byte[] buff = new byte[1024*8];
			int len = -1;
			while((len=in.read(buff))!=-1){
				out.write(buff,0,len);
			}
			in.close();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void setFile(File file) {
		this.file = file;
	}
	
	/**
	 * 设置上传文件的内容类型
	 * @param contentType
	 */
	public void setFileContentType(String contentType) {
		this.contentType = contentType;
	}
	
	/**
	 * 设置上传文件的文件名
	 * @param fileName
	 */
	public void setFileFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public File getFile() {
		return file;
	}
	
	public String getContentType() {
		return contentType;
	}
	
	public String getFileName() {
		return fileName;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}
}
