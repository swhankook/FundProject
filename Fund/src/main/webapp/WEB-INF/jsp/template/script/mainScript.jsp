<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<c:set var="themeJs"><c:url value="/resources/bootstrap/js/" /></c:set>
<c:set var="customJs"><c:url value="/resources/custom/js/" /></c:set>
<script src="http://code.jquery.com/jquery-2.1.4.js"></script>

<!-- Bootstrap core script -->
<script src="${themeJs }bootstrap.min.js"></script>
<%-- <link href="${themeJs }jquery-2.1.1.min.js" rel="stylesheet" /> --%>
<script src="${themeJs }jquery.prettyPhoto.js"></script>
<script src="${themeJs }jquery.isotope.min.js"></script>
<%-- <link href="${themeJs }jquery.prettyPhoto.js" rel="stylesheet" /> --%>
<%-- <link href="${themeJs }jquery.isotope.min.js" rel="stylesheet" /> --%>
<script src="${themeJs }wow.min.js"></script>
<script src="${themeJs }functions.js"></script>

<!-- script 추가. -->
<script src="${customJs }common.js"></script>
<script src="${themeJs }login.js"></script>
<script src="${themeJs }jquery.validate.js"></script>

