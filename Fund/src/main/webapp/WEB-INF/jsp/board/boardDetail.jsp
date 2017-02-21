<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="forum-view">
	 <input id="fm-id" type="hidden" value="13010">
	 <input id="fm-pid" type="hidden" value="628576">
	 <div class="container">
		  <div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<ul class="forum-user-info">
					<li class="user-image tpl-forum-myimage">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40">
							<pattern id="forum-view-image" patternUnits="userSpaceOnUse" width="40" height="40">
								<image x="-10" width="60" height="40" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="//i.addblock.net/member/profile_default.png?_1485763659482" />
							</pattern>
							<polygon fill="url(#forum-view-image)" points="20,0 37,10 37,30 20,40 3,30 3,10" />
						</svg>
					</li>
					<li class="user-info">
						<div class="tpl-forum-name">${map.CREA_ID }</div>
						<div class="tpl-forum-date date">${map.CREA_DTM }</div>
						<div class="tpl-forum-hit hit">HIT:${map.HIT_CNT }</div></li>
					<li class="user-ctrl navbar-right">
						<img id="forum-ctrl" aria-expanded="true" aria-haspopup="true" src="//i.addblock.net/icon/icon-user-ctrl.png" data-toggle="dropdown">
						<ul class="dropdown-menu" aria-labelledby="forum-ctrl">
							<li>
								<a class="tpl-forum-write" href="#this" class="btn" id="update">수정</a>
							</li>
							<li>
								<a class="tpl-forum-delete" href="#this" class="btn" id="delete">삭제</a>
							</li>
						</ul>
					</li>
				</ul>
				<div class="tpl-forum-title"><c:choose>
                            			<c:when test="${row.purpose eq 1}">채무통합</c:when>
                            			<c:when test="${row.purpose eq 2}">고금리 대환대출</c:when>
                            			<c:when test="${row.purpose eq 3}">생활비</c:when>
                            			<c:when test="${row.purpose eq 4}">자동차 구매</c:when>
                            			<c:when test="${row.purpose eq 5}">보증금</c:when>
                            			<c:when test="${row.purpose eq 6}">병원비</c:when>
                            			<c:when test="${row.purpose eq 7}">결혼비용</c:when>
                            			<c:otherwise>관리자에게 문의바랍니다.</c:otherwise>
                            		</c:choose></div>
				<div class="tpl-forum-content">
										<div class="boardWrite">
							<div class="row">
							<form class="form-horizontal mt-75" method="post"  id="writeForm" >
							<fieldset class="write-pannel">
								<div class="form-group row">
									<label class="col-xs-4 control-label" for="purpose">대출목적</label>
									<div class="col-xs-6 selectContainer">
									  	<div class="input-group">
									  		<div id="purpose">
									  		<c:choose>
						              			<c:when test="${map.purpose eq 1}">채무통합</c:when>
						              			<c:when test="${map.purpose eq 2}">고금리 대환대출</c:when>
						              			<c:when test="${map.purpose eq 3}">생활비</c:when>
						              			<c:when test="${map.purpose eq 4}">자동차 구매</c:when>
						              			<c:when test="${map.purpose eq 5}">보증금</c:when>
						              			<c:when test="${map.purpose eq 6}">병원비</c:when>
						              			<c:when test="${map.purpose eq 7}">결혼비용</c:when>
						              			<c:otherwise>관리자에게 문의바랍니다.</c:otherwise>
						              		</c:choose>
						              		</div>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-xs-4 control-label" for="money">희망 대출금액</label>
									<div class="col-xs-6 inputGroupContainer">
							  				<div class="input-group ">
							  					<input name="money" id="money" class="form-control" type="text" dir='rtl' value="${map.money }">
							  					<span class="input-group-addon">만원</span>
							    			</div>
						  			</div>
								</div>
								<div class="form-group row">
									<label class="col-xs-4 control-label" for="period">희망 대출기간</label>
									<div class="col-xs-6 selectContainer">
									  	<div class="input-group">
									  		<div id="period">
									  			${map.period }개월
						              		</div>
										</div>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-xs-4 control-label" for="income">연 소득</label>
									<div class="col-xs-6 inputGroupContainer">
							  				<div class="input-group ">
							  					<input name="income" id="income" class="form-control" type="text" dir='rtl' value="${map.income }">
							  					<div class="input-group-addon">만원</div>
							    			</div>
						  			</div>
								</div>
								<div class="form-group row">
						  			<label class="col-xs-4 control-label" for="name">성명</label>
						    		<div class="col-xs-6 inputGroupContainer">
						   				 <div class="input-group">
										 	 <input name="name" id="name" value="${map.name }" class="form-control"  type="text" >
										  </div>
									 </div>
								</div>
								<div class="form-group row">
						  			<label class="col-xs-4 control-label" for="birthday" >생년월일</label>
						    		<div class="col-xs-6 inputGroupContainer">
						   				 <div class="input-group">
										 	 <input name="birthday" id="birthday" value="${map.birthday }" class="form-control"  type="text" >
										  </div>
									 </div>
								</div>
								<div class="form-group row">
						  			<label class="col-xs-4 control-label"  for="sex">성별</label>
						    		<div class="col-xs-6 radioContainer">
						   				 <div id="sex">
						   				 	${map.sex }
										 </div>
									 </div>
								</div>
								<div class="form-group row">
						  			<label class="col-xs-4 control-label"  for="email">이메일</label>
						    		<div class="col-xs-6 inputGroupContainer">
						   				 <div class="input-group">
										 	 <input name="email" id="email" value="${map.email }" class="form-control"  type="text" >
										  </div>
									 </div>
								</div>
								<div class="form-group row">
						  			<label class="col-xs-4 control-label" for="phone" >휴대폰 번호</label>
						    		<div class="col-xs-6 inputGroupContainer">
						   				 <div class="input-group">
										 	 <input name="phone" id="phone" value="${map.phone }" class="form-control"  type="text" >
										  </div>
									 </div>
								</div>
								<div class="submitButton">
						  			<button class="btn btn-success write-btn" type="button" onclick="boardWrite.loan();">등록하기</button>
								</div>
								<input type="hidden" id="userid" name="USERID" value="${user.email }">
							</fieldset>
							</form>
							</div>
						</div>



				</div>
				<div class="tpl-forum-list-footer">
					<ul class="tpl-page-toolbar" data-page-option="">
				 		<li class="tpl-forum-toolbar-button share">
							<i class="fa fa-share"></i>
						</li>
					</ul>
					<div class="tpl-forum-control-wrap" style="float: right;">
						<button class="btn btn-default btn-round btn-modal btn-list tpl-forum-list" type="button" id="list">
							 <i class="fa fa-bars"> </i>
							 <a href="#this" class="btn" >목록</a>
						</button>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form class="page-comments" id="frm" >
	<div class="container">
		<div class="tpl-comment-form">
			<table class="comment-textarea">
				<tbody>
					<tr>
						<td class="comm-area">
							<input type="hidden" name="brdno" value="<c:out value="${map.IDX}"/>">
							<input type="hidden" name="rewriter" value="<c:out value="${user.email}"/>">
							<textarea class="form-control" name="rememo" id="rememo" placeholder="Write here..." data-autoresize=""></textarea>
							<div class="btn-mobile comment-submit">
								<span class="btn btn-submit btn-round" id="reply"><a href="#this" >댓글</a></span>
							</div>
						</td>
						<td class="form-submit comment-submit">
							<span class="btn btn-submit btn-round" id="reply" ><a href="#this" >댓글</a></span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<ul class="comment-list"></ul>
	</div>
</form>

<script type="text/javascript">
	var boardDetail = {
		init : function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				boardDetail.fn_openBoardList();
			});

			$("#update").on("click", function(e) {
				e.preventDefault();
				boardDetail.fn_openBoardUpdate();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼

                e.preventDefault();
                boardDetail.fn_deleteBoard();

            });
			$("#reply").on("click", function(e){

                e.preventDefault();
                boardDetail.fn_replyBoard();

            });

		},
		fn_openBoardList : function() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardList");
			comSubmit.submit();
		},
		fn_openBoardUpdate : function() {
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("boardUpdate");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		},

		fn_deleteBoard: function(){
			var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("deleteBoard");
            comSubmit.addParam("IDX", idx);
            comSubmit.submit();

        }
	}

	$(function() {
		boardDetail.init();
	});
</script>