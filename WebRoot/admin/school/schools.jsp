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
	<title>学校管理</title>
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
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
            <s:a action="add" namespace="/admin/school" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 添加学校</s:a>
        </div>
        <h1>学校管理</h1>
    </div>
    <s:form id="myform" action="listschool" namespaces="/admin/school">
    <s:if test='pageModel!=null&&pageModel.list.size>0'>
    <s:hidden name="pageNo"></s:hidden>
    <s:hidden id="id" name="school.id"></s:hidden>
    <table class="table">
        <thead>
            <tr>
                <th>学校名称</th>
                <th>学校地址</th>
                <th>联系人</th>
                <th>联系电话</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
           <s:iterator value="pageModel.list" status="st">
            <tr>
                <td><s:a action="detail" namespace="/admin/school"><s:param name="school.id">${id}</s:param>${name}</s:a></td>
                <td>${address}</td>
                <td>${relationuser }</td>
                <td>${telphone }</td>
                <td><s:if test='isfinishcheck==1'><s:a action="detail" namespace="/admin/school">
										<s:param name="school.id">${id}</s:param>查看</s:a></s:if><s:else><s:a action="remove" namespace="/admin/school" onclick="return confirm('确定删除这条数据吗？');">
										<s:param name="school.id">${id}</s:param>删除</s:a> | <s:a action="modify" namespace="/admin/school">
										<s:param name="school.id">${id}</s:param>编辑</s:a> | <s:a action="submit" namespace="/admin/school"  onclick="return confirm('确认这条数据吗？');"><s:param name="school.id">${id}</s:param>启用</s:a></s:else></td>
                <td><button type="button" onclick="resetpass(${id})" class="btn btn-xs btn-primary" data-toggle="modal">重置密码</button></td>
            </tr>
            </s:iterator>
        </tbody>
    </table>
    <div id="pagebar">
    <s:include value="/include/page-bar.jsp"></s:include>
    </div>
    </s:if>
    </s:form>
</div>
    </main>
    <script language="javascript">
       function resetpass(u){
           if(!confirm('确定重置密码吗？')){
              return;
           }
           $("#id").val(u);
           var obj = document.getElementById("myform");
           obj.action = "resetpass.html";
           obj.submit();
       }
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>