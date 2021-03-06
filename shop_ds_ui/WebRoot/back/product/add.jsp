<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商品添加</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="../back/css/common.css" type="text/css"></link>
<script type="text/javascript" src="../back/script/jquery.js"></script>
<script type="text/javascript" src="../back/script/jquery.tools.js"></script>
<script type="text/javascript" src="../back/editor/kindeditor.js"></script>
<script type="text/javascript" src="../back/script/common.js"></script>
<style type="text/css">
	*{font: 12px tahoma, Arial, Verdana, sans-serif;}
</style>
<script type="text/javascript">
   		$(function(){
   			var $tab = $("#tab");
   			$tab.tabs("table.tabContent", {
				tabs: "input",
				event:'click',
				effect:'fade'
			});
			var $title = $("#inputForm :input[title]");
			// 表单提示
			$title.tooltip({
				position: "center right",
				effect: "fade"
			});
			
			//富文本编辑器
			KindEditor.ready(function(K) {
				    editor = K.create("#editor", {
					height: "400px",
					items: [
						"source",  "preview","fullscreen","clearhtml", 
						"undo", "redo","|",
						"copy", "paste","plainpaste", "wordpaste", "|", 
						"justifycenter", "justifyright",
						"justifyfull", "insertorderedlist", "insertunorderedlist", "indent", "outdent",  "|", 
						"formatblock", "fontname", "fontsize", 
						 "forecolor", "hilitecolor", "bold",
						"italic", "underline", "strikethrough", "lineheight", "removeformat", "|", "image","table", "hr", "emoticons", "baidumap", "pagebreak",
						"anchor", "link", "unlink"
					],
					langType: 'zh_CN',
					syncType: "form",
					filterMode: false,
					pagebreakHtml: '<hr class="pageBreak" \/>',
					allowFileManager: true,
					filePostName: "image",
					fileManagerJson:"http://127.0.0.1:8990/image/browser",
					uploadJson:  "/shop_chenyn/specificationGroup/upload",
					extraFileUploadParams: {
						token: getCookie("token")
					},
					afterChange: function() {
						this.sync();
					}
				});
			});
			//添加图片tab
			var $addProductImage = $("#addProductImage");
			var productImageIndex = 0;
			var $deleteProductImage = $("a.deleteProductImage");
			// 增加商品图片
			$addProductImage.click(function() {
				var trHtml = '<tr><td><input type="text" name="list['+productImageIndex+'].imgUrlLarge" class="text specificationValuesImage" maxlength="200"><input type="button" class="button browserButton" value="选择文件" /><\/td><td> <input type="text" name="list[' + productImageIndex + '].title" class="text" maxlength="200" \/> <\/td> <td> <input type="text" name="list[' + productImageIndex + '].sortNum" class="text productImageOrder" maxlength="9" style="width: 50px;" \/> <\/td> <td> <a href="javascript:;" class="deleteProductImage">[删除]<\/a> <\/td> <\/tr>';
				$("#productImageTable").append(trHtml).find("input.browserButton:last").browser({
					
				});
				productImageIndex ++;
			});
			// 删除商品图片
			$deleteProductImage.live("click", function() {
				var $this = $(this);
				$.dialog({
					type: "warn",
					content: "您确定要删除吗？",
					onOk: function() {
						$this.closest("tr").remove();
					}
				});
			});
			
			//类别按钮
			var $productCategoryId = $("#productCategoryId");
			var $parameterTable = $("#parameterTable");
			var $attributeTable = $("#attributeTable");
			$productCategoryId.change(function(){//修改类别
				loadParameter();//重新加载参数
			   
			});
		/* 	$productCategoryId.change(); */
			// 加载参数
			function loadParameter() {
				$.ajax({
					url: "/shop_chenyn/back/product/group.json",
					type: "POST",
					data: {id: $productCategoryId.val()},
					dataType: "json",
					beforeSend: function() {
						$parameterTable.empty();
					},
					success: function(data) {
						var trHtml = "";
						console.log(data);
						$.each(data, function(i, group) {
							trHtml += '<tr><td style="text-align: right;"><strong>' + group.name + ':<\/strong><\/td><td>&nbsp;<\/td><\/tr>';
							$.each(group.items, function(i, item) {
								trHtml += '<tr> <th>' + item.name + ': <\/th> <td><input type="text" name="" class="text" maxlength="200" \/> <\/td> <\/tr>';
							});
						});
						$parameterTable.append(trHtml);
					}
				});
			}
			//规格
			var $specificationIds = $("#specificationSelect :checkbox");
			var $specificationProductTable = $("#specificationProductTable");
			var $addSpecificationProduct = $("#addSpecificationProduct");
			// 修改商品规格
			$specificationIds.click(function() {
				if ($specificationIds.filter(":checked").size() == 0) {
					$specificationProductTable.find("tr:gt(1)").remove();
				}
				var $this = $(this);
				if ($this.prop("checked")) {
					$specificationProductTable.find("td.specification_" + $this.val()).show().find("select").prop("disabled", false);
				} else {
					$specificationProductTable.find("td.specification_" + $this.val()).hide().find("select").prop("disabled", true);
				}
			});
			// 增加规格商品
			$addSpecificationProduct.click(function() {
				if ($specificationIds.filter(":checked").size() == 0) {
					$.message("warn", "必须至少选择一个规格");
					return false;
				}
				if ($specificationProductTable.find("tr:gt(1)").size() == 0) {
					$tr = $specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
					$tr.find("td:first").text("当前规格");
					$tr.find("td:last").text("-");
				} else {
					$specificationProductTable.find("tr:eq(1)").clone().show().appendTo($specificationProductTable);
				}
			});
			var $deleteSpecificationProduct = $("a.deleteSpecificationProduct");
			// 删除规格商品
			$deleteSpecificationProduct.live("click", function() {
				var $this = $(this);
				$.dialog({
					type: "warn",
					content: "您确定要删除吗？",
					onOk: function() {
						$this.closest("tr").remove();
					}
				});
			});
			$("#addPro").find("input.browserButton:last").browser({
				
			});
			$("input.browserButton").browser({
			});
			
   	});
   </script>
