<%@ page language="java" import="java.util.*" isErrorPage="true"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>修改学生</title>
	<link rel="stylesheet" href="<%=path%>/assets/css/libs.css" />
	<link rel="stylesheet" href="<%=path%>/assets/css/app.css" />
	
<link href="<%=path %>/css/jquery.datepicker.css" rel="stylesheet" type="text/css" />	
<script type="text/javascript" src="<%=path %>/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.form-validator.min.js"></script>

	<!--[if lt IE 9]>
	<script th:src="@{/assets/js/html5shiv.min.js}" src="./assets/js/html5shiv.min.js"></script>
	<script th:src="@{/assets/js/respond.min.js}" src="./assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body id="students">
	<s:include value="/include/student-navbar.jsp"></s:include>
	<main style="min-height:480px">
 <div class="container">
    <div class="page-header">
        <div class="pull-right">
            <a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
        </div>
        <h1>修改学生</h1>
    </div>
    <form class="form-horizontal" id="form1" method="post">
    <s:hidden name="student.id"></s:hidden>
    <s:hidden name="studentSchoolRoll.id"></s:hidden>
    <s:hidden name="studentRelation.id"></s:hidden>
    
    <s:hidden name="studentSchoolRoll.studentid"></s:hidden>
    <s:hidden name="studentRelation.studentid"></s:hidden>
