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
	<title>修改单位信息</title>
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
        <h1>修改单位信息</h1>
    </div>
    <form class="form-horizontal" action="update.html" namespace="/admin/org" method="post">
        <s:hidden id="id" name="member.id"></s:hidden>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>单位名称</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" value="${member.name }" name="member.name" data-validation="length" data-validation-length="5-255" data-validation-error-msg="字数范围在(5-255)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>联系电话</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" value="${member.telphone }" name="member.telphone" data-validation="length" data-validation-length="1-50" data-validation-error-msg="字数范围在(1-50)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name">手机</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" value="${member.mobile }" name="member.mobile" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>email</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" id="email" value="${member.email }" name="member.email" data-validation="length" data-validation-length="1-255" data-validation-error-msg="字数范围在(1-255)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="name"><span style="color:red;">*</span>注册用户名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" value="${member.username }" name="member.username" data-validation="length" data-validation-length="1-100" data-validation-error-msg="字数范围在(1-100)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="password"><span style="color:red;">*</span>登录密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control"  id="password" name="member.password" data-validation="length" data-validation-length="6-12" data-validation-error-msg="字数范围在(6-12)"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label" for="confirmPassword"><span style="color:red;">*</span>确认登录密码</label>
            <div class="col-sm-4">
                <input type="password" class="form-control" id="confirmPassword" data-validation="length" data-validation-length="6-12" data-validation-error-msg="字数范围在(6-12)"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <button type="submit" onclick="return check()" class="btn btn-primary" ><i class="glyphicon glyphicon-ok"></i> 保存</button>
            </div>
        </div>
    </form>
</div>
    </main>
    <script language="javascript">
       $.validate({modules : 'platform'});
       function check(){
           if($("#email").val().indexOf("@")<0){
                alert("邮件地址输入错误，请重新输入！");
                return false;
           }
           if($("#password").val()!=$("#confirmPassword").val()){
                alert("两次密码输入的不一致，请重新输入！");
                return false;
           }
       }
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>