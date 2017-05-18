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
			$("#inputForm").bind("submit",function(){
				var name = $("input:first").val();
				if(name.length ==0){
					$.message("error","目录名称不能为空!");
					return false;
				}else{
					$.ajax({
						cache:false,
						type:"post",
						data:$("#inputForm").serialize(),
						url:"${pageContext.request.contextPath}/category/saveCategory",
						success:function(args){
							$.message("success","添加成功!");
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
		<a href="">首页</a>  » 添加商品分类
	</div>
	<form id="inputForm"  novalidate="novalidate">
		<table class="input">
			<tbody>
				<tr>
					<th>
						<span class="requiredField">*</span>名称:
					</th>
					<td>
						<input type="text" name="name" class="text" maxlength="200">
					</td>
				</tr>
				<tr>
					<th>
					上级分类:
				</th>
				<td>
					<select name="parentId">
							<c:forEach var="ca1" items="${list}">
								<option value="${ca1.id}-${ca1.lev}" >
									${ca1.name}
								</option>
								<c:forEach var="ca2" items="${ca1.categorys}">
									<option value="${ca2.id}-${ca2.lev}">
										&nbsp;&nbsp;${ca2.name}
									</option>
									<c:forEach var="ca3" items="${ca2.categorys}">
										<option value="${ca3.id}" disabled="disabled">
											&nbsp;&nbsp;&nbsp;&nbsp;${ca3.name}
										</option>
									</c:forEach>
								</c:forEach>
							</c:forEach>		
					</select>
				</td>
				</tr>
				<tr>
					<th>&nbsp;</th>
					<td>
						<input type="submit" id="sb" class="button" value="确&nbsp;&nbsp;定">
						<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="history.go(-1)">
					</td>
				</tr>
		</tbody></table>
	</form>
	
  </body>
  
  
</html>
