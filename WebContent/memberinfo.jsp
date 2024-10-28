<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Sysuser"%>
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
  <%Sysuser member = (Sysuser)session.getAttribute("member");   
  Sysuser sysuser = (Sysuser)dao.findById(member.getId(),"Sysuser");
  %> 
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
                <TD width="90%" align=left><STRONG>　<FONT color=#ffffff>注册帐户</FONT></STRONG></TD>
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
              <form action="memberEdit.action" name="f1" method="post" onsubmit="return ck()">
              <input type="hidden" id="id" name="id" value="<%=sysuser.getId() %>">
                  <table width="100%">
                  	<tr>
                  		<td>密码</td>
                  		<td><input type="password" id="upass" name="upass" > </td>
                  	</tr>
                  	<tr>
                  		<td>重复密码</td>
                  		<td><input type="password" id="upass1" name="upass1"> </td>
                  	</tr>
                  	<tr>
                  		<td>姓名</td>
                  		<td><input type="text" id="realname" name="realname" value="<%=sysuser.getRealname() %>"> *</td>
                  	</tr>
                  	<tr>
                  		<td>性别</td>
                  		<td>
                  			<select id="sex" name="sex">
                  				<option value="男" <%if(sysuser.getSex().equals("男")){out.print("selected==selected");} %>>男</option>
                  				<option value="女" <%if(sysuser.getSex().equals("女")){out.print("selected==selected");} %>>女</option>
                  			</select>
                  		</td>
                  	</tr>
                  	<tr>
                  		<td>年龄</td>
                  		<td><input type="text" id="age" name="age" value="<%=sysuser.getAge() %>"> </td>
                  	</tr>
                  	<tr>
                  		<td>电话</td>
                  		<td><input type="text" id="tel" name="tel" value="<%=sysuser.getTel() %>"> *</td>
                  	</tr>
                  	<tr>
                  		<td>地址</td>
                  		<td><input type="text" id="addr" name="addr" size="60" value="<%=sysuser.getAddr() %>"> </td>
                  	</tr>
                  	<tr>
                  		<td colspan="2">
                  			<input type="submit" value="提交" >
                  			<input type="reset" value="重置">
                  		</td>
                  	</tr>
                  </table>
                  </form>
                  </DIV></TD></TR></TBODY></TABLE></TD></TR>
      </TBODY></TABLE></TD></TR></TBODY></TABLE>
    </center>
    
    <jsp:include page="foot.jsp"></jsp:include>
    <script type="text/javascript">
    
    
    	function ck(){
    	if(f1.upass.value!=""){
    		if(f1.upass1.value==""){
    			alert("请重复密码");
    			return false;
    		}if(f1.upass.value!=f1.upass1.value){
    			alert("两次密码不一致");
    		}
    	}
    		if(f1.realname.value==""){
    			alert("请输入姓名");
    			return false;
    		}if(f1.tel.value==""){
    			alert("请输入电话");
    			return false;
    		}
    	}
    	
    	<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){%>
		 alert("操作成功");
		 parent.location.replace("/nongchanpin/memberinfo.jsp");
		 <%}%>
    </script>
  </body>
</html>
