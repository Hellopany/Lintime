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
<title>学生管理</title>
<link rel="stylesheet" href="<%=path%>/assets/css/libs.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/app.css" />
<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="students">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<div class="container">
			<div class="page-header">
				<h1>学生管理</h1>
			</div>
			<s:form  action="liststudent" namespaces="/admin/student">
		    <s:if test='pageModel!=null&&pageModel.list.size>0'>
		    <s:hidden name="pageNo"></s:hidden>
		    <s:hidden name="size" id="size" ></s:hidden>
				<table class="table">
					<thead>
						<tr>
							<th>姓名</th>
							<th>性别</th>
							<th class="hidden-xs">政治面貌</th>
							<th>籍贯</th>
							<th class="hidden-xs">民族</th>
							<th>出生日期</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageModel.list" status="st">
							<tr>
								<td><s:a action="detail" namespace="/admin/student">
										<s:param name="student.id">${id}</s:param>${name}</s:a></td>
								<td><s:if test='gender=="M"'>男</s:if>
									<s:else>女</s:else></td>
								<td class="hidden-xs">${politicsStr}</td>
								<td>${residencyaddress}</td>
								<td class="hidden-xs" id="national${st.index}">${nation}</td>
								<td><s:date name="birthday" format='yyyy-MM-dd' /></td>
								<td><s:a action="detail" class="btn btn-xs btn-primary"
										namespace="/admin/student">
										<s:param name="student.id">${id}</s:param>查看</s:a></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<div id="pagebar">
				  <s:include value="/include/page-bar.jsp"></s:include>
				</div>  
                 
			</s:if>
			<s:else>
               	 无学生消息
    </s:else>
    </s:form>
		</div>
		
	</main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
<script type="text/javascript">

var national = [
            "汉族", "壮族", "满族", "回族", "苗族", "维吾尔族", "土家族", "彝族", "蒙古族", "藏族", "布依族", "侗族", "瑶族", "朝鲜族", "白族", "哈尼族",
            "哈萨克族", "黎族", "傣族", "畲族", "傈僳族", "仡佬族", "东乡族", "高山族", "拉祜族", "水族", "佤族", "纳西族", "羌族", "土族", "仫佬族", "锡伯族",
            "柯尔克孜族", "达斡尔族", "景颇族", "毛南族", "撒拉族", "布朗族", "塔吉克族", "阿昌族", "普米族", "鄂温克族", "怒族", "京族", "基诺族", "德昂族", "保安族",
            "俄罗斯族", "裕固族", "乌孜别克族", "门巴族", "鄂伦春族", "独龙族", "塔塔尔族", "赫哲族", "珞巴族"
    ];
    window.onload = function (){
   		var size=$("#size").val();
    	for(var i=0;i<size;i++){
    		var nat = parseInt($("#national"+i).text());
        	$("#national"+i).text(national[nat]);
    	}
    };
</script>
</body>
</html>