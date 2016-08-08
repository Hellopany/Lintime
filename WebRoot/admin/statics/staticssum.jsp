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
<title>统计</title>
<link rel="stylesheet" href="<%=path%>/assets/css/libs.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/app.css" />
<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="students">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<div class="container">
			<div class="page-header">
				<h1>统计</h1>
			</div>
			<s:form id="studentform" action="statics" namespaces="/admin/statics">
			<table  border="0" cellpadding="0" cellspacing="0" class="lsttable">
					<tr>
						<th>所属院校</th>
						<th><s:select id="selschool" list="schoolMap"  name="student.schoolid" ></s:select></th>
						<th>就业意向</th>
						<th><s:select id="selcareer" name="studentCareer.careertype" list="typeMap" ></s:select></th>
						<th>毕业年度</th>
						<th><s:textfield id="selyear" name="studentSchoolRoll.year"/></th>
						<th> <button class="btn btn-info" onclick="submit()"><i class="glyphicon glyphicon-plus"></i> 统计</button></th>
					</tr>
		    </table>
		    <div class="page-header">
			</div>
		    <s:if test='pageModel!=null&&pageModel.list.size>0'>
				<table class="table">
					<thead>
						<tr>
						    <th>序号</th>
							<th>所属学校</th>
							<th>毕业人数</th>
							<th>已就业人数</th>
							<th>未就业人数</th>
							<th>科普意向人数</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageModel.list" status="st">
							<tr>
							    <td>${st.index+1}</td>
								<td>${schoolname }</td>
								<td >${graduatecount}</td>
								<td >${workcount}</td>
								<td>${notworkcount}</td>
								<td>${kpcount}</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
                 
			</s:if>
			<s:else>
               	 无学生消息
    </s:else>
    </s:form>
		</div>
		
	</main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>