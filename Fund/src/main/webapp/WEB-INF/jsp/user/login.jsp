<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="login-page">
	<div class="form">
		<div class="login-form">
			<input id="email" type="text" placeholder="e-mail 주소"> <input
				id="pwd" type="password" placeholder="비밀번호">
			<button onclick="login.loginAccept();">login</button>
			<p class="message">
				아직 가입하지않았나요? <a href="/user/join">회원가입하기</a>
			</p>
		</div>
	</div>
</div>
<script type="text/javascript">
	var login = {
		init : function() {

		},
		loginAccept : function() {
			var email = $('#email').val()
				, pwd = $('#pwd').val()
				, url = "<c:url value='/user/loginAccept' />?";

			$.post(url, {
				email : email,
				password : pwd
			}, function(data) {

			}).fail(function() {
				alert("error");
			});
		}
	}
	$(function() {
		login.init();
	});
</script>