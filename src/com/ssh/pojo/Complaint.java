package com.ssh.pojo;

import java.util.Date;


/**
 * Complaint entity. @author MyEclipse Persistence Tools
 */

public class Complaint  implements java.io.Serializable {


    // Fields    

     private Integer compreId;
     private String compreTitle;
     private String compreContext;
     private Date compreTime;
     private String comprePhone;
     private String compreOwner;
     private String compreEmpname;
     private Date compreDisponseDate;
     private String comperDisponseContent;
     private String compreType;
     private String compreState;


    // Constructors

    /** default constructor */
    public Complaint() {
    }

    
  

   
    // Property accessors

    public Integer getCompreId() {
        return this.compreId;
    }
    
    public void setCompreId(Integer compreId) {
        this.compreId = compreId;
    }

    public String getCompreTitle() {
        return this.compreTitle;
    }
    
    public void setCompreTitle(String compreTitle) {
        this.compreTitle = compreTitle;
    }

    public String getCompreContext() {
        return this.compreContext;
    }
    
    public void setCompreContext(String compreContext) {
        this.compreContext = compreContext;
    }

    public Date getCompreTime() {
        return this.compreTime;
    }
    
    public void setCompreTime(Date compreTime) {
        this.compreTime = compreTime;
    }

    public String getComprePhone() {
        return this.comprePhone;
    }
    
    public void setComprePhone(String comprePhone) {
        this.comprePhone = comprePhone;
    }

    public String getCompreOwner() {
        return this.compreOwner;
    }
    
    public void setCompreOwner(String compreOwner) {
        this.compreOwner = compreOwner;
    }

    public String getCompreEmpname() {
        return this.compreEmpname;
    }
    
    public void setCompreEmpname(String compreEmpname) {
        this.compreEmpname = compreEmpname;
    }

    public Date getCompreDisponseDate() {
        return this.compreDisponseDate;
    }
    
    public void setCompreDisponseDate(Date compreDisponseDate) {
        this.compreDisponseDate = compreDisponseDate;
    }

    public String getComperDisponseContent() {
        return this.comperDisponseContent;
    }
    
    public void setComperDisponseContent(String comperDisponseContent) {
        this.comperDisponseContent = comperDisponseContent;
    }

    public String getCompreType() {
        return this.compreType;
    }
    
    public void setCompreType(String compreType) {
        this.compreType = compreType;
    }

    public String getCompreState() {
        return this.compreState;
    }
    
    public void setCompreState(String compreState) {
        this.compreState = compreState;
    }
   








}