<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/template/include/lib.jsp"%>
<div class="boardWrite">
	<div class="row">
	<form class="form-horizontal" action="" method="post" id="">
	<fieldset class="pannel">
		<div class="form-group">
			<label class="col-md-3 control-label">대출목적</label>
			<div class="col-md-4 selectContainer">
			  	<div class="input-group">        
				    <select name="period" class="form-control" >
					      <option value="" >선택해 주세요</option>      
					      <option>채무통합</option>
					      <option>고금리 대환대출</option>
					      <option>생활비</option>
					      <option>자동차 구매</option>
					      <option>보증금</option>
					      <option >병원비</option>
					      <option >결혼비용</option>      
				    </select>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4 control-label">희망 대출금액</label>
			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group"> 					
  					<input  name="money" placeholder="1000" class="form-control"  type="text">
  					<div class="input-group-addon">만원</div>
    			</div>
  			</div>			 
		</div>
		<div class="form-group">
			<label class="col-md-4 control-label">희망 대출기간</label>
			<div class="col-md-4 periodContainer">
			<ul>				
				<li><button>6개월</button></li>
				<li><button>12개월</button></li>
				<li><button>18개월</button></li>
				<li><button>24개월</button></li>
				<li><button>30개월</button></li>				
			</ul>
			
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4 control-label">연 소득</label>
			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group"> 					
  					<input  name="income-amount" placeholder="1000" class="form-control"  type="text">
  					<div class="input-group-addon">만원</div>
    			</div>
  			</div>			 
		</div>
		
		
	
		<div class="form-group">
  			<label class="col-md-4 control-label" >성명</label> 
    		<div class="col-md-4 inputGroupContainer">
   				 <div class="input-group"> 		
				 	 <input name="name" placeholder="홍길동" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		
		<div class="form-group">
  			<label class="col-md-4 control-label" >생년월일</label> 
    		<div class="col-md-4 inputGroupContainer">
   				 <div class="input-group"> 		
				 	 <input name="birthday" placeholder="19880101" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		
		<div class="form-group">
  			<label class="col-md-4 control-label" >성별</label> 
    		<div class="col-md-4 radioContainer">
   				 <div class="radio"> 		
				 	 <label class="radio-inline">
				 	 	<input type="radio" name="sex" value="1" /> 남성				 	 	
				 	 </label>
				 	 <label class="radio-inline">
				 	 	<input type="radio" name="sex" value="2" /> 여성				 	 	
				 	 </label>
				  </div>
			 </div>
		</div>
		
		<div class="form-group">
  			<label class="col-md-4 control-label" >이메일</label> 
    		<div class="col-md-4 inputGroupContainer">
   				 <div class="input-group"> 		
				 	 <input name="email" placeholder="fund@fund.com" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		
		<div class="form-group">
  			<label class="col-md-4 control-label" >휴대폰 번호</label> 
    		<div class="col-md-4 inputGroupContainer">
   				 <div class="input-group"> 		
				 	 <input name="cellphone" placeholder="01012345678" class="form-control"  type="text">
				  </div>
			 </div>
		</div>
		<div></div>
		<div class="form-group">
  		<label class="col-md-4 control-label"></label>
 		<div class="col-md-4">
  			<button class="btn btn-warning" type="submit">등록하기</button>
 		</div>
	</div>					
	</fieldset>
	
	</form>
	</div>
</div>