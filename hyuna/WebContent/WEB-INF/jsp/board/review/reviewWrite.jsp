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
						<input type="text" id="inputdefault" name="review_title" class="form-control">
					</td>
				</tr>
				<tr>
					<td width="10%"><label class="control-label" >평점</label></td>
					<td><label class="radio-inline"><input type="radio" id="review_score" name="optradio" value="1">★</label>
						<label class="radio-inline"><input type="radio" id="review_score" name="optradio" value="2">★★</label>
						<label class="radio-inline"><input type="radio" id="review_score" name="optradio" value="3">★★★</label>
						<label class="radio-inline"><input type="radio" id="review_score" name="optradio" value="4">★★★★</label>
						<label class="radio-inline"><input type="radio" id="review_score" name="optradio" value="5">★★★★★</label>
					</td>
				<tr>
					<td colspan="4"><textarea id="edit" name="text_area" class="form-control"></textarea>
	             
	            </td>
	            </tr>
	            <tr>
	            	<td>
	            		<label class="control-label">첨부 파일</label>
	            	</td>
	            	<td colspan="3">
	            		<input type="file" id="inputdefault" id="file" name="file" class="form-control"/>
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
<script src="/include/js/jquery-1.12.2.min.js"></script>
<script src="/include/js/board.js"></script>
<script>
	$("#review_write_btn").click(function() {
		
		$("#review_list_btn").click(function(){
			location.href = "/board/review/reviewList.do";
		});
		
		if (!chkSubmit($("#review_title"), "제목을")) {
			return;
		} else if (!chkSubmit($("#review_score"), "평점을")) {
			return;
		} else if (!chkSubmit($("#review_content"), "내용을")) {
			return;
		} else if (!chkFile($("#file"))) {
			return;
		} else {
			$("#review_writeForm").attr({
				"method" : "post",
				"action" : "/board/review/reviewInsert.do"
			});
			$("#review_writeForm").submit();
		}
		
		
	});
</script>





