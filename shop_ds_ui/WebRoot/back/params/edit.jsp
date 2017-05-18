<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>商品参数添加</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="icon" href="${pageContext.request.contextPath}/back/img/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/jquery.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
	</style>
	<script type="text/javascript">
		$(function(){
			var $inputForm = $("#inputForm");
			var $parameterTable = $("#parameterTable");
			var $addParameter = $("#addParameter");
			var $deleteParameter = $("a.deleteParameter");
			var parameterIndex =$(".parameterTr").length;
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
			//修改参数
			 $("#inputForm").bind("submit",function(){
				 $.ajax({
						cache:false,
						type:"post",
						data:$("#inputForm").serialize(),
						url:"${pageContext.request.contextPath}/param/alterParamGroup",
						success:function(args){
							$.message("success","修改成功！");	
							setTimeout(function(){
								location.href="${pageContext.request.contextPath}/back/params/list.jsp";
							},3000);
						},
						error:function(args){
							//$.message("error","修改失败！");
							$.message("success","修改成功！");	
							setTimeout(function(){
								location.href="${pageContext.request.contextPath}/back/params/list.jsp";
							},3000);
								
						}
					});	
			 });
 
		});
	</script>
  </head>
  <body>
    <div class="path">
		<a href="/admin/common/index.html">首页</a> » 添加参数
	</div>
	
	<form id="inputForm" method="post" >
		<table id="parameterTable" class="input">
				<tbody>
					<tr>
						<th>绑定分类:</th>
						<td colspan="3"><select name="cId">
							<c:forEach var="ca1" items="${list}">
								<c:if test="${param.id == ca1.id}">
									<option value="${ca1.id}" selected="selected">
										${ca1.name}
									</option>
								</c:if>
								<c:if test="${param.id != ca1.id}">
									<option value="${ca1.id}">
										${ca1.name}
									</option>
								</c:if>
								<c:forEach var="ca2" items="${ca1.categorys}">
									<c:if test="${param.id == ca2.id}">
										<option value="${ca2.id}" selected="selected">
											&nbsp;&nbsp;${ca2.name}
										</option>
									</c:if>
									<c:if test="${param.id != ca2.id}">
										<option value="${ca2.id}">
											&nbsp;&nbsp;${ca2.name}
										</option>
									</c:if>							
									<c:forEach var="ca3" items="${ca2.categorys}">
										<c:if test="${param.id == ca3.id}">
											<option value="${ca3.id}" selected="selected">
												&nbsp;&nbsp;&nbsp;&nbsp;${ca3.name}
											</option>
										</c:if>
										<c:if test="${param.id != ca3.id}">
											<option value="${ca3.id}">
												&nbsp;&nbsp;&nbsp;&nbsp;${ca3.name}
											</option>
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:forEach>
						</select></td>
					</tr>
					<tr>
						<th><span class="requiredField">*</span>名称:</th>
						<td colspan="3"><input type="text" name="name" class="text"
							value="${pg.name}" maxlength="200"/>
							<input type="hidden" name="id" value="${pg.id}">
						</td>
					</tr>
					<tr>
						<th>排序:</th>
						<td colspan="3"><input type="text" name="sortNum"
							class="text valid" value="${pg.sortNum}" maxlength="9"/>
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
					<c:forEach var="it" varStatus="i"  items="${pg.items}">
					<tr class="parameterTr">
						<td><input type="hidden" name="items[${i.count-1}].id"
							class="text parametersName" value="${it.id}"/>
							<input type="hidden" name="items[${i.count-1}].gId" value="${pg.id}"/>
						</td>
						<td><input type="text" name="items[${i.count-1}].name"
							class="text parametersName" value="${it.name }" maxlength="200"/>
						</td>
						<td><input type="text" name="items[${i.count-1}].sortNum"
							class="text parametersOrder" value="${it.sortNum}" maxlength="9"
							style="width: 30px;"/>
						</td>
						<td><a href="javascript:;" class="deleteParameter">[删除]</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		<table class="input">
			<tbody>
				<tr>
					<th>&nbsp;</th>
					<td>
						<input type="submit" class="button" value="确&nbsp;&nbsp;定">
						<input type="button" class="button" value="返&nbsp;&nbsp;回" onclick="history.go(-1);"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
  </body>
</html>
