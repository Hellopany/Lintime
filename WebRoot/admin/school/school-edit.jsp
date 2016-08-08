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
	<title>修改学校</title>
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
        <h1>修改学校</h1>
    </div>
    <form class="form-horizontal" action="update.html" namespace="/admin/school" method="post">
        <s:hidden id="id" name="school.id"></s:hidden>
        <s:hidden id="memberid" name="member.id"></s:hidden>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">学校名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="school.name" value="${school.name }"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">学校地址</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="school.address"  value="${school.address }"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">学校简介</label>
            <div class="col-sm-4">
                <textarea rows="5" class="form-control" name="school.describe" >${school.describe }</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">联系人</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="school.relationuser"  value="${school.relationuser }"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">联系电话</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="school.telphone"  value="${school.telphone}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">手机</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="member.mobile"  value="${member.mobile }"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">email</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="member.email"  value="${member.email }"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">注册用户名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="member.username"  value="${member.username }"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="password">登录密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="password" name="member.password"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="confirmPassword">确认密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="confirmPassword" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <button type="submit" class="btn btn-primary" ><i class="glyphicon glyphicon-ok"></i> 保存</button>
            </div>
        </div>
    </form>
</div>
    </main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>