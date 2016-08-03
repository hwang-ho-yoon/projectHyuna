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
	
		var file = "<c:out value='${detail.qna_file1}'/>";
		if(file!=""){
			$("#fileImage").attr({
				src:"/uploadStorage/${detail.qna_file1}",
				width:"150px",
				height:"100px"
			});
		}
		
		$("#qna_category").val("${detail.qna_category }");
		
		//글수정
		$("#updateBtn").click(function(){					
			if(!cccc($("#qna_title"),"제목을 "))return;
			else if(!cccc($("#qna_content"),"내용을 "))return;
			else if("${sessionScope.hyunaMember }"!="${detail.mem_no}"){
				alert("본인이 작성한 글만 수정 가능 합니다.");
				return;
			}
			else{
				$("#qna_detail").attr({
					"method":"post",
					"action":"/board/qna/qnaUpdate.do"
				});
				$("#qna_detail").submit();
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
					$("#qna_detail").attr({
						"method":"post",
						"action":"/board/qna/qnaDelete.do"
					});
					$("#qna_detail").submit();
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
		
	function cccc(v_item, v_name){
	if(v_item.val().replace(/\s/g,"")==""){
		alert(v_name+" 입력해 주세요");
		v_item.val("");
		v_item.focus();		
		return false;
	}else{
		return true;
	}
}
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
		<form id="qna_detail" enctype="multipart/form-data">
		<input type="hidden" id="mem_no" name="mem_no" value="${detail.mem_no}">
		<input type="hidden" id="qna_no" name="qna_no" value="${detail.qna_no}">
			<table class="table table table-bordered" >	
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">글번호</label></td>
					<td width="20%">${detail.qna_no }</td>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">작성일</label></td>
					<td width="30%">${detail.qna_writedate }</td>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">조회수</label></td>
					<td width="20%">${detail.qna_hit }</td>
				</tr>		
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">제목</label></td>
					<td width="75%" colspan="4">
						<input type="text"  class="form-control" id="qna_title" name="qna_title" value="${detail.qna_title }">
					</td>
					<td width="15%">					
						<select class="form-control" id="qna_category" name="qna_category">
						<option value="상품문의">상품문의</option>
						<option value="배송문의">배송문의</option>
						<option value="기타문의">기타문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">내용</label></td>
					<td colspan="5">
						<textarea class="form-control"  rows="10" style='resize: none; ' id="qna_content" name="qna_content">${detail.qna_content }</textarea>		               
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
	            <tr>
	            	<td style="text-align: center; background: #F6F6F6">
	            		<label class="control-label">첨부 파일</label>
	            	</td>
	            	<td colspan="5">
	            		<input type="file" id="inputdefault" class="form-control" name="file"/>
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







