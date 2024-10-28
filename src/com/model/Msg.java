package com.model;

/**
 * Msg entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Msg implements java.io.Serializable {

	// Fields

	private Integer id;
	private String content;
	private String reply;
	private String savetime;
	private String memberid;

	// Constructors

	/** default constructor */
	public Msg() {
	}

	/** full constructor */
	public Msg(String content, String reply, String savetime, String memberid) {
		this.content = content;
		this.reply = reply;
		this.savetime = savetime;
		this.memberid = memberid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReply() {
		return this.reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getSavetime() {
		return this.savetime;
	}

	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}

	public String getMemberid() {
		return this.memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

}