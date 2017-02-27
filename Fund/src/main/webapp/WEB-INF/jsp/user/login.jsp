<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="login-page">
	<div class="form">
		<div class="login-form">
		
				<input id="email" type="text" placeholder="e-mail 주소"> 
				<input id="pwd" type="password" placeholder="비밀번호">
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
			$('#email').keydown(function(e){
				if(e.which ==13){ 
					e.preventDefault();
					login.loginAccept();
					
				}
			});
			$('#pwd').keydown(function(e){
				if(e.which ==13){ 
					e.preventDefault();
					login.loginAccept();
					
				}
			});
		},
		loginAccept : function() {
			var email = $('#email').val()
				, pwd = $('#pwd').val()
				, url = "<c:url value='/user/loginAccept' />?";

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
			}

			$.ajax({
				url: url,
				type:"post",
				data:{email:email, password:pwd},
				datatype:"json",
				success:function(data) {
					if (data.status == 1) {
						alert("비밀번호가 다릅니다. 다시입력해주세요.");
						$('#pwd').val("");
						$('#pwd').focus();
					} else if (data.status == 0) {
						alert("로그인 성공. 홈으로 이동합니다.");
						window.location.href = "/board/loanList";
					}
				},error:function(request, status, error){
					console.log(request, status, error)
				}
			});
		},
		
	}
	$(function() {
		login.init();
	});
</script>