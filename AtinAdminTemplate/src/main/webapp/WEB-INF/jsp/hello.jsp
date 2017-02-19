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
	$("#jqgrid").html('<table id="grid"></table><div id="pager"></div>');
	
	$("#grid").jqGrid({
		url: '/grid/selectCityById.do',
		//editurl : gridEditPath + 'wifiInfo.do',
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
		pager: '#pager',
		rowNum : 10,
		multiselect: true,
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
});

</script>
</head>
<body>

	<div id="jqgrid">
		<table id="grid"></table>
		<div id="pager"></div>
	</div>
		
</body>
</html>