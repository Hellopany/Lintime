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
<title>查询统计</title>
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
				<h1>查询统计</h1>
			</div>
			<s:form id="studentform" action="newquery" namespaces="/admin/statics">
			<table  border="0" cellpadding="0" cellspacing="0" class="lsttable">
					<tr>
						<th>所属院校</th>
						<th><s:select id="selschool" list="schoolMap"  name="student.schoolid" ></s:select></th>
						<th>就业意向</th>
						<th><s:select id="selcareer" name="studentCareer.careertype" list="typeMap" ></s:select></th>
						<th>毕业年度</th>
						<th><s:textfield id="selyear" name="studentSchoolRoll.year"/></th>
					</tr>
					<tr>
						<th> <button class="btn btn-info" onclick="submit()"><i class="glyphicon glyphicon-plus"></i> 查询</button></th>
						<th> <button class="btn btn-info" onclick="exportstudent()"><i class="glyphicon glyphicon-plus"></i> 导出</button></th>
						<th> <button class="btn btn-info" onclick="statics()"><i class="glyphicon glyphicon-plus"></i> 统计</button></th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
		    </table>
		    <div class="page-header">
			</div>
		    <s:if test='pageModel!=null&&pageModel.list.size>0'>
		    <s:hidden name="pageNo"></s:hidden>
				<table class="table">
					<thead>
						<tr>
						    <th>序号</th>
							<th>姓名</th>
							<th>所属学校</th>
							<th>专业</th>
							<th>入学时间</th>
							<th>实习单位</th>
							<th>就业意向</th>
							<th>就业情况</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageModel.list" status="st">
							<tr>
							    <td>${st.index+1}</td>
								<td><s:a action="detail" namespace="/admin/student">
										<s:param name="student.id">${id}</s:param>${name}</s:a></td>
								<td>${schoolname }</td>
								<td >${professional}</td>
								<td><s:date name="joindate" format='yyyy-MM-dd' /></td>
								<td >${praticeunit}</td>
								<td>${worktypename}</td>
								<td><s:if test='iswork'>已经就业</s:if><s:else>未就业</s:else></td>
								<td><s:a action="detail" class="btn btn-xs btn-primary"
										namespace="/admin/student">
										<s:param name="student.id">${id}</s:param>查看</s:a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div id="pagebar">
				  <s:include value="/include/page-bar.jsp"></s:include>
				</div>  
                 
			</s:if>
			<s:else>
               	 无学生消息
    </s:else>
    </s:form>
		</div>
		
	</main>
	<script language="javascript">
	   function exportstudent(){
	       $('#studentform').attr("action", '<s:url action="export" />');
		   $('#studentform').submit();
	   }
	   
	   function statics(){
	       $('#studentform').attr("action", '<s:url action="statics" />');
		   $('#studentform').submit();
	   }
	</script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>