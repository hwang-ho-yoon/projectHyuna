<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	<div id="wrapper">
		<div  class="board">
			<form id="f_updateForm" method = "get">
				<input type="hidden" id="faq_no" name="faq_no" value="${detail.faq_no }"/>
				<input type="hidden" id="" name="" value=""/>
				<table class="table table-bordered">
		    		<tr>
		    			<td>제목</td>
		    			<td colspan="3">${detail.faq_title }</td>
		    		</tr>
		    		<tr>
		    			<td>작성자</td>
		    			<td colspan="3">${detail.adm_id }</td>
		    		</tr>
		    		<tr>
		    			<td>작성일</td>
		    			<td>${detail.faq_writedate }</td>
		    			<td>조회수</td>
		    			<td colspan="2">${detail.faq_hit }</td>
		    		</tr>
		    		<tr>
		    			<td colspan="4">${detail.faq_content}</td>
		    		</tr>
				</table>
				<!-- 버튼들 -->
				<div class="col-md-1">
				<input type="button" class="btn btn-info btn-block" id="btn_faq_list" value="목록">
				</div>
				<div class="col-md-1 col-md-offset-9">
				<input type="button" class="btn btn-info btn-block" id="btn_faq_delete" value="삭제">
				</div>
				<div class="col-md-1">
				<input type="button" class="btn btn-info btn-block" id="btn_faq_modify" value="수정">
				</div>
			</form>
		</div>
	</div>

<script>
	$(function(){
		$("#btn_faq_modify").click(function(){
			location.href="/board/faq/faqUpdateForm.do?faq_no="+${detail.faq_no}+"&faq_hit="+${detail.faq_hit};
		});
		$("#btn_faq_delete").click(function(){
			$("#f_updateForm").attr({
				"method" : "get",
				"action" : "/board/faq/faqDelete.do"
			});
			$("#f_updateForm").submit();
		});
	});
		
		
	
</script>