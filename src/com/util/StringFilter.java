package com.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//字符过滤类
public class StringFilter implements Filter {
private String[] characterParams = null;
private boolean OK=true;
 public void destroy() {
  // TODO Auto-generated method stub
  
 }

 public void doFilter(ServletRequest request, ServletResponse response,
   FilterChain arg2) throws IOException, ServletException {
 //非法字符过滤
  HttpServletRequest servletrequest=(HttpServletRequest)request;
  HttpServletResponse servletresponse = (HttpServletResponse)response;
  boolean status = false;
  java.util.Enumeration params = request.getParameterNames();
  String param="";
  String paramValue="";
  servletresponse.setContentType("text/html");
  servletresponse.setCharacterEncoding("utf-8");
  while(params.hasMoreElements()){
	  param = (String)params.nextElement();
	  String[] values = request.getParameterValues(param);
	  paramValue="";
	  if(OK){
		  for(int i=0;i<values.length;i++){
			  paramValue = paramValue+values[i];
			  for(int j=0;j<characterParams.length;j++){
				  if(paramValue.indexOf(characterParams[j])>=0){
					  status = true;
					  break;
				  }
				  if(status){
					  break;
				  }
			  }
			  if(status){
				  PrintWriter out = servletresponse.getWriter();
				  out.print("<script language='javascript'>alert(\"您提交的内容有非法字眼\"):location.href('"+servletrequest.getRequestURI()+"'):</script>");
			  }else{
				  arg2.doFilter(request, response);
			  }
		  }
	  }
  }
  
 }
 public void init(FilterConfig config) throws ServletException {
  // TODO Auto-generated method stub
  if(config.getInitParameter("characterParams").length()<1){
	  OK=false;
  }else{
	  this.characterParams = config.getInitParameter("characterParams").split(",");
  }
 }

}