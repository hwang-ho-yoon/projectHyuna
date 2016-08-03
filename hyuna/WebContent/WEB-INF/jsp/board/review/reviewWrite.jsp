<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
<div id="wrapper">
	<div class="bottom">
		<form id="review_writeForm" enctype="multipart/form-data">
			<table class="table table table-bordered">
				<tr>
					<td width="10%"><label class="control-label">제목</label></td>
					<td width="70%">
					<input type="hidden" id="mem_no" name="mem_no" value="${sessionScope.hyunaMember }">
						<input type="text" id="review_title" name="review_title" class="form-control">
					</td>
				</tr>
				<tr>
					<td width="10%"><label class="control-label" >평점</label></td>
					<td><label class="radio-inline"><input type="radio" id="review_score1" name="review_score" value="1">★</label>
						<label class="radio-inline"><input type="radio" id="review_score2" name="review_score" value="2">★★</label>
						<label class="radio-inline"><input type="radio" id="review_score3" name="review_score" value="3">★★★</label>
						<label class="radio-inline"><input type="radio" id="review_score4" name="review_score" value="4">★★★★</label>
						<label class="radio-inline"><input type="radio" id="review_score5" name="review_score" value="5">★★★★★</label>
					</td>
				<tr>
					<td colspan="4"><textarea id="review_content" rows="10" style='resize: none; 'name="review_content" class="form-control"></textarea>
	             
	            </td>
	            </tr>
	            <tr>
	            	<td>
	            		<label class="control-label">첨부 파일</label>
	            	</td>
	            	<td colspan="3">
	            		<input type="file"  id="inputdefault" name="file" class="form-control"/>
	            	</td>
	            </tr>
			</table>
			<div class="col-md-1 col-md-offset-0" >
				<input  class="btn" type="button" id="review_list_btn" name="review_list_btn" value="목록">
			</div>
			<div class="col-md-1 col-md-offset-9">
				<input class="btn" type="button" id="review_write_btn" name="review_write_btn" value="등록">
			</div>
			<div class="col-md-1 col-md-offset-0">
				<input class="btn" type="button" id="review_reset_btn" name="review_reset_btn" value="취소">
			</div>
		</form>
	</div>
</div>
<script src="include/js/jquery-1.12.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#review_write_btn").click(function(){			
			if(!cccc($("#review_title"),"제목을 "))return;
			else if(!cccc($("#review_content"),"내용을 "))return;
			else{
				$("#review_writeForm").attr({
					"method":"post",
					"action":"/board/review/reviewInsert.do"
				});
				$("#review_writeForm").submit();
			}
		});
		$("#review_list_btn").click(function(){
			location.href = "/board/review/reviewList.do";
		});
	
		$("#btn_review_reset").click(function(){
			$("#review_title").html("");
			$("#review_content").html("");
	});
	})
	
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





