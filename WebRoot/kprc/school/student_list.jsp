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
<link rel="stylesheet" th:href="@{/css/styles.css}"
	href="<%=path%>/css/styles.css" />
<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body id="students">
	<s:include value="/include/school-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<div class="container">
			<s:form action="list" id="btn" namespace="/kprc/school" method="post"
				enctype="multipart/form-data">
				<s:hidden name="pageNo"></s:hidden>
				<%-- 			<s:hidden name="size" id="size" ></s:hidden> --%>
				<div class="page-header">
					<div class="pull-right">
						<a class="btn btn-info" onclick="return prese()"><i
							class="glyphicon glyphicon-plus"></i> 添加 </a> <a class="btn btn-info">
							<s:file id="ifile" name="file" />
						</a>&nbsp;
						<button class="btn btn-info" onclick="importit()">
							<i class="glyphicon glyphicon-plus"></i> 导入
						</button>
						<a class="btn btn-info"
							href="<%=path%>/template/importemplate.xlsx"><i
							class="glyphicon glyphicon-plus"></i> 下载导入模板</a>
					</div>
					<div id="ld" style="position:relative;display:none; margin: 0 auto; width:20%; height:40%; background-color:#FFFFFF; z-index:1000;"> 
						<div id="center" style="position:absolute;"> 
							<table border="0"> 
							<tr><td><span id="disp">正在进行数据导入,请稍后...</span></td></tr> 
							<tr><td><img src="<%=path%>/img/wait.gif"/></td></tr> 
							</table> 
						</div> 
					</div> 
					<h1>学生管理</h1>
				</div>
				<s:if test='pageModel!=null&&pageModel.list.size>0'>
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
									<td><s:a action="schooldetail" namespace="/kprc/student">
											<s:param name="student.id">${id}</s:param>${name}</s:a></td>
									<td><s:if test='gender=="M"'>男</s:if>
										<s:else>女</s:else></td>
									<td class="hidden-xs">${politicsStr}</td>
									<td>${residencyaddress}</td>
									<td class="hidden-xs">${nation}</td>
									<td><s:date name="birthday" format='yyyy-MM-dd' /></td>
									<td><s:a action="schooldetail"
											class="btn btn-xs btn-primary" namespace="/kprc/school">
											<s:param name="student.id">${id}</s:param>查看</s:a></td>
									<td><s:a action="modify" class="btn btn-xs btn-primary"
											namespace="/kprc/school">
											<s:param name="student.id">${id}</s:param>修改</s:a></td>
									<td><s:a action="remove" class="btn btn-xs btn-primary"
											namespace="/kprc/school"
											onclick="return confirm('确定删除这条数据吗？');">
											<s:param name="student.id">${id}</s:param>删除</s:a></td>
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
	<s:include value="/include/footer-script.jsp"></s:include>
	<s:include value="/include/footer-info.jsp"></s:include>
	<script type="text/javascript">
		function prese() {
			$('#btn').attr("action",
					'<s:url action="add" namespace="/kprc/school"/>');
			$('#btn').submit();
		}

		function importit() {
		    if($("#ifile").val()==""){
		       alert("请选择要导入的文件！");
		       return;
		    }
			if (confirm("确定导入所选择的文件吗？")) {
			     ld.style.display=""; 
				$('#btn').attr("action",'<s:url action="importstudents" namespace="/kprc/school"/>');
				$('#btn').submit();
			}
		}
		/* 
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
		 }; */
	</script>
</body>
</html>