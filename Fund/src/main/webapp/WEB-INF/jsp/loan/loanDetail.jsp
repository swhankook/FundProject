<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<input type="hidden" id="user" value="${user }">
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
            comSubmit.setUrl("subLoanDelete");
            comSubmit.addParam("IDX", idx);
            comSubmit.submit();

        }
	}
	$(function() {
		loanDetail.init();
	});
</script>