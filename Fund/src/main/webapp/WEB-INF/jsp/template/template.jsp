<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<html lang="kr">

<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="css" />
</head>

<body>
	<section id="container">
		<tiles:insertAttribute name="scripts" />
		<!-- header start -->
		<tiles:insertAttribute name="header" />
		<!-- header end -->
		<!-- menu start -->
		<tiles:insertAttribute name="menu" />
		<!-- menu end -->
		<!-- main content start -->
		<section id="main-content" style="top: 75px; left: 0px; right: 0px; bottom: 80px; position: absolute; overflow: auto;">
			<section class="wrapper">
				<tiles:insertAttribute name="content" />
			</section>
		</section>
		<!-- main content end -->
		<!-- footer start -->
		<section id="footer" style="bottom: 0px; position: absolute; width: 100%;">
			<tiles:insertAttribute name="footer" />
		</section>
		<!-- footer end -->
	</section>
</body>


</html>