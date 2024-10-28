package com.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.dao.CommonDAO;
import com.model.Car;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//购物车控制类
public class CarAction extends ActionSupport
{
	private Integer id;
	private String productid;
	private String num;
	private String memberid;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getSuc() {
		return suc;
	}
	public void setSuc(String suc) {
		this.suc = suc;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public CommonDAO getCommonDAO() {
		return commonDAO;
	}
	public void setCommonDAO(CommonDAO commonDAO) {
		this.commonDAO = commonDAO;
	}
	
	//添加商品到购物车
	public void carAdd() throws IOException
	{
		System.out.println("aa");
   	Car car=new Car();
	car.setProductid(productid);
	car.setNum(num);
	car.setMemberid(memberid);
	commonDAO.save(car);
	 int responseContext;
		 responseContext=1;
	 
		System.out.println(responseContext);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(responseContext);
		out.flush();
		out.close();

	}
	//移出商品
	public String carDel(){
		commonDAO.delete(id, "Car");
		suc="";
		return "success";
	}
}
