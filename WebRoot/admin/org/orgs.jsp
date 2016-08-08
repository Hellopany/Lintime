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
	<title>用人单位管理</title>
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="orgs">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <s:a action="add" namespace="/admin/org" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 添加单位</s:a> 
            <s:a action="list" namespace="/admin/advertise" class="btn btn-info"><i class="glyphicon glyphicon-plus"></i> 查看招聘信息</s:a>
        </div>
        <h1>用人单位管理</h1>
    </div>
    <s:form  id="myform" namespaces="/admin/org">
    <s:if test='pageModel!=null&&pageModel.list.size>0'>
    <s:hidden name="pageNo"></s:hidden>
    <s:hidden id="id" name="member.id"></s:hidden>
    <table class="table">
        <thead>
            <tr>
                <th>单位名称</th>
                <th>联系电话</th>
                <th>email地址</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
           <s:iterator value="pageModel.list" status="st">
            <tr>
                <td><s:a action="detail" namespace="/admin/org"><s:param name="member.id">${id}</s:param>${name}</s:a></td>
                <td>${telphone}</td>
                <td>${email}</td>
                <td><s:if test='isfinishcheck==1'><span class="label label-success">已启用</span></s:if><s:elseif test='isfinishcheck==-1'><span class="label label-fail">被拒绝</span></s:elseif><s:else><span class="label label-warning">审核中</span></s:else></td>
                <td>
                  <s:if test='ismanagercreate!=1'>
                    	<s:if test='isfinishcheck==0'><s:a action="remove" namespace="/admin/org"  onclick="return confirm('确定删除这条数据吗？');"><s:param name="member.id">${id}</s:param>删除</s:a> | <s:a action="pass" namespace="/admin/org"  onclick="return confirm('确定通过并启用这条数据吗？');"><s:param name="member.id">${id}</s:param>通过</s:a> | <s:a action="refuse" namespace="/admin/org"  onclick="return confirm('您确定拒绝这条数据吗？');"><s:param name="member.id">${id}</s:param>拒绝</s:a></s:if>
                    	<s:elseif test='isfinishcheck==-1'><s:a action="detail" namespace="/admin/org"><s:param name="member.id">${id}</s:param>查看</s:a> | <s:a action="remove" namespace="/admin/org"  onclick="return confirm('确定删除这条数据吗？');"><s:param name="member.id">${id}</s:param>删除</s:a></s:elseif>
                    	<s:else><s:a action="detail" namespace="/admin/org"><s:param name="member.id">${id}</s:param>查看</s:a></s:else>
                   </s:if><s:else>
                        <s:if test='isfinishcheck==0'><s:a action="remove" namespace="/admin/org"  onclick="return confirm('确定删除这条数据吗？');"><s:param name="member.id">${id}</s:param>删除</s:a> | <s:a action="modify" namespace="/admin/org"><s:param name="member.id">${id}</s:param>修改</s:a> | <s:a action="pass" namespace="/admin/org"  onclick="return confirm('确定通过并启用这条数据吗？');"><s:param name="member.id">${id}</s:param>启用</s:a></s:if>
                    	<s:else><s:a action="detail" namespace="/admin/org"><s:param name="member.id">${id}</s:param>查看</s:a></s:else>
                   </s:else>
                </td>
                <td><button  onclick="resetpass(${id})" class="btn btn-xs btn-primary">重置密码</button></td>
            </tr>
            </s:iterator>
        </tbody>
    </table>
    <div id="pagebar">
    <s:include value="/include/page-bar.jsp"></s:include>
    </div>
    </s:if><s:else>
      暂时没有单位信息
    </s:else>
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