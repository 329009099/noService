
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="../../common_resource.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="stylesheet" charset="utf-8" href="<c:url value='/resources/js/kindeditor/themes/default/default.css'/>" />
  <link href="<c:url value='/resources/js/My97DatePicker/skin/WdatePicker.css'/>" rel="stylesheet" type="text/css" />
  <script src="<c:url value='/resources/js/My97DatePicker/WdatePicker.js'/>"></script>
  </head>
  <body >   
	<div class="easyui-panel" title="<c:if test='${entity!=null }'>编辑</c:if><c:if test='${entity==null }'>添加</c:if>"   style="padding:10px;">
		<div style="padding:10px 10px 10px 10px">
	    <form id="dataForm"  method="post">
	    	<table cellpadding="3">
	    	<c:if test='${entity!=null }'><input type="hidden" name="advId" value="${entity.advId }"/></c:if>
	    	<c:if test='${entity==null }'><input type="hidden" name="advId" value="-1"/></c:if>
	    		<tr>
	    			<td>名称:
	    			</td>
	    				<td><input class="easyui-validatebox" 
	    				type="text" style="width:300px;height:30px;"  
	    			    name="advName"
	    			    value="${entity.advName}"
	    			    maxlength="200"
	    			    ></input></td>
	    		</tr>
	    		<tr>
	    			<td>图片:
	    			</td>
	    				<td style="position: relative; height:64px;">
	    				<img id="img" style="position: absolute; top:2px; left:2px; z-index: 100;" width="120" height="60" src="${entity.picUrl }"/>
	    				<input style="position: absolute; top:0px; left:0px; width:120px;
	    				 height:60px; z-index: -1;" id="image" name="picUrl" value="${entity.picUrl}" 
	    				 class="easyui-validatebox" 
	    				 data-options="required:true" 
	    				 missingMessage="请选择一个图片"
	    				 ></input>
	    				<input type="button" id="imgButton" class="easyui-linkbutton"   style="width:70px;height:25px;float:right;margin-right: 280px;"  value="上传"/>
	    			 </td>
	    		</tr>
	    		<tr>
	    			<td>链接地址:
	    			</td>
	    				<td><input class="easyui-validatebox" 
	    				type="text" style="width:300px;height:30px;"  
	    			    name="linkUrl"   
	    			    value="${entity.linkUrl}"
	    			    maxlength="200"
	    			    ></input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>顺序:
	    			</td>
	    				<td><input class="easyui-numberbox" 
	    				type="text" style="width:300px;height:30px;"  
	    			    name="picIndex"   data-options="required:true" 
	    			    value="${entity.picIndex}" 
	    			    missingMessage="填个顺序吧(在 1～100之间)"
	    			    min="1" max="100"
	    			    ></input></td>
	    		</tr>
	    		<tr>
	    			<td>类型:
	    			</td>
	    				<td>
	    			    <select style="width:300px;height:30px;" id="type"  name="type" value="${entity.type }">
	    			    	
	    			    	<option value="0" <c:if test="${entity.type==0 }"> selected="selected"</c:if> >首页广告</option>	    			    	
	    			    	<option value="1" <c:if test="${entity.type==1 }"> selected="selected"</c:if> >全民赚</option>
	    			    	<option value="2" <c:if test="${entity.type==2 }"> selected="selected"</c:if> >齐心赚</option>
	    			    	<option value="3" <c:if test="${entity.type==3 }"> selected="selected"</c:if> >抽奖式</option>
	    			    	<option value="4" <c:if test="${entity.type==4 }"> selected="selected"</c:if> >人气式</option>
	    			    	<option value="5" <c:if test="${entity.type==5 }"> selected="selected"</c:if> >试用式</option>
	    			    	<option value="6" <c:if test="${entity.type==6 }"> selected="selected"</c:if> >兑换式</option>
	    			    </select>
	    			    </td>
	    		</tr>
	    		
	    		
	    		<tr>
	    			<td>活动id:</td>
	    			<td>
	    				<input class="easyui-numberbox" type="text" style="width:300px;height:30px;"  name="expId"   data-options="required:true" value="${entity.expId}"  missingMessage="输入数字" min="1" max="99999999"></input><span style="color:gray;">(首页广告请输入0)</span>
	    			</td>
	    		</tr>
	    		
	    		
	    		<tr>
	    		<td>客户端类型:</td>	    		
	    		<td>	
	    			<input type="hidden" name="clientType"/>
	    			<c:if test="${fn:contains(entity.clientType, 0)}">
        				<input name="clientT" type="checkbox" class="easyui-validatebox checkbox" checked="checked" value="0">
        			</c:if>
					<c:if test="${!fn:contains(entity.clientType, 0)}">
        				<input name="clientT" type="checkbox" class="easyui-validatebox checkbox" value="0">
        			</c:if>
        			微信
        			<c:if test="${fn:contains(entity.clientType, 1)}">
        				<input name="clientT" type="checkbox" class="easyui-validatebox checkbox" checked="checked" value="1">
        			</c:if>
					<c:if test="${!fn:contains(entity.clientType, 1)}">
        				<input name="clientT" type="checkbox" class="easyui-validatebox checkbox" value="1">
        			</c:if>
        			ios
        			<c:if test="${fn:contains(entity.clientType, 2)}">
        				<input name="clientT" type="checkbox" class="easyui-validatebox checkbox" checked="checked" value="2">
        			</c:if>
					<c:if test="${!fn:contains(entity.clientType, 2)}">
        				<input name="clientT" type="checkbox" class="easyui-validatebox checkbox" value="2">
        			</c:if>
        			android        			
	    		</td>
	    		</tr>
	    		
	    		
	    		<tr>
	    			<td>广告描述:
	    			</td>
	    				<td>
	    					<textarea>${entity.description }</textarea>
	    				</td>
	    		</tr>
    		<tr>
    			<td colspan="2" align="center"> 
    			<a href="javascript:void(0)" class="easyui-linkbutton" 
    			 style="width:100px;height:30px;" onclick="submitForm()">提交</a>
    			<a href="javascript:void(0)" class="easyui-linkbutton" 
    			 style="width:100px;height:30px;" onclick="clearForm()">清空</a>
    			</td>
    		</tr>	    
    		<input type="hidden" name="allImages" id="allImages" value=""/>	
	    	</table>
	    </form>
	    </div>
	</div>
  <link href="<c:url value='/resources/js/kindeditor/themes/default/default.css'/>" rel="stylesheet" type="text/css" />
  <script src="<c:url value='/resources/js/kindeditor/kindeditor-min.js'/>"></script>
  <script>
  	  var editor;
	  KindEditor.ready(function(K) {
			editor = K.create('textarea',{
				uploadJson : '<c:url value="/file/upload"/>',
				fileManagerJson : '<c:url value="/file/fileManager"/>',
				filePostName:"imgFile",
				allowFileManager : false,
				height:500,
				//items:['source', '|', 'undo', 'redo','|', 'cut', 'copy', 'paste','|','formatblock', 'fontname', 'fontsize','|','image'],
			    extraFileUploadParams : {
			    	module :"advs"
	          }
			});
			K('#imgButton').click(function() {
				editor.loadPlugin('image', function() {
					editor.plugin.imageDialog({
						clickFn : function(url, title, width, height, border, align) {
							K('#image').val(url);
							K("#img").attr("src",url);
							editor.hideDialog();
						}
					});
				});
			});
		});
	  
  </script>
 	<script>
		function submitForm(){
			var url="<c:url value='/advs/add?'/>";
			if('${entity.advId}'){
				url="<c:url value='/advs/update?'/>";
			}
			var isValid = $("#dataForm").form('validate');
			if(!isValid){
				return false;
			}
			
			
			var clientType="";
			$("input[name='clientT']:checked").each(function(){
				clientType+=$(this).val()+",";
			});
			
			$("input[name='clientType']").val(clientType);
			if(clientType==''){
				 $.messager.alert("操作提示","请至少选择一种客户端类型");
				 return false;
			}
			$.ajax({
				type : 'POST',
				url : url,
				data : {
					"advId" : $("input[name = 'advId']").val(),
					"advName" : $("input[name = 'advName']").val(),
					"picUrl" : $("input[name = 'picUrl']").val(),
					"linkUrl" : $("input[name = 'linkUrl']").val(),
					"picIndex" : $("input[name = 'picIndex']").val(),
					"type" : $("#type  option:selected").val(),
					"expId" : $("input[name = 'expId']").val(),
					"clientType" : clientType,
					"description" : editor.html()
				},
				dataType : "json",
				success: function(data) {
	                   if(data.result>0){
	                	   $.messager.alert("操作提示", "提交成功！", "info", function () {
	                		   window.location.href="<c:url value='/advs/index/'/>";
	                       });
	       
	                   }else{
	                	   $.messager.alert("操作提示","提交失败!");
	                   }
	            }
			});
		}
		function clearForm(){
			$('#dataForm').form('reset');
		}
	</script>
</body>
</html>
