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
<title>招聘信息</title>
<link rel="stylesheet" href="<%=path%>/assets/css/libs.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/app.css" />
<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
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
					<s:a action="add" class="btn btn-info"  namespace="/kprc/advertise"><i
						class="glyphicon glyphicon-plus"></i> 发布</s:a>
				</div>
				<h1>招聘信息</h1>
			</div>
			<s:form  action="advertiselist" namespaces="/kprc/advertise">
			<s:if test='pageModel!=null&&pageModel.list.size>0'>
			    <s:hidden name="pageNo"></s:hidden>
			    
				<table class="table">
					<thead>
						<tr>
							<th>标题</th>
							<th>时间</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageModel.list" status="st">
							<tr>
								<td><s:a action="orgdetail" namespace="/kprc/advertise">
										<s:param name="advertiseFor.id">${id}</s:param>${membername}招聘人员公告</s:a></td>
								<td><s:date name="publishdate" format='yyyy-MM-dd hh:mm:ss' /></td>
								<td><s:if test='status=="S"'><span class="label label-warning">${statusname}</span></s:if>
								<s:elseif test='status=="C"'><span class="label label-success">${statusname}</span></s:elseif>
								<s:elseif test='status=="R"'><span class="label label-fail">${statusname}</span></s:elseif><s:else>${statusname}</s:else>
								</td>
								<td><s:if test='status=="S"||status=="C"'><s:a action="orgdetail" namespace="/kprc/advertise">
										<s:param name="advertiseFor.id">${id}</s:param>查看</s:a></s:if><s:else><s:a action="remove" namespace="/kprc/advertise" onclick="return confirm('确定删除这条数据吗？');">
										<s:param name="advertiseFor.id">${id}</s:param>删除</s:a> | <s:a action="modify" namespace="/kprc/advertise">
										<s:param name="advertiseFor.id">${id}</s:param>编辑</s:a> | <s:a action="submit" namespace="/kprc/advertise"  onclick="return confirm('确定提交这条数据吗？');"><s:param name="advertiseFor.id">${id}</s:param>提交</s:a></s:else>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div id="pagebar">
					<s:include value="/include/page-bar.jsp"></s:include>
				</div>
			</s:if>
			<s:else>
   	 	您还没有发布招聘消息，点此<s:a action="add" namespace="/kprc/advertise">发布招聘</s:a>信息。
	</s:else>
	</s:form>
		</div>
	</main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>