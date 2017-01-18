<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<c:set var="themeJs"><c:url value="/resources/bootstrap/js/" /></c:set>
<c:set var="customJs"><c:url value="/resources/custom/" /></c:set>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>

<!-- Bootstrap core script -->
<link href="${themeJs }bootstrap.min.js" rel="stylesheet" />
<%-- <link href="${themeJs }jquery-2.1.1.min.js" rel="stylesheet" /> --%>
<%-- <link href="${themeJs }jquery.prettyPhoto.js" rel="stylesheet" /> --%>
<%-- <link href="${themeJs }jquery.isotope.min.js" rel="stylesheet" /> --%>
<link href="${themeJs }wow.min.js" rel="stylesheet" />
<link href="${themeJs }functions.js" rel="stylesheet" />

<!-- script 추가. -->
<%-- <link href="${customJs }common.js" rel="stylesheet" /> --%>
<link href="${themeJs }login.js" rel="stylesheet" />
