<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<c:set var="themeJs"><c:url value="/resources/bootstrap/js/" /></c:set>
<c:set var="customJs"><c:url value="/resources/custom/" /></c:set>

<!-- Bootstrap core script -->
<link href="${themeJs }bootstrap.min.js" rel="stylesheet" />
<link href="${themeJs }jquery-2.1.1.min.js" rel="stylesheet" />
<link href="${themeJs }jquery.prettyPhoto.js" rel="stylesheet" />
<link href="${themeJs }jquery.isotope.min.js" rel="stylesheet" />
<link href="${themeJs }wow.min.js" rel="stylesheet" />
<link href="${themeJs }functions.js" rel="stylesheet" />

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="//d3js.org/d3.v3.min.js" charset="utf-8"></script>
<!-- script 추가. -->
<link href="${customJs }common.js" rel="stylesheet" />
<link href="${themeJs }login.js" rel="stylesheet" />
