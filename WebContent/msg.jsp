<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Msg"%>
<%@page import="com.model.Sysuser"%>
<%@page import="com.util.PageManager"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>农产品电商服务平台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="农产品电商服务平台">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel=stylesheet type=text/css href="files/style.css">
<STYLE type=text/css>.STYLE3 {
	COLOR: #ffffff
}
</STYLE>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold
}
.STYLE2 {
	FONT-WEIGHT: bold
}
BODY {
	BACKGROUND-COLOR: #ffffff
}
</STYLE>

<STYLE type=text/css>.STYLE5 {
	FONT-SIZE: 9px
}
</STYLE>

 <LINK rel=stylesheet type=text/css href="files/css.css">
<STYLE type=text/css>BODY {
	MARGIN: 0px
}
</STYLE>
  </head>
  <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); 
    Sysuser member = (Sysuser)session.getAttribute("member");%>
  <body>
    <jsp:include page="top.jsp"></jsp:include>
    <center>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=1006 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top width=188>
    <jsp:include page="left.jsp"></jsp:include>
      </TD>
    <TD vAlign=top width=787>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" height=5>
        <TBODY>
        <TR>
          <TD height=5></TD></TR></TBODY></TABLE>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD height=10 width=787></TD></TR>
        <TR>
          <TD height=25 background=files/bgtop.gif>
            <TABLE width="100%">
              <TBODY>
              <TR>
                <TD width="90%" align=left><STRONG>　<FONT color=#ffffff>留言板</FONT></STRONG></TD>
                <TD width="10%" align=right>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
        <TR>
          <TD height=180 vAlign=top>
            <STYLE type=text/css>.style4 {
	COLOR: #ff0000
}
</STYLE>

            <TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" 
align=center>
              <TBODY>
              <TR>
                <TD height=10 vAlign=top></TD></TR>
              <TR>
                <TD>
                  <DIV style="WIDTH: 800px">
              
              <table width="100%" border="0" bgcolor="#cccccc" cellpadding="1" cellspacing="1">
                  	<tr align="center" bgcolor="#cccccc">
                  		<td>留言内容</td>
                  		<td>回复内容</td>
                  		<td>留言时间</td>
                  		<td>留言人</td>
              		</tr>
              		<%String hql = " from Msg order by id desc "; 
              		PageManager pageManager = PageManager.getPage("/nongchanpin/msg.jsp?1=1",10, request);
            	    pageManager.doList(hql);
            	    PageManager bean= (PageManager)request.getAttribute("page");
            	    ArrayList<Msg> msglist=( ArrayList<Msg>)bean.getCollection(); 
              		for(Msg msg:msglist){
              		%>
              		<tr>
              			<td bgcolor="#ffffff"><%=msg.getContent() %></td>
              			<td bgcolor="#ffffff"><%=msg.getReply() %></td>
              			<td bgcolor="#ffffff" align="center"><%=msg.getSavetime() %></td>
              			<td bgcolor="#ffffff" align="center">
              			<%
              			Sysuser m = (Sysuser)dao.findById(msg.getMemberid(),"Sysuser");
              			 %><%=m.getUname() %>
              			</td>
              		</tr>
              		<%} %>
              		<tr>
              			<td bgcolor="#ffffff" colspan="4" align="center">${page.info }</td>
              		</tr>
              </table>
              <%if(member!=null){ %>
              <form action="msgAdd.action" name="f1" method="post" onsubmit="return ck()">
              <input type="hidden" id="memberid" name="memberid" value="<%=member.getId() %>" >
                  <table width="100%">
                  	<tr>
                  		<td>留言内容</td>
                  		<td><textarea rows="4" cols="60" id="content" name="content"></textarea> *</td>
                  	</tr>
                  	<tr>
                  		<td colspan="2">
                  			<input type="submit" value="提交"  >
                  			<input type="reset" value="重置">
                  		</td>
                  	</tr>
                  </table>
                  </form>
                  <%} %>
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    <script type="text/javascript">
    	function ck(){
    		if(f1.content.value==""){
    			alert("请输入留言内容");
    			return false;
    		}
    	}
    	
    	<%
		String suc = (String)request.getAttribute("suc");
    	String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("用户名或密码错误");
		 location.replace("/nongchanpin/login.jsp");
		 <%}
		if(suc!=null){%>
		 alert("留言成功");
		 location.replace("/nongchanpin/msg.jsp");
		 <%}%>
    </script>
  </body>
</html>