</head>
<body>
	<div class="path">
		<a href="">/首页</a> » 添加商品
	</div>
	<form id="inputForm" action="${pageContext.request.contextPath}/product/insertProduct" method="post"
		enctype="multipart/form-data" novalidate="novalidate">
		<ul id="tab" class="tab">
			<li><input type="button" value="基本信息" class="current"></li>
			<li><input type="button" value="商品介绍" class=""></li>
			<li><input type="button" value="商品图片" class=""></li>
			<li><input type="button" value="商品参数" class=""></li>
			<li><input type="button" value="商品规格" class=""></li>
		</ul>
		<table class="input tabContent" id="addPro" style="display: table;">
			<tbody>
				<tr>
					<th><span class="requiredField">*</span>名称:</th>
					<td><input type="text" name="name" title="can not be null"
						class="text" maxlength="200"></td>
				</tr>
				<tr>
					<th>商品分类:</th>
					<td>
						<select id="productCategoryId" name="cid">
							<c:forEach var="ca1" items="${list}">
								<option value="${ca1.id }">${ca1.name}</option>
								<c:forEach var="ca2" items="${ca1.categorys}">
									<option value="${ca2.id }">&nbsp;&nbsp;${ca2.name}</option>
									<c:forEach var="ca3" items="${ca2.categorys}">
										<option value="${ca3.id }">&nbsp;&nbsp;&nbsp;&nbsp;${ca3.name}</option>
									</c:forEach>
								</c:forEach>
								
							</c:forEach>
							
						</select>
					</td>
				</tr>
				<tr>
					<th>编号:</th>
					<td><input type="text" name="numb" class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>销售价:</th>
					<td><input type="text" name="salePrice" class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>市场价:</th>
					<td><input type="text" name="marketPrice" class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>积分:</th>
					<td><input type="text" name="score" class="text" maxlength="100">
					</td>
				</tr>
				<tr>
					<th>是否上架:</th>
					<td>
						<select name="isPro">
							<option value="Y">是</option>
							<option value="N">否</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>主页图片:</th>
					<td><input type="text" name="primaryImg" class="text specificationValuesImage" maxlength="200"><input type="button" class="button browserButton" value="选择图片" />
					</td>
				</tr>
			</tbody>
		</table>
		<table class="input tabContent" style="display: none;">
			<tbody>
				<tr>

					<td>
						<textarea id="editor" name="introduce" 
							class="editor" style="width: 100%; display: none;">
						</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<table id="productImageTable" class="input tabContent"
			style="display: none;">
			<tbody>
				<tr>
					<td colspan="4"><a href="javascript:;" id="addProductImage"
						class="button">增加图片</a>
					</td>
				</tr>
				<tr class="title">
					<td>文件</td>
					<td>标题</td>
					<td>排序</td>
					<td>删除</td>
				</tr>
			</tbody>
		</table>
		<table id="parameterTable" class="input tabContent" style="display: none;"></table>
		<table class="input tabContent" style="display: none;">
			<tbody><tr class="title">
				<th>
					请选择商品规格:
				</th>
			</tr>
			<tr>
				<td>
					<div id="specificationSelect" class="specificationSelect">
						<ul>
								<li>
									<label>
										<input type="checkbox" name="specificationIds" value="1">颜色
											<span class="gray">[女装]</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox" name="specificationIds" value="2">颜色
											<span class="gray">[男装]</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox" name="specificationIds" value="3">尺码
											<span class="gray">[女装]</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox" name="specificationIds" value="4">尺码
											<span class="gray">[男装]</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox" name="specificationIds" value="5">尺码
											<span class="gray">[女鞋]</span>
									</label>
								</li>
								<li>
									<label>
										<input type="checkbox" name="specificationIds" value="6">尺码
											<span class="gray">[男鞋]</span>
									</label>
								</li>
						</ul>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<a href="javascript:;" id="addSpecificationProduct" class="button">增加规格商品</a>
				</td>
			</tr>
			<tr>
				<td>
					<table id="specificationProductTable" class="input">
						<tbody><tr class="title">
							<td width="60">
								&nbsp;
							</td>
								<td class="specification_1 hidden">
									颜色
										<span class="gray">[女装]</span>
								</td>
								<td class="specification_2 hidden">
									颜色
										<span class="gray">[男装]</span>
								</td>
								<td class="specification_3 hidden">
									尺码
										<span class="gray">[女装]</span>
								</td>
								<td class="specification_4 hidden">
									尺码
										<span class="gray">[男装]</span>
								</td>
								<td class="specification_5 hidden">
									尺码
										<span class="gray">[女鞋]</span>
								</td>
								<td class="specification_6 hidden">
									尺码
										<span class="gray">[男鞋]</span>
								</td>
							<td>
								操作
							</td>
						</tr>
						<tr class="hidden">
							<td>
								&nbsp;
							</td>
								<td class="specification_1 hidden">
									<select name="specification_1" disabled="disabled">
											<option value="1">无</option>
											<option value="2">黄色</option>
											<option value="3">酒红色</option>
											<option value="4">金色</option>
											<option value="5">橙色</option>
											<option value="6">灰色</option>
											<option value="7">蓝色</option>
											<option value="8">黑色</option>
											<option value="9">卡其色</option>
											<option value="10">混色</option>
											<option value="11">紫色</option>
											<option value="12">粉红色</option>
											<option value="13">银色</option>
											<option value="14">红色</option>
											<option value="15">白色</option>
											<option value="16">浅蓝色</option>
											<option value="17">深蓝色</option>
											<option value="18">绿色</option>
											<option value="19">米黄色</option>
											<option value="20">咖啡色</option>
									</select>
								</td>
								<td class="specification_2 hidden">
									<select name="specification_2" disabled="disabled">
											<option value="21">无</option>
											<option value="22">黄色</option>
											<option value="23">酒红色</option>
											<option value="24">金色</option>
											<option value="25">橙色</option>
											<option value="26">灰色</option>
											<option value="27">蓝色</option>
											<option value="28">黑色</option>
											<option value="29">卡其色</option>
											<option value="30">混色</option>
											<option value="31">紫色</option>
											<option value="32">粉红色</option>
											<option value="33">银色</option>
											<option value="34">红色</option>
											<option value="35">白色</option>
											<option value="36">浅蓝色</option>
											<option value="37">深蓝色</option>
											<option value="38">绿色</option>
											<option value="39">米黄色</option>
											<option value="40">咖啡色</option>
									</select>
								</td>
								<td class="specification_3 hidden">
									<select name="specification_3" disabled="disabled">
											<option value="41">均码</option>
											<option value="42">XXS</option>
											<option value="43">XS</option>
											<option value="44">S</option>
											<option value="45">M</option>
											<option value="46">L</option>
											<option value="47">XL</option>
											<option value="48">XXL</option>
											<option value="49">XXXL</option>
									</select>
								</td>
								<td class="specification_4 hidden">
									<select name="specification_4" disabled="disabled">
											<option value="50">均码</option>
											<option value="51">XXS</option>
											<option value="52">XS</option>
											<option value="53">S</option>
											<option value="54">M</option>
											<option value="55">L</option>
											<option value="56">XL</option>
											<option value="57">XXL</option>
											<option value="58">XXXL</option>
									</select>
								</td>
								<td class="specification_5 hidden">
									<select name="specification_5" disabled="disabled">
											<option value="59">34</option>
											<option value="60">35</option>
											<option value="61">36</option>
											<option value="62">37</option>
											<option value="63">38</option>
											<option value="64">39</option>
											<option value="65">40</option>
											<option value="66">41</option>
									</select>
								</td>
								<td class="specification_6 hidden">
									<select name="specification_6" disabled="disabled">
											<option value="67">36</option>
											<option value="68">37</option>
											<option value="69">38</option>
											<option value="70">39</option>
											<option value="71">40</option>
											<option value="72">41</option>
											<option value="73">42</option>
											<option value="74">43</option>
											<option value="75">44</option>
											<option value="76">45</option>
									</select>
								</td>
							<td>
								<a href="javascript:;" class="deleteSpecificationProduct">[删除]</a>
							</td>
						</tr>
					</tbody></table>
				</td>
			</tr>
		</tbody></table>

		<table class="input">
			<tbody>
				<tr>
					<th>&nbsp;</th>
					<td>
						<input type="submit" class="button" value="确&nbsp;&nbsp;定">
						<input type="button" class="button" value="返&nbsp;&nbsp;回"onclick="location.href='back/product/list.jsp'">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>
