<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>商品类别添加</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="icon" href="../img/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="../back/script/jquery.js"></script>
	<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="../back/script/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
		.brands label {
			width: 150px;
			display: block;
			float: left;
			padding-right: 6px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
		    var canSubmit=true;
		    /**
			$("#inputForm").bind("submit",function(){
				var pid=$("#pid").val();
				if(!canSubmit){
					$.message("warn","请选择顶级或一级");
					return false;
				}
				return true;
			});
			
			*/
			
			$("#upCat").click(function(){
				$.ajax({
					cache:false,
					type:"post",
					data:$("#updateForm").serialize(),
					url:"${pageContext.request.contextPath}/category/alterCategory",
					success:function(){
						$.message("success","修改成功");
					},
					error:function(){
						$.message("error","修改失败，请稍后重试");
					}
				});
			});
			
		});
	</script>
  </head>
  <body>
    <div class="path">
		<a href="">首页</a>  » 修改商品分类
	</div>
	<form id="updateForm"  novalidate="novalidate">
		<table class="input">
			<tbody>
				<tr>
					<th>
						<span class="requiredField">*</span>Id:
					</th>
					<td>
						<input type="text" readonly="readonly"  name="id" class="text" maxlength="200" value="${ca.id}">
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>名称:
					</th>
					<td>
						<input type="text"  name="name" class="text" maxlength="200" value="${ca.name}">
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>级别:
					</th>
					<td>
						<input type="text" readonly="readonly"  name="lev" class="text" maxlength="200" value="${ca.lev}">
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>创建时间:
					</th>
					<td>
						<input type="text" readonly="readonly"  name="createTime" class="text" maxlength="200" value="${ca.createTime}">
					</td>
				</tr>
				<tr>
					<th>
						<span class="requiredField">*</span>修改时间:
					</th>
					<td>
						<input type="text" readonly="readonly"  name="lastUpdateTime" class="text" maxlength="200" value="${ca.lastUpdateTime}">
					</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>
						<input type="button" id="upCat" class="button" value="修&nbsp;&nbsp;改">
						<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="history.go(-1)">
					</td>
				</tr>
		</tbody></table>
	</form>
	
  </body>
  
  
</html>
