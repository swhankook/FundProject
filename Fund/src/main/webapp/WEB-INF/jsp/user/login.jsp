<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="login-page">
	<div class="form">
		<div class="login-form">
		<c:choose>
			<c:when test="${not empty user }">
				<div>이미 로그인되어있습니다.</div>
				<button onclick="login.logout();">로그아웃</button>
			</c:when>
			<c:otherwise>
				<input id="email" type="text" placeholder="e-mail 주소"> <input
					id="pwd" type="password" placeholder="비밀번호">
				<button onclick="login.loginAccept();">login</button>
				<p class="message">
					아직 가입하지않았나요? <a href="/user/join">회원가입하기</a>
				</p>
			</c:otherwise>
		</c:choose>
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
						window.location.href = "/sample/boardList";
					}
				},error:function(request, status, error){
					console.log(request, status, error)
				}
			});
		},
		logout:function() {
			var url = "<c:url value='/user/logout' />?";
			$.ajax({
				url: url,
				type:"post",
				datatype:"json",
				success:function(data) {
					if (data.status == 0) {
						alert("로그아웃 성공 로그인페이지로 이동합니다.");
						window.location.href = "/user/login";
					}
				},error:function(request, status, error){
					console.log(request, status, error)
				}
			});
		}
	}
	$(function() {
		login.init();
	});
</script>