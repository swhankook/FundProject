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

				<div class="navbar-collapse collapse ">
					<div class="menu">
						<ul class="nav nav-tabs drop-menu" role="tablist">
							<li role="presentation"><a href="/sample/boardList" class="active">Home</a></li>
							<li role="presentation"><a href="/board/boardWrite">대출받기</a></li>
							<c:if test="${not empty user && user.type eq 'company'}">
								<li role="presentation"><a href="/board/boardList">대출확인</a></li>
							</c:if>							
							<c:choose>
								<c:when test="${not empty user && user.type eq 'company'}">									
										<li role="presentation" ><a href="#" onclick="header.logout();">로그아웃</a></li>					
								</c:when>
								<c:when test="${not empty user && user.type eq 'user'}">									
										<li role="presentation"><a href="#">마이페이지</a>
											
												<ul>
													<li role="presentation" ><a href="#" onclick="header.logout();">로그아웃</a></li>
													<li role="presentation" ><a href="#" onclick="header.logout();">로그아웃</a></li>
													
												</ul>
											
										</li>					
								</c:when>							
								<c:otherwise>
								<li role="presentation"><a href="/user/join">회원가입</a></li>
								<li role="presentation"><a href="/user/login">로그인</a></li>
								</c:otherwise>
							</c:choose>
							
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
</header>
<script type="text/javascript">
	var header = {
		init : function() {	
			$(function(){
				$(document).mouseup(function(e) {
					if ($(e.target).parents('.drop-menu').length == 0) {
						$('.drop-menu li').removeClass('expand');
						$('.drop-menu ul').hide();
					}
				});
				$(".drop-menu>li:has(ul)>a").each( function() {
					$(this).html( $(this).html()+' &or;' );
				});
				$(".drop-menu ul li:has(ul)")
					.find("a:first")
					.append("<p style='float:right;margin:0px'>&#9656;</p>");

				$(".drop-menu li>a").click(function(){
					var li = $(this).parent();
					var ul = li.parent()
					ul.find('li').removeClass('expand');
					ul.find('ul').not(li.find('ul')).hide();
					li.children('ul').toggle();
					if( li.children('ul').is(':visible') || li.has('ul')) {
						li.addClass('expand');
					}
				});
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
		header.init();
	});
</script>