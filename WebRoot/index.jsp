<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<s:include value="/include/header.jsp"></s:include>
<link href="<%=path %>/css/status.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="pagebody">
  <div id="topbody" class="commontop"></div>
  <div id="mainbody">
    <div id="menubar">
      <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="300" height="200" align="left" valign="top"><img src="<%=path%>/img/icon1.jpg" alt="新闻宣传" width="265" height="174" border="0" usemap="#Map" /></td>
          <td width="300" align="left" valign="top"><img src="<%=path%>/img/icon2.jpg" alt="党的宣传 width="265" height="174" border="0" usemap="#Map2" /></td>
        </tr>
        <tr>
          <td height="200" align="left" valign="top"><img src="<%=path%>/img/icon3.jpg" alt="科技期刊" width="265" height="174" border="0" usemap="#Map3" /></td>
          <td align="left" valign="top"><img src="<%=path%>/img/icon4.jpg" alt="科普工作" width="265" height="174" border="0" usemap="#Map4" /></td>
        </tr>
      </table>
      <table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="<%=path%>/img/icon5.jpg" alt="政务信息" width="129" height="60" /></td>
    <td><img src="<%=path%>/img/icon6.jpg" alt="网络宣传" width="129" height="60" /></td>
    <td><img src="<%=path%>/img/icon7.jpg" alt="" width="129" height="60" /></td>
    <td><img src="<%=path%>/img/icon8.jpg" alt="" width="129" height="60" /></td>
  </tr>
</table>
</div>
    <div id="newsbar">
      <div class="functionpanel">
      <div class="headtitle"> 公告与动态</div>
      <!--<div class="more"><a href="<%=path%>/" target="_blank">>>更多</a></div>-->
      <ul>
      <s:if test="lstNotice1 != null">
      <s:iterator value="lstNotice1" status="notice">	
      <li><a href='<s:if test="#url!=null">${url}</s:if><s:else><%=path%>/notice.html?id=${id}</s:else>' target="_blank">${title} (<s:date name='createTime' format='yyyy-MM-dd' />)</a></li>
      </s:iterator>
      </s:if>
      <s:else><br />暂无通知 <br /></s:else>    
      </ul>
      </div>
      <div class="functionpanel">
      <div class="headtitle">使用说明</div>
      <!--<div class="more"><a href="<%=path%>/" target="_blank">>>更多</a></div>-->
      <ul>
      <s:if test="lstNotice2 != null">
      <s:iterator value="lstNotice2" status="notice">	
      <li><a href='<s:if test="#url!=null">${url}</s:if><s:else><%=path%>/notice.html?id=${id}</s:else>' target="_blank">${title} (<s:date name='createTime' format='yyyy-MM-dd' />)</a></li>
      </s:iterator>
      </s:if>
      <s:else><br />暂无使用说明 <br /></s:else></ul>      
      </div>
    <div class="functionpanel">
      <div class="headtitle">留言反馈</div>
      <div class="more"><a href="http://comment.kepu.net.cn:8081/comment/lstcomment.jsp?pid=caskepu" target="_blank">>>进入</a></div>
    </div>        
    </div>
    <div class="cls"></div>
  </div>
</div>
<s:include value="/include/footer-info.jsp"></s:include>

<map name="Map" id="Map">
  <area shape="rect" coords="66,124,128,166" href="<s:url action='news1login' namespace='/' />" alt="中文新闻报导" />
<area shape="rect" coords="138,124,205,167" href="<s:url action='news2login' namespace='/' />" alt="外文新闻报导" />
</map>
<map name="Map2" id="Map2">
  <area shape="rect" coords="79,121,181,166" href="<s:url action='partylogin' namespace='/' />" alt="党的宣传" />
</map>
<map name="Map3" id="Map3">
  <area shape="rect" coords="75,124,180,167" href="<s:url action='periodicallogin' namespace='/' />" alt="科技期刊" />
</map>
<map name="Map4" id="Map4">
  <area shape="rect" coords="75,122,180,166" href="<s:url action='kepulogin' namespace='/' />" alt="科普工作" />
</map></body>
</html>
