<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">	
	var member_tel = "${detail.mem_tel }";
	var tel = member_tel.split("-");
	var member_mail = "${detail.mem_mail }";
	var mail = member_mail.split("@");
	var member_ask = "${detail.mem_ask }";
	var member_check = "${detail.mem_mailCheck }";
	var pwdReg = /^(?=.*[a-zA-Z0-9])(?=.*\W).{10,16}$/;
	var phReg = /^[0-9]{3,4}$/;
	var ph2Reg = /^[0-9]{4}$/;
	var mailReg = /^[A-za-z0-9]{4,16}$/i;
	var mail2Reg = /^[A-za-z]*\.[A-za-z]{3}$/i;
	
 	$(function(){ 		
 		$("#postcodify_search_button").postcodifyPopUp();
 		$("#mail1").val(mail[0]);
 		$("#mail2").val(mail[1]);
 		$("#mem_ask").val(member_ask);
 		$("#tel").val(tel[0]);
 		$("#tel1").val(tel[1]);
 		$("#tel2").val(tel[2]);
 		if(member_check=='수신'){
 			$("#check").attr("checked",true); 			
 		}else{
 			$("#nocheck").attr("checked",true);
 		}
 		
 		$("#update").click(function(){
 			if($("#mem_pwdd").val()!=""){
 	  			if(!pwdReg.test($("#mem_pwdd").val())){
 	 				$("#mem_pwdd").focus();
 	 				return;
 	 			}else if(($("#mem_pwdd").val())!=($("#mem_pwd1").val())){
 	 				$("#mem_pwd1").focus(); 	 				
 	 	 			return;
 	 			} 	  			
 			}
 			if(!phReg.test($("#tel1").val())){ 				
 				$("#tel1").focus();
 				return;
 			}else if(!ph2Reg.test($("#tel2").val())){
 				$("#tel1").focus();
 				return; 				
 			}else if(!mailReg.test($("#mail1").val())){
 				$("#mail1").focus();
 				return;
 			}else if(!mail2Reg.test($("#mail2").val())){
 				$("#mail2").focus();
 				return;
 			}else{
	 			$("#detail_form").attr({
	 				"method":"post",
	 				"action":"/member/memberUpdate.do"
	 			});
	 			$("#detail_form").submit();
	 			alert("수정되었습니다.");
 			}
 		});
 		
 		$("#cancel").click(function(){
 			location.href = "/index.jsp";
 		});
 		
		//이메일 선택시마다 값변환
		$("#mail").change(function(){						
			if($("#mail option:selected").val()=="직접입력"){
				$("#form-group11").removeClass("has-success has-error has-feedback");
				$("#mail2").attr("readonly",false);
				$("#mail2").val("");
			}else if($("#mail option:selected").val()=="-이메일 선택-"){
				$("#form-group11").removeClass("has-success has-error has-feedback");
				$("#mail2").attr("readonly",true);
				$("#mail2").val("");				
			}else{				
				$("#mail2").attr("readonly",true);				
				$("#mail2").val($("#mail option:selected").val());
				if(!mail2Reg.test($("#mail2").val())){				
					$("#form-group11").removeClass("has-success has-feedback");
					$("#form-group11").addClass("has-error has-feedback");
					$("#c11").removeClass("glyphicon-ok");
					$("#c11").addClass("glyphicon-remove");				
				}else{
					$("#form-group11").removeClass("has-error has-feedback");
					$("#form-group11").addClass("has-success has-feedback");				
					$("#c11").removeClass("glyphicon-remove");
					$("#c11").addClass("glyphicon-ok");				
				}
			}
		})
		
		//탈퇴
		$("#out").click(function(){
			$("#outModal").modal('show');		

		});
 		$("#pwdBtn").click(function(){
			$.ajax({
				url : "/member/memberOut.do",
			    type : "post",
			    data : $("#pwd_form").serialize(),
			    error : function(){
					alert("실패");
			    },
			    success : function(resultData){			     
				    if(resultData==1){	
				      	if(confirm("정말 탈퇴하시겠습니까?")){				      		
				      	}else{
				      		return;
				      	}
				      	alert("탈퇴되었습니다.");
				    }
				}
			});
		}); 
 		
        $("#tel1").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
            }
        });
        
		$("#tel2").keyup(function(){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));        
				
            }
		});		
	}); 
