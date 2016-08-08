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
	<title>添加职教委用户</title>
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
	<script  src="<%=path%>/js/jquery-1.10.2.min.js"></script>
    <script  src="<%=path%>/js/jquery.form-validator.min.js"></script>
</head>
<body id="schools">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <h1>添加职教委用户</h1>
    </div>
    <form class="form-horizontal" id="form1" action="sava.html" namespace="/admin/tcu" method="post">
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>姓名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="tcu.name" data-validation="length" data-validation-length="2-255" data-validation-error-msg="字数范围在(5-255)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>联系电话</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="tcu.tel" data-validation="length" data-validation-length="1-50" data-validation-error-msg="字数范围在(1-50)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">教指委职务</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="tcu.post" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>email</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="email" name="tcu.email" data-validation="length" data-validation-length="1-255" data-validation-error-msg="字数范围在(1-255)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>单位名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="company" name="tcu.company" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数范围在(6-12)"/>
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <button type="submit" onclick="return check()" class="btn btn-primary" ><i class="glyphicon glyphicon-ok"></i> 保存</button>
            </div>
        </div>
    <form>
</div>
    </main>
    <script language="javascript">
       $.validate({modules : 'platform'});
       function check(){
           return true;
       }
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>