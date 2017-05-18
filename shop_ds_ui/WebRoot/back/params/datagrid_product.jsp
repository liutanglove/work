<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>

</head>
<body>
<script type="text/javascript">
		var id;
		var name;
		var min;
		var max;
		var ll;
		var amount;
		var desc;
	//工具栏
		var abc = [{
						text:"增加",
						iconCls:'icon-add',
						handler:function(){
									$("#diaPro").dialog({
										title:"增加产品信息",
										width:300,
										height:250,
										href:"${pageContext.request.contextPath}/addProduct_form.jsp"
									});	   	
								}
					},"-",{
						text:"修改",
						iconCls:'icon-edit',
						handler:function(){
									var trs = $("#dgPro").datagrid("getChecked");
									if(trs.length < 1){
										$.messager.show({
											title:"提示",
											msg:"请选择要修改的行！"
										});
									}else if(trs.length > 1){
										$.messager.show({
											title:"提示",
											msg:"修改只能选择一行！"
										});
									}else{
										id = trs[0].id;
										name = trs[0].name;
										min = trs[0].min;
										max = trs[0].max;
										ll = trs[0].ll;
										amount = trs[0].amount;
										desc = trs[0].desc;
										$("#diaPro").dialog({
											title:"修改产品信息",
											width:300,
											height:300,
											href:"${pageContext.request.contextPath}/updateProduct_form.jsp"
										});
									}
							 }
					},"-",{
						text:"删除",
						iconCls:'icon-cut',
						handler:function(){
									var trs = $("#dgPro").datagrid("getChecked");
									var list;
									if(trs.length < 1){
										$.messager.show({
											title:"提示",
											msg:"请选择要删除的行！"
										});
									}else{
										$.messager.confirm("confirm", "确定要删除这"+trs.length+"条数据？", function(r){
											if (r){
												var idStr=",";
												$.each(trs,function(n,value){
													idStr=idStr+value.id+",";
												});
												//console.log(idStr);
												//console.log(idStr);
												$.ajax({
													type:"post",
													url:"${pageContext.request.contextPath}/product/delProduct",
													data:"idStr="+idStr,
													success:function(args){
														if(args == "ok"){
															$.messager.show({
																title:"提示",
																msg:"产品信息删除成功！"
															});
															$("#dgPro").datagrid("load");
														}
													}
												});
											}
										});
									}
							}
					},"-"]
	//分页
			var pag = $("#dgPro");
			pag.datagrid({
				onLoadSuccess:function(){
					pag.datagrid("getPager").pagination({
						beforePageText:'第',
						afterPageText:'页  共{pages}页',
						displayMsg:'从第{from}条 到 第{to}条  共{total}条'
					});
				}
			});
			
</script>
	<table id="dgPro"  class="easyui-datagrid" style="padding:0;width:736px;" 
   				data-options="toolbar:abc,pagination:true,pageList:[2,3,4,5,6,7,8],pageSize:3,url:'${pageContext.request.contextPath}/product/queryAllProduct',title:'产品'">
			<thead>
				<tr>
					 <th data-options="checkbox:true,width:50"></th>
					 <th data-options="field:'id',align:'center',width:100">id</th>
					 <th data-options="field:'name',align:'center',width:100">贷款产品</th>
					 <th data-options="field:'min',align:'center',width:100">起始金额</th>
					 <th data-options="field:'max',align:'center',width:100">截止金额</th>
					 <th data-options="field:'ll',align:'center',width:100">利率</th>
					 <th data-options="field:'amount',align:'center',width:100">还款期限</th>
					 <th data-options="field:'desc',align:'center',width:100">贷款说明</th>
				</tr>
			</thead>
		</table> 
	<div id="diaPro"></div>
</body>
</html>