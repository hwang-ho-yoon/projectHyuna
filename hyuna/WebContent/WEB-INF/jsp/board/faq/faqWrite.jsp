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
					<td width="10%">제목</td>
					<td width="90%"><input type="text" id="faq_title" name="faq_title" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea id="edit" name="faq_content" class="form-control"></textarea><script>
	               
	            </script></td>
	            </tr>
			</table>
			<div class="col-md-1 col-md-offset-0" >
				<input type="button" class="btn" value="목록" id="btn_faq_list" name="btn_faq_list">
			</div>
			<div class="col-md-1 col-md-offset-9">
				<input type="button" class="btn" value="등록" id="btn_faq_write" name="btn_faq_write">
			</div>
			<div class="col-md-1 col-md-offset-0">
				<input type="button" class="btn" value="취소" id="btn_faq_reset" name="btn_faq_reset">
			</div>
		</form>
	</div>
</div>
<script>
	$(function(){
		$("#btn_faq_list").click(function(){
			location.href = "/board/faq/faqList.do";
		});
		$("#btn_faq_write").click(function(){
			location.href = "/board/faq/faqList.do";
		});
		$("#btn_faq_reset").click(function(){
			$("#faq_content").html("");
		});
		
	})
</script>