<%-- <s:hidden name="studentEducation.id"></s:hidden>
    <s:hidden name="studentPractice.id"></s:hidden>
    <s:hidden name="studentPaper.id"></s:hidden>
    <s:hidden name="studentResearch.id"></s:hidden>
    <s:hidden name="studentResearchActivity.id"></s:hidden>
    <s:hidden name="studentHonor.id"></s:hidden> --%>
    

 <%--    <s:hidden name="studentEducation.studentid"></s:hidden>
    <s:hidden name="studentPractice.studentid"></s:hidden>
    <s:hidden name="studentPaper.studentid"></s:hidden>
    <s:hidden name="studentResearch.studentid"></s:hidden>
    <s:hidden name="studentResearchActivity.studentresearchid"></s:hidden>
    <s:hidden name="studentHonor.studentid"></s:hidden> --%>
    
            <fieldset>
            <legend>个人基础信息</legend>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="name">姓名</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="student.name" value="${student.name}" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
                </div>
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-2">
                	<s:if test='student.gender=="M"'>
                	<label class="radio-inline"><input type="radio" name="student.gender"  value="M" checked /> 男</label>
                 	<label class="radio-inline"><input type="radio" name="student.gender" value="G" /> 女</label>
                	</s:if><s:else>
                	<label class="radio-inline"><input type="radio" name="student.gender"  value="M"  /> 男</label>
                 	<label class="radio-inline"><input type="radio" name="student.gender" value="G" checked /> 女</label>
                	</s:else>
                 
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="idcard">身份证号</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control"  onblur="getBirthday(this)" name="student.idcard" value="${student.idcard }"  data-validation="sfz" data-validation-error-msg="身份证输入错误"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="birthday">出生日期</label>
                <div class="col-sm-2">
                    <input  id="birth"   type="text" class="form-control" name="student.birthday"  readonly="true" value="<s:date name="student.birthday" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
                </div>
                <label class="col-sm-2 control-label" for="birthplace">出生地</label>
                <div class="col-sm-5 form-inline">
                    <input type="text" class="form-control" name="student.birthaddress" value="${student.birthaddress }" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="native-place">籍贯</label>
                <div class="col-sm-2">
                   <input type="text" class="form-control" name="student.originaddress" value="${student.originaddress }" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
                </div>
                <label class="col-sm-2 control-label" for="hukou">户口所在地</label>
                <div class="col-sm-5 form-inline">
                    <input type="text" class="form-control" name="student.residencyaddress" value="${student.residencyaddress }" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="ethnic">民族</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" name="student.nation" value="${student.nation}" data-validation="length" data-validation-length="1-50" data-validation-error-msg="字数在1-50之间"/>
                </div>
                <label class="col-sm-2 control-label" for="politic">政治面貌</label>
                <div class="col-sm-2">
                    <select id="politic" name="student.politics" class="form-control">
                        <option value="A" <s:if test='student.politics=="A"'>selected="selected"</s:if> >中共党员</option>                      
                        <option value="B" <s:if test='student.politics=="B"'>selected="selected"</s:if> >中共预备党员</option>
                        <option value="C" <s:if test='student.politics=="C"'>selected="selected"</s:if> >共青团员</option>
                        <option value="D" <s:if test='student.politics=="D"'>selected="selected"</s:if> >群众</option>
                        <option value="E" <s:if test='student.politics=="E"'>selected="selected"</s:if> >其他</option>
                    </select>
                </div>
            </div>
        </fieldset>
         <fieldset>
            <legend>学籍基本信息</legend>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="school">专业</label>
                <div class="col-sm-6">
                    <input   class="form-control"  name="studentSchoolRoll.professional" value="${studentSchoolRoll.professional}" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>
                </div>
            </div> 
            <div class="form-group">
                
                <label class="col-sm-2 control-label" for="politic">入学方式</label>
                <div class="col-sm-2">
                    <select id="politic" class="form-control" name="studentSchoolRoll.jointype">
                        <option value="A" <s:if test='studentSchoolRoll.jointype=="A"'>selected="selected"</s:if> >就近入学</option>
                        <option value="B" <s:if test='studentSchoolRoll.jointype=="B"'>selected="selected"</s:if> >统一招生考试/普通入学</option>
                        <option value="C" <s:if test='studentSchoolRoll.jointype=="C"'>selected="selected"</s:if> >体育特招</option>
                        <option value="D" <s:if test='studentSchoolRoll.jointype=="D"'>selected="selected"</s:if> >艺术特招</option>
                        <option value="E" <s:if test='studentSchoolRoll.jointype=="E"'>selected="selected"</s:if> >其他</option>
                    </select>
                </div>
                <label class="col-sm-2 control-label" for="ethnic">入学时间</label>
                <div class="col-sm-6 form-inline">
                    <input type="date" class="form-control" name="studentSchoolRoll.joindate"  value="<s:date name="studentSchoolRoll.joindate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
                    -<input type="date" id="rx_to" class="form-control" name="studentSchoolRoll.freedate" value="<s:date name="studentSchoolRoll.freedate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="ethnic">班级</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="idcard" name="studentSchoolRoll.classin" value="${studentSchoolRoll.classin }" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
                </div>
                <label class="col-sm-2 control-label" for="ethnic">班内学号</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="idcard" name="studentSchoolRoll.classno" value="${studentSchoolRoll.classno }" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
                </div>
            </div>
        </fieldset>
       <fieldset>
            <legend>个人联系信息</legend>
            <div class="form-group">
				<label class="col-sm-2 control-label" for="addr">家庭地址</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" name="studentRelation.homeaddress" value="${studentRelation.homeaddress}" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
                </div>
                <label class="col-sm-1 control-label" for="email">电子信箱</label>
                <div class="col-sm-2">
                    <input type="email" class="form-control" name="studentRelation.email" value="${studentRelation.email}" data-validation="email_z"  data-validation-error-msg="邮箱格式不正确"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="postaddr">通讯地址</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="postaddr" name="studentRelation.address" value="${studentRelation.address}" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
                </div>
                <label class="col-sm-1 control-label" for="postcode">邮政编码</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="postcode" name="studentRelation.zipcode" value="${studentRelation.zipcode}" data-validation="length" data-validation-length="2-10" data-validation-error-msg="字数在2-10之间"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="addr">临时地址</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="addr"  name="studentRelation.temporaryaddress" data-validation-optional="true" value="${studentRelation.temporaryaddress}" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
                </div>
                <label class="col-sm-1 control-label" for="tel">联系电话</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="tel" name="studentRelation.phone" value="${studentRelation.phone}" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
                </div>
            </div>

        </fieldset>
        <fieldset>
            <legend>教育信息<button type="button" class="btn btn-default" id="studentEducationAdd"><i class="glyphicon glyphicon-plus" id="studentEducationAdd"></i></button></legend>
            <div id="studentEducation">
            <s:iterator value="educationList" status="list">
            <div id="group">
	            <div class="form-group">
	                <label class="col-sm-2 control-label" for="undergraduate">本科学校</label>
	              	<div class="col-sm-3">
	                    <input type="text" class="form-control"  name="Aschoolname" value="${schoolname}" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>
	                </div>
	                <label class="col-sm-1 control-label" for="start">学习时间</label>
	                <div class="col-sm-6 form-inline">
	                    <input type="date" class="form-control" id="start0" placeholder="开始时间" name="Astartdate" value="<s:date name="startdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                    -
	                    <input type="date" class="form-control" id="end0" placeholder="结束时间" name="Afinishdate" value="<s:date name="finishdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
                    	<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" for="undergraduate">所学专业</label>
	                <div class="col-sm-3">
	                    <input type="text" class="form-control"  name="Aprofessional" value="${professional}" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" for="study">所获荣誉</label>
	                <div class="col-sm-6">
	                    <textarea id="study" class="form-control" rows="3" name="Ahonor" data-validation-optional="true"  data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间">${honor}</textarea>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" for="project">申报项目</label>
	                <div class="col-sm-6">
	                    <textarea id="project" class="form-control" rows="3" name="Areportproject" data-validation-optional="true" data-validation="length" data-validation-length="2-500" data-validation-error-msg="字数在2-500之间">${reportproject}</textarea>
	                </div>
	            </div>
	           </div>
	           </s:iterator>
            </div> 
        </fieldset>
        <fieldset>
            <legend>就业信息<button type="button" class="btn btn-default" id="add"><i class="glyphicon glyphicon-plus" id="add"></i></button></legend>
         	<div id="career">
         	<s:hidden id="careersize" value="%{careerList.size}"></s:hidden>
            <s:iterator value="careerList" status="list">
            <div id="group">
            	<div class="form-group">
                <label class="col-sm-2 control-label" for="intent">就业意向</label>
                <div class="col-sm-6">
                    <select id="intent" class="form-control" rows="3" name="careertype"  onchange="showOther(this,${list.index })">
                    	<option value="A" <s:if test='careertype=="A"'>selected="selected"</s:if> >科普企业</option>
                    	<option value="B" <s:if test='careertype=="B"'>selected="selected"</s:if> >科普场馆</option>
                    	<option value="C" <s:if test='careertype=="C"'>selected="selected"</s:if> >中小学</option>
                    	<option value="D" <s:if test='careertype=="D"'>selected="selected"</s:if> >科协机关和组织</option>
                    	<option value="E" <s:if test='careertype=="E"'>selected="selected"</s:if> >高校院所</option>
                    	<option value="F" <s:if test='careertype=="F"'>selected="selected"</s:if> >继续深造（考博、出国等）</option>
                    	<option value="G" <s:if test='careertype=="G"'>selected="selected"</s:if> >其它科技组织</option>
                    	<option value="H" <s:if test='careertype=="H"'>selected="selected"</s:if> >其它</option>
                    </select>
                </div>
                <button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
            </div>
            <s:if test='careertype=="H"'>
                    <div id="div_career_other${list.index }" class="form-group">
	                <label class="col-sm-2 control-label" for="intent">其他就业意向</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="othername" value="${othername}"  data-validation="length" data-validation-length="0-50" data-validation-error-msg="字数在50之内"/>
	                </div>               
	               </div>
	        </s:if>
	        <s:else>
	               <div id="div_career_other${list.index }" style="display:none;" class="form-group">
	                <label class="col-sm-2 control-label" for="intent">其他就业意向</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="othername"  data-validation="length" data-validation-length="0-50" data-validation-error-msg="字数在50之内"/>
	                </div> 
	                </div>
	        </s:else>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="intent">工作单位</label>
                <div class="col-sm-6">
                    <input id="intent" class="form-control" name="corporationname" value="${corporationname}" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
                </div>               
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="intent">工作单位性质</label>
                <div class="col-sm-6">
                    <select id="unittype" class="form-control" rows="3" name="unittype">
                    	<option value="A" <s:if test='unittype=="A"'>selected="selected"</s:if> >科普</option>
                    	<option value="B" <s:if test='unittype=="B"'>selected="selected"</s:if> >非科普</option>
                    </select>
                </div>               
            </div>
            <div class="form-group"> 
                <label class="col-sm-2 control-label" for="intent">单位地址</label>
                <div class="col-sm-6">
                    <input id="intent" class="form-control" name="address" value="${address}" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">工作经历</label>
                <div class="col-sm-8 form-inline">
                    <p>
                        <input type="date" class="form-control"  id="work_start0"  placeholder="开始时间" name="startdate" value="<s:date name="startdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
                        -
                        <input type="date" class="form-control"  id="work_end0"  placeholder="结束时间" name="finishdate" value="<s:date name="finishdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
                    </p>
                </div>
            </div>
            </div>
            </s:iterator>           
            </div>
            
        </fieldset>
            
        <fieldset>
        	<legend>实习信息<button type="button" class="btn btn-default" id="studentPracticeAdd"><i class="glyphicon glyphicon-plus" id="studentPracticeAdd"></i></button></legend>
        	<div id="studentPractice">        	
            <s:iterator value="proticeList" status="list">
            <div id="group">
        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">实习类型</label>
	        		<div class="col-sm-3">
	        			<select name="Btype" class="form-control"> 
	        				<option value="A" <s:if test='Btype=="A"'>selected="selected"</s:if>>实习</option>
	        				<option value="B" <s:if test='Btype=="B"'>selected="selected"</s:if>>见习</option>
	        				<option value="C" <s:if test='Btype=="C"'>selected="selected"</s:if>>志愿者服务</option>
	        				<option value="D" <s:if test='Btype=="D"'>selected="selected"</s:if>>社团活动</option>
	        			</select>
	        		</div>
	        		<label class="col-sm-1 control-label">工作经历</label>
	                <div class="col-sm-6 form-inline">
	                    <p>
	                        <input type="date" class="form-control" id="pra_start0" placeholder="开始时间" name="Bstartdate" value="<s:date name="startdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                        -
	                        <input type="date" class="form-control" id="pra_end0" placeholder="结束时间" name="Bfinishdate" value="<s:date name="finishdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
                    		<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
	                    </p>
	                </div>        			
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">单位名称</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="Bcorporation" value="${corporation}" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>
	                </div>
	        	</div>
	        	<div class="form-group">
	                <label class="col-sm-2 control-label" for="intent">指导教师</label>
	        		<div class="col-sm-6">
	        			<input name="Bteacher" value="${teacher}" type="text" class="form-control" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
	        		</div>
	            </div>
	        	<div class="form-group">
	                <label class="col-sm-2 control-label" for="study">工作内容</label>
	                <div class="col-sm-6">
	                    <textarea id="study" class="form-control" rows="3" name="Bwork" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间">${work}</textarea>
	                </div>
	            </div>
	         </div>
	         </s:iterator>
	         </div>   
        </fieldset>
    	<fieldset>
        	<legend>论文信息<button type="button" class="btn btn-default" id="studentPaperAdd"><i class="glyphicon glyphicon-plus" id="studentPaperAdd"></i></button></legend>
        	<div id="studentPaper">        	
            <s:iterator value="paperList" status="list">
            <div id="group">
            <div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">论文名称</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="Cname" value="name" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>   
	                </div>
                    <button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
	        	</div>
	        	<div class="form-group">
	                <label class="col-sm-2 control-label" for="intent">指导教师</label>
	        		<div class="col-sm-6">
	        			<input name="Cteacher" value="${teacher}" type="text" class="form-control" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>
	        		</div>
	            </div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">论文类型</label>
	        		<div class="col-sm-2">
	        			<select name="Ctype" class="form-control"> 
	        				<option value="A" <s:if test='Ctype=="A"'>selected="selected"</s:if>>初中</option>
	        				<option value="B" <s:if test='Ctype=="B"'>selected="selected"</s:if>>研究类</option>
	        				<option value="C" <s:if test='Ctype=="C"'>selected="selected"</s:if>>作品类</option>
	        			</select>
	        		</div>
	        		<label class="col-sm-2 control-label" for="intent">论文质量</label>
	        		<div class="col-sm-2">
	        			<select name="Cquanlity" class="form-control"> 
	        				<option value="A" <s:if test='Cquanlity=="A"'>selected="selected"</s:if>>院级优秀</option>
	        				<option value="B" <s:if test='Cquanlity=="B"'>selected="selected"</s:if>>校级优秀</option>
	        				<option value="C" <s:if test='Cquanlity=="C"'>selected="selected"</s:if>>省市级优秀</option>
	        				<option value="D" <s:if test='Cquanlity=="D"'>selected="selected"</s:if>>无</option>
	        			</select>
	        		</div>
	        	</div>	
	        	<div class="form-group">
	                <label class="col-sm-2 control-label" for="study">论文简介</label>
	                <div class="col-sm-6">
	                    <textarea id="study" class="form-control" rows="3" name="Cresume" data-validation="length" data-validation-length="2-500" data-validation-error-msg="字数在2-500之间">${resume}</textarea>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-sm-2 control-label" for="study">内容说明</label>
	                <div class="col-sm-6">
	                    <textarea id="study" class="form-control" rows="3" name="Cwork" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间">${work}</textarea>
	                </div>
	            </div>
            </div>
            </s:iterator>
            </div>
        </fieldset>
        <fieldset>
        	<legend>科研信息<button type="button" class="btn btn-default" id="studentResearchAdd"><i class="glyphicon glyphicon-plus" id="studentResearchAdd"></i></button></legend>
        	<div id="studentResearch">        	
            <s:iterator value="researchList" status="list">
            <div id="group">
        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">科研名称</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="Dtitle" value="${title}" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>
	                </div>
                    <button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">科研类型</label>
	        		<div class="col-sm-2">
	        			<select name="Dtype" class="form-control"> 
	        				<option value="A" <s:if test='Dtype=="A"'>selected="selected"</s:if>>项目</option>
	        				<option value="B" <s:if test='Dtype=="B"'>selected="selected"</s:if>>课题</option>
	        				<option value="C" <s:if test='Dtype=="C"'>selected="selected"</s:if>>竞赛</option>
	        				<option value="D" <s:if test='Dtype=="D"'>selected="selected"</s:if>>论文</option>
	        				<option value="E" <s:if test='Dtype=="E"'>selected="selected"</s:if>>作品（课件、视频、展品）</option>
	        				<option value="F" <s:if test='Dtype=="F"'>selected="selected"</s:if>>其它</option>
	        			</select>
	        		</div>
	        		<label class="col-sm-2 control-label" for="intent">等级</label>
	        		<div class="col-sm-2">
	        			<select name="Dgrade" class="form-control"> 
	        				<option value="A" <s:if test='Dgrade=="A"'>selected="selected"</s:if>>国家</option>
	        				<option value="B" <s:if test='Dgrade=="B"'>selected="selected"</s:if>>学校</option>
	        			</select>
	        		</div>
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">参与角色</label>
	        		<div class="col-sm-3">
	        			<select name="Drole" class="form-control"> 
	        				<option value="A" <s:if test='Drole=="A"'>selected="selected"</s:if>>主持</option>
	        				<option value="B" <s:if test='Drole=="B"'>selected="selected"</s:if>>参加</option>
	        			</select>
	        		</div>
	        		<label class="col-sm-1 control-label">时间</label>
	                <div class="col-sm-6 form-inline">
	                    <p>
	                        <input type="date" class="form-control" id="sci_start0" placeholder="开始时间" name="Dstartdate" value="<s:date name="startdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                        -
	                        <input type="date" class="form-control" id="sci_end0" placeholder="结束时间" name="Dfinishdate" value="<s:date name="finishdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                    </p>
	                </div>        
	        	</div>
        	</div>
        	</s:iterator>
        	</div>
        </fieldset>
        <fieldset>
        	<legend>科研活动信息<button type="button" class="btn btn-default" id="studentResearchActivityAdd"><i class="glyphicon glyphicon-plus" id="studentResearchActivityAdd"></i></button></legend>
        	<div id="studentResearchActivity">        	
            <s:iterator value="activityList" var="ast">
            <div id="group">
        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">科研名称</label>
	                <div class="col-sm-6">
	                	<select name='DEname' id='DEname' class='form-control'>
	                		<s:iterator value="researchList" var="hst">
	                		<option value="<s:property value="#hst.title" />" <s:if test='#ast.studentresearchid==#hst.id'>selected="selected"</s:if> ><s:property value="#hst.title" /></option>
	                	</s:iterator>
	                	</select>
	                </div>
                    <button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">活动名称</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="Ename" value="${name}" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>
	                </div>
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">等级</label>
	        		<div class="col-sm-3">
	        			<select name="Egrade" class="form-control"> 
	        				<option value="A" <s:if test='Egrade=="A"'>selected="selected"</s:if>>国际</option>
	        				<option value="B" <s:if test='Egrade=="B"'>selected="selected"</s:if>>国内</option>
	        			</select>
	        		</div>
	        		<label class="col-sm-1 control-label">时间</label>
	                <div class="col-sm-6 form-inline">
	                    <p>
	                        <input type="date" class="form-control" id="active_start0" placeholder="开始时间" name="Estartdate" value="<s:date name="startdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                        -
	                        <input type="date" class="form-control" id="active_end0" placeholder="结束时间" name="Efinishdate" value="<s:date name="finishdate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                    </p>
	                </div>        
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">论文名称</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="Epapername" data-validation-optional="true" value="${papername}" data-validation="length" data-validation-length="0-100" data-validation-error-msg="字数在0-100之间"/>
	                </div>
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">论文顺序</label>
	        		<div class="col-sm-3">
	        			<input type="text" class="form-control"  name="Epaperorder" data-validation-optional="true" value="${paperorder}" data-validation="number"  data-validation-error-msg="只允许数字"/>
	        		</div>       
	        	</div>
        	</div>
        	</s:iterator>
        	</div>	
        </fieldset>
        <fieldset>
        	<legend>活动荣誉信息<button type="button" class="btn btn-default" id="studentHonorAdd"><i class="glyphicon glyphicon-plus" id="studentHonorAdd"></i></button></legend>
        	<div id="studentHonor">        	
            <s:iterator value="honorList" status="list">
            <div id="group">
        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">获奖名称</label>
	                <div class="col-sm-6">
	                    <input id="intent" class="form-control" name="Fname" value="${name}" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>
	                </div>
                    <button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>
	        	</div>
	        	<div class="form-group">
	        		<label class="col-sm-2 control-label" for="intent">等级</label>
	        		<div class="col-sm-3">
	        			<select name="Fgrade" class="form-control"> 
	        				<option value="A" <s:if test='Fgrade=="A"'>selected="selected"</s:if>>国家级</option>
	        				<option value="B" <s:if test='Fgrade=="B"'>selected="selected"</s:if>>省级</option>
	        				<option value="C" <s:if test='Fgrade=="C"'>selected="selected"</s:if>>市级</option>
	        				<option value="D" <s:if test='Fgrade=="D"'>selected="selected"</s:if>>校级</option>
	        			</select>
	        		</div>
	        		<label class="col-sm-1 control-label">时间</label>
	                <div class="col-sm-6 form-inline">
	                        <input type="date" class="form-control" id="start" placeholder="获奖时间" name="Fhonordate" value="<s:date name="honordate" format="yyyy-MM-dd" />" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>
	                </div>        
	        	</div>
        	</div>
        	</s:iterator>
        	</div>
        </fieldset>		
        <hr/>   
        <div class="form-group">
            <div class="col-sm-4 col-sm-offset-4">
                <button type="button" class="btn btn-primary" onclick="return prese()"><i class="glyphicon glyphicon-ok" onclick="return prese()"></i> 保存</button>
            	<s:if test='student.status==null'>
            	<button type="button" class="btn btn-primary" onclick="return updateStatus()"><i class="glyphicon glyphicon-ok" onclick="return updateStatus()"></i> 提交</button>
            	</s:if>
            </div>
        </div> 
    </form>
