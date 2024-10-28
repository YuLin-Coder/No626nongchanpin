<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>农产品电商服务平台后台管理</title>
    
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
  
  <body onLoad="MM_preloadImages('/nongchanpin/admin/images/index_on.gif','/nongchanpin/admin/images/reg_on.gif','/nongchanpin/admin/images/order_on.gif','/nongchanpin/admin/images/top/topxmas/jp_on.gif','/nongchanpin/admin/images/top/topxmas/download_on.gif','/nongchanpin/admin/images/top/topxmas/bbs_on.gif','/nongchanpin/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/nongchanpin/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>电子商务门户</a> →公告管理
					<img border="0" src="/nongchanpin/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                  商品名称：<input type="text" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="搜索"/>
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>商品名称</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>价格</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>操作</b></font></td>
		</tr>
                
		<tr>
			<td class=tablebody2 valign=middle align=center width="">1</td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;<a href="productDetail.html">精通Hibernate：Java对象持久化技术详解</a></td>
			<td class=tablebody2 valign=middle align=center width="">59.0</td>
			<td class=tablebody1 valign=middle align=center width="">编辑&nbsp;&nbsp;|&nbsp;&nbsp;删除</td>
		</tr>
                
		</table>
		<br>
		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=middle>
		<a href="#">[上一页]</a>&nbsp;&nbsp;&nbsp;<font style="color:red">1</font>&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;...&nbsp;&nbsp;&nbsp;<a href="#">[下一页]</a>
                </td>
                </tr>
		</table>
		
        <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
