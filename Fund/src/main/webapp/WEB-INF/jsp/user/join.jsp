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
			, url = "<c:url value='/user/loginCheck' />?";

		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		if ( !email ) {
            alert('이메일주소를 입력 해 주세요');
            $('#email').focus();
            return false;
        } else {
            if(!regEmail.test(email)) {
                alert('이메일 주소가 유효하지 않습니다');
                $('#email').focus();
                return false;
            }
        }

		if (!pwd) {
			alert('비밀번호를 입력해주세요.');
            $('#pwd').focus();
            return false;
		} else if (!pwdCheck) {
			alert('비밀번호 확인을 입력해주세요.');
            $('#pwdCheck').focus();
            return false;
		} else {
			if(pwd !== pwdCheck) {
				alert('비밀번호가 다릅니다. 다시 입력해주세요.');
				$('#pwd').val("");
	            $('#pwdCheck').val("");
	            $('#pwd').focus();
	            return false;
			}
		}

		$.ajax({
			url: url,
			type:"post",
			data:{email:email, password:pwd, passwordCheck:pwdCheck},
			datatype:"json",
			success:function(data) {
				if (data.status == 1) {
					alert("등록된 이메일이 있습니다. 다른이메일로 등록해주세요.");
				} else if (data.status == 0) {
					alert("회원가입이 완료되었습니다. 로그인해주세요.");
					window.location.href = "/user/login";
				}
			},error:function(request, status, error){
				console.log(request, status, error)
			}
		});
	}
}
$(function() {
	join.init();
});
</script>