<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="register-page">
	<div class="form">
		회원가입
		<div class="register-form">
			<input id="email" type="text" placeholder="e-mail"> <input
				id="pwd" type="password" placeholder="비밀번호"> <input
				id="pwdCheck" type="password" placeholder="비밀번호  확인">
			<button onclick="join.loginCheck();">가입</button>
			<p class="message">
				이미 가입하셨나요? <a href="/user/login">Log In</a>
			</p>
		</div>
	</div>
</div>
<script type="text/javascript">
var join = {
	init : function() {

	},
	loginCheck : function() {
		var email = $('#email').val()
			, pwd = $('#pwd').val()
			, pwdCheck = $('#pwdCheck').val()
			, url = "<c:url value='/user/loginCheck.json' />?";

		$.post(url, {email:email, password:pwd, passwordCheck:pwdCheck}, function(data){
			console.log(status);
			if (data.status == 1) {
				alert('이메일이 이미 존재합니다.다른 이메일로 해주세요.');
				return;
			}
			alert('로그인되었습니다.');
        }).fail(function() {
        	console.log(data.status);
        	alert( "회원가입이 실패하였습니다. 관리자에게 문의하세요." );
        });
	}
}
$(function() {
	join.init();
});
</script>