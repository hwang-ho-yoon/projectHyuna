<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>

  <script src="/include/board/js/ckeditor/ckeditor.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script>
	$(function(){
	
		var file = "<c:out value='${detail.review_file1}'/>";
		if(file!=""){
			$("#fileImage").attr({
				src:"/uploadStorage/${detail.review_file1}",
				width:"150px",
				height:"100px"
			});
		}
		
		$("#review_score").val("${detail.review_score }");
		
		//글수정
		$("#updateBtn").click(function(){
				if("${sessionScope.hyunaMember }"!="${detail.mem_no}"){
				alert("본인이 작성한 글만 수정 가능 합니다.");
				return;
			}
			else{
				$("#review_detail").attr({
					"method":"post",
					"action":"/product/prdreviewUpdateForm.do"
				});
				$("#review_detail").submit();
			}
		});
		
		//글삭제		
		$("#deleteBtn").click(function(){
			if("${sessionScope.hyunaMember }"!="${detail.mem_no}"){
				alert("본인이 작성한 글만 삭제 가능 합니다.");
				return;
			}
			else{
				if(confirm("정말 삭제하시겠습니까?")){
					$("#review_detail").attr({
						"method":"post",
						"action":"/product/prdreviewDelete.do"
					});
					$("#review_detail").submit();
				}else{
					return;
				}

			}
		});
		
		//목록
		$("#listBtn").click(function(){
			history.back();
		})
	});

</script>
  
  <!-- 게시판 전용
  게시판 전용
  게시판 전용
  게시판 전용
  게시판 전용
   -->
   </head>
   <body>
	<div id="wrapper" style="margin-top: 50px">
	<div class="bottom">
		<form id="review_detail" enctype="multipart/form-data">
		<input type="hidden" id="mem_no" name="mem_no" value="${detail.mem_no}">
		<input type="hidden" id="review_no" name="review_no" value="${detail.review_no}">
			<table class="table table table-bordered" >	
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">글번호</label></td>
					<td width="20%">${detail.review_no }</td>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">작성일</label></td>
					<td width="30%">${detail.review_writedate }</td>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">조회수</label></td>
					<td width="20%">${detail.review_hit }</td>
				</tr>		
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">제목</label></td>
					<td width="75%" colspan="5">
						<input type="text"  class="form-control" id="review_title" name="review_title" value="${detail.review_title }" readonly="readonly" style="background: white">
					</td>
				</tr>	
				<tr>			
					<td width="15%" style="text-align: center; background: #F6F6F6"><label class="control-label" >평점</label>
					</td>
					<td colspan="5">
						<label class="radio-inline"><input type="radio" id="review_score1" name="review_score" value="1">★</label>
						<label class="radio-inline"><input type="radio" id="review_score2" name="review_score" value="2">★★</label>
						<label class="radio-inline"><input type="radio" id="review_score3" name="review_score" value="3">★★★</label>
						<label class="radio-inline"><input type="radio" id="review_score4" name="review_score" value="4">★★★★</label>
						<label class="radio-inline"><input type="radio" id="review_score5" name="review_score" value="5">★★★★★</label>
					</td>
				</tr>
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">내용</label></td>
					<td colspan="5">
						<textarea class="form-control"  rows="10" style='resize: none; background: white ' id="review_content" name="review_content" readonly="readonly">${detail.review_content }</textarea>		               
		            </td>
	            </tr>
				<tr>
	            	<td style="text-align: center; background: #F6F6F6">
	            		<label class="control-label">첨부 파일</label>
	            	</td>
	            	<td colspan="5">
	            		<img id="fileImage">
	            	</td>	            	
	            </tr>
			</table>
			<div class="col-md-1 col-md-offset-0" >
				<button class="btn btn-default" type="button" id="listBtn">목록</button>
			</div>
			<div class="col-md-1 col-md-offset-9">
				<button class="btn btn-default" type="button" id="updateBtn">수정</button>
			</div>
			<div class="col-md-1 col-md-offset-0">
				<button class="btn btn-default" type="button" id="deleteBtn">삭제</button>
			</div>
		</form>
	</div>
</div>







