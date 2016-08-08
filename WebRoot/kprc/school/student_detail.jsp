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
	<title>学生信息</title>
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="students">
	<s:include value="/include/school-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <h1>学生信息</h1>
    </div>
    <table class="table">
				<tbody>
					<tr>
						<th class="bg-info" colspan="6">个人基础信息</th>
					</tr>
					<tr>
						<th>姓名</th>
						<td>${student.name}</td>
						<th>性别</th>
						<td><s:if test='student.gender=="M"'>男</s:if><s:else>女</s:else></td>
						<th>身份证号</th>
						<td>${student.idcard}</td>
					</tr>
					<tr>
						<th>出生日期</th>
						<td><s:date name="student.birthday" format='yyyy-MM-dd' /></td>
						<th>出生地</th>
						<td>${student.birthaddress}</td>
						<th>民族</th>
						<td>${student.nation}</td>
					</tr>
					<tr>
						<th>籍贯</th>
						<td>${student.originaddress}</td>
						<th>户口所在地</th>
						<td>${student.residencyaddress}</td>
						<th>政治面貌</th>
						<td>${student.politicsStr}</td>
					</tr>
					<tr>
						<th class="bg-info" colspan="6">学籍基本信息</th>
					</tr>
					<s:iterator value="schoolRollList" status="st">
						<tr>
							<th>学校</th>
							<td>${schoolname}</td>
							<th>入学时间</th>
							<td><s:date name="joindate" format='yyyy-MM-dd' /></td>
							<th>毕业时间</th>
							<td><s:date name="freedate" format='yyyy-MM-dd' /></td>
						</tr>
						<tr>
							<th>专业</th>
							<td>${professional}</td>
							<th>班级</th>
							<td>${classin}</td>
							<th>班内学号</th>
							<td>${classno}</td>
						</tr>
						<tr>
							<th>入学方式</th>
							<td>${jointypename}</td>
							<th></th>
							<td></td>
							<th></th>
							<td></td>
						</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">个人联系信息</th>
					</tr>
					<s:iterator value="relationList" status="st">
					<tr>
						<th>联系电话</th>
						<td>${phone}</td>
						<th>电子信箱</th>
						<td colspan="3">${email}</td>
					</tr>
					<tr>
						<th>通讯地址</th>
						<td colspan="3">${address}</td>
						<th>邮政编码</th>
						<td>${zipcode}</td>
					</tr>
					<tr>
						<th>家庭地址</th>
						<td colspan="3">${homeaddress}</td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>临时地址</th>
						<td colspan="3">${temporaryaddress}</td>
						<th></th>
						<td></td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">教育信息</th>
					</tr>
					<s:iterator value="educationList" status="st">
					<tr>
						<th>本科学校</th>
						<td>${schoolname}</td>
						<th>开始时间</th>
						<td><s:date name="startdate" format='yyyy-MM-dd' /></td>
						<th>结束时间</th>
						<td><s:date name="finishdate" format='yyyy-MM-dd' /></td>
					</tr>
					<tr>
						<th>所学专业</th>
						<td colspan="5">${professional}</td>
					</tr>
					<tr>
						<th>所获荣誉</th>
						<td colspan="5">${honor}</td>
					</tr>
					<tr>
						<th>申报项目</th>
						<td colspan="5">${reportproject}</td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">就业信息</th>
					</tr>
					<s:iterator value="careerList" status="st">
					<tr>
						<th>就业意向</th>
						<td >${careertypename}</td>
						<s:if test='careertype=="H"'>
						     <th>其他就业意向</th>
						     <td >${othername}</td>
						</s:if>
						<th>就业单位类型</th>
						<td>${unittypename}</td>
					</tr>
					<tr>
						<th>工作单位</th>
						<td >${corporationname}</td>
						<th>单位地址</th>
						<td >${address}</td>
						<th>开始时间</th>
						<td ><s:date name="startdate" format='yyyy-MM-dd' /></td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">实习信息</th>
					</tr>
					<s:iterator value="proticeList" status="st">
					<tr>
						<th>单位名称</th>
						<td>${corporation}</td>
						<th>开始时间</th>
						<td><s:date name="startdate" format='yyyy-MM-dd' /></td>
						<th>结束时间</th>
						<td><s:date name="finishdate" format='yyyy-MM-dd' /></td>
					</tr>
					<tr>
						<th>实习类型</th>
						<td >${typename}</td>
						<th>指导教师</th>
						<td >${teacher}</td>
						<th></th>
						<td ></td>
					</tr>
					<tr>
						<th>工作内容</th>
						<td colspan="5">${work}</td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">论文信息</th>
					</tr>
					<s:iterator value="paperList" status="st">
					<tr>
						<th>论文名称</th>
						<td>${name}</td>
						<th>论文类型</th>
						<td>${typename}</td>
						<th>指导教师</th>
						<td>${teacher}</td>
					</tr>
					<tr>
						<th>论文质量</th>
						<td colspan="5">${quanlityname}</td>
					</tr>
					<tr>
						<th>论文简介</th>
						<td colspan="5">${resume}</td>
					</tr>
					<tr>
						<th>内容说明</th>
						<td colspan="5">${work}</td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">科研信息</th>
					</tr>
					<s:iterator value="researchList" status="st">
					<tr>
						<th>科研名称</th>
						<td>${title}</td>
						<th>开始时间</th>
						<td><s:date name="startdate" format='yyyy-MM-dd' /></td>
						<th>结束时间</th>
						<td><s:date name="finishdate" format='yyyy-MM-dd' /></td>
					</tr>
					<tr>
						<th>科研类型</th>
						<td >${typename}</td>
						<th>等级</th>
						<td >${gradename}</td>
						<th>参与角色</th>
						<td >${rolename}</td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">科研活动信息</th>
					</tr>
					<s:iterator value="activityList" var="ast">
					<tr><th>所属科研</th>
					<td>
					<s:iterator value="researchList" var="hst">					
 					<s:if test='#ast.studentresearchid==#hst.id'><s:property value="#hst.title" /></s:if>
					</s:iterator>
					</td></tr>
					<tr>
						<th>活动名称</th>
						<td>${name}</td>
						<th>开始时间</th>
						<td><s:date name="startdate" format='yyyy-MM-dd' /></td>
						<th>结束时间</th>
						<td><s:date name="finishdate" format='yyyy-MM-dd' /></td>
					</tr>
					<tr>
						<th>等级</th>
						<td >${gradename}</td>
						<th>是否发表论文</th>
						<td ><s:if test='ispaper=1'>是</s:if><s:else>否</s:else></td>
						<th></th>
						<td></td>
					</tr>
					<tr>
						<th>论文名称</th>
						<td >${papername}</td>
						<th>论文顺序</th>
						<td >${paperorder}</td>
						<th></th>
						<td></td>
					</tr>
					</s:iterator>
					<tr>
						<th class="bg-info" colspan="6">活动荣誉信息</th>
					</tr>
					<s:iterator value="honorList" status="st">
					<tr>
						<th>获奖名称</th>
						<td>${name}</td>
						<th>等级</th>
						<td >${gradename}</td>
						<th>获奖时间</th>
						<td><s:date name="honordate" format='yyyy-MM-dd' /></td>
					</tr>
					</s:iterator>
				</tbody>
			</table>
</div>
    </main>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
<script type="text/javascript">
/* var national = [
            "汉族", "壮族", "满族", "回族", "苗族", "维吾尔族", "土家族", "彝族", "蒙古族", "藏族", "布依族", "侗族", "瑶族", "朝鲜族", "白族", "哈尼族",
            "哈萨克族", "黎族", "傣族", "畲族", "傈僳族", "仡佬族", "东乡族", "高山族", "拉祜族", "水族", "佤族", "纳西族", "羌族", "土族", "仫佬族", "锡伯族",
            "柯尔克孜族", "达斡尔族", "景颇族", "毛南族", "撒拉族", "布朗族", "塔吉克族", "阿昌族", "普米族", "鄂温克族", "怒族", "京族", "基诺族", "德昂族", "保安族",
            "俄罗斯族", "裕固族", "乌孜别克族", "门巴族", "鄂伦春族", "独龙族", "塔塔尔族", "赫哲族", "珞巴族"
    ];
    window.onload = function (){
        var nat = parseInt($("#national").text());
        $("#national").text(national[nat]);
    }
     */
</script>
</body>
</html>