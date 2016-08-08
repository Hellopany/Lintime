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
<title>消息中心</title>
<link rel="stylesheet" href="<%=path%>/assets/css/libs.css" />
<link rel="stylesheet" href="<%=path%>/assets/css/app.css" />
<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="messages">
	<s:include value="/include/admin-navbar.jsp"></s:include>
	<main style="min-height:480px">
		<div class="container">
			<div class="page-header">
				<h1>消息中心</h1>
			</div>
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation"><a href="###" onclick="submit1()"><i
						class="glyphicon glyphicon-envelope"></i> 收件箱 </a></li>
				<li role="presentation"><a href="###" onclick="submit2()"><i
						class="glyphicon glyphicon-send"></i> 发件箱</a></li>
				<li class="active"><a href="#"><i
						class="glyphicon glyphicon-pencil"></i> 发送消息</a></li>
			</ul>
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active">
					<div class="navbar navbar-default">
						<div class="container-fluid">
							<button type="button" onclick="send()"
								class="btn btn-primary navbar-btn pull-right">
								发送 <i class="glyphicon glyphicon-arrow-right"></i>
							</button>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div style="float">
								<form id="myform" action="send.html" namesapces="/messages"
									class="form-horizontal" method="post"  enctype="multipart/form-data">
									<s:hidden id="pageNo" name="pageNo"></s:hidden>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="to">发送给</label>
										<div class="col-sm-10">
											<textarea class="form-control" id="to"
												value="${username}" name="transMessage.receivers" rows="6"></textarea>
												 <span	style="color:gray;font-size:12px;">*多人之间用逗号分隔</span><br>
											<input type="checkbox" name="transMessage.isshortmessage" /><span
												style="align:right;">同时发送短信</span>

										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="subject">标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="subject"
												name="transMessage.title" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="content">内容</label>
										<div class="col-sm-10">
											<textarea class="form-control" id="content"
												name="transMessage.content" rows="6"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="content"><a href="javascript:void(0)" onclick="addAttach()">添加附件</a></label>
										<div class="col-sm-10">
										    <table>
										         <tr>
										           <td id="attach_list"><div ><s:file name="attach"/> | <a href="javascript:void(0)" onclick="removeAttach(this)">移除</a></div></td>
										         </tr>
										    </table>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div style="float;height:260px; overflow:auto; ">
							<ul role="tablist">
							    <li role="presentation" class="active"><a href="#tcu"
									aria-controls="inbox" role="tab" data-toggle="tab" onclick="settype(0)">教指委用户 </a></li>
								<li role="presentation" ><a href="#unit"
									aria-controls="outbox" role="tab" data-toggle="tab" onclick="settype(1)">用人单位 </a></li>
								<li role="presentation"><a href="#school"
									aria-controls="outbox" role="tab" data-toggle="tab" onclick="settype(2)">学校联系人</a></li>
							    <li role="presentation"><a href="#student"
									aria-controls="outbox" role="tab" data-toggle="tab" onclick="settype(3)">学生</a></li>
								<input type="hidden" value="1" id="type"/>
								<input type="hidden" value="1" id="tcunowpage"/>
								<input type="hidden" value="1" id="orgnowpage"/>
								<input type="hidden" value="1" id="schoolnowpage"/>
								<input type="hidden" value="1" id="studentnowpage"/>
							</ul>
							<div class="tab-content">
							    <div style="padding-left:20px;"><a href="#" onclick="getPageData(-1)">前50条</a> <a href="#" onclick="getPageData(1)">后50条</a></div>
								 <div role="tabpanel" class="tab-pane active" id="tcu">
									<s:if test='tcuMap!=null&&tcuMap.size>0'>
									<table>
								      <tr >
								       <td id="tcuinfo"><div>
									  <table class="table">
										<tbody>
										   <s:iterator value="tcuMap">
											<tr>
												<td><a href="#" onclick="euser('${key}')"><s:property value="key"/> | <s:property value="value"/></a></td>
											</tr>
											</s:iterator>
										</tbody>
									</table>
									</div>
									</td>
									</tr>
									</table>
									</s:if>
								</div>
								<div role="tabpanel" class="tab-pane" id="unit">
									<s:if test='orgMap!=null&&orgMap.size>0'>
									<table>
								      <tr >
								       <td id="orginfo"><div>
									  <table class="table">
										<tbody>
										   <s:iterator value="orgMap">
											<tr>
												<td><a href="#" onclick="euser('${key}')"><s:property value="key"/> | <s:property value="value"/></a></td>
											</tr>
											</s:iterator>
										</tbody>
									</table>
									</div>
									</td>
									</tr>
									</table>
									</s:if>
								</div>
								<div role="tabpanel" class="tab-pane" id="school">
								   <s:if test='schoolMap!=null&&schoolMap.size>0'>
								   <table>
								   <tr >
								       <td id="schoolinfo"><div>
									<table class="table">
										<tbody>
										 <s:iterator value="schoolMap">
											<tr>
												<td><a href="#" onclick="euser('${key}')"><s:property value="key"/> | <s:property value="value"/></a></td>
											</tr>
											</s:iterator>
										</tbody>
									</table>
									</div>
									</td>
									</tr>
									</table>
									</s:if>
								</div>
								<div role="tabpanel" class="tab-pane" id="student">
								  <s:if test='studentMap!=null&&studentMap.size>0'>
								  <table>
								   <tr >
								       <td id="studentinfo"><div>
									<table class="table">
										<tbody>
										  <s:iterator value="studentMap">
											<tr>
												<td><a href="#" onclick="euser('${key}')"><s:property value="key"/> | <s:property value="value"/></a></td>
											</tr>
											</s:iterator>
										</tbody>
									</table>
									</div>
									</td>
									</tr>
									</table>
									</s:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>
	<script language="javascript">
		function submit1() {
			$("#pageNo").val("1");
			var obj = document.getElementById("myform");
			obj.action = "";
			obj.action = "recvlist.html";
			obj.submit();
		}
		function submit2() {
			$("#pageNo").val("1");
			var obj = document.getElementById("myform");
			obj.action = "";
			obj.action = "sendlist.html";
			obj.submit();
		}

		function send() {
			if ($("#to").val() == "") {
				alert("接收人不能为空");
				return;
			}
			if ($("#subject").val() == "") {
				alert("标题不能为空");
				return;
			}
			if ($("#content").val() == "") {
				alert("内容不能为空");
				return;
			}
			var obj = document.getElementById("myform");
			obj.submit();
		}
		
		function euser(u){
		   if ($("#to").val()!=""&&$("#to").val().indexOf(u)>=0) return;

		   var val = $("#to").val();
		   if (val==""){
		       $("#to").val(u);
		   }else{
		       $("#to").val(val+","+u);
		   }
		}
		function settype(type){
		    $("#type").val(type);
		}
		function getPageData(num){
           //num 是1 表示向后翻页 -1表示向前翻页
           //得到是哪个类别翻页
           if ($("#type").val()=="0"){
              getTcu(num);
           }
           if ($("#type").val()=="1"){
              getOrg(num);
           }
           if ($("#type").val()=="2"){
              getSchool(num);
           }
           if ($("#type").val()=="3"){
              getStudent(num);
           }
        }
        function getTcu(num){ 
           //得到当前页
           var page =parseInt($("#tcunowpage").val());
           if (num==-1){
              page = page -1;
              if (page<=0){
                  page = 1;
              }
              $("#tcunowpage").val(page);
           }else{
              page = page + 1;
              $("#tcunowpage").val(page);
           }

	       $.ajax({
	            async:false,
	            type:'get',
				url: 'getAjaxTcu.html',
				data:{ tcunowpage: page},
				dataType:'json',
				success: function(data) {
				    // 先删除原来增加的内容
	                $("#tcuinfo").empty();
	            	var info = eval("("+data+")");
	            	
	            	var content ="<div><table class='table'>";
	                for(var i=0;i<info.length;i++){
		                  content = content +"<tr><td>";  
                          content = content +"<a href='#' onclick=\"euser('"+info[i].username+"')\">"+info[i].username+" | "+info[i].name+"</a>";
                          content = content +"</td></tr>";  
				    } 
				    content = content +"</table></div>";
				    if (parseInt(info.length)<=0) {
				        page = page - 1;
                        $("#tcunowpage").val(page);
				    }
				    $("#tcuinfo").append(content);
				},
				error: function(){                         
		           alert("获取教指委用户信息出错！");    
		        }
			});
	    }
        function getOrg(num){ 
           //得到当前页
           var page =parseInt($("#orgnowpage").val());
           if (num==-1){
              page = page -1;
              if (page<=0){
                  page = 1;
              }
              $("#orgnowpage").val(page);
           }else{
              page = page + 1;
              $("#orgnowpage").val(page);
           }

	       $.ajax({
	            async:false,
	            type:'get',
				url: 'getAjaxOrg.html',
				data:{ orgnowpage: page},
				dataType:'json',
				success: function(data) {
				    // 先删除原来增加的内容
	                $("#orginfo").empty();
	            	var info = eval("("+data+")");
	            	
	            	var content ="<div><table class='table'>";
	                for(var i=0;i<info.length;i++){
		                  content = content +"<tr><td>";  
                          content = content +"<a href='#' onclick=\"euser('"+info[i].username+"')\">"+info[i].username+" | "+info[i].name+"</a>";
                          content = content +"</td></tr>";  
				    } 
				    content = content +"</table></div>";
				    if (parseInt(info.length)<=0) {
				        page = page - 1;
                        $("#orgnowpage").val(page);
				    }
				    $("#orginfo").append(content);
				},
				error: function(){                         
		           alert("获取单位信息出错！");    
		        }
			});
	    }
	    
	    function getSchool(num){ 
           //得到当前页
           var page =parseInt($("#schoolnowpage").val());
           if (num==-1){
              page = page -1;
              if (page<=0){
                  page = 1;
              }
              $("#schoolnowpage").val(page);
           }else{
              page = page + 1;
              $("#schoolnowpage").val(page);
           }

	       $.ajax({
	            async:false,
	            type:'get',
				url: 'getAjaxSchool.html',
				data:{ schoolnowpage: page},
				dataType:'json',
				success: function(data) {
				    // 先删除原来增加的内容
	                $("#schoolinfo").empty();
	            	var info = eval("("+data+")");
	            	
	            	var content ="<div><table class='table'>";
	                for(var i=0;i<info.length;i++){
		                  content = content +"<tr><td>";  
                          content = content +"<a href='#' onclick=\"euser('"+info[i].username+"')\">"+info[i].username+" | "+info[i].name+"</a>";
                          content = content +"</td></tr>";  
				    } 
				    content = content +"</table></div>";
				    if (parseInt(info.length)<=0) {
				        page = page - 1;
                        $("#schoolnowpage").val(page);
				    }
				    $("#schoolinfo").append(content);
				},
				error: function(){                         
		           alert('获取学校信息出错！');    
		        }
			});
	    }
	    
	    function getStudent(num){ 
           //得到当前页
           var page =parseInt($("#studentnowpage").val());
           if (num==-1){
              page = page -1;
              if (page<=0){
                  page = 1;
              }
              $("#studentnowpage").val(page);
           }else{
              page = page + 1;
              $("#studentnowpage").val(page);
           }

	       $.ajax({
	            async:false,
	            type:'get',
				url: 'getAjaxStudent.html',
				data:{ studentnowpage: page},
				dataType:'json',
				success: function(data) {
				    // 先删除原来增加的内容
	                $("#studentinfo").empty();
	            	var info = eval("("+data+")");
	            	var content ="<div><table class='table'>";
	                for(var i=0;i<info.length;i++){
		                  content = content +"<tr><td>";  
                          content = content +"<a href='#' onclick=\"euser('"+info[i].username+"')\">"+info[i].username+" | "+info[i].name+"</a>";
                          content = content +"</td></tr>";  
				    } 
				    content = content +"</table></div>";
				    if (parseInt(info.length)<=0) {
				        page = page - 1;
                        $("#studentnowpage").val(page);
				    }
				    $("#studentinfo").append(content);
				},
				error: function(){                         
		           alert('获取学生信息出错！');    
		        }
			});
	    }
	    
	    function addAttach() {
			$("#attach_list").append('<div><s:file name="attach"/> | <a href="javascript:void(0)" onclick="removeAttach(this)">移除</a></div>');
		}
		function removeAttach(aObj) {
			$(aObj).parent().remove();
		}
	</script>
	<s:include value="/include/footer-info.jsp"></s:include>
	<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>