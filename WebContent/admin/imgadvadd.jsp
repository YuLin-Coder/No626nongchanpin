<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>

<LINK href="/nongchanpin/commfiles/css/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/nongchanpin/commfiles/js/Admin.js"></SCRIPT>
<script language=javascript src="/nongchanpin/fckeditor/fckeditor.js"></script>
<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="imgAdvAdd.action" method=post name="f1" onsubmit="return ck()" enctype ="multipart/form-data">
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TD width="10%" height=24 align="center" class=forumrow>请选择图片</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input type="file" id="upFile" name="upFile" size="60">
    </label></TD></TR>
      <TR>
    <TD width="10%" height=24 align="center" class=forumrow>图片类型</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <select id="type" name="type">
      	<option value="ADV">广告图片</option>
      	<option value="HEAD">头部图片</option>
      </select>
    </label></TD></TR>
    <TR>
	    <TD colspan="2" height=24 align="center" class=forumrow>
	    	<input type="submit" value="提交">	
	    	<input type="reset" value="重置">	
	    </TD>
    </TR>
  </TBODY></TABLE>
  </form>
</BODY></HTML>
<SCRIPT language=javascript>
		function ck(){
     		if(f1.upFile.value==""){
     			alert("图片不能为空");
     			return false;
     		}
     	}
     	
		<%
		String suc = (String)request.getAttribute("suc");
		if(suc!=null){%>
		 alert("操作成功");
		 parent.location.replace("/nongchanpin/admin/imgadv.jsp");
		 <%}%>
		 		<%
		String no = (String)request.getAttribute("no");
		if(no!=null){%>
		 alert("头部图片只能存在一张");
		 parent.location.replace("/nongchanpin/admin/imgadv.jsp");
		 <%}%>
</script>
