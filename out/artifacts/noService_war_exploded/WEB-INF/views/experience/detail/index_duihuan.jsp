<%@page import="com.suyin.experience.model.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common_resource.jsp" %>
<html>
  <head>
  </head>
  <body id="search" class="easyui-layout"  >   
	<div id="tool">
	  		<a href="#" class="easyui-linkbutton" onclick="doAdd();" data-options="iconCls:'icon-add'">添加</a>
	  		<a href="#" class="easyui-linkbutton" onclick="doUpdate();" data-options="iconCls:'icon-edit'">修改</a>
			<a href="#" class="easyui-linkbutton" onclick="doDelete();" data-options="iconCls:'icon-remove'">删除</a>
	</div>
	<div id="mydatagrid" fit="true"></div>
	<input type="hidden" value="${expId }" id="expId"/>
</body>
<script type="text/javascript">
$(function() {
	$('#mydatagrid').datagrid({
		fitColumns : true,
		url : "<c:url value='/expdetail/list?expId=${expId }'/>",
		method : "POST",
		pageSize :10, 
		pageList : [10,20,50],
		columns : [[
			{ "field":'expDetailId',checkbox:true },
					    { "field": 'busname',"title" : '所属商家',width:$(this).width() * 0.2}, 					  
					    { "field": 'proname',"title" : '产品名称',width:$(this).width() * 0.2},
					    { "field": 'proNum',"title" : '活动详情数量',width:$(this).width() * 0.2},
					    { "field": 'integral',"title" : '兑换所需金币',width:$(this).width() * 0.2},
						{ "field": 'validity',"title" : '券的到期时间',width:$(this).width() * 0.2}, 
					    { "field": 'addDay',"title" : '几天后过期',width:$(this).width() * 0.2},
					    { "field": 'seqNo',"title" : '排序',width:$(this).width() * 0.2},
						{ "field": 'createTime',"title" : '创建时间',width:$(this).width() * 0.2},
						{ "field": 'updateTime',"title" : '更新时间',width:$(this).width() * 0.2},
		]],
		toolbar :'#tool',
		pagination : true,
		rownumbers : true
	});
});

function serchGrid(){
	var queryParams = {directoryName:$("#directoryName").val()};
	$('#mydatagrid').datagrid("load",queryParams); 
}
function doAdd(){
	window.location.href="<c:url value='/expdetail/jumpAddDuihuan?expId=${expId }'/>";
}
function doUpdate(){
	var rows=$("#mydatagrid").datagrid("getSelections");
	if(rows.length!=1){
		$.messager.alert("", "请选择一条数据！", true, "warning");
		return;
	}
	window.location.href="<c:url value='/expdetail/jumpEditDuihuan?id="+rows[0].expDetailId+"'/>";
}
function doDelete(){
	var rows=$("#mydatagrid").datagrid("getSelections");
	if(rows.length==0){
		$.messager.alert("", "请选择数据！", true, "warning");
		return;
	}
	var ids = [];
	for(var i=0; i<rows.length; i++){
		ids.push(rows[i].expDetailId);

	}
	$.messager.confirm('确认', '是否确定要删除!', function(r){
		if(!r){
			return;
		}
		$.post(SITE_BASE_PATH+'expdetail/delete?', {id: ids.join(',')},function(data){
			if(data.result > 0){
				for ( var i = rows.length-1; i >=0; i--) {
				var index = $('#mydatagrid').datagrid('getRowIndex', rows[i]);
					$('#mydatagrid').datagrid('deleteRow', index);
				}
				rows = null;
				systemShow("系统提示","数据删除成功!");
			}
		},"json");	
	}, null);	
}
</script>  
</html>