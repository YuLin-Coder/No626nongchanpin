<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%@page import="com.model.Msg"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
    <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
  <body>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=180 align=center>
        <TBODY>
        <TR>
          <TD width="200" height=15 align=middle>&nbsp;</TD></TR>
        <TR>
          <TD height=25 background=files/bgtop.gif align=middle><SPAN 
            class=STYLE3><STRONG>信息栏</STRONG></SPAN></TD></TR>
        <TR>
          <TD>
            <STYLE type=text/css>.td {
	BORDER-BOTTOM: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; BORDER-RIGHT: #cccccc 1px solid
}
.STYLE2 {
	FONT-SIZE: 14px; FONT-WEIGHT: bold
}
.STYLE3 {
	FONT-SIZE: 12px
}
</STYLE>

            <TABLE border=0 cellSpacing=0 cellPadding=0 width="10%" align=center 
            height=5>
              <TBODY>
              <TR>
                <TD></TD></TR></TBODY></TABLE>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=184 
              align=center><TBODY>
              <TR>
                <TD height=4 vAlign=top width=4><IMG 
                  src="files/new_line_004.gif" width=4 height=4></TD>
                <TD height=4 background=files/new_line_008.gif></TD>
                <TD height=4 vAlign=top width=4><IMG 
                  src="files/new_line_005.gif" width=4 height=4></TD></TR>
              <TR>
                <TD background=files/new_line_009.gif rowSpan=4></TD>
                <TD 
                style="PADDING-BOTTOM: 3px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px" 
                vAlign=top align=middle>&nbsp;</TD>
                <TD background=files/new_line_010.gif rowSpan=4></TD></TR>
              <TR>
                <TD 
                style="PADDING-BOTTOM: 3px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px" 
                vAlign=top align=middle></TD></TR>
              <TR>
                <TD 
                style="PADDING-BOTTOM: 3px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px" 
                vAlign=top align=middle>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                  height=32>
                    <TBODY>
                    <TR>
                      <TD height=36 background=files/gongji_02.gif 
                      width=180 align=middle useMap="#faq" border="0"><A 
                        href="">新闻公告</A></TD></TR></TBODY></TABLE>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                  height=27>
                    <TBODY>
                    <%ArrayList<Notice> noticelist = (ArrayList<Notice>)dao.findByHql(" from Notice where type='公告' order by id desc limit 0,10");
                    for(Notice notice:noticelist){
                    	String ntitle = "";
                    	if(notice.getTitle().length()>10){
                    		ntitle = notice.getTitle().substring(0,10)+"...";
                    	}else{
                    		ntitle = notice.getTitle();
                    	}
                    %>
                    <TR>
                      <TD height=19></TD>
                      <TD><IMG src="files/gongji_06.gif" width=14 
                        height=15> <A 
                        href="noticeDetail.jsp?id=<%=notice.getId() %>" title="<%=notice.getTitle() %>"><STRONG><%=ntitle %></STRONG></A><BR></TD></TR>
                    <TR>
                      <TD height=8 width="1%"></TD>
                      <TD width="99%">
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                        background=files/lineDotGray.gif height=1>
                          <TBODY>
                          <TR>
                            <TD height=1 
                          background=files/blank.gif></TD></TR></TBODY></TABLE></TD></TR>
                          <%} %>
                   </TBODY></TABLE></TD></TR>
                   
                   
                   
              <TR>
                <TD 
                style="PADDING-BOTTOM: 3px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; PADDING-TOP: 0px" 
                vAlign=top align=middle>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                  height=32>
                    <TBODY>
                    <TR>
                      <TD height=36 background=files/gongji_02.gif 
                      width=180 align=middle useMap="#faq" border="0"><A 
                        href="/nongchanpin/msg.jsp">留言板</A></TD></TR></TBODY></TABLE>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                  height=27>
                    <TBODY>
                    
                    
             <%ArrayList<Msg> msglist = (ArrayList<Msg>)dao.findByHql(" from Msg order by id desc limit 0,10 "); 
             for(Msg msg:msglist){
             %>       
                    <TR>
                      <TD height=19></TD>
                      <TD><IMG src="files/gongji_06.gif" width=14 
                        height=15> <A 
                        href="/nongchanpin/msg.jsp" title="<%=msg.getContent() %>">
                        <%
                        String m = "";
                        if(msg.getContent().length()>10){
                        	m = msg.getContent().substring(0,10)+"...";
                        }else{
                        	m = msg.getContent();
                        } %>
                        <%=m %>
                        </A><BR></TD></TR>
                    <TR>
                      <TD height=8 width="1%"></TD>
                      <TD width="99%">
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                        background=files/lineDotGray.gif height=1>
                          <TBODY>
                          <TR>
                            <TD height=1 
                          background=files/blank.gif></TD></TR></TBODY></TABLE></TD></TR>
				<%} %>
                   </TBODY></TABLE></TD></TR>
              <TR>
                <TD height=4 vAlign=top width=4><IMG 
                  src="files/new_line_006.gif" width=4 height=4></TD>
                <TD background=files/new_line_011.gif></TD>
                <TD height=4 vAlign=top width=4><IMG 
                  src="files/new_line_007.gif" width=4 
              height=4></TD></TR></TBODY></TABLE></TD></TR>
        
       </TBODY>
      <TBODY></TBODY></TABLE>
  </body>
</html>
