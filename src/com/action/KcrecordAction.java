package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Kcrecord;
import com.model.Notice;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//产品出入库控制类
public class KcrecordAction extends ActionSupport
{
	private Integer id;
	private String productid;
	private String num;
	private String type;
	private String savetime;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
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
	
	//商品出、入库
	public String recordAdd()
	{
			Kcrecord kcrecord=new Kcrecord();
			kcrecord.setProductid(productid);
			kcrecord.setNum(num);
			kcrecord.setType(type);
			kcrecord.setSavetime(Info.getDateStr());
			commonDAO.save(kcrecord);
			suc="";
			return "success";
	}
}
