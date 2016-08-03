<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">		
	$(function(){
		$("#pwchange").click(function(){
			$("#admModal").modal('show');			
		});
		$("#ok").click(function(){
			if($("#adm_pwd1").val()!=$("#adm_pwd2").val()){
				alert("비밀번호 불일치");
				return;
			}else{
				$.ajax({
					url : "/admin/pwdChange.do",
				    type : "post",
				    data : $("#pwd_form").serialize(),
				    error : function(){
						alert("실패");
				    },				    
				    success : function(resultData){				    	
					    if(resultData==1){
					    	alert("변경되었습니다");
					      	location.href = "/admin/adminLogin.do";
					    }else{
					      	alert("비밀번호 틀림");			      	
						}    
					}
				});	
			}
		});


				
		$("#login").click(function(){
			location.href = "/admin/adminLogin.do";
		});
		$("#logout").click(function(){
			location.href = "/admin/adminLogout.do";
		});	
		$("#pwchange").mouseover(function(){
			$("#pwchange").css("text-decoration","underline");	
		});
		$("#pwchange").mouseout(function(){
			$("#pwchange").css("text-decoration","none");	
		});
		$("#login").mouseover(function(){
			$("#login").css("text-decoration","underline");	
		});
		$("#login").mouseout(function(){
			$("#login").css("text-decoration","none");	
		});
		$("#logout").mouseover(function(){
			$("#logout").css("text-decoration","underline");	
		});
		$("#logout").mouseout(function(){
			$("#logout").css("text-decoration","none");	
		});		
	});
</script>
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                </div>
                <div class="col-md-5">
                    <div class="header-right">
                        <ul class="list-unstyled list-inline" style="margin-top: 20px">                                                                                                    
                            <c:choose>
                            	<c:when test="${not empty sessionScope.admin }">
                            		<li><i class="fa fa-user"></i><span id="pwchange" style="cursor: pointer; "> 비밀번호변경</span></li>
                            		<li><i class="fa fa-user"></i><span id="logout" style="cursor: pointer; "> 로그아웃</span></li>
                            		<li>관리자&nbsp;${sessionScope.admin } 님</li>
                            	</c:when>                            
	                            <c:otherwise>
	                            	<li><i class="fa fa-user"></i><span id="login" style="cursor: pointer; "> 로그인</span></li>	                            	
	                            </c:otherwise>
                            </c:choose>                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="/adminIndex.jsp"><img src="/include/image/hyun.png"></a></h1>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End site branding area -->
    
    <div class="mainmenu-area">
        <div class="container">
            <div class="row">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> 
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.html">Home</a></li>
                        <li class="dropdown dropdown-small">
							<a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">
	                            <span class="key">Samsung</span>
	                            <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">갤럭시</a></li>
                                <li><a href="#">노트</a></li>
                                <li><a href="#">보급</a></li>
                            </ul>
						</li>
                        <li class="dropdown dropdown-small">
							<a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">
	                            <span class="key">Apple</span>
	                            <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">5S</a></li>
                                <li><a href="#">6S</a></li>
                                <li><a href="#">7S</a></li>
                            </ul>
						</li>
                        <li class="dropdown dropdown-small">
							<a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" href="#">
	                            <span class="key">LG</span>
	                            <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">G시리즈</a></li>
                                <li><a href="#">G프로</a></li>
                                <li><a href="#">옵티머스</a></li>
                            </ul>
						</li>
                        <li><a href="/orderAdmin/orderAdminList.do">주문조회</a></li>
                        <li><a href="/board/qna/qnaList.do">Q&A</a></li>
                        <li><a href="/board/faq/faqList.do">FAQ</a></li>
						<li><a href="/board/review/reviewList.do">review</a></li>
						<li><a href="/admin/memberList.do">회원목록</a></li>
						 
<!-- 						 <button type="button" class="btn btn-info">PHP</button>
						 <button type="button" class="btn btn-info">Blogger</button>
						 <div class="btn-group">
							 <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
							 	Android <span class="caret"></span>
							 </button>
						 
							 <ul class="dropdown-menu" role="menu">
								 <li><a href="#">Android Studio</a></li>
								 <li><a href="#">Eclipse</a></li>
								 <li><a href="#">Basics</a></li>
							 </ul>
						 </div> -->
                    </ul>
                </div>  
            </div>
        </div>
    </div> <!-- End mainmenu area -->
    		
    		<div id="admModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog modal-sm">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">비밀번호 입력</h4>
		            </div>
		            <div class="modal-body form-inline">
		            <form id="pwd_form">
		            <input type="hidden" name="adm_name" value="${sessionScope.admin }">
		            <table>
		            	<tr>
		            	<td>
		            		현재 비밀번호 : 
		            	</td>
		            	<td>
		                 	<input type="password" name="adm_pwd" id="adm_pwd" maxlength="16" class="form-control" style="width: 150px">
		                 </td>
		                 <tr>
		            	<tr>
		            	<td>
		            		바꿀 비밀번호 : 
		            	</td>
		            	<td>
		                 	<input type="password" name="adm_pwd1" id="adm_pwd1" maxlength="16" class="form-control" style="width: 150px">
		                 </td>
		                 <tr>
		            	<tr>
		            	<td>
		            		비밀번호 확인: 
		            	</td>
		            	<td>
		                 	<input type="password" name="adm_pwd2" id="adm_pwd2" maxlength="16" class="form-control" style="width: 150px">
		                 </td>
		                 <tr>
		            </table>
		            </form>		            	
		         	</div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm" id="ok">확인</button>
		                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">취소</button>
            	   </div>
	         	</div>
         	</div>
         </div>
