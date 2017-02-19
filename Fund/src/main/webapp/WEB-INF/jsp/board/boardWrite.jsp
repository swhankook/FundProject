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
		<div class="form-group row">
			<label class="col-xs-4 control-label" for="money">희망 대출금액</label>
			<div class="col-xs-6 inputGroupContainer">
	  				<div class="input-group ">
	  					<input name="money" id="money" placeholder="1000" class="form-control " type="text" dir='rtl' >
	  					<span class="input-group-addon">만원</span>
	    			</div>
  			</div>
		</div>
		<div class="form-group row">
			<label class="col-xs-4 control-label" for="period">희망 대출기간</label>
			<div class="col-xs-6 selectContainer">
			  	<div class="input-group">
				    <select name="period" id="period" class="form-control" >
				    	  <option value="" >선택해 주세요</option>
					      <option value="6">6개월</option>
					      <option value="12">12개월</option>
					      <option value="18">18개월</option>
					      <option value="24">24개월</option>
					      <option value="30">30개월</option>
				    </select>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-xs-4 control-label" for="income">연 소득</label>
			<div class="col-xs-6 inputGroupContainer">
	  				<div class="input-group ">
	  					<input name="income" id="income" placeholder="1000" class="form-control" type="text" dir='rtl'>
	  					<div class="input-group-addon">만원</div>
	    			</div>
  			</div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="name">성명</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="name" id="name" placeholder="홍길동" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="birthday" >생년월일</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="birthday" id="birthday" placeholder="19880101" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label"  for="sex">성별</label>
    		<div class="col-xs-6 radioContainer">
   				 <div class="radio">
				 	 <label class="radio-inline">
				 	 	<input type="radio" name="sex" id="sex" value="M" /> 남성
				 	 </label>
				 	 <label class="radio-inline">
				 	 	<input type="radio" name="sex" id="sex" value="F"  /> 여성
				 	 </label>
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label"  for="email">이메일</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="email" id="email" placeholder="fund@fund.com" class="form-control"  type="text" >
				  </div>
			 </div>
		</div>
		<div class="form-group row">
  			<label class="col-xs-4 control-label" for="phone" >휴대폰 번호</label>
    		<div class="col-xs-6 inputGroupContainer">
   				 <div class="input-group">
				 	 <input name="phone" id="phone" placeholder="010-1234-5678" class="form-control"  type="text" >
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
	var boardWrite = {
		init : function() {
			var user = $('#user').val();
			if(user === "") {
				alert("로그인해주세요.");
				window.location.href = "/user/login";
			}
		},
		loan : function() {
			var money = $('#money').val()
			, purpose = $('#purpose').val()
			, period = $('#period').val()
			, income = $('#income').val()
			, name = $('#name').val()
			, birthday = $('#birthday').val()
			, sex = $('#sex').prop("checked")
			, phone = $('#phone').val()
			, email = $('#email').val()
			, data = $('#write').serialize();
			var url = "<c:url value='/board/loan' />?";

			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var regName = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
			var regPhone =  /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;


			if ( !purpose ) {
	            alert('대출목적을 선택 해 주세요');
	            $('#purpose').focus();
	            return false;
	        }
			if ( !money ) {
	            alert('대출금액을 입력 해 주세요');
	            $('#money').focus();
	            return false;
	        }
			if ( !period ) {
	            alert('대출기간을 선택 해 주세요');
	            $('#period').focus();
	            return false;
	        }

			if ( !income ) {
	            alert('연소득을 입력 해 주세요');
	            $('#income').focus();
	            return false;
	        }
			if ( !name ) {
	            alert('성명을 입력 해 주세요');
	            $('#name').focus();
	            return false;
	        } else if(regName.test(name)){
	        	alert('한글로 입력해주세요');
	            $('#name').focus();
	            return false;
	        }else if(name.length<2){
	        	alert('두글자 이상 입력 해 주세요');
	            $('#name').focus();
	            return false;
	        }


			if ( !birthday ) {
	            alert('생년월일을 입력 해 주세요');
	            $('#birthday').focus();
	            return false;
	        } else if(birthday.length<6){
	        	alert('생년월일이 유효하지 않습니다.');
	            $('#birthday').focus();
	            return false;
	        }

	        if ( !sex ) {
	            alert('성별을 선택해 주세요');
	            $('#sex').focus();
	            return false;
	        };
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
			if ( !phone ) {
	            alert('휴대폰번호를 입력 해 주세요');
	            $('#phone').focus();
	            return false;
	        }else if(!regPhone.test(phone)){
	        	alert('핸드폰번호가 유효하지 않습니다.');
	            $('#phone').focus();
	            return false;
	        }

			var comSubmit = new ComSubmit("writeForm")
		    	, url = "loan";
		    comSubmit.setUrl(url);
		    comSubmit.submit();
		},
	}
	$(function() {
		boardWrite.init();
	});
</script>