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
	<title>消息中心</title>
	<link rel="stylesheet"  href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet"  href="<%=path%>/assets/css/app.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="messages">
	<s:include value="/include/school-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <h1>消息中心</h1>
    </div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="###" onclick="submit1()"><i class="glyphicon glyphicon-envelope"></i> 收件箱 </a></li>
        <li role="presentation"><a href="###" onclick="submit2()"><i class="glyphicon glyphicon-send"></i> 发件箱</a></li>
        <li class="active"><a href="#"><i class="glyphicon glyphicon-pencil"></i> 发送消息</a></li>
    </ul>
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active">
            <div class="navbar navbar-default">
                <div class="container-fluid">
                    <button type="button" onclick="send()" class="btn btn-primary navbar-btn pull-right">发送 <i class="glyphicon glyphicon-arrow-right"></i></button>
                </div>
            </div>
            <div class="row">
						
							
            <form id="myform" action="send.html" namesapces="/messages" class="form-horizontal" method="post"  enctype="multipart/form-data">
                <div class="col-sm-6">
                <div style="float">
                <s:hidden id="pageNo" name="pageNo"></s:hidden>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="to">发送给</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="to" value="${username}" name="transMessage.receivers"/>
                        <span style="color:gray;font-size:12px;">*多人之间用逗号分隔</span><br>
                        <input type="checkbox" name="transMessage.isshortmessage" /><span style="align:right;">同时发送短信</span>
                        
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="subject">标题</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="subject" name="transMessage.title" />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="content">内容</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="content" name="transMessage.content" rows="6"></textarea>
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
            </div>
						</div>
						<div style="float;height:260px; overflow:auto; ">
							<ul role="tablist">
							    <li role="presentation"><a href="#student"
									 role="tab" data-toggle="tab">学生</a> </li>
									<input type="hidden" value="1" id="nowpage"/>
							</ul>
							
							<div class="tab-content">
							    <s:if test='studentMap!=null&&studentMap.size>0'>
							        <div style="padding-left:20px;"><a href="#" onclick="getPageData(-1)">前50条</a> <a href="#" onclick="getPageData(1)">后50条</a></div>
								</s:if>
								<div class="tab-pane active" role="tabpanel" class="tab-pane" id="student">
								  <s:if test='studentMap!=null&&studentMap.size>0'>
								   <table>
								   <tr >
								       <td id="studentinfo"><div>
										<table class="table">
											  <s:iterator value="studentMap">
												<tr>
													<td><a href="#" onclick="euser('${key}')"><s:property value="key"/> | <s:property value="value"/></a></td>
												</tr>
												</s:iterator>
										</table>
										</div>
										</td>
									</tr>
									</table>
									</s:if>
								</div>
							</div>
						</div>
						</form>
					</div>
        </div>
    </div>
</div>
    </main>
    <script language="javascript">
       function submit1(){
           $("#pageNo").val("1");
           var obj = document.getElementById("myform");
           obj.action ="";
           obj.action = "recvlist.html";
           obj.submit();
       }
       function submit2(){
           $("#pageNo").val("1");
           var obj = document.getElementById("myform");
           obj.action ="";
           obj.action = "sendlist.html";
           obj.submit();
       }
       
       function send(){
           if ($("#to").val()==""){
               alert("接收人不能为空");
               return;
           }
           if ($("#subject").val()==""){
               alert("标题不能为空");
               return;
           }
           if ($("#content").val()==""){
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
       function getPageData(num){
           //num 是1 表示向后翻页 -1表示向前翻页
           //得到当前页
           var page =parseInt($("#nowpage").val());
           if (num==-1){
              page = page -1;
              if (page<=0){
                  page = 1;
              }
              $("#nowpage").val(page);
           }else{
              page = page + 1;
              $("#nowpage").val(page);
           }

	       $.ajax({
	            async:false,
	            type:'get',
				url: 'getAjaxPageData.html',
				data:{ nowpage: page},
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
                        $("#nowpage").val(page);
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