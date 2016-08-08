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
	<title>发布招聘信息</title>
	<link rel="stylesheet"  href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet"  href="<%=path%>/assets/css/app.css" />
	<script  src="<%=path%>/js/jquery-1.10.2.min.js"></script>
    <script  src="<%=path%>/js/jquery.form-validator.min.js"></script>
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="jobs">
	<s:include value="/include/org-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <h1>发布招聘信息</h1>
    </div>
    <form class="form-horizontal" action="save.html" namespaces="/kprc/advertise" method="post">
        <div class="form-group">
            <label class="col-sm-2 control-label" for="title"><span style="color:red;">*</span>公司简介</label>
            <div class="col-sm-8">
                <textarea rows="5" class="form-control" name="advertiseFor.describe" data-validation="length" data-validation-length="1-500" data-validation-error-msg="字数范围在(1-500)"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="title"><span style="color:red;">*</span>招聘岗位</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" name="advertiseFor.post" data-validation="length" data-validation-length="1-200" data-validation-error-msg="字数范围在(1-200)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="content"><span style="color:red;">*</span>工作内容</label>
            <div class="col-sm-8">
                <textarea rows="8"  name="advertiseFor.content" class="form-control ckeditor" data-validation="length" data-validation-length="1-2000" data-validation-error-msg="字数范围在(1-2000)"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="content"><span style="color:red;">*</span>应聘要求</label>
            <div class="col-sm-8">
                <textarea rows="8"   name="advertiseFor.requeire" class="form-control ckeditor" data-validation="length" data-validation-length="1-2000" data-validation-error-msg="字数范围在(1-2000)"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2 col-sm-offset-2">
                <button type="submit" class="btn btn-primary" ><i class="glyphicon glyphicon-ok"></i> 保存</button>
            </div>
        </div>
    </form>
</div>
    </main>
    <script language="javascript">
       $.validate({modules : 'platform'});
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>