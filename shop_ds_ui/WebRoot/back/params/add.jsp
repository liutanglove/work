<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>商品参数添加</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="icon" href="../back/img/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="../back/script/jquery.js"></script>
	<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="../back/script/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
	</style>
	<script type="text/javascript">
		$(function(){
		    var canSubmit=false; 
			var $inputForm = $("#inputForm");
			var $parameterTable = $("#parameterTable");
			var $addParameter = $("#addParameter");
			var $deleteParameter = $("a.deleteParameter");
			var parameterIndex=0;
			// 增加参数
			$addParameter.live("click", function() {
				var tr = "<tr class='parameterTr'><td>&nbsp;</td><td><input type='text' name='items["+parameterIndex+"].name' class='text parametersName' maxlength='200'/></td> <td><input type='text' name='items["+parameterIndex+"].sortNum' class='text parametersOrder' maxlength='9' style='width: 30px;''/></td><td><a href='javascript:;' class='deleteParameter'>[删除]</a></td></tr>";
				$parameterTable.append(tr);
				parameterIndex++;
			});
			// 删除参数
			$deleteParameter.live("click", function() {
				$(this).parent().parent().remove();
			});
			//添加修改类别界面
			$("#pid").change(function(){
				alert("自己做");
			});
			 $("#inputForm").bind("submit",function(){
				 var name = $("input:first").val();
					if(name.length ==0){
						$.message("error","参数组名不能为空!");
						return false;
					}else{
						$.ajax({
							cache:false,
							type:"post",
							data:$("#inputForm").serialize(),
							url:"${pageContext.request.contextPath}/param/addParam",
							success:function(args){
								$.message("success","添加成功！");
								setTimeout(function(){
									location.href="${pageContext.request.contextPath}/back/params/list.jsp";
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
		<a href="">首页</a> » 添加参数
	</div>
	<form id="inputForm" novalidate="novalidate">
		<table id="parameterTable" class="input">
			<tbody>
				<tr>
					<th>绑定分类:</th>
					<td colspan="3"><select name="cId">
							<c:forEach var="ca1" items="${list}">
								<option value="${ca1.id}" >
									${ca1.name}
								</option>
								<c:forEach var="ca2" items="${ca1.categorys}">
									<option value="${ca2.id}">
										&nbsp;&nbsp;${ca2.name}
									</option>
									<c:forEach var="ca3" items="${ca2.categorys}">
										<option value="${ca3.id}">
											&nbsp;&nbsp;&nbsp;&nbsp;${ca3.name}
										</option>
									</c:forEach>
								</c:forEach>
							</c:forEach>
					</select></td>				
				</tr>
				<tr>
					<th><span class="requiredField">*</span>名称:</th>
					<td colspan="3"><input type="text" name="name" class="text"
						maxlength="200">
					</td>
				</tr>
				<tr>
					<th>排序:</th>
					<td colspan="3"><input type="text" name="sortNum" class="text" maxlength="9">
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td colspan="3"><a href="javascript:;" id="addParameter"
						class="button">增加参数</a></td>
				</tr>
				<tr class="title">
					<td>&nbsp;</td>
					<td>名称</td>
					<td>排序</td>
					<td>删除</td>
				</tr>
			</tbody>
		</table>
		<table class="input">
			<tbody>
				<tr>
					<th>&nbsp;</th>
					<td><input type="submit" class="button" value="确&nbsp;&nbsp;定">
							<input type="button" class="button" value="返&nbsp;&nbsp;回"
							onclick="history.go(-1)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
  </body>
</html>
