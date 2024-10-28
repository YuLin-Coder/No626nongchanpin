<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Orders"%>
<%@page import="com.model.Product"%>
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
    String hql = " from Orders where 1=1 and type='0' ";
    String url ="/nongchanpin/admin/orders.jsp?1=1"; 
    String key = request.getParameter("key")==null?"":request.getParameter("key");
    String f = request.getParameter("f");
    if(f==null)
    {
    key = Info.getUTFStr(key);
    }
    if(!key.equals(""))
    {
    hql+=" and (orderid like'%"+key+"%'  )";
    url+="&key="+key;
    }
    hql+="  order by id desc";
  %>
  <body onLoad="MM_preloadImages('/nongchanpin/admin/images/index_on.gif','/nongchanpin/admin/images/reg_on.gif','/nongchanpin/admin/images/order_on.gif','/nongchanpin/admin/images/top/topxmas/jp_on.gif','/nongchanpin/admin/images/top/topxmas/download_on.gif','/nongchanpin/admin/images/top/topxmas/bbs_on.gif','/nongchanpin/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/nongchanpin/admin/orders.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/nongchanpin/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>电子商务门户</a> →订单管理
					<img border="0" src="/nongchanpin/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                 订单号：<input type="text" id="key" name="key" value="<%=key%>"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="搜索"/>
                 
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>订单号</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>订单商品</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>订单总金额</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>付款状态</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>发货状态</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>订单时间</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>订单人</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>电话</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>地址</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>操作</b></font></td>
		</tr>
        <%
        	PageManager pageManager = PageManager.getPage("/nongchanpin/admin/orders.jsp?1=1",10, request);
        	    pageManager.doList(hql);
        	    PageManager bean= (PageManager)request.getAttribute("page");
        	    ArrayList<Orders> list=( ArrayList<Orders>)bean.getCollection(); 
        	   
        	   	int i=0;
        	    for(Orders order :list)
        	    {
        	    	i++;
        %>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""><%=i %></td>
			<td class=tablebody1 valign=middle width="">&nbsp;&nbsp;<%=order.getOrderid() %></td>
			<td class=tablebody1 valign=middle width="">
			            <%String proinfo = order.getProinfo();
                  		String a[] = proinfo.split("-");
                  		String p = "";
                  		for(int j=0;j<a.length;j++){
                  			String b[] = a[j].split(",");
                  			Product product = (Product)dao.findById(b[0],"Product");
                      		p+=product.getProname()+"&nbsp;数量："+b[1]+"<br/>";
                  		}
                  		%><%=p %>
			</td>
			<td class=tablebody1 valign=middle width="" align="center"><%=order.getPrice() %>元</td>
			<td class=tablebody1 valign=middle width="" align="center"><%=order.getFkstatus() %></td>
			<td class=tablebody1 valign=middle width="" align="center"><%=order.getFhstatus() %></td>
			<td class=tablebody1 valign=middle width="" align="center"><%=order.getSavetime() %></td>
			<td class=tablebody1 valign=middle width="" align="center">
			<%
			Sysuser member = (Sysuser)dao.findById(order.getMemberid(),"Sysuser");
			%><%=member.getRealname() %>
			</td>
			<td class=tablebody1 valign=middle width="" align="center"><%=order.getTel() %></td>
			<td class=tablebody1 valign=middle width="" align="center"><%=order.getAddr() %></td>
			<td class=tablebody1 valign=middle align=center width="">
			<%if((order.getFkstatus().equals("已付款")||order.getFkstatus().equals("货到付款"))&&order.getFhstatus().equals("未发货")){ %>
			<a href="orderFh.action?id=<%=order.getId() %>">发货</a>
			<%} %>
			<a href="adminDelOrder.action?id=<%=order.getId() %>">删除</a></td>
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
		pop("/nongchanpin/admin/protypeadd.jsp","新增类别",400,150);
	}
	function edit(id)
	{
		pop("/nongchanpin/admin/protypeedit.jsp?id="+id,"编辑类别",400,150);
	}
	<%
		String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("有关联到此类别的商品，不能删除！");
		 parent.location.replace("/nongchanpin/admin/protype.jsp");
		 <%}%>
</script>