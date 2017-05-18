<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    
    <title>商品列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<link rel="icon" href="../back/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
	<script type="text/javascript" src="../back/script/jquery.js"></script>
	<script type="text/javascript" src="../back/script/common.js"></script>
	<style type="text/css">
		*{font: 12px tahoma, Arial, Verdana, sans-serif;}
		html, body {
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
    </style>
	<script type="text/javascript">
		$().ready(function() {
			var $listForm = $("#listForm");
			var $moreButton = $("#moreButton");
			var $filterSelect = $("#filterSelect");
			var $filterOption = $("#filterOption a");
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
			
			$filterSelect.mouseover(function() {
				var $this = $(this);
				var offset = $this.offset();
				var $menuWrap = $this.closest("div.menuWrap");
				var $popupMenu = $menuWrap.children("div.popupMenu");
				$popupMenu.css({left: offset.left, top: offset.top + $this.height() + 2}).show();
				$menuWrap.mouseleave(function() {
					$popupMenu.hide();
				});
			});
			// 筛选选项
			$filterOption.click(function() {
				var $this = $(this);
				var $dest = $("#" + $this.attr("name"));
				if ($this.hasClass("checked")) {
					$dest.val("");
				} else {
					$dest.val($this.attr("val"));
				}
				//$listForm.submit();表单提交
				alert($this.attr("val"));
			});
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
				return false;
			});
			
			// 页码跳转
			$.pageSkip = function(pageNumber) {
				alert("自己做");
				return false;
			}
			
			//全选
			$selectAll.click(function(){//添加全选操作
			 	alert("自己做");
			 });
			 $ids.click(function(){//点击某一行
			 	    alert("自己做");
			 });
			 $deleteButton.click(function(){
			 	alert("自己做");
			 });	
			 $moreButton.click(function(){
			 	 $.dialog({
					title: "更多选项",
					content:'<table id="moreTable" class="moreTable"> <tr> <th> 商品分类: <\/th><td><input type="text"/></td></table>',
					onOk: function(){
						$.message("warn","操作完成");
						return true;
					},
					onCancel: function(){
						$.message("warn","操作警告");
						return true;
					}
			 	 });
			 });	 
		});
