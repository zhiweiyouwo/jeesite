<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>查看</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate({
				submitHandler: function(form){
					if($("#files").val()){
						s();
					}else{
						//<c:if test="${testTree.parent!=null}">
						confirmx("当前没有选择任何文件,是否保存?", s);
						//</c:if>
						//<c:if test="${testTree.parent==null}">
						s();
						//</c:if>
					}
					function s(){
						loading('正在提交，请稍等...');
						form.submit();
					}
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">${testTree.parent==null?testTree.name:testTree.parent.name} - ${testTree.name}<shiro:hasPermission name="pm:pmTree:edit">查看</shiro:hasPermission><shiro:lacksPermission name="pm:pmTree:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="testTree" action="${ctx}/pm/pmTree/saveMy" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<form:hidden path="name"/>
		<form:hidden path="sort"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">项目名称：</label>
			<div class="controls">
				${testTree.parent==null?testTree.name:testTree.parent.name}
			</div>
			</div>
		<div class="control-group">
			<label class="control-label">名称：</label>
			<div class="controls">
				${testTree.name}
			</div>
		</div>
			<div class="control-group">
			<label class="control-label">备注信息：</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="10" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<c:if test="${testTree.parent!=null}">
		<div class="control-group">
				<label class="control-label">附件：</label>
				<div class="controls">
					<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
					<sys:ckfinder input="files" type="files" uploadPath="/pm" selectMultiple="true"/>
				</div>
			</div>
			</c:if>
		<div class="form-actions">
			<shiro:hasPermission name="pm:pmTree:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
		</div>
	</form:form>
</body>
</html>