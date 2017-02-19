<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello Millky</title>
<link rel="stylesheet" href="<c:url value="/webjars/jquery-ui/1.12.1/jquery-ui.theme.min.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/webjars/jquery-ui/1.12.1/jquery-ui.min.css" />" type="text/css" />
<link rel="stylesheet" href="<c:url value="/webjars/jqgrid/4.7.0/css/ui.jqgrid.css" />" type="text/css" />
<script src="/webjars/jquery/3.1.1-1/jquery.min.js"></script>
<script src="/webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script src="/webjars/jqgrid/4.7.0/js/i18n/grid.locale-en.js"></script>
<script src="/webjars/jqgrid/4.7.0/js/i18n/grid.locale-kr.js"></script>
<script src="/webjars/jqgrid/4.7.0/js/jquery.jqGrid.js"></script>
<script>
var contextPath = "${pageContext.request.contextPath}";
var gridPath = "${pageContext.request.contextPath}/grid/gridList.do?ACTION=";
var gridEditPath = "${pageContext.request.contextPath}/gridEdit/";
var language = '${currentLocaleLanguage}';

$(document).ready(function() {
	var dialog;
	var lastsel;
	
	$("#jqgrid").html('<table id="grid"></table><div id="pager"></div>');
	$("#grid").jqGrid({
		url: '/grid/selectCityById.do',
		editurl : '/gridedit/selectCityById.do',
		datatype: 'json',
			colNames:['ID',
			          'COUNTRY',
			          'STATE',
			          'name'
			          ],
			colModel:[
				{title:false, name:'ID',	index:'ID', 	key:true, editable:false, hidden:false, width: 150},
				{title:false, name:'STATE',	index:'STATE', 	editable:true, width: 210},
				{title:false, name:'COUNTRY',			index:'COUNTRY', 			editable:true, width: 210},
				{title:false, name:'NAME',			index:'NAME', 			editable:true, width: 230},
			],
		sortname: 'COUNTRY', sortorder: "asc", rowNum:25, height:"100%", width:738, scrollOffset:0, 
		viewrecords:true, emptyrecords: "dsdss is empty",
		loadComplete: function() {
			$("#grid").jqGrid ('setLabel', 'COUNTRY', '', {'text-align':'left'});
			$("#grid").jqGrid ('setLabel', 'STATE', '', {'text-align':'left'});
			$("#grid").jqGrid ('setLabel', 'NAME', '', {'text-align':'left'});
		},
		onSelectRow: function(id) {
			dialog.dialog( "open" );

			//alert(id);
			if(id && id!==lastsel){
				$('#grid').jqGrid('restoreRow',lastsel);
				$('#grid').jqGrid('editRow',id,true);
				lastsel=id;
			}
		},
		pager: '#pager',
		rowNum : 10,
		multiselect: false,
		jsonReader : {
			root: "rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			cell: "cell",
			id: "ID"
		}
	});
	
	dialog = $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      buttons: {
	        //"Create an account": addUser,
	        Cancel: function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
	        //form[ 0 ].reset();
	        $("#form")[0].reset();
			//allFields.removeClass( "ui-state-error" );
	      }
	    });
});

</script>
</head>
<body>

	<div id="jqgrid">
		<table id="grid"></table>
		<div id="pager"></div>
	</div>

	<div id="dialog-form" title="Create new user">
		<p class="validateTips">All form fields are required.</p>
	 
		<form id="form">
			<fieldset>
			<label for="name">Name</label>
			<input type="text" name="name" id="name" value="Jane Smith" class="text ui-widget-content ui-corner-all">
			<label for="email">Email</label>
			<input type="text" name="email" id="email" value="jane@smith.com" class="text ui-widget-content ui-corner-all">
			<label for="password">Password</label>
			<input type="password" name="password" id="password" value="xxxxxxx" class="text ui-widget-content ui-corner-all">
		
			<!-- Allow form submission with keyboard without duplicating the dialog button -->
			<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
			</fieldset>
		</form>
	</div>

</body>
</html>