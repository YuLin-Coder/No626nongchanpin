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
  CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
  String hql = " from Sysuser where type='会员' ";
  String url ="/nongchanpin/admin/member.jsp?1=1"; 
  String key = request.getParameter("key")==null?"":request.getParameter("key");
  String f = request.getParameter("f");
  if(f==null)
  {
  key = Info.getUTFStr(key);
  }
  if(!key.equals(""))
  {
  hql+=" and (uname like'%"+key+"%'  )";
  url+="&key="+key;
  }
  hql+="  order by id desc"; %>
  <body onLoad="MM_preloadImages('/nongchanpin/admin/images/index_on.gif','/nongchanpin/admin/images/reg_on.gif','/nongchanpin/admin/images/order_on.gif','/nongchanpin/admin/images/top/topxmas/jp_on.gif','/nongchanpin/admin/images/top/topxmas/download_on.gif','/nongchanpin/admin/images/top/topxmas/bbs_on.gif','/nongchanpin/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/nongchanpin/admin/member.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/nongchanpin/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>电子商务门户</a> →会员管理
					<img border="0" src="/nongchanpin/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                 用户名：<input type="text" id="key" name="key" value="<%=key %>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索"/>
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>用户名</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>密码</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>姓名</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>性别</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>年龄</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>电话</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>地址</b></font></td>
		</tr>
        <%
        PageManager pageManager = PageManager.getPage("/nongchanpin/admin/member.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Sysuser> list=( ArrayList<Sysuser>)bean.getCollection(); 
	   
	   	int i=0;
	    for(Sysuser sysuser :list)
	    {
	    	i++;
        %>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""><%=i %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getUname() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getUpass() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getRealname() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getSex() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getAge() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getTel() %></td>
			<td class=tablebody1 valign=middle align=center width=""><%=sysuser.getAddr() %></td>
		</tr>
        <%} %>     
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
	function add()
	{
		pop("/nongchanpin/admin/noticeadd.jsp","新增公告",710,350);
	}
	function edit(id)
	{
		pop("/nongchanpin/admin/noticeedit.jsp?id="+id,"编辑公告",710,350);
	}
</script>