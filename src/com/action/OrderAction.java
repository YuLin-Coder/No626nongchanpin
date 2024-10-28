package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Kcrecord;
import com.model.Orders;
import com.model.Product;
import com.model.Sales;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//订单控制类
public class OrderAction extends ActionSupport
{
	private Integer id;
	private String orderid;
	private String proinfo;
	private String memberid;
	private String price;
	private String savetime;
	private String fkstatus;
	private String carids;
	private String fhstatus;
	private String tel;
	private String addr;
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
	public String getFhstatus() {
		return fhstatus;
	}
	public void setFhstatus(String fhstatus) {
		this.fhstatus = fhstatus;
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
	public String getCarids() {
		return carids;
	}
	public void setCarids(String carids) {
		this.carids = carids;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getProinfo() {
		return proinfo;
	}
	public void setProinfo(String proinfo) {
		this.proinfo = proinfo;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
	public String getFkstatus() {
		return fkstatus;
	}
	public void setFkstatus(String fkstatus) {
		this.fkstatus = fkstatus;
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
	
	//新增订单
	public String orderAdd()
	{
			Orders order=new Orders();
			order.setOrderid(Info.getAutoId());
			order.setMemberid(memberid);
			order.setPrice(price);
			order.setFkstatus("未付款");
			order.setProinfo(proinfo);
			order.setSavetime(Info.getDateStr());
			order.setFhstatus("未发货");
			order.setTel(tel);
			order.setAddr(addr);
			order.setType("0"); //0：订单 1：退货
			commonDAO.save(order);
			String carid[] = carids.split("-");
			for(int i=0;i<carid.length;i++){
				commonDAO.delete(carid[i], "Car");
			}
			suc="";
			return "success";
	}
	
	//删除订单
	public String orderDel(){
		commonDAO.delete(id, "Orders");
		suc="";
		return "success";
	}
	//管理员删除订单
	public String adminDelOrder(){
		commonDAO.delete(id, "Orders");
		suc="";
		return "success";
	}
	//会员付款
	public String orderFk(){
		Orders o = new Orders();
		o = (Orders)commonDAO.findById(id, "Orders");
		o.setFkstatus("已付款");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//货到付款
	public String orderHdFk(){
		Orders o = new Orders();
		o = (Orders)commonDAO.findById(id, "Orders");
		o.setFkstatus("货到付款");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//管理员发货
	public String orderFh(){
		Orders o = new Orders();
		o = (Orders)commonDAO.findById(id, "Orders");
		String pinfo = o.getProinfo();
		String a[] = pinfo.split("-");
		for(int i=0;i<a.length;i++){
			String b[] = a[i].split(",");
			Kcrecord kc = new Kcrecord();
			kc.setProductid(b[0]);
			kc.setNum(b[1]);
			kc.setType("out");
			kc.setSavetime(Info.getDateStr());
			commonDAO.update(kc);
			Sales sales = new Sales();
			sales.setProductid(b[0].toString());
			sales.setNum(b[1].toString());
			sales.setSavetime(Info.getDateStr());
			commonDAO.save(sales);
		}
		o.setFhstatus("已发货");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//会员订单退货
	public String orderTh(){
		Orders o = (Orders)commonDAO.findById(id, "Orders");
		o.setFhstatus("退货申请中");
		o.setType("1");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	
	//会员取消订单退货
	public String orderThQx(){
		Orders o = (Orders)commonDAO.findById(id, "Orders");
		o.setFhstatus("已发货");
		o.setType("0");
		commonDAO.update(o);
		suc="";
		return "success";
	}
	//管理员同意退货
	public String adminOrderTh(){
		Orders o = new Orders();
		o = (Orders)commonDAO.findById(id, "Orders");
		String pinfo = o.getProinfo();
		String a[] = pinfo.split("-");
		for(int i=0;i<a.length;i++){
			String b[] = a[i].split(",");
			Kcrecord kc = new Kcrecord();
			kc.setProductid(b[0]);
			kc.setNum(b[1]);
			kc.setType("in");
			kc.setSavetime(Info.getDateStr());
			commonDAO.update(kc);
		}
		o.setFhstatus("退货成功");
		commonDAO.update(o);
		suc="";
		return "success";
	}
}



