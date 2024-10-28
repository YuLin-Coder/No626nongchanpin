package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Msg;
import com.model.Notice;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//消息控制类
public class MsgAction extends ActionSupport
{
	private Integer id;
	private String content;
	private String reply;
	private String savetime;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
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
	
	//留言 
	public String msgAdd()
	{
			Msg msg=new Msg();
//			String w1 = "日本";
//			String w2 = "操";
//			String w3 = "日";
			String[] w = {"日本","操","日"};
			for(int i=0;i<w.length;i++){
				content=content.replaceAll(w[i],"**");
			}
//			content = content.replaceAll(w1,"**");
//			content = content.replaceAll(w2,"*");
//			content = content.replaceAll(w3,"*");
			msg.setContent(content);
			msg.setMemberid(memberid);
			msg.setReply("");
			msg.setSavetime(Info.getDateStr());
			commonDAO.save(msg);
			suc="";
			return "success";
	}
	//留言回复
	public String msgReply(){
		Msg msg = (Msg)commonDAO.findById(id, "Msg");
		msg.setReply(reply);
		commonDAO.update(msg);
		suc="";
		return "success";
	}
	//留言删除
	public String msgDel(){
		commonDAO.delete(id, "Msg");
		suc="";
		return "success";
	}
}
