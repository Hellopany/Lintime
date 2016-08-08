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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title></title>
<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}"
	href="<%=path%>/assets/css/libs.css" />
<link rel="stylesheet" th:href="@{/assets/css/app.css}"
	href="<%=path%>/assets/css/app.css" />
<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="jobs">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<s:form id="form1" action="" namespaces="/admin/advertise" method="post">
		<s:hidden name="advertiseFor.id"></s:hidden>
			<div class="container">
				<div class="pull-right">
					<a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
				</div>
				<article>
					<h1 class="text-center">${advertiseFor.membername}招聘</h1>
					<span style="font-family:华文中宋;font-size:18px; color:gray; ">公司简介</span>
					<p style="text-indent:2em">${advertiseFor.describe }</p>
					<span style="font-family:华文中宋; font-size:18px; color:gray; ">招聘岗位</span>
					<p style="text-indent:2em">${advertiseFor.post }</p>
					<span style="font-family:华文中宋; font-size:18px; color:gray;">招聘内容：</span>
					<p style="text-indent:2em">${advertiseFor.content }</p>
					<span style="font-family:华文中宋; font-size:18px; color:gray;">应聘要求：</span>
					<p style="text-indent:2em">${advertiseFor.requeire }</p>
				</article>
				<s:if test='advertiseFor.status=="S"'>
				<div class="form-group">
					<div class="col-sm-4 col-sm-offset-4">
						<button onclick="return pass()"
							class="btn btn-primary">
							<i class="glyphicon glyphicon"></i> 通过
						</button>
						<button type="submit" onclick="return refuse()"
							class="btn btn-primary">
							<i class="glyphicon glyphicon"></i> 拒绝
						</button>
					</div>
				</div>
				</s:if>
		</s:form>
		</div>
	</main>
	<script>
	function pass(){
	   if(confirm('审核通过这条招聘广告发布数据吗？')){
		 $('#form1').attr("action", '<s:url action="pass" namespace="/admin/advertise" />');
		 $('#form1').submit();
	   }
	}
	function refuse(){
	  if(confirm('确定拒绝这条招聘广告发布数据吗？')){
		$('#form1').attr("action", '<s:url action="refuse" namespace="/admin/advertise" />');
		$('#form1').submit();
	  }
	}
	</script>	
	<s:include value="/include/footer-info.jsp"></s:include>
	<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>