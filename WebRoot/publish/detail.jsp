<!doctype html>
<%@ page language="java" import="java.util.*" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	response.setStatus(HttpServletResponse.SC_OK);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title></title>
	<link rel="stylesheet"  href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet"  href="<%=path%>/assets/css/app.css" />
</head>
<body id="jobs">
 <div class="container">
    <article>
        <h1 class="text-center">${advertiseFor.membername}招聘</h1>
				<span  style="font-family:华文中宋;font-size:18px; color:gray; ">公司简介</span>
				<p style="text-indent:2em">${advertiseFor.describe }</p>
				<span  style="font-family:华文中宋; font-size:18px; color:gray; ">招聘岗位</span>
				<p style="text-indent:2em">${advertiseFor.post }</p>
				<span  style="font-family:华文中宋; font-size:18px; color:gray;">招聘内容：</span>
				<p style="text-indent:2em">${advertiseFor.content }</p>
				<span  style="font-family:华文中宋; font-size:18px; color:gray;">应聘要求：</span>
				<p style="text-indent:2em">${advertiseFor.requeire }</p>
    </article>
</div>
</body>
</html>