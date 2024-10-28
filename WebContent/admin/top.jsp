<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.model.Sysuser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<LINK href="/nongchanpin/admin/css/test.css" rel=stylesheet>
	<script language = "JavaScript" src = "/nongchanpin/admin/js/test.js"></script>
  </head>
  <%Sysuser admin = (Sysuser)session.getAttribute("admin");   %> 
  <body>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="table2">
		  <tr>
		    <td align="left" width="7%" ><img src="/nongchanpin/admin/images/adminlogo.png" width="286" height="55"></td>
		    <td width="62%" background="/nongchanpin/admin/images/top_bg.gif">　</td>
		    <td width="31%" background="/nongchanpin/admin/images/top_r.gif" align="right">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		  </tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr>
		    <td background="/nongchanpin/admin/images/dh_bg.gif" align="left" height="32">
		    	<!-- 如果登陆 开始-->
				<%if(admin!=null){ %>
				 <table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <tr>
				    <td background="/nongchanpin/admin/images/dh_bg.gif" align="left" height="32">
				      <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				        <tr>
				          <td width="5%">　</td>
				          <td ><a href="admin/notice.jsp"><b><font color="#ffffff">公告管理</font></b></a></td>
				          <td ><a href="admin/protype.jsp"><b><font color="#ffffff">类别管理</font></b></a></td>
				          <td ><a href="admin/product.jsp"><b><font color="#ffffff">商品管理</font></b></a></td>
				          <td ><a href="admin/orders.jsp"><b><font color="#ffffff">订单管理</font></b></td>
                          <td ><a href="admin/ordersth.jsp"><b><font color="#ffffff">退货管理</font></b></a></td>
				          <td ><a href="admin/kcrecord.jsp"><b><font color="#ffffff">库存记录</font></b></a></td>
				          <td ><a href="admin/kcview.jsp"><b><font color="#ffffff">库存盘点</font></b></a></td>
				          <td ><a href="admin/saletj.jsp"><b><font color="#ffffff">销售统计</font></b></a></td>
				          <td ><a href="admin/cwtj.jsp"><b><font color="#ffffff">财务统计</font></b></a></td>
				          <td ><a href="admin/msg.jsp"><b><font color="#ffffff">留言管理</font></b></a></td>
				          <td ><a href="admin/member.jsp"><b><font color="#ffffff">会员管理</font></b></a></td>
				          <td ><a href="admin/imgadv.jsp"><b><font color="#ffffff">图片广告</font></b></a></td>
				          <td ><a href="admin/adminPwdEdit.jsp"><b><font color="#ffffff">密码修改</font></b></a></td>
				          <td ><a href="adminExit.action"><b><font color="#ffffff">安全退出</font></b></a></td>
				        </tr>
				      </table>
				    </td>
				  </tr>
				</table>
				<%} %>
				<!-- 如果登陆 结束 -->
		    </td>
		  </tr>
		</table>

		<table cellspacing="1" cellpadding="3" align="center" border="0" width="98%">
		<tr>
		<td width="65%"><BR>
		>> 欢迎访问 <b>农产品电商服务平台后台</b> </td>
		<td width="35%" align="right">
			
		</td></tr></table>
  </body>
</html>

