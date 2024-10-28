package com.model;

/**
 * Kcrecord entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Kcrecord implements java.io.Serializable {

	// Fields

	private Integer id;
	private String productid;
	private String num;
	private String type;
	private String savetime;

	// Constructors

	/** default constructor */
	public Kcrecord() {
	}

	/** full constructor */
	public Kcrecord(String productid, String num, String type, String savetime) {
		this.productid = productid;
		this.num = num;
		this.type = type;
		this.savetime = savetime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductid() {
		return this.productid;
	}

	public void setProductid(String productid) {
		this.productid = productid;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}