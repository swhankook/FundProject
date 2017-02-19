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
				 	 <input name="name" id="name" value=${map.name } class="form-control"  type="text" >
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

<script type="text/javascript">
	var loanDetail = {
		init : function() {

		}
	}
	$(function() {
		loanDetail.init();
	});
</script>