<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.util.*" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>全国高层次科普专门人才培养指导委员会</title>
<meta name="keywords" content="高层次，科普人才，人才，委员会，指导委员会，科普人才" />
<meta name="description" content="" />
</head>
<body>
		<s:form  action="list" namespaces="/">
		    <s:hidden name="pageNo"></s:hidden>
			<s:if test='pageModel!=null&&pageModel.list.size>0'>
			 <table width="100%">
			    <s:iterator value="pageModel.list" status="st">
	                 <tr>
						<td align="left"><s:a action="detail" namespace="/"><s:param name="advertiseFor.id">${id}</s:param>${membername}招聘人员公告</s:a></td>
						<td align="right">( <s:date name="publishdate" format='yyyy-MM-dd' />)</td>
					  </tr>
	           </s:iterator>
	           </table>
			</s:if>
			<s:else>
	       	 	无最新招聘消息
	   		</s:else>
   		</s:form>
</body>
</html>