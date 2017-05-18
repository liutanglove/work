<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    
    <title>商品分类</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="icon" href="../back/img/favicon.ico" type="image/x-icon" />
	<script type="text/javascript" src="../back/script/jquery.js"></script>
	<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="../back/script/common.js"></script>
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
			var $searchProperty = $("#searchProperty");
			
			var $refreshButton = $("#refreshButton");
			var $deleteButton = $("#deleteButton");
			var $selectAll = $("#selectAll");
			var $ids = $("#listTable input[name='ids']");
			/* var $lists=$("#lists");
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath }/category/queryAllCategory",
				dataType:"JSON",
				success:function(data){
					$.each(data,function(i,parent){
						var html = "<tr><td><span style='margin-left: 0px; color: #000000;'>"+parent.name+"</span></td><td>"+parent.lev+"</td><td><a href='/product/list/11.html' target='_blank'>[查看]</a><a href='edit.html?id=11'>[编辑]</a><a href='javascript:;' class='delete' val='11'>[删除]</a></td></tr>";
						$lists.append(html);
						alert(parent.name)
						$.each(parent.childrens,function(j,children){
							var childHtml = "<tr><td><span style='margin-left: 0px; color: #000000;'>&nbsp;&nbsp;"+children.name+"</span></td><td>"+children.lev+"</td><td><a href='/product/list/11.html' target='_blank'>[查看]</a><a href='edit.html?id=11'>[编辑]</a><a href='javascript:;' class='delete' val='11'>[删除]</a></td></tr>";
							$lists.append(childHtml);
						});
						
					});
				}
			
			}); */
			
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
			// 每页记录数  ---qtt
			$pageSizeOption.click( function() {
				alert("自己做");
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
				$searchProperty.val($this.attr("val"));
				$searchPropertyOption.removeClass("current");
				$this.addClass("current");
				return false;
			});
			// 刷新  
			$refreshButton.click( function() {
				alert("自己做");
			});
			
			// 页码跳转
			$.pageSkip = function(pageNumber) {
				alert("自己做");
			}
			//  上一页  下一页   ----qtt
			jumpPage = function(num){
				alert("自己做");
			}
			
			//全选
			$selectAll.click(function(){//添加全选操作
			 	alert("自己做");
			 });
			 $ids.click(function(){//点击某一行
			 	    var $this = $(this);
					if ($this.prop("checked")) {
						$this.closest("tr").addClass("selected");
						$deleteButton.removeClass("disabled");
					} else {
						$this.closest("tr").removeClass("selected");
						if ($("#listTable input[name='ids']:checked").size() > 0) {
							$deleteButton.removeClass("disabled");
						} else {
							$deleteButton.addClass("disabled");
							$selectAll.prop("checked",false);
						}
					}
			 });
			 $deleteButton.click(function(){
			 	 $this=$(this);
			 	 if($this.hasClass("disabled")){
			 	 	return false;
			 	 }
			 	var $checkedIds=$("#listTable input[name=ids]:checked");
			 	console.log($checkedIds.serialize());
			 	$.message("success","删除成功");
			 });	
		});
</script>
<style type="text/css">
	*{font: 12px tahoma, Arial, Verdana, sans-serif;}
</style>
  </head>
  <body>
  	<div class="path">
		<a href="">首页</a> » 类别列表 <span>(共<span id="pageTotal"><s:property value="pb.count"/>  </span>条记录)</span>
	</div>
	<form id="listForm" method="get">
		<div class="bar">
			<a href="../category/queryAllCategory?info=add" class="iconButton"> <span class="addIcon">&nbsp;</span>添加</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>删除 
				</a> 
				<a href="javascript:;" id="refreshButton" class="iconButton"> 
					<span class="refreshIcon">&nbsp;</span>刷新
				 </a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button"> 
						每页显示 <span class="arrow">&nbsp;</span> 
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li><a href="javascript:;" class="current" val="10">10</a></li>
							<li><a href="javascript:;"  val="15">15</a></li>
							<li><a href="javascript:;" val="20">20</a></li>
							<li><a href="javascript:;" val="30">30</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span> 
					<input type="text" id="searchValue" name="searchValue" value="" maxlength="200">
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
		<tbody id="lists">
			<tr>
				<th><span>名称</span></th>
				<th><span>级别</span></th>
				<th><span>操作</span></th>
			</tr>
			<c:forEach var="ca1" items="${list}">
				<tr>
				<td>
					<span style="margin-left: 0px; color: #000000;">
						${ca1.name}
					</span>
				</td>
				<td>
					${ca1.lev}
				</td>
				<td>
					<a href="/product/list/1.html" target="_blank">[查看]</a>
					<a href="../category/queryCategoryById?id=${ca1.id }">[编辑]</a>
					<a href="javascript:;" class="delete" val="1">[删除]</a>
				</td>
			</tr>
				<c:forEach var="ca2" items="${ca1.categorys}">
					<tr>
				<td>
					<span style="margin-left: 20px;">
						${ca2.name}
					</span>
				</td>
				<td>
					${ca2.lev}
				</td>
				<td>
					<a href="/product/list/11.html" target="_blank">[查看]</a>
					<a href="../category/queryCategoryById?id=${ca2.id }">[编辑]</a>
					<a href="javascript:;" class="delete" val="11">[删除]</a>
				</td>
			</tr>
					<c:forEach var="ca3" items="${ca2.categorys}">
						<tr>
					<td>
						<span style="margin-left: 50px;">
							${ca3.name}
						</span>
					</td>
					<td>
						${ca3.lev}
					</td>
					<td>
						<a href="/product/list/11.html" target="_blank">[查看]</a>
						<a href="../category/queryCategoryById?id=${ca3.id }">[编辑]</a>
						<a href="javascript:;" class="delete" val="11">[删除]</a>
					</td>
				</tr>
					</c:forEach>
				</c:forEach>
			</c:forEach>
			
		</div>
	</form>
  </body>
</html>
