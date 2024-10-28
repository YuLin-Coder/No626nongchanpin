package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Sysuser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.MD5;
import com.util.Pagination;
//系统用户控制类
public class SysuserAction extends ActionSupport
{
	private Integer id;
	private String uname;
	private String upass;
	private String realname;
	private String sex;
	private String age;
	private String tel;
	private String addr;
	private String delstatus;
	private String type;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	//会员登陆
	public String memberLogin(){
		 	Map session= ServletActionContext.getContext().getSession();
		 	upass = MD5.getDigest(upass);
				String hql="from Sysuser where uname='"+uname+"' and upass='"+upass+"' and type='会员' ";
				List adminList=commonDAO.findByHql(hql);
				if(adminList.size()!=0){
					Sysuser sysuser=(Sysuser)adminList.get(0);
					 session.put("member", sysuser);
					 suc="";
					 return "success";
				}else{
					no="";
					return "erro";
				}
		}
	//管理员登陆
	public String adminLogin(){
		Map session= ServletActionContext.getContext().getSession();
		upass = MD5.getDigest(upass);
		String hql="from Sysuser where uname='"+uname+"' and upass='"+upass+"'";
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0){
			Sysuser sysuser=(Sysuser)adminList.get(0);
			 session.put("admin", sysuser);
			 suc="";
			 return "success";
		}else{
			no="";
			return "erro";
		}
	}
	
	//商家登陆
	public String shangjiaLogin(){
		Map session= ServletActionContext.getContext().getSession();
		upass = MD5.getDigest(upass);
		String hql="from Sysuser where uname='"+uname+"' and upass='"+upass+"' and type='商家' ";
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0){
			Sysuser sysuser=(Sysuser)adminList.get(0);
			 session.put("admin", sysuser);
			 suc="";
			 return "success";
		}else{
			no="";
			return "erro";
		}
	}

	//管理员修改信息
	public String adminPwdEdit(){
		Sysuser s = (Sysuser)commonDAO.findById(id, "Sysuser");
		upass = MD5.getDigest(upass);
		s.setUpass(upass);
		commonDAO.update(s);
		suc="";
		return "success";
	}
	//用户注册
	public String memberReg()
	{
		String hql = " from Sysuser where uname='"+uname+"'";
		List adminList=commonDAO.findByHql(hql);
		if(adminList.size()!=0){
			no="";
			return "erro";
		}else{
			Sysuser sysuser=new Sysuser();
			sysuser.setUname(uname);
			upass = MD5.getDigest(upass);
			sysuser.setUpass(upass);
			sysuser.setRealname(realname);
			sysuser.setSex(sex);
			sysuser.setAge(age);
			sysuser.setTel(tel);
			sysuser.setAddr(addr);
			sysuser.setType(type);
			sysuser.setDelstatus("0");
			commonDAO.save(sysuser);
			suc="";
			return "success";
		}
	}
	//会员编辑个人信息
	public String memberEdit(){
		Sysuser sysuser = (Sysuser)commonDAO.findById(id, "Sysuser");
		System.out.println("aa="+upass.equals(""));
		if(!upass.equals("")){
			upass = MD5.getDigest(upass);
			sysuser.setUpass(upass);
		}
		sysuser.setRealname(realname);
		sysuser.setSex(sex);
		sysuser.setAge(age);
		sysuser.setTel(tel);
		sysuser.setAddr(addr);
		commonDAO.update(sysuser);
		suc="";
		return "success";
	}
	
	//会员退出
	public String memberExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("member");
		return "success";
	}
	
	//管理员退出
	public String adminExit(){
		Map session= ServletActionContext.getContext().getSession();
		session.remove("admin");
		return "success";
	}




	 
}
