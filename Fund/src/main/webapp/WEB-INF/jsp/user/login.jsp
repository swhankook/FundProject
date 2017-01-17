<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="login-page">
	<div class="form">
		<form class="login-form">
			<input type="text" placeholder="e-mail 주소"> <input
				type="password" placeholder="비밀번호">
			<button>login</button>
			<p class="message">
				아직 가입하지않았나요? <a href="/user/join">회원가입하기</a>
			</p>
		</form>
	</div>
</div>