</script>
</head>
  <body>
     <div class="path">
		<a href="">首页</a> » 商品列表 <span>(共<span id="pageTotal">300</span>条记录)</span>
	 </div>
	  <form id="listForm" action="action" method="get">
			<input type="hidden" id="productCategoryId" name="productCategoryId" value="">
			<input type="hidden" id="brandId" name="brandId" value="">
			<input type="hidden" id="promotionId" name="promotionId" value="">
			<input type="hidden" id="tagId" name="tagId" value="">
			<input type="hidden" id="isMarketable" name="isMarketable" value="">
			<input type="hidden" id="isList" name="isList" value="">
			<input type="hidden" id="isTop" name="isTop" value="">
			<input type="hidden" id="isGift" name="isGift" value="">
			<input type="hidden" id="isOutOfStock" name="isOutOfStock" value="">
			<input type="hidden" id="isStockAlert" name="isStockAlert" value="">
			<input type="hidden" id="pageSize" name="pageSize" value="50">
			<input type="hidden" id="searchProperty" name="searchProperty" value="">
			<input type="hidden" id="orderProperty" name="orderProperty" value="">
			<input type="hidden" id="orderDirection" name="orderDirection" value="">
			
			
			<div class="bar">
				<a href="${pageContext.request.contextPath}/category/queryAllCategory" class="iconButton">
					<span class="addIcon">&nbsp;</span>添加
				</a>
				<div class="buttonWrap">
					<a href="javascript:;" id="deleteButton" class="iconButton disabled">
						<span class="deleteIcon" >&nbsp;</span>删除
					</a>
					<a href="javascript:;" id="refreshButton" class="iconButton">
						<span class="refreshIcon">&nbsp;</span>刷新
					</a>
					<div class="menuWrap">
						<a href="javascript:;" id="filterSelect" class="button">
							商品筛选<span class="arrow">&nbsp;</span>
						</a>
						<div class="popupMenu" style="left: 217px; top: 59px; display: none;">
							<ul id="filterOption" class="check">
								<li>
									<a href="javascript:;" name="isMarketable" val="true" class="checked">已上架</a>
								</li>
								<li>
									<a href="javascript:;" name="isMarketable" val="false">未上架</a>
								</li>
								<li class="separator">
									<a href="javascript:;" name="isList" val="true">已列出</a>
								</li>
								<li>
									<a href="javascript:;" name="isList" val="false">未列出</a>
								</li>
								<li class="separator">
									<a href="javascript:;" name="isTop" val="true">已置顶</a>
								</li>
								<li>
									<a href="javascript:;" name="isTop" val="false">未置顶</a>
								</li>
								<li class="separator">
									<a href="javascript:;" name="isGift" val="true">赠品</a>
								</li>
								<li>
									<a href="javascript:;" name="isGift" val="false">非赠品</a>
								</li>
								<li class="separator">
									<a href="javascript:;" name="isOutOfStock" val="false">有货</a>
								</li>
								<li>
									<a href="javascript:;" name="isOutOfStock" val="true">缺货</a>
								</li>
								<li class="separator">
									<a href="javascript:;" name="isStockAlert" val="false">库存正常</a>
								</li>
								<li>
									<a href="javascript:;" name="isStockAlert" val="true">库存警告</a>
								</li>
							</ul>
						</div>
					</div>
					<a href="javascript:;" id="moreButton" class="button">更多选项</a>
					<div class="menuWrap">
						<a href="javascript:;" id="pageSizeSelect" class="button">
							每页显示<span class="arrow">&nbsp;</span>
						</a>
						<div class="popupMenu">
							<ul id="pageSizeOption">
								<li>
									<a href="javascript:;" val="10">10</a>
								</li>
								<li>
									<a href="javascript:;" val="20">20</a>
								</li>
								<li>
									<a href="javascript:;" class="current" val="50">50</a>
								</li>
								<li>
									<a href="javascript:;" val="100">100</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="menuWrap">
					<div class="search">
						<span id="searchPropertySelect" class="arrow">&nbsp;</span>
						<input type="text" id="searchValue" name="searchValue" value="" maxlength="200"/>
						<button type="submit">&nbsp;</button>
					</div>
					<div class="popupMenu">
						<ul id="searchPropertyOption">
							<li>
								<a href="javascript:;" val="name">名称</a>
							</li>
							<li>
								<a href="javascript:;" val="sn">编号</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<table id="listTable" class="list">
				<tbody>
				   <tr>
					<th class="check">
						<input type="checkbox" id="selectAll">
					</th>
					<th>
						<a href="javascript:;" class="sort" name="sn">编号</a>
					</th>
					<th>
						<a href="javascript:;" class="sort" name="name">名称</a>
					</th>
					<th>
						<a href="javascript:;" class="sort" name="productCategory">商品分类</a>
					</th>
					<th>
						<a href="javascript:;" class="sort" name="price">销售价</a>
					</th>
					<th>
						<a href="javascript:;" class="sort" name="cost">市场价</a>
					</th>
					<th>
						<a href="javascript:;" class="sort" name="isMarketable">是否上架</a>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<c:forEach var="pro" items="${list}">
					<tr>
						<td>
							<input type="checkbox" name="ids" value="300">
						</td>
						<td>
							${pro.numb}
						</td>
						<td>
							<span title="${pro.name}">
								${pro.name}
							</span>
						</td>
						<td>
							${pro.category.name}
						</td>
						<td>
							${pro.salePrice}
						</td>
						<td>
							${pro.marketPrice}
						</td>
						<td>
							<c:if test="${pro.isPro == 'Y'}">
								<span class="trueIcon">&nbsp;</span>
							</c:if>
							<c:if test="${pro.isPro == 'N'}">
								<span class="falseIcon">&nbsp;</span>
							</c:if>
						</td>
						<td>
							<a href="">[编辑]</a>
							<a href="" target="_blank">[查看]</a>
						</td>
				   </tr>
				</c:forEach>
			</tbody>
		</table>
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
