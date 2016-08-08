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
	<title>添加学校</title>
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="schools">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <h1>查看学校</h1>
    </div>
    <form class="form-horizontal">
        <table class="table">
				<tbody>
				    <tr>
						<th class="bg-info" colspan="6">详细信息</th>
					</tr>
					<tr>
						<th>学校名称</th>
						<td>${school.name}</td>
						<th>学校地址</th>
						<td colspan="3">${school.address}</td>
					</tr>
					<tr>
						<th>学校简介</th>
						<td colspan="5">${school.name}</td>
					</tr>
					<tr>
						<th>联系人</th>
						<td>${school.relationuser}</td>
						<th>性别</th>
						<td><s:if test='member.gender=="M"'>男</s:if><s:else>女</s:else></td>
						<th>email</th>
						<td>${member.email}</td>
					</tr>
					<tr>
						<th>联系电话</th>
						<td>${member.telphone}</td>
						<th>手机</th>
						<td>${member.mobile}</td>
						<th>注册用户名称</th>
						<td>${member.username}</td>
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