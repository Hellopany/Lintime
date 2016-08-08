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
	<title>查看单位信息</title>
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
        <h1>查看单位信息</h1>
    </div>
    <form class="form-horizontal" id="form1">
    <s:hidden id="id" name="member.id"></s:hidden>
        <table class="table">
				<tbody>
				    <tr>
						<th class="bg-info" colspan="6">详细信息</th>
					</tr>
					<tr>
						<th>单位名称</th>
						<td colspan="3">${member.name}</td>
						<th>联系电话</th>
						<td>${member.telphone}</td>
					</tr>
					<tr>
					    <th>注册用户名称</th>
						<td>${member.username}</td>
						<th>注册email</th>
						<td>${member.email}</td>
						<th>联系手机</th>
						<td>${member.mobile}</td>
					</tr>
			</tbody>
			</table>
			<div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                   <s:if test='member.ismanagercreate!=1'>
                    	<s:if test='member.isfinishcheck==0'><button type="submit" onclick="return pass()" class="btn btn-primary" onclic> 通过</button> <button type="submit" onclick="return refuse()" class="btn btn-primary" onclic> 拒绝</button></s:if>
                   </s:if><s:else>
                        <s:if test='member.isfinishcheck==0'><button type="submit" onclick="return pass()" class="btn btn-primary" onclic> 启用</button></s:if>
                   </s:else>
            </div>
            </div>
    </form>
</div>
    </main>
    <script language="javascript">
       function pass(){
           if(confirm('确定通过并启用这条数据吗？')){
                $('#form1').attr("action", '<s:url action="pass" namespace="/admin/org"/>');
		        $('#form1').submit();
           }
       }
       
       function refuse(){
           if(confirm('您确定拒绝这条数据吗？')){
                $('#form1').attr("action", '<s:url action="refuse" namespace="/admin/org" />');
		        $('#form1').submit();
           }
       }
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>