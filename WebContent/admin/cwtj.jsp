<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Sales"%>
<%@page import="com.model.Product"%>
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
  String hql = " from Sales where 1=1 ";
  String url ="/nongchanpin/admin/cwtj.jsp?1=1"; 
  String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
  String key2 = request.getParameter("key2")==null?"":request.getParameter("key2");
  String f = request.getParameter("f");
  if(f==null)
  {
  key1 = Info.getUTFStr(key1);
  key2 = Info.getUTFStr(key2);
  }
  if(!key1.equals(""))
  {
  hql+=" and (savetime >='"+key1+"'  )";
  url+="&key1="+key1;
  }  if(!key2.equals(""))
  {
	  hql+=" and (savetime <='"+key2+"'  )";
	  url+="&key2="+key2;
	  }
  hql+="  order by id desc"; %>
  <body onLoad="MM_preloadImages('/nongchanpin/admin/images/index_on.gif','/nongchanpin/admin/images/reg_on.gif','/nongchanpin/admin/images/order_on.gif','/nongchanpin/admin/images/top/topxmas/jp_on.gif','/nongchanpin/admin/images/top/topxmas/download_on.gif','/nongchanpin/admin/images/top/topxmas/bbs_on.gif','/nongchanpin/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/nongchanpin/admin/cwtj.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/nongchanpin/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>电子商务门户</a> →财务统计
					<img border="0" src="/nongchanpin/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                 起止时间：<input type="text" id="key1" name="key1" value="<%=key1 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>-
                 <input type="text" id="key2" name="key2" value="<%=key2 %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                 <input type="submit" value="搜索"/>
                <script type="text/javascript" src="/nongchanpin/commfiles/js/calendar/WdatePicker.js"></script>
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>金额</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>公益金</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>日期</b></font></td>
		
		</tr>
		
        <%
       
	    ArrayList<Sales> list= (ArrayList<Sales>)dao.findByHql(hql); 
	   String dprice = "";
	   String tprice = "";
	   String gyprice = "";
	   int sumprice = 0;
	    for(Sales s :list)
	    {
	    	Product p = (Product)dao.findById(s.getProductid(),"Product");
	    	if(p.getField7().equals("yes")){
	    		dprice = p.getField8();
	    	}else{
	    		dprice = p.getPrice();
	    	}
	    	tprice = String.valueOf(Integer.parseInt(dprice)*Double.parseDouble(s.getNum()));
	    	gyprice = String.valueOf(Integer.parseInt(dprice)*Double.parseDouble(s.getNum())/100);
	    	sumprice += Double.parseDouble(tprice)-Double.parseDouble(gyprice);
        %>
		<tr>
			<td class=tablebody1 valign=middle align=center width=""><%=tprice %>元</td>
			<td class=tablebody1 valign=middle align=center width=""><%=gyprice %>元</td>
			<td class=tablebody1 valign=middle width=""><%=s.getSavetime() %></td>
		</tr>
        <%} %>    
        <tr>
			<td class=tablebody1 valign=middle align=center width="" colspan="2">销售总金额：<%=sumprice %>元</td>
			<td class=tablebody1></td>
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
	function add()
	{
		pop("/nongchanpin/admin/noticeadd.jsp","新增公告",710,380);
	}
	function edit(id)
	{
		pop("/nongchanpin/admin/noticeedit.jsp?id="+id,"编辑公告",710,350);
	}
</script>