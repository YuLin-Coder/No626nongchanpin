package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;

public class UserValidateAction extends ActionSupport {
	 private static final long serialVersionUID = 1L;

     @Resource

     private CommonDAO commonDAO;

     public String msgStr;
 	 public String uname;

     public void check() throws IOException
 	{
    	 System.out.println(uname);
    	 ArrayList<Sysuser> list = (ArrayList<Sysuser>)commonDAO.findByHql("from Sysuser where uname='"+uname+"' and type='会员' ");
    	 int responseContext;
    	 System.out.println("aa=="+list.size());
    	 if(list.size()==0){
    		 responseContext = 0;
    	 }else{
    		 responseContext=1;
    	 }
    	 
 		System.out.println(responseContext);
 		HttpServletResponse response=ServletActionContext.getResponse();
 		response.setContentType("text/html");
 		PrintWriter out = response.getWriter();
 		out.println(responseContext);
 		out.flush();
 		out.close();
 		 
 	}


//     @JSON(serialize= false)

     //声明uname不需要转化为json格式

     //@JSON

     //@Json struts将将返回的数据类型转换为json格式


	public CommonDAO getCommonDAO() {
		return commonDAO;
	}

	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String add(){
		return SUCCESS;
	}
	public String getInfo() {
		return msgStr;
	}

	public void setInfo(String info) {
		this.msgStr = info;
	}


}

