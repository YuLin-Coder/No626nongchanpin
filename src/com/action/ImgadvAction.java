package com.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.CommonDAO;
import com.model.Imgadv;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Info;
import com.util.Pagination;
//文件上传控制类
public class ImgadvAction extends ActionSupport
{
	private Integer id;
	private String imgurl;
	private String type;
	String suc;
	String no;
	private int index=1;
	private CommonDAO commonDAO;
	private File upFile;
	private String upFileContentType;
	private String upFileFileName;
	private static final int FILE_SIZE=16*1024;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getImgurl() {
		return imgurl;
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
	//新增图片
	public String imgAdvAdd()
	{
		Imgadv imgadv=new Imgadv();
		String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
		String imgurl = Info.getAutoId()+"."+hz;
		String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+imgurl;
		File targetFile=new File(filePath);
		upLoadFile(upFile,targetFile);
		System.out.println("type=="+type);
			if(type.equals("HEAD")){
				ArrayList<Imgadv> ilist = (ArrayList<Imgadv>)commonDAO.findByHql(" from Imgadv where type='HEAD' ");
				if(ilist.size()==0){
					imgadv.setImgurl(imgurl);
					imgadv.setType(type);
					commonDAO.save(imgadv);
					suc="";
					return "success";
				}else{
					no="";
					return "erro";
				}
			}else{
				imgadv.setImgurl(imgurl);
				imgadv.setType(type);
				commonDAO.save(imgadv);
				suc="";
				return "success";
			}
	}
	//编辑图片
	public String imgAdvEdit(){
		Imgadv imgadv = (Imgadv)commonDAO.findById(id, "Imgadv");
		if(!upFileFileName.equals("")){
			String hz = upFileFileName.substring(upFileFileName.lastIndexOf(".")+1);
			String imgurl = Info.getAutoId()+"."+hz;
			String filePath=ServletActionContext.getServletContext().getRealPath("upfile")+"/"+imgurl;
			File targetFile=new File(filePath);
			upLoadFile(upFile,targetFile);
			imgadv.setImgurl(imgurl);
		}
		commonDAO.update(imgadv);
		suc="";
		return "success";
	}
	
	//删除图片
	public String imgAdvDel(){
		commonDAO.delete(id, "Imgadv");
		suc="";
		return "success";
	}
}
