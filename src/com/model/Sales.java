package com.model;

/**
 * Sales entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Sales implements java.io.Serializable {

	// Fields

	private Integer id;
	private String productid;
	private String num;
	private String savetime;

	// Constructors

	/** default constructor */
	public Sales() {
	}

	/** full constructor */
	public Sales(String productid, String num, String savetime) {
		this.productid = productid;
		this.num = num;
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

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

}