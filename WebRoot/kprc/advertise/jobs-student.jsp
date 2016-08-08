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
<link rel="stylesheet" 	href="<%=path %>/assets/css/libs.css" />
<link rel="stylesheet" 	href="<%=path %>/assets/css/app.css" />
<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
</head>
<body id="jobs">
	<s:include value="/include/student-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<div class="container">
			<div class="page-header">
				<h1>招聘信息</h1>
			</div>
			<s:form  action="list" namespaces="/kprc/advertise">
			<s:if test='pageModel!=null&&pageModel.list.size>0'>
			<s:hidden name="pageNo"></s:hidden>
			<table class="table">
				<thead>
					<tr>
						<th>标题</th>
						<th>时间</th>
					</tr>
				</thead>
				<tbody>
				       <s:iterator value="pageModel.list" status="st">
						<tr>
							<td><s:a action="detail" namespace="/kprc/advertise"><s:param name="advertiseFor.id">${id}</s:param>${membername}招聘人员公告</s:a></td>
							<td><s:date name="publishdate" format='yyyy-MM-dd hh:mm:ss' /></td>
						</tr>
					   </s:iterator>
				</tbody>
			</table>
			<div id="pagebar">
				<s:include value="/include/page-bar.jsp"></s:include>
			</div>
			</s:if>
			<s:else>
          	 	无最新招聘消息
      		</s:else>
      		</s:form>
		</div>
	</main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>