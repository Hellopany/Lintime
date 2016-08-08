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
<title>首页</title>
<link rel="stylesheet" href="./assets/css/libs.css" />
<link rel="stylesheet" href="./assets/css/app.css" />
</head>
<body id="home">
	<s:include value="/include/student-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<div class="panel panel-primary">
						<div class="panel-heading">最新消息</div>
						<s:if test='list!=null&&list.list.size>0'>
							<table class="table">
								<tbody>
									<s:iterator value="list.list" status="st">
										<tr>
											<td>${title}</td>
											<td>${sendername}</td>
											<td><s:date name="senddate" format='yyyy-MM-dd hh:mm:ss' /></td>
											<td><s:a action="detail"
													namespace="/messages">
													<s:param name="transMessage.id">${id}</s:param>详细</s:a></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
							<div class="panel-heading-right">...<s:a action="recvlist" namespace="/messages">更多</s:a></div>
						</s:if>
						<s:else>
                    	 无最新消息
                </s:else>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="panel panel-primary">
						<div class="panel-heading">最新招聘信息</div>
						<s:if test='pageModel!=null&&pageModel.list.size>0'>
							<ul class="list-group">
							    <s:iterator value="pageModel.list" status="st">
							       <li class="list-group-item"><div style="float:left;text-align:left;"><s:a action="detail" namespace="/kprc/advertise"><s:param name="advertiseFor.id">${id}</s:param>${membername}招聘人员公告</s:a></div>
									<div style="float:right;text-align:right"><span align="right"><time><s:date name="publishdate" format='yyyy-MM-dd hh:mm:ss' /></time></span></div></li>
							    </s:iterator>
							</ul>
							<div class="panel-heading-right">...<s:a action="list" namespace="/kprc/advertise">更多</s:a></div>
						</s:if>
						<s:else>
                    	 	无最新招聘消息
                		</s:else>
					</div>
				</div>
			</div>
		</div>
	</main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>