<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<input type="hidden" id="user" value="${user }">
<div class="boardWrite">
	<div class="row">
	<form class="form-horizontal mt-75" id="write" action="" method="post" id="">
	<fieldset class="write-pannel">
		<div class="form-group">
			<label class="col-xs-4 control-label">대출목적</label>
			<div class="col-xs-8 selectContainer">
			  	<div class="input-group">
				    <select name="purpose" id="purpose" class="form-control" >
					      <option value="" >선택해 주세요</option>
					      <option value="1">채무통합</option>
					      <option value="2">고금리 대환대출</option>
					      <option value="3">생활비</option>
					      <option value="4">자동차 구매</option>
					      <option value="5">보증금</option>
					      <option value="6">병원비</option>
					      <option value="7">결혼비용</option>
				    </select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-4 control-label">희망 대출금액</label>
			<div class="col-xs-8 inputGroupContainer">
				<div class="form-inline">
	  				<div class="input-group">
	  					<input name="money" id="money" placeholder="1000" class="form-control money" type="text" dir='rtl'>
	  					<div class="input-group-addon">만원</div>
	    			</div>
    			</div>
  			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-4 control-label">희망 대출기간</label>
			<div class="col-xs-8 selectContainer">
			  	<div class="input-group">
				    <select name="period" name="period" class="form-control" >
					      <option value="6">6개월</option>
					      <option value="12">12개월</option>
					      <option value="18">18개월</option>
					      <option value="24">24개월</option>
					      <option value="30">30개월</option>
				    </select>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-xs-4 control-label">연 소득</label>
			<div class="col-xs-8 inputGroupContainer">
				<div class="form-inline">
	  				<div class="input-group">
	  					<input name="income" id="income" placeholder="1000" class="form-control money" type="text" dir='rtl'>
	  					<div class="input-group-addon">만원</div>
	    			</div>
    			</div>
  			</div>
		</div>
		<div class="form-group">
  			<label class="col-xs-4 control-label" >성명</label>
    		<div class="col-xs-8 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="name" placeholder="홍길동" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		<div class="form-group">
  			<label class="col-xs-4 control-label" >생년월일</label>
    		<div class="col-xs-8 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="birthday" id="birthday" placeholder="19880101" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		<div class="form-group">
  			<label class="col-xs-4 control-label" >성별</label>
    		<div class="col-xs-8 radioContainer">
   				 <div class="radio">
				 	 <label class="radio-inline">
				 	 	<input type="radio" name="sex" id="sex" value="M" /> 남성
				 	 </label>
				 	 <label class="radio-inline">
				 	 	<input type="radio" name="sex" id="sex" value="F" /> 여성
				 	 </label>
				  </div>
			 </div>
		</div>
		<div class="form-group">
  			<label class="col-xs-4 control-label" >이메일</label>
    		<div class="col-xs-8 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="email" id="email" placeholder="fund@fund.com" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		<div class="form-group">
  			<label class="col-xs-4 control-label" >휴대폰 번호</label>
    		<div class="col-xs-8 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="phone" id="phone" placeholder="01012345678" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		<div>
  			<button class="btn btn-warning write-btn" type="button" onclick="boardWrite.loan();">등록하기</button>
		</div>
	</fieldset>
	</form>
	</div>
</div>

<script type="text/javascript">
	var boardWrite = {
		init : function() {
			var user = $('#user').val();
			if(user === "") {
				alert("로그인해주세요.");
				window.location.href = "/user/login";
			}
		},
		loan : function() {
			var data = $('#write').serialize();
			var url = "<c:url value='/board/loan' />?";
			$.ajax({
				url: url,
				type:"post",
				data:data,
				datatype:"json",
				success:function(data) {
				},error:function(request, status, error){
				}
			});
		}
	}
	$(function() {
		boardWrite.init();
	});
</script>