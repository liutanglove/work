<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>添加规格</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../css/common.css" type="text/css"></link>
<script type="text/javascript" src="../script/jquery.js"></script>
<script type="text/javascript" src="../script/jquery.tools.js"></script>
<script type="text/javascript" src="../editor/kindeditor.js"></script>
<script type="text/javascript" src="../script/common.js"></script>
<style type="text/css">
	*{font: 12px tahoma, Arial, Verdana, sans-serif;}
</style>
<script type="text/javascript">
	$(function(){
		var $inputForm = $("#inputForm");
		var $specificationTable = $("#specificationTable");
		var $type = $("#type");
		var $addSpecificationValueButton = $("#addSpecificationValueButton");
		var $deleteSpecificationValue = $("a.deleteSpecificationValue");
		var specificationValueIndex = 0;
		// 修改规格类型
		$type.change(function() {
			if ($(this).val() == "text") {
				$("input.specificationValuesImage").val("").prop("disabled", true);
				$("input.browserButton").prop("disabled", true);
			} else {
				$("input.specificationValuesImage").prop("disabled", false);
				$("input.browserButton").prop("disabled", false);
			}
		});
		
		$("input.browserButton").browser({
		});
		
		// 增加规格值
		$addSpecificationValueButton.click(function() {
		    var trHtml="";
			if ($type.val() == "text") {
				trHtml = '<tr class="specificationValueTr"> <td> &nbsp; <\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].name" maxlength="200" class="text specificationValuesName" \/> <\/td> <td> <span class="fieldSet"> <input type="text" name="list[' + specificationValueIndex + '].imgUrl" maxlength="200" class="text specificationValuesImage" disabled="disabled" \/> <input type="button" class="button browserButton" value="选择文件" disabled="disabled" \/> <\/span> <\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].sortnum" maxlength="9" class="text specificationValuesOrder" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteSpecificationValue">[删除]<\/a> <\/td> <\/tr>';		
			} else {
			    trHtml = '<tr class="specificationValueTr"> <td> &nbsp; <\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].name" class="text specificationValuesName" maxlength="200" \/> <\/td> <td> <span class="fieldSet"> <input type="text" name="list[' + specificationValueIndex + '].imgUrl" class="text specificationValuesImage" maxlength="200" \/> <input type="button" class="button browserButton" value="选择文件" \/> <\/span> <\/td> <td> <input type="text" name="list[' + specificationValueIndex + '].sortnum" class="text specificationValuesOrder" maxlength="9" style="width: 30px;" \/> <\/td> <td> <a href="javascript:;" class="deleteSpecificationValue">[删除]<\/a> <\/td> <\/tr>';		
		   }
			$specificationTable.append(trHtml).find("input.browserButton:last").browser({
				
			});
			specificationValueIndex ++;
		});
		
		// 删除规格值
		$deleteSpecificationValue.live("click", function() {
			$(this).parent().parent().remove();
		});
		//添加规格参数
		$("#inputForm").bind("submit",function(){
			 var name = $("input:first").val();
				if(name.length ==0){
					$.message("error","规格参数名不能为空!");
					return false;
				}else{
					$.ajax({
						cache:false,
						type:"post",
						data:$("#inputForm").serialize(),
						url:"${pageContext.request.contextPath}/speci/saveSpeItem",
						success:function(args){
							$.message("success","添加成功！");
							setTimeout(function(){
								location.href="${pageContext.request.contextPath}/speci/queryAllSpeItem";
							},3000);	
						},
						error:function(){
							$.message("error","添加失败！");		
						}
					});	
					return false;
				}
		}); 
	});
</script>
</head>
<body>
	<div class="path">
		<a href="">首页</a> » 添加规格
	</div>
	<form id="inputForm" method="post" novalidate="novalidate">
		<table id="specificationTable" class="input">
			<tbody><tr class="titleTr">
				<th>
					<span class="requiredField">*</span>名称:
				</th>
				<td colspan="4">
					<input type="text" name="name" class="text" maxlength="200">
				</td>
			</tr>
			<tr>
				<th>
					类型:
				</th>
				<td colspan="4">
					<select id="type" name="showType">
							<option value="text">文本</option>
							<option value="image">图片</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>
					备注:
				</th>
				<td colspan="4">
					<input type="text" name="note" class="text" maxlength="200">
				</td>
			</tr>
			<tr>
				<th>
					排序:
				</th>
				<td colspan="4">
					<input type="text" name="sortnum" class="text" maxlength="9">
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;
				</td>
				<td colspan="4">
					<a href="javascript:;" id="addSpecificationValueButton" class="button">增加规格值</a>
				</td>
			</tr>
			<tr class="title">
				<td>
					&nbsp;
				</td>
				<td>
					规格值名称
				</td>
				<td>
					规格值图片
				</td>
				<td>
					规格值排序
				</td>
				<td>
					删除
				</td>
			</tr>
			
		</tbody></table>
		<table class="input">
			<tbody><tr>
				<th>
					&nbsp;
				</th>
				<td colspan="4">
					<input type="submit" class="button" value="确&nbsp;&nbsp;定">
					<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="location.href='list.html'">
				</td>
			</tr>
		</tbody></table>
	</form>
	
</body>
</html>
