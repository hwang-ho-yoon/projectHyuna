<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="/include/css/join.css">
<!-- <link rel="stylesheet" type="text/css" href="/include/css/bootstrap.min.css"> -->

<!-- <script type="text/javascript" src="/include/js/jquery-1.12.2.min.js"></script> -->
<script type="text/javascript">
	var idReg = /^[a-z0-9]{4,16}$/;	//아이디정규식	
	var pwdReg = /^(?=.*[a-zA-Z0-9])(?=.*\W).{10,16}$/;
	var phReg = /^[0-9]{3,4}$/;
	var ph2Reg = /^[0-9]{4}$/;
	var mailReg = /^[A-za-z0-9]{4,16}$/i;
	var mail2Reg = /^[A-za-z]*\.[A-za-z]{3}$/i;
	var cnt = 0;
	var idcheck = "";
	var mailcheck = "";
	
	$(function(){

		$("#postcodify_search_button").postcodifyPopUp();
		$("#join").click(function(){
	 		if(!chkSubmit($("#mem_id")))return;
	 		else if(cnt<1){
	 			$("#id_msg").text(" 아이디 중복확인 하세요.").css("color","red");
	 			$("#mem_id").focus();
	 			return;
	 		}
	 		else if(idcheck != "ok"){	 			
	 			$("#id_msg").text(" 아이디 중복확인 하세요.").css("color","red");
	 			$("#mem_id").focus();
	 			return;
	 		}
	 		else if(!chkSubmit($("#mem_pswd")))return;
	 		else if(!chkSubmit($("#mem_pwd1")))return;
	 		else if(!chkSubmit($("#mem_name")))return;
	 		else if(!chkSubmit($("#mem_answer")))return;
			else if($("#mem_post").val()==""){				
				$("#post_msg").text(" 우편번호를 입력하세요").css("color", "red");
				$("#postcodify_search_button").focus();
				return;
			}
	 		else if(!chkSubmit($("#mem_address1")))return;
	 		else if(!chkSubmit($("#mem_address2")))return;
	 		else if(!chkSubmit($("#tel1")))return;
	 		else if(!chkSubmit($("#tel2")))return;
	 		else if(!chkSubmit($("#mail1")))return;
	 		else if(!chkSubmit($("#mail2")))return;
	 		else if(!($(".radio").is(":checked"))){				
				 $("#mail_msg").text(" 뉴스메일을 체크하세요.").css("color", "red");
				 $(".radio").select();
				return;
			}else if(!($("#agr_agreeCheck").is(":checked"))){				
				$("#agr1_msg").text(" 이용약관에 동의하지 않으면 가입할수 없습니다.").css("color", "red");
				$("#agr_agreeCheck").select();
				return;
			}else if(!($("#agr_agreeCheck2").is(":checked"))){				
				$("#agr2_msg").text(" 개인정보 수집 및 이용에 동의하지않으면 가입할수 없습니다.").css("color", "red");				
				return;						
			/* else if(!idReg.test($("#mem_id").val()) && !pwdReg.test($("#mem_pwd").val()) && ($("#mem_pwd").val())!=($("#mem_pwd1").val()) && $("#mem_answer").val()=="" && !phReg.test($("#tel1").val()) && !ph2Reg.test($("#tel2").val()) && !mailReg.test($("#mail1").val()) && !mail2Reg.test($("#mail2").val()) && $("#mem_name").val()=="" && $("#mem_address2").val()=="")
				return;			 */
			}else if(!idReg.test($("#mem_id").val())){
				$("#mem_id").focus();
				return;				
 			}else if(!pwdReg.test($("#mem_pswd").val())){
				$("#mem_pswd").focus();
				return; 
			}else if(($("#mem_pswd").val())!=($("#mem_pwd1").val())){
				$("#mem_pwd1").focus();
				return;
			}else if(!phReg.test($("#tel1").val())){
				$("#tel1").focus();
				return;
			}else if(!ph2Reg.test($("#tel2").val())){
				$("#tel2").focus();
				return;
			}else if(!mailReg.test($("#mail1").val())){
				$("#mail1").focus();
				return;
			}else if(!mail2Reg.test($("#mail2").val())){
				$("#mail2").focus();
				return;
			}
			else{				
				$("#join_form").attr({
					"method":"post",
					"action":"/member/memberInsert.do"
				});				
				$("#join_form").submit();
				alert("회원가입 되었습니다.");
			}
		});
		
		//취소버튼클릭
		$("#cancel").click(function(){
			location.href = "/index.jsp";
		});
		
 		$("#idCheck").click(function(){
 			cnt++; 			
			$.ajax({
				url : "/member/idCheck.do",
			    type : "post",
			    data : $("#join_form").serialize(),
			    error : function(){
					alert("실패");
			    },
			    success : function(resultData){			     
				    if(resultData==1){
						$("#id_msg").text(" 사용중 입니다.").css("color","red");
				      	$("#mem_id").select();
				      	idcheck = "no";
				    }else if(resultData==0&&idReg.test($("#mem_id").val())){
				      	$("#id_msg").text(" 사용가능 합니다.").css("color","blue");
				      	idcheck = "ok";			      	
					}else if(!idReg.test($("#mem_id").val())){
						$("#id_msg").text(" 사용불가능 합니다.").css("color","red");
						idcheck = "no";
					}     
				}
			});
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
		
		//입력시 키이벤트로 텍스트박스 색깔변환		
 		$("#mem_id").keyup(function(){
 			idcheck = "no";
			if(!idReg.test($("#mem_id").val())){
				$("#form-group1").removeClass("has-success has-feedback");
				$("#form-group1").addClass("has-error has-feedback");
				$("#c1").removeClass("glyphicon-ok");
				$("#c1").addClass("glyphicon-remove");				
			}else{
				$("#form-group1").removeClass("has-error has-feedback");
				$("#form-group1").addClass("has-success has-feedback");				
				$("#c1").removeClass("glyphicon-remove");
				$("#c1").addClass("glyphicon-ok");
								
			}
		});		
		$("#mem_pswd").keyup(function(){				
			if(!pwdReg.test($("#mem_pswd").val())){
				$("#form-group2").removeClass("has-success has-feedback");
				$("#form-group2").addClass("has-error has-feedback");
				$("#c2").removeClass("glyphicon-ok");
				$("#c2").addClass("glyphicon-remove");				
			}else{
				$("#form-group2").removeClass("has-error has-feedback");
				$("#form-group2").addClass("has-success has-feedback");				
				$("#c2").removeClass("glyphicon-remove");
				$("#c2").addClass("glyphicon-ok");
			}
		});
		$("#mem_pwd1").keyup(function(){			
			if(($("#mem_pswd").val())!=($("#mem_pwd1").val())){				
				$("#form-group3").removeClass("has-success has-feedback");
				$("#form-group3").addClass("has-error has-feedback");
				$("#c3").removeClass("glyphicon-ok");
				$("#c3").addClass("glyphicon-remove");				
			}else{
				$("#form-group3").removeClass("has-error has-feedback");
				$("#form-group3").addClass("has-success has-feedback");				
				$("#c3").removeClass("glyphicon-remove");
				$("#c3").addClass("glyphicon-ok");			
			}
		});
		$("#mem_answer").keyup(function(){			
			if($("#mem_answer").val()==""){				
				$("#form-group4").removeClass("has-success has-feedback");
				$("#form-group4").addClass("has-error has-feedback");
				$("#c4").removeClass("glyphicon-ok");
				$("#c4").addClass("glyphicon-remove");				
			}else{
				$("#form-group4").removeClass("has-error has-feedback");
				$("#form-group4").addClass("has-success has-feedback");				
				$("#c4").removeClass("glyphicon-remove");
				$("#c4").addClass("glyphicon-ok");				
			}
		});

			
        $("#tel1").keyup(function(event){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));
                if(!phReg.test($("#tel1").val())){					
    				$("#form-group8").removeClass("has-success has-feedback");
    				$("#form-group8").addClass("has-error has-feedback");
    				$("#c8").removeClass("glyphicon-ok");
    				$("#c8").addClass("glyphicon-remove");    				
    			}else{
    				$("#form-group8").removeClass("has-error has-feedback");
    				$("#form-group8").addClass("has-success has-feedback");				
    				$("#c8").removeClass("glyphicon-remove");
    				$("#c8").addClass("glyphicon-ok");				
    			}
            }
        });
        
		$("#tel2").keyup(function(){
            if (!(event.keyCode >=37 && event.keyCode<=40)) {
                var inputVal = $(this).val();
                $(this).val(inputVal.replace(/[^0-9]/gi,''));            
				if(!ph2Reg.test($("#tel2").val())){				
    				$("#form-group9").removeClass("has-success has-feedback");
    				$("#form-group9").addClass("has-error has-feedback");
    				$("#c9").removeClass("glyphicon-ok");
    				$("#c9").addClass("glyphicon-remove");				
    			}else{
    				$("#form-group9").removeClass("has-error has-feedback");
    				$("#form-group9").addClass("has-success has-feedback");				
    				$("#c9").removeClass("glyphicon-remove");
    				$("#c9").addClass("glyphicon-ok");			
				}
            }
		});
		
		$("#mail1").keyup(function(){			
			if(!mailReg.test($("#mail1").val())){				
				$("#form-group10").removeClass("has-success has-feedback");
				$("#form-group10").addClass("has-error has-feedback");
				$("#c10").removeClass("glyphicon-ok");
				$("#c10").addClass("glyphicon-remove");				
			}else{
				$("#form-group10").removeClass("has-error has-feedback");
				$("#form-group10").addClass("has-success has-feedback");				
				$("#c10").removeClass("glyphicon-remove");
				$("#c10").addClass("glyphicon-ok");									
			}
		});
		
 		$("#mail2").keyup(function(){			
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
		}); 
 		
 		$("#mem_name").keyup(function(){			
			if($("#mem_name").val()==""){				
				$("#form-group12").removeClass("has-success has-feedback");
				$("#form-group12").addClass("has-error has-feedback");
				$("#c12").removeClass("glyphicon-ok");
				$("#c12").addClass("glyphicon-remove");				
			}else{
				$("#form-group12").removeClass("has-error has-feedback");
				$("#form-group12").addClass("has-success has-feedback");				
				$("#c12").removeClass("glyphicon-remove");
				$("#c12").addClass("glyphicon-ok");					
			}
		});
 		
 		$("#mem_address2").keyup(function(){			
			if($("#mem_address2").val()==""){				
				$("#form-group7").removeClass("has-success has-feedback");
				$("#form-group7").addClass("has-error has-feedback");
				$("#c7").removeClass("glyphicon-ok");
				$("#c7").addClass("glyphicon-remove");				
			}else{
				$("#form-group7").removeClass("has-error has-feedback");
				$("#form-group7").addClass("has-success has-feedback");				
				$("#c7").removeClass("glyphicon-remove");
				$("#c7").addClass("glyphicon-ok");					
			}
		}); 

 		$("#wrapper").mousemove(function(){ 			
 			if($("#mem_post").val()!=""){ 				
 				$("#post_msg").text("");
 			}
 		});
		$(".radio").click(function(){
			if($(".radio").is(":checked")){
				$("#mail_msg").text("");
			}
		});
		$("#agr_agreeCheck").change(function(){
			if(($("#agr_agreeCheck").is(":checked"))){
				$("#agr1_msg").text("");
			}else{
				$("#agr1_msg").text(" 이용약관에 동의하지 않으면 가입할수 없습니다.").css("color", "red");
			}
		});
		$("#agr_agreeCheck2").change(function(){
			if(($("#agr_agreeCheck2").is(":checked"))){
				$("#agr2_msg").text("");
			}else{
				$("#agr2_msg").text(" 개인정보 수집 및 이용에 동의하지않으면 가입할수 없습니다.").css("color", "red");	
			}
		});
		/* 목록 버튼 클릭 시 처리 이벤트 */
		$("#boardListBtn").click(function(){			
			location.href = "/board/boardList.do";
		});
	});
	function chkSubmit(v_item){
		if(v_item.val().replace(/\s/g,"")==""){			
			v_item.val("");
			v_item.focus();		
			return false;
		}else{
			return true;
		}
	}

