<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>商品参数</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="icon" href="${pageContext.request.contextPath}/back/img/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/jquery.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/common.js"></script>
	<script type="text/javascript">
		$().ready(function() {
			var $listForm = $("#listForm");
			
			var $pageSizeSelect=$("#pageSizeSelect");
			var $pageSizeOption = $("#pageSizeOption a");
			
			var $pageSize = $("#pageSize");
			var $pageNow = $("#pageNow");
			
			var $searchPropertySelect = $("#searchPropertySelect");
			var $searchPropertyOption = $("#searchPropertyOption a");
			
			var $refreshButton = $("#refreshButton");
			var $deleteButton = $("#deleteButton");
			var $selectAll = $("#selectAll");
			var $ids = $("#listTable input[name='ids']");
			
			// 每页记录数选项
			$pageSizeSelect.mouseover( function() {
				var $this = $(this);
				var offset = $this.offset();
				var $menuWrap = $this.closest("div.menuWrap");
				var $popupMenu = $menuWrap.children("div.popupMenu");
				$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
				$menuWrap.mouseleave(function() {
					$popupMenu.hide();
				});
			});
			// 每页记录数
			$pageSizeOption.click( function() {
				alert("do by yourself");
			});
			
			// 搜索选项
			$searchPropertySelect.mouseover( function() {
				var $this = $(this);
				var offset = $this.offset();
				var $menuWrap = $this.closest("div.menuWrap");
				var $popupMenu = $menuWrap.children("div.popupMenu");
				$popupMenu.css({left: offset.left - 1, top: offset.top + $this.height() + 2}).show();
				$menuWrap.mouseleave(function() {
					$popupMenu.hide();
				});
			});
			// 搜索选项
			$searchPropertyOption.click( function() {
				var $this = $(this);
				$searchPropertyOption.removeClass("current");
				$this.addClass("current");
				return false;
			});
			// 刷新
			$refreshButton.click( function() {
				alert("do by yourself");
			});
			
			// 页码跳转
			$.pageSkip = function(pageNumber) {
				alert("自己做");
			}
			
			 
			 //  全选   --------------qtt 
			 $selectAll.click(function(){
			 	alert("自己做");
			 });
			 // 单选-------------qtt
			$ids.click(function(){
				alert("自己做");
			});
			
			 
			 //  删除  -------------- qtt
			 $deleteButton.click(function(){
			 	alert("自己做");
			 });
			 
			 
		});
</script>
<style type="text/css">
	*{font: 12px tahoma, Arial, Verdana, sans-serif;}
</style>
  </head>
 
  <body>
  	<div class="path">
		<a href="">首页</a> » 参数列表 <span>(共<span id="pageTotal"><s:property value="pb.count"/>  </span>条记录)</span>
	</div>
	<form id="listForm" action="${pageContext.request.contextPath}/back/queryParameter" method="get">
		<div class="bar">
			<a href="../back/params/add.jsp" class="iconButton"> 
				<span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>删除 </a> 
				<a href="javascript:;" id="refreshButton" class="iconButton"> 
					<span class="refreshIcon">&nbsp;</span>刷新 
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button"> 每页显示<span
						class="arrow">&nbsp;</span> </a>
					<div class="popupMenu"
						style="left: 217px; top: 59px; display: none;">
						<ul id="pageSizeOption">
							<li><a href="javascript:;" val="10">10</a></li>
							<li><a href="javascript:;" class="current" val="20">20</a></li>
							<li><a href="javascript:;" val="50">50</a></li>
							<li><a href="javascript:;" val="100">100</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span> 
					<input type="text" id="searchValue" name="value" value="xx" maxlength="200">
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li><a href="javascript:;" val="name">名称</a></li>
					</ul>
				</div>
			</div>
		</div>
		<table id="listTable" class="list">
			<tbody>
				<tr>
					<th class="check"><input type="checkbox" id="selectAll">
					</th>
					<th><a href="javascript:;" class="sort" name="name">名称</a></th>
					<th><a href="javascript:;" class="sort" name="productCategory">绑定分类</a>
					</th>
					<th><span>参数</span></th>
					<th><a href="javascript:;" class="sort" name="name">排序</a></th>
					<th><span>操作</span></th>
				</tr>
				<c:forEach var="ca" items="${list}">
					<c:forEach var="pg" varStatus="i" items="${ca.groups}">
						<tr>
							<td><input type="checkbox" name="ids" value="${pg.id}">
							</td>
							<td>${pg.name}</td>
							<td>${ca.name}</td>
							<td>
								<c:forEach var="pi" items="${pg.items}">
									${pi.name}&nbsp;&nbsp;
								</c:forEach>
							</td>
							<td>${pg.sortNum}</td>
							<td><a href="edit.html?id=6">[编辑]</a></td>
						</tr>
					</c:forEach>
					
				</c:forEach>	
			</tbody>
		</table>
		<input type="hidden" id="pageSize" name="pageSize" value='<s:property value="pageSize" default="10"/>'>
		<div class="pagination">
			<span class="firstPage">&nbsp;</span> <span class="previousPage">&nbsp;</span>
			<span class="currentPage">1</span> <a
				href="javascript:$.pageSkip(2);">2</a> <a
				href="javascript:$.pageSkip(3);">3</a> <span class="pageBreak">...</span>
			<a class="nextPage" href="javascript: $.pageSkip(2);">&nbsp;</a>
			<a class="lastPage" href="javascript: $.pageSkip(6);">&nbsp;</a>
			<span class="pageSkip"> 共6页 到第<input id="pageNumber"
				name="pageNumber" value="1" maxlength="9"
				onpaste="return false;">页
					<button type="submit">&nbsp;</button>
			</span>
		</div>
	</form>
  </body>
</html>
