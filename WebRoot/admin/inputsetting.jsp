<%@ page language="java" import="java.util.*" isErrorPage="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/include/admin-header.jsp"></s:include>
</head><body>
<div id="pagebody">
<div id="topbody"></div>
<s:include value="/include/admin-navbar.jsp"></s:include>

<div id="mainbody">
<div id="contentbar">
<h1><s:if test='systype=="kepu"'>科普工作</s:if><s:elseif test='systype=="party"'>党的宣传</s:elseif><s:elseif test='systype=="news1"'>新闻宣传</s:elseif><s:elseif test='systype=="news2"'>新闻外宣</s:elseif><s:elseif test='systype=="periodical"'>科技出版	</s:elseif>系统填报设置</h1>
<div>
<div style="margin-top:5px; padding-top:5px;"><p>当前是<s:property value="@cn.kepu.ability.utils.YearUtils@getCurrentYear()"/>年度 (<s:date name="@cn.kepu.ability.utils.YearUtils@getYearStart(@cn.kepu.ability.utils.YearUtils@getCurrentYear())" format="yyyy年MM月dd日"/> 到 <s:date name="@cn.kepu.ability.utils.YearUtils@getYearEnd(@cn.kepu.ability.utils.YearUtils@getCurrentYear())" format="yyyy年MM月dd日"/>)</p></div>
<s:form action="saveinputsetting" namespace="/admin">
<s:hidden name="systype" />
<table border="0" cellpadding="0" cellspacing="0" class="frmtable">
	<tr>
		<td width="160">用户填报滞后期：</td>
		<td><s:textfield name="delayreport.delaydays" cssClass="shorttext" data-validation="number" data-validation-error-msg="请输入正确的天数"></s:textfield>(天)</td>
	</tr>
	<tr>
		<td colspan="2">
        <s:if test='systype=="kepu"'><strong>上季度截止日期设置为</strong>：
          <s:date name="@cn.kepu.ability.utils.YearUtils@getLastQuarterEndWithDelay('kepu')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp; <strong>本季度截止日期设置为</strong>：<s:date name="@cn.kepu.ability.utils.YearUtils@getQuarterEndWithDelay('kepu')" format="yyyy年MM月dd日"/>0点</s:if>
        <s:elseif test='systype=="party"'><strong>上季度截止日期设置为</strong>：
          <s:date name="@cn.kepu.ability.utils.YearUtils@getLastQuarterEndWithDelay('party')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp; 
          <strong>本季度截止日期设置为</strong>：<s:date name="@cn.kepu.ability.utils.YearUtils@getQuarterEndWithDelay('party')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp; </s:elseif>
        <s:elseif test='systype=="news1"'><strong>上季度截止日期设置为</strong>：
          <s:date name="@cn.kepu.ability.utils.YearUtils@getLastQuarterEndWithDelay('news1')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp;  
          <strong>本季度截止日期设置为</strong>：<s:date name="@cn.kepu.ability.utils.YearUtils@getQuarterEndWithDelay('news1')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp; </s:elseif>
        <s:elseif test='systype=="news2"'><strong>上季度截止日期设置为</strong>：<s:date name="@cn.kepu.ability.utils.YearUtils@getLastQuarterEndWithDelay('news2')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp;  
          <strong>本季度截止日期设置为</strong>：<s:date name="@cn.kepu.ability.utils.YearUtils@getQuarterEndWithDelay('news2')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp; </s:elseif>
        <s:elseif test='systype=="periodical"'><strong>上年度截止日期设置为</strong>：
          <s:date name="@cn.kepu.ability.utils.YearUtils@getLastYearEndWithDelay('periodical')" format="yyyy年MM月dd日"/>0点&nbsp;&nbsp; </s:elseif>        </td>
	</tr>
	<s:if test='systype=="periodical"'>
    	<tr><td colspan="2" style="border-top:1px dashed #ccc"></td></tr>
	   <tr>
	       <td>期刊年度调查填报期起：</td>
		   <td><input type="text" name="delayreport.startDate" id="startdate"  data-validation="date" data-validation-format="yyyy-mm-dd" value='<s:date name="delayreport.startDate" format="yyyy-MM-dd"/>' data-validation-error-msg="不能为空" readonly="readonly" /></td>
	   </tr>
	   <tr>
	       <td>期刊年度调查填报期止：</td>
		   <td><input type="text" name="delayreport.endDate" id="enddate"  data-validation="date" data-validation-format="yyyy-mm-dd" value='<s:date name="delayreport.endDate" format="yyyy-MM-dd"/>' data-validation-error-msg="不能为空" readonly="readonly" /></td>
	   </tr>
	</s:if>    
	<tr>
		<td height="60" colspan="2" valign="middle"><s:submit value="保 存 "></s:submit></td>
	</tr>
</table>
</s:form>
</div>
</div>
</div>
  
  </div>
<div class="cls"></div>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
<script type="text/javascript">
$.validate();
set_interval_date_picker($('#startdate'),$('#enddate'));
</script>

</body>
</html>