</script>
</head>
<body>
<form id="join_form" name="join_form" class="form-inline">
<div id="wrapper">
	<div id="content">	
	<h4>기본정보</h4>
		<table class="table" style="border: 1px solid #ddd">
			<tr>
				<td>아이디</td>
				<td>
				<div>
					<div class="form-group" id="form-group1" >						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_id" name="mem_id" maxlength="16" >
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c1"></span>																
					</div>
					&nbsp;<button type="button" id="idCheck" class="btn btn-default">아이디 중복확인</button>&nbsp;(영문소문자/숫자, 4~16자)<span id="id_msg"></span>
				</div>
				</td>
			</tr>
			<tr>
				<td class="tc">비밀번호</td>
				<td>
				<div>
					<div class="form-group" id="form-group2">						
						<input type="password" class="form-control" aria-describedby="inputSuccess5Status" id="mem_pswd" name="mem_pwd" maxlength="16" >
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
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_name" name="mem_name" maxlength="5" >
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
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_answer" maxlength="50" style="width: 400px" id="mem_answer" name="mem_answer">
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
						<input type="text" class="form-control postcodify_postcode5" aria-describedby="inputSuccess5Status" id="mem_post" name="mem_post" maxlength="6" style="width: 100px; background: white" readonly="readonly">
						
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c5"></span>						
						&nbsp;-&nbsp;<button type="button" value="우편번호" id="postcodify_search_button" class="btn btn-default " style="margin-bottom: 5px; margin-top: 0px">우편번호</button><span id=post_msg></span>																			
					</div>									
				</div>
				<div>
					<div class="form-group" id="form-group6">						
						<input type="text" class="form-control postcodify_jibeon_address" aria-describedby="inputSuccess5Status" id="mem_address1" name="mem_address1" maxlength="100" style="width: 300px; background: white; margin-bottom: 10px" readonly="readonly">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c6"></span>																									
					</div>									
				</div>	
				<div>
					<div class="form-group" id="form-group7">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mem_address2" name="mem_address2" maxlength="100" style="width: 300px; ">
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
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="tel1" name="tel1" maxlength="4" style="width: 100px">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c8"></span>																			
					</div>&nbsp;-&nbsp;
					<div class="form-group" id="form-group9">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="tel2" name="tel2" maxlength="4" style="width: 100px">
						<span class="glyphicon form-control-feedback" aria-hidden="true" id="c9"></span>																			
					</div>					
				</td>	
			</tr>
			<tr>
				<td class="tc">이메일</td>
				<td>
					<div class="form-group" id="form-group10">						
						<input type="text" class="form-control" aria-describedby="inputSuccess5Status" id="mail1" name="mail1" maxlength="16">
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
					<input type="radio" class="radio" name="mem_mailCheck" value="수신" >수신함
					<input type="radio" class="radio" name="mem_mailCheck" value="">수신안함
					<span id="mail_msg"></span>					
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
		<div style="margin: 20px">${list0.ter_title }에 동의하십니까?&nbsp;<input type="checkbox" id="agr_agreeCheck" name="agr_agreeCheck" value="동의">동의함&nbsp;<span id="agr1_msg"></span></div>
	</div>


	<input type="hidden" id="ter_no1" name="ter_no1" value="${list1.ter_no }">
 	<h4>${list1.ter_title}</h4>
	<div style="border: 1px solid #ddd">	
		<div style="margin-top: 15px; margin-bottom: 15px" class="col-md-12">
			<textarea readonly="readonly" class="form-control" rows="10" cols="133" style="background: white">
${list1.ter_content }
			</textarea>
		</div>
		<div style="margin: 20px">${list1.ter_title}에 동의하십니까?&nbsp;<input type="checkbox" id="agr_agreeCheck2" name="agr_agreeCheck2" value="동의">동의함&nbsp;<span id="agr2_msg"></span></div>
	</div>

	<div class="contentBtn" style="text-align:right; margin-bottom: 20px">
		<button type="button" id="cancel" name="cancel" class="btn btn-default">회원가입취소</button>
		<button type="button" id="join" name="join" class="btn btn-default">회원가입</button>
	</div>
</div>
</form>
</body>
</html>