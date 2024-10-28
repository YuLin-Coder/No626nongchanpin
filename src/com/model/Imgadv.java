package com.model;

/**
 * Imgadv entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Imgadv implements java.io.Serializable {

	// Fields

	private Integer id;
	private String imgurl;
	private String type;
	// Constructors

	/** default constructor */
	public Imgadv() {
	}

	/** full constructor */
	public Imgadv(String imgurl,String type) {
		this.imgurl = imgurl;
		this.type = type;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getImgurl() {
		return this.imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}