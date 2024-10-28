<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Kcrecord"%>
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
  String hql = " from Kcrecord where 1=1  ";
  String url ="/nongchanpin/admin/kcrecord.jsp?1=1"; 
  String stime = request.getParameter("stime")==null?"":request.getParameter("stime");
  String etime = request.getParameter("etime")==null?"":request.getParameter("etime");
  String f = request.getParameter("f");
  if(f==null)
  {
	  stime = Info.getUTFStr(stime);
	  etime = Info.getUTFStr(etime);
  }
  if(!stime.equals(""))
  {
  hql+=" and (savetime>='"+stime+"'  )";
  url+="&stime="+stime;
  }  if(!etime.equals(""))
  {
	  hql+=" and (savetime<='"+etime+"'  )";
	  url+="&etime="+etime;
	  }
  hql+="  order by id desc"; %>
  <body onLoad="MM_preloadImages('/nongchanpin/admin/images/index_on.gif','/nongchanpin/admin/images/reg_on.gif','/nongchanpin/admin/images/order_on.gif','/nongchanpin/admin/images/top/topxmas/jp_on.gif','/nongchanpin/admin/images/top/topxmas/download_on.gif','/nongchanpin/admin/images/top/topxmas/bbs_on.gif','/nongchanpin/admin/images/top/topxmas/designwz_on.gif')" topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
        <jsp:include page="top.jsp"></jsp:include>
        
        <form action="/nongchanpin/admin/kcrecord.jsp?f=f" name="f1" method="post">
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle>
                  <img src="/nongchanpin/admin/images/Forum_nav.gif" align="absmiddle">
                  <a href=index.jsp>电子商务门户</a> →库存记录
					<img border="0" src="/nongchanpin/admin/images/dog.gif" width="19" height="18">
					欢迎<font color="red"></font>光临！
                </td>
                </tr>
		</table>
              <br>
        <table cellspacing=1 cellpadding=3 align=center class=tableBorder2>
		<tr>
		<td height=25 valign=middle align=right>
                 按时间查询：<input type="text" id="stime" name="stime" value="<%=stime %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>-
                 <input type="text" id="etime" name="etime" value="<%=etime %>" readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
                 <script type="text/javascript" src="/nongchanpin/commfiles/js/calendar/WdatePicker.js"></script>
                 &nbsp;&nbsp;<input type="submit" value="查询" >
                </td>
                </tr>
		</table>
		
		<table cellpadding=3 cellspacing=1 align=center class=tableborder1>
		<tr>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width="10%"><font color="#ffffff"><b>序号</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>商品</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width=""><font color="#ffffff"><b>出入库数量</b></font></td>
			<td valign=middle align=center height=25 background="/nongchanpin/admin/images/bg2.gif" width="15%"><font color="#ffffff"><b>时间</b></font></td>
		</tr>
        <%
        PageManager pageManager = PageManager.getPage("/nongchanpin/admin/kcrecord.jsp?1=1",10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<Kcrecord> list=( ArrayList<Kcrecord>)bean.getCollection(); 
	   	int i=0;
	    for(Kcrecord kc :list)
	    {
	    	i++;
        %>
		<tr>
			<td class=tablebody2 valign=middle align=center width=""><%=i %></td>
			<td class=tablebody1 valign=middle width="">
			<%Product p = (Product)dao.findById(kc.getProductid(),"Product"); %>
			<%=p.getProname() %>
			</td>
			<td class=tablebody1 valign=middle align=center width="">
			<%
			String type = "";
			if(kc.getType().equals("in")){
				type = "入库";
			}else{
				type = "出库";
			} %>
			<%=type %>&nbsp;<%=kc.getNum() %>
			</td>
			<td class=tablebody1 valign=middle width=""><%=kc.getSavetime() %></td>
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