<%@ page language="java" import="java.util.*;" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:if test='systype=="admin"'>
		<s:include value="/include/admin-header.jsp"></s:include>
		</s:if><s:else>
		<s:include value="/include/header.jsp"></s:include>
		</s:else>
		<link href="<%=path %>/css/jquery.datepicker.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div id="pagebody">
		<s:if test='systype=="kepu"'>
		<s:include value="/include/kepu-top-body.jsp"></s:include>
		</s:if><s:elseif test='systype=="party"'>
		<s:include value="/include/pb-header.jsp"></s:include>
		</s:elseif><s:elseif test='systype=="news1"'>
		<s:include value="/include/news-top-body.jsp"></s:include>
		</s:elseif><s:elseif test='systype=="news2"'>
		<s:include value="/include/news2-top-body.jsp"></s:include>
		</s:elseif><s:elseif test='systype=="periodical"'>
		<s:include value="/include/kepu-top-body.jsp"></s:include>
		</s:elseif><s:elseif test='systype=="admin"'>
		<div id="topbody"></div>
		<s:include value="/include/admin-navbar.jsp"></s:include>
		</s:elseif>
		<div id="mainbody">
<div id="contentbar">
<div class="main-blk"  >
<s:form action="statistics"  namespace="/">
<s:hidden name="systype" />
统计年度：<s:select name="year" headerKey="0" headerValue="" list="@cn.kepu.ability.utils.YearUtils@getYearMap()"></s:select>
&nbsp; 
<input type="submit" value="查询" />
</s:form>
</div>

<div>
	<div class="cls"></div>
	<div style="border-bottom: 1px dashed #ccccff;">&nbsp;</div>
	<s:if test="frontStatistics!=null">
	<br /><br /><strong>第一季度</strong>统计数据：<s:if test="frontStatistics.getStatistic(1)!=null"><a href="<s:property value='frontStatistics.getStatistic(1)'/>">点此下载查看</a></s:if><s:else>未完成统计</s:else>。
	<br /><br /><strong>第二季度</strong>统计数据：<s:if test="frontStatistics.getStatistic(2)!=null"><a href="<s:property value='frontStatistics.getStatistic(2)'/>">点此下载查看</a></s:if><s:else>未完成统计</s:else>。
	<br /><br /><strong>第三季度</strong>统计数据：<s:if test="frontStatistics.getStatistic(3)!=null"><a href="<s:property value='frontStatistics.getStatistic(3)'/>">点此下载查看</a></s:if><s:else>未完成统计</s:else>。
	<br /><br /><strong>第四季度</strong>统计数据：<s:if test="frontStatistics.getStatistic(4)!=null"><a href="<s:property value='frontStatistics.getStatistic(4)'/>">点此下载查看</a></s:if><s:else>未完成统计</s:else>。
	</s:if>
</div>

</div>
</div>
  
  </div>
<div class="cls"></div>
	<s:if test='systype=="kepu"'>
	<s:include value="/include/kepu-footer-info.jsp"></s:include>
	</s:if><s:elseif test='systype=="news1"'>
	<s:include value="/include/news-footer-info.jsp"></s:include>
	</s:elseif><s:elseif test='systype=="news2"'>
	<s:include value="/include/news2-footer-info.jsp"></s:include>
	</s:elseif><s:elseif test='systype=="party"'>
	<s:include value="/include/pb-footer-info.jsp"></s:include>
	</s:elseif><s:else>
	<s:include value="/include/footer-info.jsp"></s:include></s:else>
<s:include value="/include/footer-script.jsp"></s:include>
<script type="text/javascript">
</script>

</body>
</html>
