<%@ page language="java" import="java.util.*" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/include/header.jsp"></s:include>
<link href="<%=path %>/css/status.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="pagebody">
  <div id="topbody" class="commontop"></div>
  <div id="mainbody">
  <div style="margin:60px;">
			<% cn.kepu.base.form.Message msg = cn.kepu.utils.ContextUtils.getOpMessage(); 
			   if (msg != null) {
			%>
			<div class="message-alert <%=msg.getType()%>"><%=msg.getMessage()%></div>
			<% } else { %>
			<div class="message-alert">用户操作失败，请稍后重试！</div>
			<% } %>
            <p><br/><s:if test="isAdmin"><a href="<%=path%>/admin/index.html">>>返回管理员首页</a></s:if><s:else><a href="<%=path%>/">>>返回首页</a></s:else></p>
  </div>
  </div>
 </div>
		<s:include value="/include/footer-info.jsp"></s:include>
	</body>
</html>

