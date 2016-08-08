<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setStatus(HttpServletResponse.SC_OK);
%>
<header th:fragment="header (page)"
		class="navbar navbar-inverse navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<a class="navbar-brand" href="#" th:href="@{/}">高层次科普人才数据管理系统</a>
			</div>
			<div class="navbar-collapse collapse">


				<ul class="nav navbar-nav">
					<li><s:a action="orgindex" namespace="/">首页</s:a></li>
					<li><s:a action="advertiselist" namespace="/kprc/advertise">招聘信息</s:a></li>
					<li><s:a action="recvlist" namespace="/messages">消息中心</s:a></li>
				</ul>
				<form class="navbar-form navbar-right" action="logout.html"
					namespaces="/" method="post">
					<a href="<%=path%>/logout.html" class="btn btn-link">
						<i class="glyphicon glyphicon-log-out"></i> 退出
					</a>
				</form>
				<p class="navbar-text navbar-right">
					<a href="#" class="navbar-link">欢迎您，<s:property value="@cn.kepu.ability.utils.BusinessUtils@getCurrentUser().name" /></a>
				</p>

			</div>
		</div>
	</header>