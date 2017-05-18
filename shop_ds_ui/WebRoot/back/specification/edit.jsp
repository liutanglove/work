<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改规格</title>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
<script type="text/javascript" src="../back/script/jquery.js"></script>
<script type="text/javascript" src="../back/script/jquery.tools.js"></script>
<script type="text/javascript" src="../back/editor/kindeditor.js"></script>
<script type="text/javascript" src="../back/script/common.js"></script>
<style type="text/css">
	*{font: 12px tahoma, Arial, Verdana, sans-serif;}
</style>
<script type="text/javascript">
	$(function(){
			var $specificationTable = $("#specificationTable");
			var $type = $("#type");
			var $addSpecificationValueButton = $("#addSpecificationValueButton");
			var $deleteSpecificationValue = $("a.deleteSpecificationValue");
			var specificationValueIndex = $(".specificationValueTr").length;
			var id = $("#id").prop("value");
			var $inputForm = $("#inputForm");

			// 修改规格类型
			$type.change(function() {
						if ($(this).val() == "text") {
							$("input.specificationValuesImage")
									.val("").prop("disabled", true);
							$("input.browserButton").prop(
									"disabled", true);
						} else {
							$("input.specificationValuesImage")
									.prop("disabled", false);
							$("input.browserButton").prop(
									"disabled", false);
						}
					});
			$("input.browserButton").browser();
			// 增加规格值
			$addSpecificationValueButton
					.click(function() {
						if ($type.val() == "文本") {
							var trHtml = '<tr class="specificationValueTr"> <td> &nbsp; <input type="hidden" name="list[' + specificationValueIndex + '].parentid"  value="'+id+'"/><\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].name" class="text specificationValuesName" maxlength="200" \/> <\/td> <td> <span class="fieldSet"> <input type="text" name="list[' + specificationValueIndex + '].imgUrl" class="text specificationValuesImage" maxlength="200" disabled="disabled" \/> <input type="button" class="button browserButton" value="选择文件" disabled="disabled" \/> <\/span> <\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].sortnum" class="text specificationValuesOrder" maxlength="9" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteSpecificationValue">[删除]<\/a> <\/td> <\/tr>';
						} else {
							var trHtml = '<tr class="specificationValueTr"> <td> &nbsp; <input type="hidden" name="list[' + specificationValueIndex + '].parentid"  value="'+id+'"/><\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].name" class="text specificationValuesName" maxlength="200" \/> <\/td> <td> <span class="fieldSet"> <input type="text" name="list[' + specificationValueIndex + '].imgUrl" class="text specificationValuesImage" maxlength="200" \/> <input type="button" class="button browserButton" value="选择文件" \/> <\/span> <\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].sortnum" class="text specificationValuesOrder" maxlength="9" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteSpecificationValue">[删除]<\/a> <\/td> <\/tr>';
						}
						$specificationTable.append(trHtml).find(
								"input.browserButton:last")
								.browser();
						specificationValueIndex++;
					});
			// 删除规格值
			$deleteSpecificationValue.live("click", function() {
				$(this).parent().parent().remove();
			});
			//修改规格
			 $("#inputForm").bind("submit",function(){
				 $.ajax({
						cache:false,
						type:"post",
						data:$("#inputForm").serialize(),
						url:"${pageContext.request.contextPath}/speci/alterSpeItem",
						success:function(args){
							$.message("success","修改成功！");	
							setTimeout(function(){
								location.href="${pageContext.request.contextPath}/speci/queryAllSpeItem";
							},3000);
						},
						error:function(args){
							$.message("error","修改失败！");
							//$.message("success","修改成功！");	
							setTimeout(function(){
								location.href="${pageContext.request.contextPath}/speci/queryAllSpeItem";
							},3000);
								
						}
					});	
			 });
	});
</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> » 编辑规格
	</div>
	<form id="inputForm"  method="post"
		novalidate="novalidate">
			<table id="specificationTable" class="input">
				<tbody>
					<tr class="titleTr">
						<th><span class="requiredField">*</span>名称:</th>
						<td colspan="4"><input type="text" name="name" class="text"
							value="${item.name}" maxlength="200">
							<input type="hidden" name="id" id="id" value="${item.id}">
						</td>
					</tr>
					<tr>
						<th>类型:</th>
						<td colspan="4"><select id="type" name="showType">
								<c:if test="${item.showType == '文本'}">
									<option value="图片">图片</option>
									<option value="文本" selected="selected">文本</option>
								</c:if>
								<c:if test="${item.showType != '文本'}">
									<option value="图片" selected="selected">图片</option>
									<option value="文本">文本</option>
								</c:if>
						</select></td>
					</tr>
					<tr>
						<th>备注:</th>
						<td colspan="4"><input type="text" name="note" class="text"
							value="${item.note}" maxlength="200">
						</td>
					</tr>
					<tr>
						<th>排序:</th>
						<td colspan="4"><input type="text" name="sortnum" class="text"
							value="${item.sortnum}" maxlength="9">
							<input type="hidden" name="createTime" value="${item.createtime}"/>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td colspan="4"><a href="javascript:;"
							id="addSpecificationValueButton" class="button">增加规格值</a></td>
					</tr>
					<tr class="title">
						<td>&nbsp;</td>
						<td>规格值名称</td>
						<td>规格值图片</td>
						<td>规格值排序</td>
						<td>删除</td>
					</tr>
					<c:forEach var="it" varStatus="i" items="${item.list}">
						<tr class="specificationValueTr">
						<td>
							<input type="hidden" name="list[${i.count-1}].id" value="${it.id}"/>
						</td>
						<td>
							<input type="text" name="list[${i.count-1}].name" class="text specificationValuesName" value="${it.name}" maxlength="200"/>
							<input type="hidden" name="list[${i.count-1}].parentid" value="${item.id}"/>
						</td>
						<td>
							<span class="fieldSet"> 
								<c:if test="${it.imgUrl != null}">
									<input type="hidden" name="list[${i.count-1}].parentid" value="${item.id}">
									<input type="text"
								   name="list[${i.count-1}].imgUrl"
								   class="text specificationValuesImage valid"
								   value="${it.imgUrl}" maxlength="200"/> 
									<input type="button" class="button browserButton" value="选择文件"/> 
									<img src="${pageContext.request.contextPath}/${it.imgUrl}" style="width: 20px; height: 20px; padding: 1px; vertical-align: middle; border: 1px solid #b2d3f4;"/>
								</c:if>
								<c:if test="${it.imgUrl == null}">
									<input type="text"
								   name="list[${i.count-1}].imgUrl"
								   class="text specificationValuesImage valid"
								   disabled="disabled" maxlength="200"/> 
									<input type="button" disabled="disabled" class="button browserButton" value="选择文件"/> 
									<img src="${pageContext.request.contextPath}/${it.imgUrl}" style="width: 20px; height: 20px; padding: 1px; vertical-align: middle; border: 1px solid #b2d3f4;"/>
								</c:if>
								
							</span>
						</td>
						<td>
							<input type="text" name="list[${i.count-1}].sortnum" class="text specificationValuesOrder" value="1" maxlength="9" style="width: 30px;"/>
						</td>
						<td><a href="javascript:;" class="deleteSpecificationValue">[删除]</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="input" >
				<tbody>
					<tr>
						<th>&nbsp;</th>
						<td colspan="4">
							<input type="submit" class="button"
							value="确&nbsp;&nbsp;定"/> 
							<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.html'"/>
						</td>
					</tr>
				</tbody>
			</table>
</body>
</html>
