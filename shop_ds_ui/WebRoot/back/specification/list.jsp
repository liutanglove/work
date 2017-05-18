<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>规格列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="icon" href="../back/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="../back/script/jquery.js"></script>
	<script type="text/javascript" src="../back/script/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
    </style>
	<script type="text/javascript">
		$().ready(function() {
			var $listForm = $("#listForm");
			
			var $pageSizeSelect=$("#pageSizeSelect");
			var $pageSizeOption = $("#pageSizeOption a");
			
			var $pageSize = $("#pageSize");
			var $pageNumber = $("#pageNumber");
			
			var $searchPropertySelect = $("#searchPropertySelect");
			var $searchPropertyOption = $("#searchPropertyOption a");
			var $searchValue = $("#searchValue");
			var $searchType=$("#searchType");
			
			
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
				alert("自己做");
				return false;
			});
			//当搜索值改变的时候
			$searchValue.change(function(){
				$pageNumber.val("1");
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
				$searchType.val($this.attr("val"));
				$searchPropertyOption.removeClass("current");
				$this.addClass("current");
				return false;
			});
			// 刷新
			$refreshButton.click( function() {
				alert("自己做");
				return false;
			});
			
			// 页码跳转
			$.pageSkip = function(pageNumber) {
				alert("自己做");
			}
			
			//全选
			$selectAll.click(function(){//添加全选操作
				$ids.each(function(n,val){
					if($(val).prop("checked")){
						$(val).removeAttr("checked");
					}else{
						$(val).prop("checked",true);
					}
				});
				var trs = $("#listTable input[name='ids']:checked");
				if(trs.length != 0){
					$($deleteButton).prop("class","iconButton");
				}else{
					$($deleteButton).prop("class","iconButton disabled");
				}
			 });
			 $ids.click(function(){//点击某一行
				var trs = $("#listTable input[name='ids']:checked");
				if(trs.length != 0){
					$($deleteButton).prop("class","iconButton");
				}else{
					$($deleteButton).prop("class","iconButton disabled");
				}
			 });
			 $deleteButton.click(function(){
				 var trs = $("#listTable input[name='ids']:checked");
				 var ids = "-";
				 trs.each(function(n,val){
					 ids = ids + val.value + "-";
				 });
				 $.ajax({
						type:"post",
						data:"ids="+ids,
						url:"${pageContext.request.contextPath}/speci/delSpeItem",
						success:function(args){
							alert("删除成功 !");
							location.href = "${pageContext.request.contextPath}/speci/queryAllSpeItem";
						},
						error:function(){
							alert("删除失败 !");
						}
				 });
				 if(trs.length < 1){
						$.messager.alert("提示","请选择要删除的行!");
					}else{
						$.messager.confirm("confirm", "确定要删除这"+trs.length+"条数据？", function(r){
							if (r){
								var idStr=",";
								$.each(trs,function(n,value){
									idStr=idStr+value.id+",";
								});
								$.ajax({
									type:"post",
									url:"${pageContext.request.contextPath}/param/removeParamGroup",
									data:"idStr="+idStr,
									success:function(args){
										$.messager.progress(); 
										setTimeout(function(){
											$.messager.progress('close');
											$.messager.alert("提示","删除成功!");
											$("#pgList").datagrid("load"); 
										},3000);
									},
									error:function(){
										$.messager.alert("提示","请选择要删除的行!");
									}
								});
							}
						});
					}
				 
			 });	
			 $listForm.bind("submit",function(){
			 	alert("自己做");
			 });
		});
</script>
</head>
  <body>
    <div class="path"> 
		<a href="">首页</a> »规格列表 <span>(共
		<span id="pageTotal">6</span>条记录)</span>
	</div>
	<form id="listForm" action="list.html" method="get">
		<div class="bar">
			<a href="../back/specification/add.jsp" class="iconButton"> <span class="addIcon">&nbsp;</span>添加
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>删除 </a> <a href="javascript:;"
					id="refreshButton" class="iconButton"> <span
					class="refreshIcon">&nbsp;</span>刷新 </a>
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
					<span id="searchPropertySelect" class="arrow">&nbsp;</span> <input
						type="text" id="searchValue" name="searchValue" value=""
						maxlength="200">
						<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li><a href="javascript:;" val="name">名称</a></li>
						<li><a href="javascript:;" val="memo">备注</a></li>
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
					<th><a href="javascript:;" class="sort" name="type">类型</a></th>
					<th><span>规格值</span></th>
					<th><span>排序</span></th>
					<th><span>操作</span></th>
				</tr>
				<c:forEach var="sp" items="${list}">
					<tr>
					<td><input type="checkbox" name="ids" value="${sp.id}">
					</td>
					<td>${sp.name}
						<c:if test="${sp.note != null }">
							<span class="gray">[${sp.note}]</span>
						</c:if>
					</td>
					<td>${sp.showType}</td>
					<td>
						<c:forEach var="opt" items="${sp.list }">
							${opt.name} &nbsp;
						</c:forEach>
					</td>
					<td>${sp.sortnum}</td>
					<td><a href="${pageContext.request.contextPath}/speci/queryById?id=${sp.id}">[编辑]</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<input type="hidden" id="pageSize" name="pageSize" value="20">
		<input type="hidden" id="searchProperty" name="searchProperty" value=""> 
		<input type="hidden" id="orderProperty" name="orderProperty" value=""> 
		<input type="hidden" id="orderDirection" name="orderDirection" value="">
		<div class="pagination">
			<span class="firstPage">&nbsp;</span>
			<span class="previousPage">&nbsp;</span>
			<span class="currentPage">1</span>
			<a href="javascript:$.pageSkip(2);">2</a>
			<a href="javascript:$.pageSkip(3);">3</a>
			<span class="pageBreak">...</span>
			<a class="nextPage" href="javascript: $.pageSkip(2);">&nbsp;</a>
			<a class="lastPage" href="javascript: $.pageSkip(6);">&nbsp;</a>
			<span class="pageSkip">
				共6页 到第<input id="pageNumber" name="pageNumber" value="1" maxlength="9" onpaste="return false;">页<button type="submit">&nbsp;</button>
			</span>
		</div>
	</form>
  </body>
</html>