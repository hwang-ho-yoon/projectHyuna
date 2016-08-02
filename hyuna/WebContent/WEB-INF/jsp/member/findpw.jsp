<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 	$(function(){ 	
		$("#okBtn").click(function(){			
			$.ajax({
				url : "/member/memberPw.do",
			    type : "post",
			    data : $("#findpw_form").serialize(),
			    error : function(){
					alert("실패");
			    },
			    success : function(resultData){			     
				    if(resultData==1){
				    	alert("비밀번호가 이메일로 발송되었습니다");
				    	location.href = "/member/loginform.do";
				    }else{
				    	alert("존재하지 않는 정보입니다.");	
				    	return;				      				      	
					}
				}			
			});							
		});

/*  		var pattern1 = /[0-9]/;
		
		var pattern2 = /[a-zA-Z]/;
		
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
		
		alert(pattern2);ran
 		var ranNum = pattern1(Math.random()*10);
		alert(ranNum);  */

	}); 
/*  	 function createCode(objArr, iLength) {
         var arr = objArr;
         var randomStr = "";
         
         for (var j=0; j<iLength; j++) {
             randomStr += arr[Math.floor(Math.random()*arr.length)];
         }
         
         return randomStr
     }
    function getRandomCode(iLength) {
    	var arr="0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,~,`,!,@,#,$,%,^,&,*,(,),-,+,|,_,=,\,[,],{,},<,>,?,/,.,;".split(",");        
    	var arr="0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z".split(",");        
        var rnd = createCode(arr, iLength);        	
        return rnd;
    } */
</script>
<style type="text/css">
body{
    background: url(http://mymaplist.com/img/parallax/back.png);
	background-color: #444;
    background: url(http://mymaplist.com/img/parallax/pinlayer2.png),url(http://mymaplist.com/img/parallax/pinlayer1.png),url(http://mymaplist.com/img/parallax/back.png);    
}

.vertical-offset-100{
    padding-top:50px;
}
.telc{width: 100px; height: 35px}
.form-control{margin-bottom: 15px}
</style>
</head>
<body>
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">비밀번호 찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" id="findpw_form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="아이디" name="mem_id" id="mem_id" type="text">
			    		</div>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="이름" name="mem_name" id="mem_name" type="text">
			    		</div>
			    		<div class="form-group" id="mailtxt">
			    			<input class="form-control" placeholder="이메일 주소" name="mem_mail" id="mem_mail" type="email" >
			    		</div>			    		
				       		<div class="form-group">
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
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="비밀번호 찾기 답변" name="mem_answer" id="mem_answer" type="text" >
			    		</div>			    		
			    	    <div class="form-inline" align="center">
			    		<input class="btn btn-lg btn-success btn-block" type="button" value="확인" id="okBtn">
						</div>
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>