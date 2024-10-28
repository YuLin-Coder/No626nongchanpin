package com.model;

/**
 * Fav entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Fav implements java.io.Serializable {

	// Fields

	private Integer id;
	private String productid;
	private String memberid;

	// Constructors

	/** default constructor */
	public Fav() {
	}

	/** full constructor */
	public Fav(String productid, String memberid) {
		this.productid = productid;
		this.memberid = memberid;
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

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}