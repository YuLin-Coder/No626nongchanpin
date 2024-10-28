package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Notice;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//公告控制类
public class NoticeAction extends ActionSupport
{
	private Integer id;
	private String title;
	private String content;
	private String savetime;
	private String type;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	//新增公告
	public String noticeAdd()
	{
			Notice notice=new Notice();
			notice.setTitle(title);
			notice.setContent(content);
			notice.setType(type);
			notice.setSavetime(Info.getDateStr());
			commonDAO.save(notice);
			suc="";
			return "success";
	}
	//编辑公告
	public String noticeEdit(){
		Notice notice = (Notice)commonDAO.findById(id, "Notice");
		notice.setTitle(title);
		notice.setContent(content);
		commonDAO.update(notice);
		suc="";
		return "success";
	}
	
	//删除公告
	public String noticeDel(){
		commonDAO.delete(id, "Notice");
		suc="";
		return "success";
	}
}
