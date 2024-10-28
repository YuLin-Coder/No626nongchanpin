<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Notice"%>
<%@page import="com.model.Product"%>
<%@page import="com.model.Imgadv"%>
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
  <%CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO"); %>
  <body>
    <jsp:include page="top.jsp"></jsp:include>

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
         <table width="100%">
          	<tr>
          		<td align="center">
          			<script> 
var widths=800; 
var heights=155; 
var widths=800; 
var heights=150; 
<%ArrayList<Imgadv> imgadvlist = (ArrayList<Imgadv>)dao.findByHql(" from Imgadv where type='ADV' ");
	int counts=0;
	int i=0;
	if(imgadvlist.size()!=0){
		counts = imgadvlist.size();
		for(Imgadv imgadv:imgadvlist){
		i++;
		%>
			img<%=i%>=new Image ();img<%=i%>.src="/nongchanpin/upfile/<%=imgadv.getImgurl()%>";  
<%		}
	}
%>

var counts=<%=counts%>;

//webjx.com 
var nn=1; 
var key=0; 
function change_img() 
{if(key==0){key=1;} 
else if(document.all) 
{document.getElementById("pic").filters[0].Apply();document.getElementById("pic").filters[0].Play(duration=2);} 
eval('document.getElementById("pic").src=img'+nn+'.src'); 
for (var i=1;i<=counts;i++){document.getElementById("xxjdjj"+i).className='axx';} 
document.getElementById("xxjdjj"+nn).className='bxx'; 
nn++;if(nn>counts){nn=1;} 
tt=setTimeout('change_img()',4000);} 
function changeimg(n){nn=n;window.clearInterval(tt);change_img();} 
document.write('<style>'); 
document.write('.axx{padding:1px 7px;border-left:#cccccc 1px solid;}'); 
document.write('a.axx:link,a.axx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#666;}'); 
document.write('a.axx:active,a.axx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#999;}'); 
document.write('.bxx{padding:1px 7px;border-left:#cccccc 1px solid;}'); 
document.write('a.bxx:link,a.bxx:visited{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}'); 
document.write('a.bxx:active,a.bxx:hover{text-decoration:none;color:#fff;line-height:12px;font:9px sans-serif;background-color:#D34600;}'); 
document.write('</style>'); 
document.write('<div style="width:'+widths+'px;height:'+heights+'px;overflow:hidden;text-overflow:clip;">'); 
document.write('<div><img id="pic" style="border:0px;filter:progid:dximagetransform.microsoft.wipe(gradientsize=1.0,wipestyle=4, motion=forward)" width='+widths+' height='+heights+' /></div>'); 
document.write('<div style="filter:alpha(style=1,opacity=10,finishOpacity=80);background: #888888;width:100%-2px;text-align:right;top:-12px;position:relative;margin:1px;height:12px;padding:0px;margin:0px;border:0px;">'); 
for(var i=1;i<counts+1;i++){document.write('<a href="javascript:changeimg('+i+');" id="xxjdjj'+i+'" class="axx" target="_self">'+i+'</a>');} 
document.write('</div></div>'); 
change_img(); 
</script> 
          		</td>
          	</tr>
          	
          	</table>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TD height=10 width=787></TD></TR>
        <TR>
          <TD height=25 background=files/bgtop.gif>
          
            <TABLE width="100%">
              <TBODY>
              <TR>
                <TD width="90%" align=left class=STYLE3><STRONG>　商品展示</STRONG></TD>
                <TD width="10%" align=right><A 
                  href="/nongchanpin/productmore.jsp"><STRONG><FONT color=#ffffff>more</FONT></STRONG></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
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
                  <%ArrayList<Product> productlist = (ArrayList<Product>)dao.findByHql(" from Product where delstatus=0 order by id desc limit 0,12");
                  int a = 0;
                  for(Product product:productlist ){
                	  a++;
                  %>
                  <DIV style="TEXT-ALIGN: center; WIDTH: 200px; FLOAT: left; HEIGHT: 250px; marign: 3px">
                  <TABLE>
                    <TBODY>
                    <TR>
                      <TD height=110 vAlign=top>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=110 
                        height=137>
                          <TBODY>
                          <TR>
                            <TD height=95 width=110>
                              <DIV align=center>
                              <TABLE border=0 cellSpacing=1 cellPadding=2 
                              width=90 bgColor=#e1e1e1 align=center height=90>
                                <TBODY>
                                <TR>
                                <TD bgColor=#ffffff height=90 width=90 
                                align=middle><A href="/nongchanpin/productDetail.jsp?id=<%=product.getId() %>" title="<%=product.getProname() %>">
                                <IMG border=0 src="/nongchanpin/upfile/<%=product.getImg() %>" 
                                width=150 height=150></A></TD></TR></TBODY></TABLE></DIV></TD></TR>
                          <TR>
                            <TD height=18 vAlign=center>
                              <DIV align=center><A 
                              href="/nongchanpin/productDetail.jsp?id=<%=product.getId() %>" title="<%=product.getProname() %>">
                              <%
                              String proname="";
                              if(product.getProname().length()>10){
                            	  proname = product.getProname().substring(0,10)+"...";
                              }else{
                            	  proname = product.getProname();
                              }
							  %><%=proname %>
                              </A></DIV></TD></TR>
                          <TR>
                            <TD height=13 vAlign=bottom>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="98%">
                                <TBODY>
                                <TR>
                                <TD height=9>
                                <DIV class=style4 align=center>
                                <%if(product.getField7().equals("yes")){ %>
                                定价：<s><%=product.getPrice() %></s>元&nbsp;特价：<%=product.getField8() %>元
                                <%}else{ %>
                                定价：<%=product.getPrice() %>元
                                <%} %>
                               </DIV></TD></TR>
                                <TR>
                                <TD height=9>
                          <DIV align=center><A 
                                href="/nongchanpin/productDetail.jsp?id=<%=product.getId() %>"><IMG 
                                border=0 src="files/index_29.jpg" width=62 
                                height=17></A></DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
                               <%
                                if(a%4==0)
                                {%>
                                </DIV><DIV>
                                <%
                                }
                                }
                                 %>
                  
                  
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
