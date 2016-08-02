<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
<div id="wrapper">
	<div class="bottom">
		<form id="faq_write">
			<table class="table table table-bordered">
				<tr>
					<td width="10%"><label class="control-label">제목</label></td>
					<td width="70%">
						<input type="text" id="inputdefault" name="faq_title" class="form-control">
					</td>
				</tr>
				<tr>
					<td width="10%"><label class="control-label">평점</label></td>
					<td><label class="radio-inline"><input type="radio" name="optradio">★</label>
						<label class="radio-inline"><input type="radio" name="optradio">★★</label>
						<label class="radio-inline"><input type="radio" name="optradio">★★★</label>
						<label class="radio-inline"><input type="radio" name="optradio">★★★★</label>
						<label class="radio-inline"><input type="radio" name="optradio">★★★★★</label>
					</td>
				<tr>
					<td colspan="4"><textarea id="edit" name="text_area" class="form-control"></textarea><script>
	             
	            </script></td>
	            </tr>
	            <tr>
	            	<td>
	            		<label class="control-label">첨부 파일</label>
	            	</td>
	            	<td colspan="3">
	            		<input type="file" id="inputdefault" class="form-control"/>
	            	</td>
	            </tr>
			</table>
			<div class="col-md-1 col-md-offset-0" >
				<input  class="btn" type="button" value="목록">
			</div>
			<div class="col-md-1 col-md-offset-9">
				<input class="btn" type="button" value="등록">
			</div>
			<div class="col-md-1 col-md-offset-0">
				<input class="btn" type="button" value="취소">
			</div>
		</form>
	</div>
</div>