</script>
</head>
<body>
<form id="detail_form"  class="form-inline">
<input type="hidden" name="mem_no" value="${sessionScope.hyunaMember }">
<div id="wrapper">
	<div id="content">	
	<h4>기본정보</h4>
		<table class="table" style="border: 1px solid #ddd">
			<tr>
				<td>아이디</td>
				<td>
				<div>
					<div class="form-group" id="form-group1" >						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_id" name="mem_id" maxlength="16" value="${detail.mem_id }" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c1"></span>																
					</div>					
				</div>
				</td>
			</tr>
			<tr>
				<td class="tc">비밀번호</td>
				<td>
				<div>
					<div class="form-group" id="form-group2">						
						<input type="password" class="form-control" aria-describedby="inputSuccess5Status" id="mem_pwdd" name="mem_pwd" maxlength="16" >
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c2"></span>											
					</div>
					(영문 대소문자/숫자/특수문자(필수) 중 2가지 이상 조합, 10자~16자)					
				</div>							
				</td>
			</tr>
			<tr>
				<td class="tc">비밀번호 확인</td>
				<td>
				<div>
					<div class="form-group" id="form-group3">						
						<input type="password" class="form-control" aria-describedby="inputSuccess5Status" id="mem_pwd1" name="mem_pwd1" maxlength="16" >
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c3"></span>											
					</div>					
				</div>												
				</td>
			</tr>
			<tr>
				<td class="tc">이름</td>
				<td>
				<div>
					<div class="form-group" id="form-group12" >						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_name" name="mem_name" maxlength="5" value="${detail.mem_name }" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c12"></span>										
					</div>					
				</div>
				</td>
			</tr>						
			<tr>
				<td class="tc">비밀번호 찾기 질문</td>
				<td>
					<select id="mem_ask" name="mem_ask" class="form-control">
						<option value="나의 보물 23호는?">나의 보물 23호는?</option>
						<option value="내가 2살때 살았던 곳은?">내가 2살때 살았던 곳은?</option>						
						<option value="초등학교1학년때 짝궁 이름은?">초등학교1학년때 짝궁 이름은?</option>						
						<option value="할머니의 생년월일은?">할머니의 생년월일은?</option>						
						<option value="내가 존경하는 인물은?">내가 존경하는 인물은?</option>						
						<option value="타인이 모르는 나의 신체비밀은?">타인이 모르는 나의 신체비밀은?</option>						
						<option value="기억에 남는 추억의 장소는?">기억에 남는 추억의 장소는?</option>						
						<option value="자신의 인생 좌우명은?">자신의 인생 좌우명은?</option>						
						<option value="부모님 결혼기념일은?">부모님 결혼기념일은?</option>						
						<option value="자신이 좋아하는 음식은?">자신이 좋아하는 음식은?</option>						
					</select><span id="ask_msg"></span>
				</td>				
			</tr>	
			<tr>
				<td class="tc">비밀번호 찾기 답변</td>
				<td>
				<div>
					<div class="form-group" id="form-group4">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_answer" maxlength="50" style="width: 400px" id="mem_answer" name="mem_answer"  value="${detail.mem_answer }">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c4"></span>												
					</div>
				</div>			
				</td>
			</tr>
			<tr>
				<td class="tc">주소</td>
				<td>
				<div>
					<div class="form-group" id="form-group5">										
						<input type="text" class="form-control postcodify_postcode5" aria-describedby="inputSuccess5Status" id="mem_post" name="mem_post" maxlength="6" style="width: 100px;" value="${detail.mem_post }" readonly="readonly">
						
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c5"></span>						
						&nbsp;-&nbsp;<button type="button" value="우편번호" id="postcodify_search_button" class="btn btn-default " style="margin-bottom: 5px; margin-top: 0px">우편번호</button><span id=post_msg></span>
					</div>									
				</div>
				<div>
					<div class="form-group" id="form-group6">						
						<input type="text" class="form-control postcodify_jibeon_address" aria-describedby="inputSuccess5Status" id="mem_address1" name="mem_address1" maxlength="100" style="width: 300px; margin-bottom: 10px" value="${detail.mem_address1 }">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c6"></span>																			
					</div>									
				</div>	
				<div>
					<div class="form-group" id="form-group7">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_address2" name="mem_address2" maxlength="100" style="width: 300px " value="${detail.mem_address2 }">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c7"></span>																			
					</div>									
				</div>	
				</td>
			</tr>
			<tr>
				<td class="tc">휴대전화</td>
				<td>
					<select id="tel" name="tel" class="form-control">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>&nbsp;-&nbsp;
					<div class="form-group" id="form-group8">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="tel1" name="tel1" maxlength="4" style="width: 100px" value="">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c8"></span>																			
					</div>&nbsp;-&nbsp;
					<div class="form-group" id="form-group9">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="tel2" name="tel2" maxlength="4" style="width: 100px"  value="">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c9"></span>																			
					</div>					
				</td>	
			</tr>
			<tr>
				<td class="tc">이메일</td>
				<td>
					<div class="form-group" id="form-group10">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mail1" name="mail1" maxlength="16" >
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c10"></span>																			
					</div>&nbsp;@&nbsp;
					<div class="form-group" id="form-group11">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mail2" name="mail2" maxlength="16" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c11"></span>																			
					</div>
					<select id="mail" name="mail" class="form-control">						
						<option>-이메일 선택-</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="empas.com">empas.com</option>
						<option value="korea.com">korea.com</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="gmail.com">gmail.com</option>
						<option>직접입력</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td class="tc">뉴스메일</td>
				<td><label id="as"></label>뉴스 메일을 받으시겠습니까?								
					<input type="radio" id="check" class="radio" name="mem_mailCheck" value="수신" >수신함
					<input type="radio" id="nocheck" class="radio" name="mem_mailCheck" value="">수신안함
					<span id="mail_msg"></span>					
				</td>	
			</tr>
			<tr>
				<td class="tc">가입일</td>
				<td>
				<div>
					<div class="form-group" id="form-group4">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_answer" maxlength="50" style="width: 400px" id="mem_answer" name="mem_answer"  value="${detail.mem_registdate }" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c4"></span>												
					</div>
				</div>			
				</td>
			</tr>		
			<tr>
				<td class="tc">마지막 수정일</td>
				<td>
				<div>
					<div class="form-group" id="form-group4">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_answer" maxlength="50" style="width: 400px" id="mem_answer" name="mem_answer"  value="${detail.mem_updatedate }" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c4"></span>												
					</div>
				</div>			
				</td>
			</tr>		
		</table>
	</div>	

	<div class="contentBtn" style="text-align:right; margin-bottom: 20px">
		<button type="button" id="cancel"  class="btn btn-default">변경취소</button>
		<button type="button" id="update"  class="btn btn-default">정보변경</button>
		<button type="button" id="out"  class="btn btn-default">회원탈퇴</button>
	</div>
</div>
</form>
    		<div id="outModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog modal-sm">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">비밀번호 입력</h4>
		            </div>
		            <div class="modal-body form-inline">
		            <form id="pwd_form">
		            <input type="hidden" name="mem_no" value="${sessionScope.hyunaMember }">
		                  비밀번호:&nbsp;&nbsp;<input type="password" name="mem_pwd" id="mem_pswd1" maxlength="16" class="form-control" style="width: 150px">
		            </form>		            	
		         	</div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm" id="pwdBtn">확인</button>
		                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">취소</button>
            	   </div>
	         	</div>
         	</div>
         </div>
</body>
</html>