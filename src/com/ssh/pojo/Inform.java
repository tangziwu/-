package com.ssh.pojo;

import java.util.Date;


/**
 * Inform entity. @author MyEclipse Persistence Tools
 */

public class Inform  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String name;
     private String type;
     private String title;
     private String context;
     private Date date;


    // Constructors

    /** default constructor */
    public Inform() {
    }

    
    

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContext() {
        return this.context;
    }
    
    public void setContext(String context) {
        this.context = context;
    }

    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }
   








}