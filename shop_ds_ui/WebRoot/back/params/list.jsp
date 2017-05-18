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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/css/easyui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/css/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/back/script/jquery.easyui.min.js"></script>
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
				 
					 $("input[type=checkbox]").prop("checked","checked");
				
				 
			 });
			 // 单选-------------qtt
			$ids.click(function(){
				var trg = $("input[type=checkbox]:checked");
				if(trg.length != 0){
					$deleteButton.prop("class","iconButton");
				}
			});
			
			 
			 //  删除  -------------- qtt
			 $deleteButton.click(function(){
			 	var trg = $("input[type=checkbox]:checked");
			 	var idStr = ",";
			 	trg.each(function(n,val){
			 		idStr = idStr + val.value+",";
			 	});
			 	$.ajax({
			 		type:"post",
			 		data:"ids="+idStr,
			 		url:"${pageContext.request.contextPath}/param/removeParamGroup",
		 			success:function(args){
						$.message("success","删除成功!");
						location.reload();
					},
					error:function(){
						$.message("error","删除失败!");		
					}	
			 	}); 
			 });
			 
			 
		});
</script>
<style type="text/css">
	*{font: 12px tahoma, Arial, Verdana, sans-serif;}
</style>
  </head>
 
  <body>
  	<script type="text/javascript">
  	function cate(value,row,index){
  		value=row.category.name;
		return value;
	}
  	function item(itemName,row,index){
  		var items = row.items;
  		var it = " ";
  		for(var i=0;i<items.length;i++){
  			it =items[i].name + " " + it;
  		}
  		itemName = it;
  		return itemName;
	}
  	function opt1(op,row,index){
		return "<a href='${pageContext.request.contextPath}/param/queryParamById?gid="+row.id+"&cid="+row.cId+"'>[编辑]</a>";
	}
  //分页
	var pag = $("#pgList");
	pag.datagrid({
		onLoadSuccess:function(){
			pag.datagrid("getPager").pagination({
				beforePageText:'第',
				afterPageText:'页  共{pages}页',
				displayMsg:'从第{from}条 到 第{to}条  共{total}条'
			});
		}
	}); 
	
	//工具栏
	var abc = [{
					text:"增加",
					iconCls:'icon-add',
					handler:function(){
								location.href="${pageContext.request.contextPath}/category/queryAllCategory?info=addParam";  	
							}
				},"-",{
					text:"删除",
					iconCls:'icon-cut',
					handler:function(){
								var trs = $("#pgList").datagrid("getChecked");
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
						}
				},"-"]
  	</script>
	<table id="pgList"  class="easyui-datagrid" style="padding:0;width:960px;height:300px" 
   				data-options="toolbar:abc,pagination:true,pageList:[2,3,4,5,6,7,8],pageSize:3,url:'${pageContext.request.contextPath}/param/queryAllParam',title:'首页  » 参数列表'">
			<thead>
				<tr>
					 <th data-options="checkbox:true,width:55"></th>
					 <th data-options="field:'name',align:'center',width:100">名称</th>
					 <th data-options="formatter:cate,field:'value',align:'center',width:100">贷绑定分类</th>
					 <th data-options="formatter:item,field:'itemName',align:'center',width:500">参数</th>
					 <th data-options="field:'sortNum',align:'center',width:100">排序</th>
					 <th data-options="formatter:opt1,field:'op',align:'center',width:115">操作</th>
				</tr>
			</thead>
		</table> 
	<div id="diaPro"></div>
  </body>
</html>
