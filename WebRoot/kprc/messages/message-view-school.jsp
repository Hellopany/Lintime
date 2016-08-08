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
	<title>消息中心</title>
	<link rel="stylesheet"  href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet"  href="<%=path%>/assets/css/app.css" />
</head>
<body id="messages">
	<s:include value="/include/school-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
 <s:form id="myform"  namespaces="/messages">
    <s:hidden  name="transMessage.id"></s:hidden>
    <div class="page-header">
        <h1>消息中心</h1>
    </div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="###" onclick="submit1()"><i class="glyphicon glyphicon-envelope"></i> 收件箱 </a></li>
        <li role="presentation"><a href="###" onclick="submit2()"><i class="glyphicon glyphicon-send"></i> 发件箱</a></li>
        <li><s:a action="sendMessage.html" namespaces="/messages"><i class="glyphicon glyphicon-pencil"></i> 发送消息</s:a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active">
            <div class="navbar navbar-default">
                <div class="container-fluid">
                    <a type="button" class="btn btn-link navbar-btn" onclick="history.back()"><i class="glyphicon glyphicon-arrow-left"></i> 返回</a>
                    <a type="button" class="btn btn-primary navbar-btn pull-right" onclick="reply()"><i class="glyphicon glyphicon-arrow-left"></i> 回复</a>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">${transMessage.title }</div>
                <div class="panel-body">${transMessage.content }</div>
                <div class="panel-heading">附件信息</div>
                <div class="panel-body">
				    <table>
				         <tr>
				           <td><div ><s:if test="attachments!=null && attachments.size > 0"><s:iterator value="attachments" status="st"><div><a href="<%=path %>/${url}">${name}</a></div></s:iterator></s:if><s:else>无</s:else></td>
				         </tr>
				    </table>
				</div>
            </div>
        </div>
    </div>
    </s:form>
</div>
    </main>
    <script language="javascript">
       function submit1(){
           $("#pageNo").val("1");
           var obj = document.getElementById("myform");
           obj.action ="";
           obj.action = "recvlist.html";
           obj.submit();
       }
       function submit2(){
           $("#pageNo").val("1");
           var obj = document.getElementById("myform");
           obj.action ="";
           obj.action = "sendlist.html";
           obj.submit();
       }
       
       function reply(){
           var obj = document.getElementById("myform");
           obj.action ="";
           obj.action = "reply.html";
           obj.submit();
       }
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>