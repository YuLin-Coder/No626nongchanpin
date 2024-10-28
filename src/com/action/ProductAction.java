package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Product;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//产品控制类
public class ProductAction extends ActionSupport
{
	private Integer id;
	private String proname;
	private String prono;
	private String price;
	private String img;
	private String field1;
	private String field2;
	private String field3;
	private String field4;
	private String field5;
	private String field6;
	private String field7;
	private String field8;
	private String field9;
	private String field10;
	private String protype;
	private String remark;
	private String delstatus;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	private File upFile;
	private String upFileContentType;
	private String upFileFileName;
	private static final int FILE_SIZE=16*1024;
	
	
	public String getField8() {
		return field8;
	}
	public void setField8(String field8) {
		this.field8 = field8;
	}
	public String getField9() {
		return field9;
	}
	public void setField9(String field9) {
		this.field9 = field9;
	}
	public String getField10() {
		return field10;
	}
	public void setField10(String field10) {
		this.field10 = field10;
	}
	public File getUpFile() {
		return upFile;
	}
	public void setUpFile(File upFile) {
		this.upFile = upFile;
	}
	public String getUpFileContentType() {
		return upFileContentType;
	}
	public void setUpFileContentType(String upFileContentType) {
		this.upFileContentType = upFileContentType;
	}
	public String getUpFileFileName() {
		return upFileFileName;
	}
	public void setUpFileFileName(String upFileFileName) {
		this.upFileFileName = upFileFileName;
	}
	public static int getFILE_SIZE() {
		return FILE_SIZE;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProno() {
		return prono;
	}
	public void setProno(String prono) {
		this.prono = prono;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getField1() {
		return field1;
	}
	public void setField1(String field1) {
		this.field1 = field1;
	}
	public String getField2() {
		return field2;
	}
	public void setField2(String field2) {
		this.field2 = field2;
	}
	public String getField3() {
		return field3;
	}
	public void setField3(String field3) {
		this.field3 = field3;
	}
	public String getField4() {
		return field4;
	}
	public void setField4(String field4) {
		this.field4 = field4;
	}
	public String getField5() {
		return field5;
	}
	public void setField5(String field5) {
		this.field5 = field5;
	}
	public String getField6() {
		return field6;
	}
	public void setField6(String field6) {
		this.field6 = field6;
	}
	public String getField7() {
		return field7;
	}
	public void setField7(String field7) {
		this.field7 = field7;
	}
	public String getProtype() {
		return protype;
	}
	public void setProtype(String protype) {
		this.protype = protype;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDelstatus() {
		return delstatus;
	}
	public void setDelstatus(String delstatus) {
		this.delstatus = delstatus;
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
	//文件上传
	public void upLoadFile(File source,File target){
		  InputStream in=null;
		  OutputStream out=null;
		  try{
		   in=new BufferedInputStream(new FileInputStream(source),FILE_SIZE);
		   out=new BufferedOutputStream(new FileOutputStream(target),FILE_SIZE);
		   byte[] image=new byte[FILE_SIZE];
		   while(in.read(image)>0){
		    out.write(image);
		   }
		  }catch(IOException ex){
		   ex.printStackTrace();
		  }finally{
		   try{
		    in.close();
		    out.close();
		   }catch(IOException ex){
		    
		   }
		  }
		 }
	
	//新增商品
	public String productAdd()
	{
		String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
		String img = Info.getAutoId()+"."+hz;
		String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
		File targetFile=new File(filePath);
		upLoadFile(upFile,targetFile);
			Product product=new Product();
			product.setProname(proname);
			product.setProno(prono);
			product.setImg(img);
			product.setPrice(price);
			product.setProtype(protype);
			product.setRemark(remark);
			product.setDelstatus("0"); //0：正常；1:删除
			product.setField1(field1); //品牌
			product.setField2(field2);	//存储介质 
			product.setField3(field3);	//适用对象
			product.setField4(field4);	//发行地区
			product.setField5(field5);	
			product.setField6(field6);	 
			product.setField7("no"); //是否特价
			product.setField8(field8); //特价价格
			product.setField9(field9);
			product.setField10(field10);
			commonDAO.save(product);
			suc="";
			return "success";
	}
	//编辑商品
	public String productEdit(){
		Product product = (Product)commonDAO.findById(id, "Product");
		product.setProname(proname);
		product.setProno(prono);
		product.setPrice(price);
		
		product.setProtype(protype);
		product.setRemark(remark);
		product.setField1(field1); //品牌
		product.setField2(field2);	//存储介质
		product.setField3(field3);	//适用对象
		product.setField4(field4);	//发行地区
		product.setField5(field5);
		//product.setField6(field6);	 
		if(!upFileFileName.equals("")){
			String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
			String img = Info.getAutoId()+"."+hz;
			String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+img;
			File targetFile=new File(filePath);
			upLoadFile(upFile,targetFile);
			product.setImg(img);
		}
		commonDAO.update(product);
		suc="";
		return "success";
	}
	
	//删除商品
	public String productDel(){
		Product product = (Product)commonDAO.findById(id, "Product");
		product.setDelstatus("1");
		commonDAO.update(product);
		return "success";
	}
	
	//商品设置特价
	public String productSetTj(){
		Product product = (Product)commonDAO.findById(id, "Product");
		if(Integer.parseInt(product.getPrice())>Integer.parseInt(field8)){
			product.setField7("yes");
			product.setField8(field8);
			commonDAO.update(product);
			suc="";
			return "success";
		}else{
			no="";
			return "erro";
		}
	}
	//商品取消特价
	public String productQxTj(){
		Product product = (Product)commonDAO.findById(id, "Product");
		product.setField7("no");
		product.setField8("");
		commonDAO.update(product);
		suc="";
		return "success";
	}
}
