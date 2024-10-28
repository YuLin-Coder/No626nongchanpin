package com.model;

/**
 * Order entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Orders implements java.io.Serializable {

	// Fields

	private Integer id;
	private String orderid;
	private String proinfo;
	private String memberid;
	private String price;
	private String savetime;
	private String fkstatus;
	private String fhstatus;
	private String tel;
	private String addr;
	private String type;

	// Constructors

	/** default constructor */
	public Orders() {
	}

	/** full constructor */
	public Orders(String orderid, String proinfo, String memberid, String price,
			String savetime, String fkstatus, String fhstatus, String tel,
			String addr,String type) {
		this.orderid = orderid;
		this.proinfo = proinfo;
		this.memberid = memberid;
		this.price = price;
		this.savetime = savetime;
		this.fkstatus = fkstatus;
		this.fhstatus = fhstatus;
		this.tel = tel;
		this.addr = addr;
		this.type = type;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrderid() {
		return this.orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getProinfo() {
		return this.proinfo;
	}

	public void setProinfo(String proinfo) {
		this.proinfo = proinfo;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getFkstatus() {
		return this.fkstatus;
	}

	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
	}

	public String getFhstatus() {
		return this.fhstatus;
	}

	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}