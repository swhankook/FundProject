<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<input type="hidden" id="user" value="${user }">
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
				<div class="tpl-forum-title"></div>
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
              			<c:when test="${map.PURPOSE eq 1}">채무통합</c:when>
              			<c:when test="${map.PURPOSE eq 2}">고금리 대환대출</c:when>
              			<c:when test="${map.PURPOSE eq 3}">생활비</c:when>
              			<c:when test="${map.PURPOSE eq 4}">자동차 구매</c:when>
              			<c:when test="${map.PURPOSE eq 5}">보증금</c:when>
              			<c:when test="${map.PURPOSE eq 6}">병원비</c:when>
              			<c:when test="${map.PURPOSE eq 7}">결혼비용</c:when>
              			<c:otherwise>관리자에게 문의바랍니다.</c:otherwise>
              		</c:choose>
              		</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-xs-4 control-label" for="money">희망 대출금액</label>
			<div class="col-xs-6 inputGroupContainer">
  				<div class="input-group">
  					<input name="money" id="money" disabled="disabled" class="form-control" type="text" dir='rtl' value="${map.MONEY }">
  					<span class="input-group-addon">만원</span>
    			</div>
  			</div>
		</div>
		<div class="form-group row">
			<label class="col-xs-4 control-label" for="period">희망 대출기간</label>
			<div class="col-xs-6 selectContainer">
			  	<div class="input-group">
			  		<div id="period">
			  			${map.PERIOD }개월
              		</div>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-xs-4 control-label" for="income">연 소득</label>
			<div class="col-xs-6 inputGroupContainer">
	  				<div class="input-group ">
	  					<input name="income" disabled="disabled" id="income" class="form-control" type="text" dir='rtl' value="${map.INCOME }">
	  					<div class="input-group-addon">만원</div>
	    			</div>
  			</div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="name">성명</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="name" id="name" value="${map.NAME }" disabled="disabled" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="birthday" >생년월일</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="birthday" id="birthday" value="${map.BIRTHDAY }" disabled="disabled" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="sex">성별</label>
    		<div class="col-xs-6 radioContainer">
   				 <div id="sex">
   				 	${map.SEX }
				 </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label"  for="email">이메일</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="email" id="email" disabled="disabled" value="${map.EMAIL }" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="phone" >휴대폰 번호</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="phone" id="phone" value="${map.PHONE }" disabled="disabled" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
	</fieldset>
	</form>
	</div>
	</div>
				<div class="tpl-forum-list-footer">				
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
	<c:if test="${fn:length(list) > 0}">
	<c:forEach var="row" items="${list}" varStatus="status">
	<div class="tpl-comment-form">
		<table class="comment-textarea">
			<tbody>
				<tr>
					<td class="comm-area">
						<input type="hidden" name="IDX" id="IDX" value="${row.IDX}">
						<input type="hidden" id="userid" name="USERID" value="${row.CREA_ID }">
						
						<textarea class="form-control" disabled="disabled" id="CONTENTS" name="CONTENTS" data-autoresize="">${row.CONTENTS }</textarea>
						<span class="cm-update cm-controls pull-right" style="display: inline;" ><i class="fa fa-pencil"></i><a id="update" href="#this"> 수정</a></span>
						<span class="cm-delete cm-controls pull-right" style="display: inline;" ><i class="fa fa-trash-o"></i><a id="delete" href="#this"> 삭제</a></span>
						
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</c:forEach>
	</c:if>
	<form class="page-comments" id="sub_frm" >
	<div class="container">
		<div class="tpl-comment-form">
			<table class="comment-textarea">
				<tbody>
					<tr>
						<td class="comm-area">
							<input type="hidden" name="PARENT_IDX" id="PARENT_IDX" value="${map.IDX}">
							<input type="hidden" id="userid" name="USERID" value="${user.email }">
							<textarea class="form-control" id="CONTENTS" name="CONTENTS" placeholder="Write here..." data-autoresize=""></textarea>
							<div class="btn-mobile comment-submit">
								<button class="btn btn-submit btn-round" id="reply" type="button" onclick="loanDetail.subLoan();">댓글</button>
							</div>
						</td>
						<td class="form-submit comment-submit">
							<button class="btn btn-submit btn-round" id="reply" type="button" onclick="loanDetail.subLoan();">댓글</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
	</form>
</div>

<script type="text/javascript">
	var loanDetail = {
		init : function() {
			$("#update").on("click", function(e) {
				e.preventDefault();
				loanDetail.fn_openBoardUpdate();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
                e.preventDefault();
                loanDetail.fn_deleteBoard();

            });
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				boardDetail.fn_openBoardList();
			});

		},
		subLoan:function() {
			var comSubmit = new ComSubmit("sub_frm")
	    	, url = "subLoanWrite";
		    comSubmit.setUrl(url);
		    comSubmit.submit();
		},
		fn_openBoardUpdate : function() {
		
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("subLoanUpdate");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		},

		fn_deleteBoard: function(){
			var idx = "${map.IDX}";
            var comSubmit = new ComSubmit();
            if
            comSubmit.setUrl("subLoanDelete");
            comSubmit.addParam("IDX", idx);
            comSubmit.submit();
        },
        fn_openBoardList : function() {
        	
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("loanList");
			comSubmit.submit();
		}
	}
	$(function() {
		loanDetail.init();
	});
</script>
