<%@ page language="java" import="java.util.*;" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="/include/header.jsp"></s:include>
		<link href="<%=path %>/css/jquery.datepicker.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div id="pagebody">
		  <div id="topbody" class="commontop">
	    	
		  </div>
		<div id="mainbody">
			<div id="contentbar">
				<h1>重置登录密码</h1>
				<s:form action="emailConfirm"  namespace="/admin">
				<table>
					<tr>
						<td>
							<span class="mustfill">*</span>用户账号:						</td>
				  <td>
							<s:textfield name="username" id="username_id" data-validation="length" data-validation-length="2-20" data-validation-error-msg="请输入用户账号"></s:textfield>
						</td>
					</tr>
					<tr>
						<td>
							<span class="mustfill">*</span>验证码:
						</td>
						<td>
							<s:textfield name="checkcode" cssClass="float_left" /><img class="verify-code" src="<%=path %>/verifycode.jpg"/>
						</td>
					</tr>
					<tr>
						<td height="60" colspan="2" align="center" valign="middle"><s:submit value=" 提  交 "></s:submit><input value=" 关 闭 " type="button" onclick="javascript:window.close();" /></td>
					</tr>
				</table>
				</s:form>
			</div>
		</div>
	</div>
	<s:include value="/include/footer-info.jsp"></s:include>
	<s:include value="/include/footer-script.jsp"></s:include>
	<script type="text/javascript">
	$.validate({modules : 'security'});
	</script>
	</body>
</html>
