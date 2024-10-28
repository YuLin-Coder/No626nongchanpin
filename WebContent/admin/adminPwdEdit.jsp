<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sysuser"%>
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
  <%        
  Sysuser admin = (Sysuser)session.getAttribute("admin"); 
  CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
  Sysuser sysuser = (Sysuser)dao.findById(admin.getId(),"Sysuser");
  %>
  <body onLoad="MM_preloadImages('/nongchanpin/admin/images/index_on.gif','/nongchanpin/admin/images/reg_on.gif','/nongchanpin/admin/images/order_on.gif','/nongchanpin/admin/images/top/topxmas/jp_on.gif','/nongchanpin/admin/images/top/topxmas/download_on.gif','/nongchanpin/admin/images/top/topxmas/bbs_on.gif','/nongchanpin/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="adminPwdEdit.action" name="f1" method="post" onsubmit="return ck()">
        <input type="hidden" id="id" name="id" value="<%=sysuser.getId()%>">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/nongchanpin/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>电子商务门户</a> →密码修改
					<img border="0" src="/nongchanpin/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>

		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td class=tablebody2 valign=middle align=center width="">新密码</td>
			<td class=tablebody1 valign=middle align=center width=""><input type="password" id="upass" name="upass"> </td>
		</tr>
        <tr>
			<td class=tablebody2 valign=middle align=center width="">重复新密码</td>
			<td class=tablebody1 valign=middle align=center width=""><input type="password" id="upass1" name="upass1"> </td>
		</tr>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""></td>
			<td class=tablebody1 valign=middle align=center width="">
				<input type="submit" value="提交">&nbsp;&nbsp;
				<input type="reset" value="重置">
			</td>
		</tr>
		</table>
		<br>
		<table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
			<tr>
			<td height=25 valign=middle align=middle>${page.info }</td>
	        </tr>
		</table>
		</form>
        <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
<SCRIPT language=javascript src="/nongchanpin/commfiles/js/popup.js"></SCRIPT>
<script type="text/javascript">
	function ck()
	{
		if(f1.upass.value==""){
			alert("请输入新密码");
			return false;
		}if(f1.upass1.value==""){
			alert("请重复新密码");
			return false;
		}if(f1.upass.value!=f1.upass1.value){
			alert("两次密码不致");
			return false;
		}
	}
			<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){%>
		 alert("操作成功");
		 parent.location.replace("/nongchanpin/admin/adminPwdEdit.jsp");
		 <%}%>
</script>