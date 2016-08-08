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
	<link rel="stylesheet" th:href="@{/assets/css/lcell-beike.min.css}" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" th:href="@{/assets/css/app.css}" href="<%=path%>/assets/css/app.css" />
	<link rel="stylesheet" th:href="@{/css/styles.css}" href="<%=path%>/css/styles.css" />
	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="messages">
	<s:include value="/include/org-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <s:form id="myform"  namespaces="/messages">
    <s:hidden id="pageNo" name="pageNo"></s:hidden>
    <div class="page-header">
        <h1>消息中心</h1>
    </div>
    <ul class="nav nav-tabs" role="tablist">
        <s:if test='inbox==1'>
        	<li role="presentation" class="active"><a href="#inbox" onclick="submit1()" aria-controls="inbox" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-envelope"></i> 收件箱 </a></li>
        	<li role="presentation"><a href="#outbox" onclick="submit2()" aria-controls="outbox" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-send"></i> 发件箱</a></li>
        </s:if>
        <s:else>
            <li role="presentation"><a href="#inbox" onclick="submit1()" aria-controls="inbox" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-envelope"></i> 收件箱 </a></li>
        	<li role="presentation"  class="active"><a href="#outbox" onclick="submit2()" aria-controls="outbox" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-send"></i> 发件箱</a></li>
        </s:else>
        <li><s:a action="sendMessage.html" namespaces="/messages"><i class="glyphicon glyphicon-pencil"></i> 发送消息</s:a></li>
    </ul>
    <div class="tab-content">
            <div class="navbar navbar-default">
                <div class="container-fluid">
                    <button type="button" onclick="selectall()" class="btn btn-primary btn-xs navbar-btn"> <input type="checkbox"/>全选</button>
                    <button type="button" onclick="del()" class="btn btn-primary btn-xs navbar-btn"> <input type="checkbox"/>删除</button>
                </div>
            </div>
        <s:if test='inbox==1'>
        <div role="tabpanel" class="tab-pane active" id="inbox">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width:2em"></th>
                        <th>发件人</th>
                        <th>标题</th>
                        <th>时间</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                   <s:if test='pageModel!=null&&pageModel.list.size>0'>
                    <s:iterator value="pageModel.list" status="st">
                    <tr>
                        <td><input type="checkbox" name="ids" value="${id}" class="data_id"/></td>
                        <s:if test='sendertype=="1"'>
                           <td><s:a action="orgdetail"
												namespace="/kprc/student">
												<s:param name="student.id">${sender}</s:param>${sendername}</s:a></td>
                        </s:if><s:else>
                            <td>${sendername}</td>
                        </s:else>
                        <td><s:a action="detail.html" namespaces="/messages"><s:param name="transMessage.id">${id}</s:param>${title}</s:a></td>
                        <td><s:date name="senddate" format='yyyy-MM-dd hh:mm:ss' /></td>
                    </tr>
                    </s:iterator>
                    </s:if>
                </tbody>
            </table>
            <div id="pagebar">
            	<s:include value="/include/page-bar.jsp"></s:include>
            </div>	
        </div>
        </s:if><s:else>
        <div role="tabpanel" class="tab-pane  active" id="outbox">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width:2em"></th>
                        <th>收件人</th>
                        <th>标题</th>
                        <th>时间</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                   <s:if test='pageModel!=null&&pageModel.list.size>0'>
                    <s:iterator value="pageModel.list" status="st">
                    <tr>
                        <td><input type="checkbox" name="ids" value="${id}" class="data_id"/></td>
                        <td><a href="#">${receiversnames}</a></td>
                        <td><s:a action="detail.html" namespaces="/messages"><s:param name="transMessage.id">${id}</s:param>${title}</s:a></td>
                        <td><s:date name="senddate" format='yyyy-MM-dd hh:mm:ss' /></td>
                    </tr>
                    </s:iterator>
                    </s:if>
                </tbody>
            </table>
           <div id="pagebar"> 
           		<s:include value="/include/page-bar.jsp"></s:include>
           </div>	
        </div>
        </s:else>
    </div>
    </s:form>
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
       function selectall(){
          var checkObj = $('.data_id');
          if(checkObj.length) {
				var ischeck = !checkObj.eq(0).prop('checked');
				checkObj.each(function(index){
					$(this).prop('checked', ischeck);
				});
		  }
       }
       
       function del(){
            var totalNum = $(".data_id:checked").length;
			if(totalNum > 0) {
				if(confirm("确定要删除选中的数据吗？")) {
				   $("#pageNo").val("1");
				   var obj = document.getElementById("myform");
		           obj.action ="";
		           obj.action = "remove.html";
		           obj.submit();
			    }	
			}else {
				alert("请选择需要操作的数据");
		    }
			
      }
    </script>
<s:include value="/include/footer-info.jsp"></s:include>
<s:include value="/include/footer-script.jsp"></s:include>
</body>
</html>