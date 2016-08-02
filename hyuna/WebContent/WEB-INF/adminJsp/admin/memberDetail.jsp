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
	var arg0 = "${agr0.agr_agreeCheck}";
	var arg1 = "${agr1.agr_agreeCheck}";
	var id = "${detail.mem_id }";
	var id0 = id.substring(0,3);
	var id1 = id.substring(3);	
	var id2 = id1.replace(/[a-z0-9]/g, "*");
	var id3 = id0+id2;
	var name = "${detail.mem_name}";
	var name0 = name.substring(0, 2);
	var name1 = name.substring(2)	
	var name2 = name1.replace(/[^A-Za-z0-9]/g, "*");	
	var name3 = name0+name2;
	var post = "${detail.mem_post}";
	var post0 = post.substring(0, 3);
	var post1 = post.substring(3);
	var post2 = post1.replace(/[0-9]/g, "*");
	var post3 = post0+post2;
	var adr = "${detail.mem_address1}";
	var adr1 = adr.split(" ");
	var adr2 = adr1[2].replace(/[^A-Za-z0-9]/g, "*");
	var adr3 = adr1[0]+" "+adr1[1]+" "+adr2;	
	var adrr = "${detail.mem_address2}";
	var adrr0 = adrr.substring(0, 5);
	var adrr1 = adrr.substring(5);
	var adrr2 = adrr1.replace(/[^A-Za-z0-9]/g, "*");
	var adrr3 = adrr0+adrr2;	
 	var tel0 = tel[0].substring(0,2);
	var tel01 = tel[0].substring(2);
	var tel02 = tel01.replace(/[0-9]/g, "*");
	var tel03 = tel0+tel02;
 	var tel1 = tel[1].substring(0,2);
	var tel11 = tel[1].substring(2);
	var tel12 = tel11.replace(/[0-9]/g, "*");
	var tel13 = tel1+tel12;	
 	var tel2 = tel[2].substring(0,2);
	var tel21 = tel[2].substring(2);
	var tel22 = tel21.replace(/[0-9]/g, "*");
	var tel23 = tel2+tel22; 
	var mail0 = mail[0].substring(0,3);
	var mail1 = mail[0].substring(3).replace(/[A-Za-z0-9]/g, "*");
	var mail2 = mail0+mail1;
	
 	$(function(){  
 		$("#mem_id").val(id3);
 		$("#mem_name").val(name3);
 		$("#mem_post").val(post3);
 		$("#mem_address1").val(adr3);
 		$("#mem_address2").val(adrr3); 		
 		$("#tel").val(tel03);
 		$("#tel1").val(tel13);
 		$("#tel2").val(tel23);
 		$("#mail1").val(mail2);
 		$("#mail2").val(mail[1]);
 		$("#mem_ask").val(member_ask);
 		
 		if(arg0=='동의'){
 			$("#agr_agreeCheck").attr("checked", true);
 		}
 		if(arg1=='동의'){
 			$("#agr_agreeCheck2").attr("checked", true);
 		}
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
 		
 		$("#goBack").click(function(){
 			history.back();
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
			<td>회원번호</td>
				<td>
				<div>
					<div class="form-group" id="form-group1" >						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_no" name="mem_no" maxlength="16" value="${detail.mem_no }" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c1"></span>																
					</div>					
				</div>
				</td>
			</tr>
			<tr>
			<td>아이디</td>
				<td>
				<div>
					<div class="form-group" id="form-group1" >						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_id" name="mem_id" maxlength="16" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c1"></span>																
					</div>					
				</div>
				</td>
			</tr>
			<tr>
				<td class="tc">이름</td>
				<td>
				<div>
					<div class="form-group" id="form-group12" >						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_name" name="mem_name" maxlength="5"  readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c12"></span>										
					</div>					
				</div>
				</td>
			</tr>						
			<tr>
				<td class="tc">비밀번호 찾기 질문</td>
				<td>
					<select id="mem_ask" name="mem_ask" class="form-control" disabled="disabled">
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
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_answer" maxlength="50" style="width: 400px" id="mem_answer" name="mem_answer"  value="${detail.mem_answer }" readonly="readonly">
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
						<input type="text" class="form-control postcodify_postcode5" aria-describedby="inputSuccess5Status" id="mem_post" name="mem_post" maxlength="6" style="width: 100px;" readonly="readonly">
						
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c5"></span>				
						
					</div>									
				</div>
				<div>
					<div class="form-group" id="form-group6">						
						<input type="text" class="form-control postcodify_jibeon_address" aria-describedby="inputSuccess5Status" id="mem_address1" name="mem_address1" maxlength="100" style="width: 300px; margin-top: 10px" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c6"></span>																			
					</div>									
				</div>	
				<div>
					<div class="form-group" id="form-group7">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_address2" name="mem_address2" maxlength="100" style="width: 300px; margin-top: 10px" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c7"></span>																			
					</div>									
				</div>	
				</td>
			</tr>
			<tr>
				<td class="tc">휴대전화</td>
				<td>
					<select id="tel" name="tel" class="form-control" disabled="disabled">
						<option value="01*">01*</option>						
					</select>&nbsp;-&nbsp;
					<div class="form-group" id="form-group8">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="tel1" name="tel1" maxlength="4" style="width: 100px" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c8"></span>																			
					</div>&nbsp;-&nbsp;
					<div class="form-group" id="form-group9">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="tel2" name="tel2" maxlength="4" style="width: 100px" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c9"></span>																			
					</div>					
				</td>	
			</tr>
			<tr>
				<td class="tc">이메일</td>
				<td>
					<div class="form-group" id="form-group10">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mail1" name="mail1" maxlength="16" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c10"></span>																			
					</div>&nbsp;@&nbsp;
					<div class="form-group" id="form-group11">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mail2" name="mail2" maxlength="16" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c11"></span>																			
					</div>	
				</td>
			</tr>
			<tr>
				<td class="tc">뉴스메일</td>
				<td><label id="as"></label>뉴스 메일을 받으시겠습니까?								
					<input type="radio" id="check" class="radio" name="mem_mailCheck" value="수신" disabled="disabled">수신함
					<input type="radio" id="nocheck" class="radio" name="mem_mailCheck" value="" disabled="disabled">수신안함
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
	
	<!-- 약관 -->
	
	<input type="hidden" id="ter_no0" name="ter_no0" value="${list0.ter_no }">
	<h4>${list0.ter_title}</h4>
	<div style="border: 1px solid #ddd">	
		<div style="margin-top: 15px; margin-bottom: 15px" class="col-md-12">
			<textarea readonly="readonly" class="form-control" rows="10" cols="133" style="background: white">				
${list0.ter_content }
			</textarea>			
		</div>
		<div style="margin: 20px">${list0.ter_title }에 동의하십니까?&nbsp;<input type="checkbox" id="agr_agreeCheck" name="agr_agreeCheck" value="동의" disabled="disabled">동의함&nbsp;<span id="agr1_msg"></span></div>
	</div>


	<input type="hidden" id="ter_no1" name="ter_no1" value="${list1.ter_no }">
 	<h4>${list1.ter_title}</h4>
	<div style="border: 1px solid #ddd">	
		<div style="margin-top: 15px; margin-bottom: 15px" class="col-md-12">
			<textarea readonly="readonly" class="form-control" rows="10" cols="133" style="background: white">
${list1.ter_content }
			</textarea>
		</div>
		<div style="margin: 20px">${list1.ter_title}에 동의하십니까?&nbsp;<input type="checkbox" id="agr_agreeCheck2" name="agr_agreeCheck2" value="동의" disabled="disabled">동의함&nbsp;<span id="agr2_msg"></span></div>
	</div>	

	<div class="contentBtn" style="text-align:right; margin-bottom: 20px">
		<button type="button" id="goBack"  class="btn btn-default">목록</button>
	</div>
</div>
</form>
</body>
</html>