<%@ page language="java" import="java.util.*" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setStatus(HttpServletResponse.SC_OK);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>登录</title>
	<link rel="stylesheet"  href="<%=path %>/assets/css/libs.css" type="text/css"/>
	<link rel="stylesheet"  href="<%=path %>/assets/css/app.css"  type="text/css"/>
</head>
<body id="sigin">
	<main>
 	<div class="container-fluid">
        <h1 class="page-header text-center">高层次科普人才数据管理系统</h1>
		<s:form class="form-signin" action="dologin"  namespace="/admin">
		<table border="0" align="center" cellpadding="0" cellspacing="0" style="color:#666666">
            <tbody>
              <tr>
                <td nowrap="nowrap">用户名</td>
                <td><div style="width:234px;border:1px solid #cccccc; margin-top:5px;">
                    <div class="float_left">
                      <input name="user.name" type="text"  placeholder="请输入用户名" style="padding-left:5px;padding-right:5px;width:200px;height:32px;border:0;line-height:32px;font-size:14px;" />
                    </div>
                    <div class="float_right "> <img src="<%=path%>/img/loginuser.jpg" width="32" height="32" /> </div>
                    <div class="cls"></div>
                  </div></td>
              </tr>
              <tr>
                <td nowrap="nowrap">登录密码</td>
                <td>
                <div style="width:234px;border:1px solid #cccccc; margin-top:5px;">
                    <div class="float_left">
                      <input name="user.password"  type="password" placeholder="请输入用户密码" style="padding-left:5px;padding-right:5px;width:200px;height:32px;border:0;line-height:32px;font-size:14px;"/>
                    </div>
                    <div class="float_right"> <img src="<%=path%>/img/loginpwd.jpg" width="32" height="32" /> </div>
                    <div class="cls"></div>
                  </div></td>
              </tr>
              <tr>
                <td>验证码</td>
                <td>
                <div style="width:260px;border:1px solid #cccccc;margin-top:5px">
                <div class="float_left">
                <input name="checkcode" type="text"  placeholder="请输入右侧验证码" style="padding-left:5px;padding-right:5px;width:130px;height:32px;border:1;line-height:32px;font-size:14px;" />
                </div>
                <div class="float_right>"><img src="<%=path %>/verifycode.jpg" style="height:32px; " align="absmiddle" class="verify-code"/></div>
                <div class="cls"></div></div></td>
              </tr>
              <tr>
                <td height="60">&nbsp;</td>
                <td align="right">忘记密码？<a href="<%=path %>/admin/forgetPass.html" target="_blank">请点此获取</a></td>
              </tr>
              <tr>
                 <td colspan="2" align="center"><button type="submit" class="btn btn-primary btn-lg btn-block">登录</button></td>
              </tr>
            </tbody>
          </table>
		</s:form>
	</div>
    </main>
	<s:include value="/include/footer-script.jsp"></s:include>
		<script type="text/javascript">
			$(function(){
				$('.verify-code').click(function() {
					$(this).hide().attr('src', '<%=path %>/verifycode.jpg?' + Math.floor(Math.random() * 100)).fadeIn();
				});
			});
		</script>
</body>
</html>