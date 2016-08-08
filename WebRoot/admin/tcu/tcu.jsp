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
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>查看教指委用户信息</title>
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="schools">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:500px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <h1>查看教指委用户信息</h1>
    </div>
    <form class="form-horizontal" id="form1">
    <s:hidden id="id" name="tcu.id"></s:hidden>
        <table class="table">
				<tbody>
				    <tr>
						<th class="bg-info" colspan="9">详细信息</th>
					</tr>
					<tr>
					    <th>名称</th>
						<td>${tcu.name}</td>
						<th>单位名称</th>
						<td colspan="3">${tcu.post}</td>
						<th>联系电话</th>
						<td>${tcu.tel}</td>
					</tr>
					<tr>
					    <th>教指委职务</th>
						<td>${tcu.company}</td>
						<th>注册email</th>
						<td>${tcu.email}</td>
					</tr>
			</tbody>
			</table>
    </form>
</div>
    </main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>