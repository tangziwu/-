package com.ssh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class WebUploaderAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private File file;	//�ϴ����ļ�
	private String contentType;	//�ļ���������
	private String fileName;	//�ļ���
	private String dir;			//�ϴ��ļ���Ŀ¼
	
	//������
	//org.apache.struts2.interceptor.FileUploadInterceptor
	public String file(){
		//����ϴ�Ŀ¼�ڣ���������Ӳ���ϵ����·��
		String path = ServletActionContext.getServletContext().getRealPath(dir);
		System.out.println(dir);
		//����ϴ�Ŀ¼�ڣ���������Ӳ���ϵľ���·��
//		String path = "D:/Java/��ذ�װ/apache-tomcat-9.0.0.M26/webapps/171024-���ʻ����ļ��ϴ�/upload";
		
		//��ָ���ļ��ӿͻ��˸��Ƶ�������ָ��Ŀ¼
		try{
			File pathFile = new File(path);
			if(!pathFile.exists()){
				pathFile.mkdirs();
			}
			//�ͻ���������ļ�
			FileInputStream in = new FileInputStream(file);
			//��������������ļ�
			FileOutputStream out = new FileOutputStream(pathFile+"/"+fileName);
			//���û���Ĵ�С
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
	 * �����ϴ��ļ�����������
	 * @param contentType
	 */
	public void setFileContentType(String contentType) {
		this.contentType = contentType;
	}
	
	/**
	 * �����ϴ��ļ����ļ���
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