</div>
    </main>
<footer th:fragment="footer">
	<hr/>
	<div class="container">
		<div class="footer-title text-muted">
			<p>技术支持：<a href="http://www.kepu.net.cn" target="_blank">中国科普博览</a> &nbsp;&nbsp;技术支持电话：01058813711<br />
			Copyright © 2016 All rights reserved.
			</p>
		</div>
	</div>
</footer>
	<script>
	$.validate({modules : 'platform'});   
    	/*增加5个全局变量，为了判断时间大小*/
        var educount =1,workcount=1,pracount=1,scicount=1,activecount=1;
        var othercount = 1;
        var c = $("#careersize").val();
        if (c!=null||c!=""){
           othercount = parseInt(c);
        }
        
    	$("input[name='Dtitle']").blur(function(){
    	     var html="";
    	 	 $("select[name='DEname']").each(function(){	
	   		 	$(this).empty();
	   		 });                
		     $("input[name='Dtitle']").each(function(){       		   	
            	html+="<option class='op' value="+$(this).val()+">"+$(this).val()+"</option>";
	   			});  	 	 
            $("select[name='DEname']").each(function(){	
	   		 	$(this).append(html);
	   		 });            	 
        });
    $().ready(function() {
	    	    	
    	/* 教育信息 start */
    	var $studentEducation=$("#studentEducation");
    	var $studentEducationAdd=$("#studentEducationAdd");
    	$studentEducationAdd.click(function() {	
    		var trHtml='<div id="group"><div class="form-group">'
	                +'<label class="col-sm-2 control-label" for="undergraduate">本科学校</label>'
	              	+'<div class="col-sm-3">'
	                    +'<input type="text" class="form-control"  name="Aschoolname" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>'
	                +'</div>'
	                +'<label class="col-sm-1 control-label" for="start">学习时间</label>'
	                +'<div class="col-sm-6 form-inline">'
	                    +'<input type="date" class="form-control" id="start'+educount+'" placeholder="开始时间" name="Astartdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                    +'-'
	                    +'<input type="date" class="form-control" id="end'+educount+'" placeholder="结束时间" name="Afinishdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                    +'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'
	                +'</div>'
	            +'</div>'
	            +'<div class="form-group">'
	                +'<label class="col-sm-2 control-label" for="undergraduate">所学专业</label>'
	                +'<div class="col-sm-3">'
	                    +'<input type="text" class="form-control"  name="Aprofessional" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>'
	                +'</div>'
	            +'</div>'
	            +'<div class="form-group">'
	                +'<label class="col-sm-2 control-label" for="study">所获荣誉</label>'
	                +'<div class="col-sm-6">'
	                    +'<textarea id="study" class="form-control" rows="3" name="Ahonor" data-validation-optional="true" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"></textarea>'
	                +'</div>'
	            +'</div>'
	            +'<div class="form-group">'
	                +'<label class="col-sm-2 control-label" for="project">申报项目</label>'
	                +'<div class="col-sm-6">'
	                    +'<textarea id="project" class="form-control" rows="3" name="Areportproject" data-validation-optional="true" data-validation="length" data-validation-length="2-500" data-validation-error-msg="字数在2-500之间"></textarea>'
	                +'</div>'
	            +'</div></div>'
	            $studentEducation.append(trHtml); 	
	            educount = educount+1; 
    	});
    			
    	/* 教育信息 end */
    
    	/* 就业信息start */
    	var $add=$("#add");
    	var $career=$("#career");
		$add.click(function() {                  
             var trHtml='<div id="group"><div class="form-group">'
                +'<label class="col-sm-2 control-label" for="intent">就业意向</label>'
                +'<div class="col-sm-6">'
                    +'<select id="intent" class="form-control" name="careertype" onchange="showOther(this,'+othercount+')">'
                    	+'<option value="A">科普企业</option>'
						+'<option value="B">科普场馆</option>'
                    	+'<option value="C">中小学</option>'
                    	+'<option value="D">科协机关和组织</option>'
                    	+'<option value="E">高校院所</option>'
                    	+'<option value="F">继续深造（考博、出国等）</option>'
                    	+'<option value="G">其它科技组织</option>'
                    	+'<option value="H">其它</option></select>'
                +'</div>'
                +'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'
            +'</div>'
           +' <div id="div_career_other'+othercount+'" style="display:none;" class="form-group">'
	               +' <label class="col-sm-2 control-label" for="intent">其他就业意向</label>'
	               +' <div class="col-sm-6">'
	                   +' <input id="intent" class="form-control" name="othername"  data-validation="length" data-validation-length="0-50" data-validation-error-msg="字数在50之内"/>'
	               +' </div>'               
	          +' </div>'
            +'<div class="form-group">'
                +'<label class="col-sm-2 control-label" for="intent">工作单位</label>'
                +'<div class="col-sm-6">'
                   +'<input id="intent" class="form-control" name="corporationname" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>'
                +'</div>'               
            +'</div>'
            +'<div class="form-group">'
	               +' <label class="col-sm-2 control-label" for="intent">工作单位类型</label>'
	                +'<div class="col-sm-6">'
	                   +' <select id="intent" class="form-control" rows="3" name="unittype">'
	                    	+'<option value="A">科普类</option>'
	                    	+'<option value="B">非科普类</option>'
                       +' </select>'
	               +' </div> '            
	           +' </div>'
            +'<div class="form-group">' 
                +'<label class="col-sm-2 control-label" for="intent">单位地址</label>'
                +'<div class="col-sm-6">'
                    +'<input id="intent" class="form-control" name="address" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>'
                +'</div>'
            +'</div>'
            +'<div class="form-group">'
                +'<label class="col-sm-2 control-label">工作经历</label>'
                +'<div class="col-sm-8 form-inline">'
                    +'<p><input type="date" class="form-control" id="start'+workcount+'" placeholder="开始时间" name="startdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
                        +'&nbsp;-&nbsp;'
                        +'<input type="date" class="form-control" id="end'+workcount+'" placeholder="结束时间" name="finishdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>&nbsp;'
                    +'</p>'
                +'</div>'
            +'</div></div>';       
            $career.append(trHtml);     
            workcount = workcount+1;    
            othercount = othercount+1;  
		});
    });
    	/* 就业信息 end*/
    	
    	/* 实习信息 start */
    	var $studentPractice=$("#studentPractice");
    	var $studentPracticeAdd=$("#studentPracticeAdd");
    	$studentPracticeAdd.click(function() {	
    	var trHtml='<div id="group"><div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">实习类型</label>'
	        		+'<div class="col-sm-3">'
	        			+'<select name="Btype" class="form-control">' 
	        				+'<option value="A">实习</option>'
	        				+'<option value="B">见习</option>'
	        				+'<option value="C">志愿者服务</option>'
	        				+'<option value="D">社团活动</option>'
	        			+'</select>'
	        		+'</div>'
	        		+'<label class="col-sm-1 control-label">工作经历</label>'
	                +'<div class="col-sm-6 form-inline">'
	                    +'<p>'
	                        +'<input type="date" class="form-control" id="start'+pracount+'" placeholder="开始时间" name="Bstartdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                        +'-'
	                        +'<input type="date" class="form-control" id="end'+pracount+'" placeholder="结束时间" name="Bfinishdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                    	+'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'
	                    +'</p>'
	                +'</div> '       			
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">单位名称</label>'
	                +'<div class="col-sm-6">'
	                    +'<input id="intent" class="form-control" name="Bcorporation" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>'
	                +'</div>'
	        	+'</div>'
	        	+'<div class="form-group">'
	                +'<label class="col-sm-2 control-label" for="intent">指导教师</label>'
	        		+'<div class="col-sm-6">'
	        			+'<input name="Bteacher" type="text" class="form-control" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>'
	        		+'</div>'
	            +'</div>'
	        	+'<div class="form-group">'
	                +'<label class="col-sm-2 control-label" for="study">工作内容</label>'
	                +'<div class="col-sm-6">'
	                    +'<textarea id="study" class="form-control" rows="3" name="Bwork" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"></textarea>'
	                +'</div>'
	            +'</div></div>'
    		 $studentPractice.append(trHtml);
    		 pracount = pracount+1;    
    		}); 
    	/* 实习信息 end */
    	
    	/* 论文信息 start */
    	var $studentPaper=$("#studentPaper");
    	var $studentPaperAdd=$("#studentPaperAdd");
    	$studentPaperAdd.click(function() {
    		var trHtml='<div id="group"><div class="form-group">'
			        		+'<label class="col-sm-2 control-label" for="intent">论文名称</label>'
			                +'<div class="col-sm-6">'
			                    +'<input id="intent" class="form-control" name="Cname" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>'
			                +'</div>'
			                +'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'		                
			        	+'</div>'
			        	+'<div class="form-group">'
			                +'<label class="col-sm-2 control-label" for="intent">指导教师</label>'
			        		+'<div class="col-sm-6">'
			        			+'<input name="Cteacher" type="text" class="form-control" data-validation="length" data-validation-length="2-50" data-validation-error-msg="字数在2-50之间"/>'
			        		+'</div>'
			            +'</div>'
			        	+'<div class="form-group">'
			        		+'<label class="col-sm-2 control-label" for="intent">论文类型</label>'
			        		+'<div class="col-sm-2">'
			        			+'<select name="Ctype" class="form-control">' 
			        				+'<option value="A">初中</option>'
			        				+'<option value="B">研究类</option>'
			        				+'<option value="C">作品类</option>'
			        			+'</select>'
			        		+'</div>'
			        		+'<label class="col-sm-2 control-label" for="intent">论文质量</label>'
			        		+'<div class="col-sm-2">'
			        			+'<select name="Cquanlity" class="form-control">' 
			        				+'<option value="A">院级优秀</option>'
			        				+'<option value="B">校级优秀</option>'
			        				+'<option value="C">省市级优秀</option>'
			        				+'<option value="D">无</option>'
			        			+'</select>'
			        		+'</div>'
			        	+'</div>'	
			        	+'<div class="form-group">'
			                +'<label class="col-sm-2 control-label" for="study">论文简介</label>'
			                +'<div class="col-sm-6">'
			                    +'<textarea id="study" class="form-control" rows="3" name="Cresume" data-validation="length" data-validation-length="2-500" data-validation-error-msg="字数在2-500之间"></textarea>'
			                +'</div>'
			            +'</div>'
			            +'<div class="form-group">'
			                +'<label class="col-sm-2 control-label" for="study">内容说明</label>'
			                +'<div class="col-sm-6">'
			                    +'<textarea id="study" class="form-control" rows="3" name="Cwork" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"></textarea>'
			                +'</div>'
			            +'</div></div>'
    		 $studentPaper.append(trHtml);
    	});
    	/* 论文信息 end */
    	
    	/* 科研信息  start*/
    	var $studentResearch=$("#studentResearch");
    	var $studentResearchAdd=$("#studentResearchAdd");
    	$studentResearchAdd.click(function() {
    		var trHtml='<div id="group"><div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">科研名称</label>'
	                +'<div class="col-sm-6">'
	                    +'<input id="intent" class="form-control" name="Dtitle" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>'
	                +'</div>'
			        +'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'		                
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">科研类型</label>'
	        		+'<div class="col-sm-2">'
	        			+'<select name="Dtype" class="form-control">' 
	        				+'<option value="A">项目</option>'
	        				+'<option value="B">课题</option>'
	        				+'<option value="C">竞赛</option>'
	        				+'<option value="D">论文</option>'
	        				+'<option value="E">作品（课件、视频、展品）</option>'
	        				+'<option value="F">其它</option>'
	        			+'</select>'
	        		+'</div>'
	        		+'<label class="col-sm-2 control-label" for="intent">等级</label>'
	        		+'<div class="col-sm-2">'
	        			+'<select name="Dgrade" class="form-control">' 
	        				+'<option value="A">国家</option>'
	        				+'<option value="B">学校</option>'
	        			+'</select>'
	        		+'</div>'
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">参与角色</label>'
	        		+'<div class="col-sm-3">'
	        			+'<select name="Drole" class="form-control">'
	        				+'<option value="A">主持</option>'
	        				+'<option value="B">参加</option>'
	        			+'</select>'
	        		+'</div>'
	        		+'<label class="col-sm-1 control-label">时间</label>'
	                +'<div class="col-sm-6 form-inline">'
	                    +'<p>'
	                        +'<input type="date" class="form-control" id="start'+scicount+'" placeholder="开始时间" name="Dstartdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                        +'-'
	                        +'<input type="date" class="form-control" id="end'+scicount+'" placeholder="结束时间" name="Dfinishdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                    +'</p>'
	                +'</div>'        
	        	+'</div></div>'
    		
    		$studentResearch.append(trHtml);
    		scicount = scicount+1;
    		$("input[name='Dtitle']").blur(function(){
    	    	var html="";
    	 		$("select[name='DEname']").each(function(){	
	   		 		$(this).empty();
	   		 	});                 
		     	$("input[name='Dtitle']").each(function(){       		   	
            		html+="<option class='op' value="+$(this).val()+">"+$(this).val()+"</option>";
	   			});  	 	 
           		$("select[name='DEname']").each(function(){	
	   		 		$(this).append(html);
	   			});           	 
        	});
    	});
    		
    	/* 科研信息 end*/
    	var size=0;
    	/* 科研活动信息 start*/
    	var $studentResearchActivity=$("#studentResearchActivity");
    	var $studentResearchActivityAdd=$("#studentResearchActivityAdd");
    	$studentResearchActivityAdd.click(function() {
    		var trHtml='<div id="group"><div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">科研名称</label>'
	                +'<div class="col-sm-6">'
	                	+'<select name="DEname" id="DEname'+size+'" class="form-control"></select>'
	                +'</div>'
			        +'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'		                
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">活动名称</label>'
	                +'<div class="col-sm-6">'
	                    +'<input id="intent" class="form-control" name="Ename" data-validation="length" data-validation-length="2-200" data-validation-error-msg="字数在2-200之间"/>'
	                +'</div>'
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">等级</label>'
	        		+'<div class="col-sm-3">'
	        			+'<select name="Egrade" class="form-control">' 
	        				+'<option value="A">国际</option>'
	        				+'<option value="B">国内</option>'
	        			+'</select>'
	        		+'</div>'
	        		+'<label class="col-sm-1 control-label">时间</label>'
	                +'<div class="col-sm-6 form-inline">'
	                    +'<p>'
	                        +'<input type="date" class="form-control" id="start'+activecount+'" placeholder="开始时间" name="Estartdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                        +'-'
	                        +'<input type="date" class="form-control" id="end'+activecount+'" placeholder="结束时间" name="Efinishdate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                    +'</p>'
	                +'</div>'        
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">论文名称</label>'
	                +'<div class="col-sm-6">'
	                    +'<input id="intent" class="form-control" name="Epapername" data-validation-optional="true" data-validation="length" data-validation-length="0-100" data-validation-error-msg="字数在0-100之间"/>'
	                +'</div>'
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">论文顺序</label>'
	        		+'<div class="col-sm-3">'
	        			+'<input type="text" class="form-control"  name="Epaperorder" data-validation-optional="true" data-validation="number"  data-validation-error-msg="只允许数字"/>'
	        		+'</div>'       
	        	+'</div></div>'
    		
    		$studentResearchActivity.append(trHtml);
    		activecount = activecount+1;     
			var html="";
			$("select[name='DEname']").each(function(){	
	   		 	$(this).empty();
	   		 });                 
		     $("input[name='Dtitle']").each(function(){       		   	
            	html+="<option class='op' value="+$(this).val()+">"+$(this).val()+"</option>";
	   			});  	 	 
           	 $("select[name='DEname']").each(function(){	
	   		 	$(this).append(html);
	   		});
    	});
    /* 科研活动信息 end*/
    	
    /* 获得荣誉 start*/
    	var $studentHonor=$("#studentHonor");
    	var $studentHonorAdd=$("#studentHonorAdd");
    	$studentHonorAdd.click(function() {
    		var trHtml='<div id="group"><div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">获奖名称</label>'
	                +'<div class="col-sm-6">'
	                    +'<input id="intent" class="form-control" name="Fname" data-validation="length" data-validation-length="2-100" data-validation-error-msg="字数在2-100之间"/>'
	                +'</div>'
			        +'<button type="button" class="btn btn-default" onclick="removes(this)"><i class="glyphicon glyphicon-minus" onclick="removes(this)"></i></button>'		                
	        	+'</div>'
	        	+'<div class="form-group">'
	        		+'<label class="col-sm-2 control-label" for="intent">等级</label>'
	        		+'<div class="col-sm-3">'
	        			+'<select name="Fgrade" class="form-control">' 
	        				+'<option value="A">国家级</option>'
	        				+'<option value="B">省级</option>'
	        				+'<option value="C">市级</option>'
	        				+'<option value="D">校级</option>'
	        			+'</select>'
	        		+'</div>'
	        		+'<label class="col-sm-1 control-label">时间</label>'
	                +'<div class="col-sm-6 form-inline">'
	                        +'<input type="date" class="form-control" id="start" placeholder="获奖时间" name="Fhonordate" data-validation="length" data-validation-length="2-200" data-validation-optional="false"  data-validation-error-msg="必选"/>'
	                +'</div>'        
	        	+'</div></div>'   		
    		$studentHonor.append(trHtml);
    	});
    	/* 获得荣誉 end*/
    
    function removes(obj){
		$(obj).closest("#group").remove();
	}
	function prese(){
	    //验证日期
	    if (!isValid()){
	       return;
	    }
		$('#form1').attr("action", '<s:url action="newSave" />');
		$('#form1').submit();
	}
	function updateStatus(){
	   //验证日期
	    if (!isValid()){
	       return;
	    }
	   if (confirm("您确定提交本次修改吗？")){
			$('#form1').attr("action", '<s:url action="updateStatus" />');
			$('#form1').submit();
		}
	}
	
	function isValid(){
	    if ($("#rx_to").val()==""||$("#rx_from").val()==""){
	        alert("入学时间段填写错误，不能为空！");
	        return false;
	    }
	    if($("#rx_to").val()<$("#rx_from").val()){
	        alert("入学时间段填写错误，开始时间必须小于结束时间！");
	        return false;
	    }
	    for(var i=0;i<educount;i++){
	        if ($("#start"+i).val()==""||$("#end"+i).val()==""){
		        alert("教育信息中，学习时间段填写错误，不能为空！");
		        return false;
		    }
		    if($("#start"+i).val()>$("#end"+i).val()){
		        alert("教育信息中，学习时间段填写错误，开始时间必须小于结束时间！");
		        return false;
		    }
	    }
	    for(var i=0;i<workcount;i++){
	        if ($("#work_start"+i).val()==""||$("#work_end"+i).val()==""){
		        alert("就业信息中，工作经历时间段填写错误，不能为空！");
		        return false;
		    }
		    if($("#work_start"+i).val()>$("#work_end"+i).val()){
		        alert("就业信息中，工作经历时间段填写错误，开始时间必须小于结束时间！");
		        return false;
		    }
	    }
	    for(var i=0;i<pracount;i++){
	        if ($("#pra_start"+i).val()==""||$("#pra_end"+i).val()==""){
		        alert("实习信息中，工作经历时间段填写错误，不能为空！");
		        return false;
		    }
		    if($("#pra_start"+i).val()>$("#pra_end"+i).val()){
		        alert("实习信息中，工作经历时间段填写错误，开始时间必须小于结束时间！");
		        return false;
		    }
	    }
	    for(var i=0;i<scicount;i++){
	        if ($("#sci_start"+i).val()==""||$("#sci_end"+i).val()==""){
		        alert("科研信息中，时间段填写错误，不能为空！");
		        return false;
		    }
		    if($("#sci_start"+i).val()>$("#sci_end"+i).val()){
		        alert("科研信息中，时间段填写错误，开始时间必须小于结束时间！");
		        return false;
		    }
	    }
	    for(var i=0;i<activecount;i++){
	        if ($("#active_start"+i).val()==""||$("#active_end"+i).val()==""){
		        alert("科研活动信息中，时间段填写错误，不能为空！");
		        return false;
		    }
		    if($("#active_start"+i).val()>$("#active_end"+i).val()){
		        alert("科研活动信息中，时间段填写错误，开始时间必须小于结束时间！");
		        return false;
		    }
	    }
	    return true;
	}
	function getBirthday(obj){
	   var val = obj.value.substr(6,8);
	   val = val.substr(0,4)+"-"+val.substr(4,2)+"-"+val.substr(6,2);
	   $("#birth").val(val);
	}
	function showOther(obj,xh){
	   if($(obj).val()=="H"){
	      $("#div_career_other"+xh).show();
	   }else{
	      $("#div_career_other"+xh).hide();
	   }
	}
	</script>	
</body>
</html>