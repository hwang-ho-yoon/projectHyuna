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
	$(function(){
/* 		if($("#rm").is(":checked")){				
			$("#teltxt").hide();				
			$("#teltxt").hide();			
		}
		$("#rm").click(function(){			
			$("#teltxt").hide();				
			$("#teltxt").hide();
			$("#mailtxt").show();				
			$("#mailtxt").show();
		});
		$("#rp").click(function(){			
			$("#mailtxt").hide();				
			$("#mailtxt").hide();
			$("#teltxt").show();				
			$("#teltxt").show();
		}); */
		
		$("#okBtn").click(function(){
 			$.ajax({
				url : "/member/findidOk.do",
			    type : "post",
			    data : $("#findid_form").serialize(),
			    error : function(){
					alert("실패");
			    },
			    success : function(resultData){				    	
				    if(resultData=='Failed'){
				    	alert("존재하지않는 정보입니다 확인후 다시 시도하세요.");				    					    	
				    }else if(resultData!=null){
				    	alert("회원님의 아이디는 "+resultData+" 입니다.");
				    	location.href = "/member/loginform.do";
					}     
				}
			});

		});
	});
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
.form-control{margin-bottom: 15px}
.telc{width: 100px; height: 35px}
</style>
</head>
<body>
<div class="container">
    <div class="row vertical-offset-100">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">아이디 찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" id="findid_form">
                    <fieldset>
                    	<!-- <div class="form-group">                    	
			    		    <input name="mem_radio" id="rm" type="radio" value="mail" checked="checked">&nbsp;이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    		    <input name="mem_radio" id="rp" type="radio" value="ph">&nbsp;휴대폰			    		
			    		</div>
			    		<hr> -->
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="이름" name="mem_name" id="mem_name" type="text">
			    		</div>
			    		<div class="form-group" id="mailtxt">
			    			<input class="form-control" placeholder="이메일 주소" name="mem_mail" id="mem_mail" type="email" >
			    		</div>
			    		<div class="form-group" style="margin-bottom: 0px">
			    		휴대폰 번호
			    		</div>			    		
			    		<div class="form-group" id="teltxt">
			    			<input class="telc" name="tel1" type="text" maxlength="3">&nbsp;-
			    			<input class="telc" name="tel2" type="text" maxlength="4">&nbsp;-
			    			<input class="telc" name="tel3" type="text" maxlength="4">
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