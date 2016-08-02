<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
<div id="wrapper">
	<div class="bottom">
		<form id="faq_write">
			<table class="table table table-bordered" enctype="multipart/form-data">
				<tr>
					<td width="10%"><label class="control-label">제목</label></td>
					<td width="10%">
						<select class="form-control">
						<option value="qq">상품문의</option>
						<option value="dd">배송문의</option>
						<option value="etc">기타문의</option>
						</select>
					</td>
					<td width="70%">
						<input type="text" id="inputdefault" name="faq_title" class="form-control">
					</td>
				</tr>
				<tr>
					<td colspan="4"><textarea id="edit" name="text_area" class="form-control"></textarea><script>
	                // Replace the <textarea id="editor1"> with a CKEditor
	                // instance, using default configuration.
	               
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







