<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<header>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target=".navbar-collapse.collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="navbar-brand">
						<a href="/"><h1>
								<span>Com</span>pany
							</h1></a>
					</div>
				</div>

				<div class="navbar-collapse collapse">
					<div class="menu">
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation"><a href="/sample/boardList" class="active">Home</a></li>
							<li role="presentation"><a href="/loan/list">대출받기</a></li>
							<li role="presentation"><a href="/loan/check">대출확인</a></li>
							<li role="presentation"><a href="/user/join">회원가입</a></li>
							<li role="presentation"><a href="/user/login">로그인</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>