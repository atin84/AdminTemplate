<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%--
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
--%>
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
$(document).ready(function() {
	var cookieValue = getCookie('language');
	if(cookieValue.toUpperCase() == 'KO' || cookieValue.toUpperCase() == 'KR' || 
			cookieValue.toUpperCase() == 'KO_KR') {
		$("#setLocale").val('ko');
	}
	else if(cookieValue.toUpperCase() == 'EN' || cookieValue.toUpperCase() == 'US' ||
			cookieValue.toUpperCase() == 'EN_US'){
		$("#setLocale").val('en');
	}
	else {
		$("#setLocale").val('en');
	}

	//multiAccessControl();
	//$("#USERID").focus();
});

function getCookie(name) {
	var Found = false;
	var start;
	var end;
	var i = 0;

	while (i <= document.cookie.length) { 
		start = i ;
		end = start + name.length ;

		if(document.cookie.substring(start, end) == name) { 
			Found = true ;
			break ;
		} 
		i++ ;
	} 

	if(Found == true) { 
		start = end + 1 ;
		end = document.cookie.indexOf(';', start) ;

		if(end < start) 
			end = document.cookie.length ;

		return document.cookie.substring(start, end) ;
	} 

	return false ;
}

function selectLocale(selectObj) {
	if (selectObj.value == 'ko') {
		//window.location = '/locale/change.do?lang=kr';
		window.location = '/login.do?lang=kr';
	} else {
		//window.location = '/locale/change.do?lang=en';
		window.location = '/login.do?lang=en';
	}
}

</script>
</head>
<body>
	<select name="setLocale" style="width:176px" id="setLocale" class="wide" onchange="javascript:selectLocale(this)">
		<option value="ko"><spring:message code="ADMIN_LANGUAGE_KOREAN" /></option>
		<option value="en"><spring:message code="ADMIN_LANGUAGE_ENGLISH" /></option>
	</select>

</body>
</html>