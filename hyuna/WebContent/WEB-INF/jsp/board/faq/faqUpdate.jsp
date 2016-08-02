<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function(){
		$("#btn_faq_modify").click(function(){
				$("#f_updateForm").attr({
					"method" : "post",
					"action" : "/board/faq/faqUpdate.do"
				});
				$("#f_updateForm").submit();
			}
			
		)
		
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#btn_faq_list").click(function() {
			location.href="/board/faq/faqList.do";
		});
	});
</script>
<body>
			<form id="f_writeForm" name="f_writeForm">
				<input type="hidden" id="faq_no" name="faq_no" value="${detail.faq_no }"/>
				<input type="hidden" name="page" id="page" value="${param.page }"/>
				<input type="hidden" name="pageSize" id="pageSize" value="${param.pageSize}"/>
			</form>
		<div id="wrapper">
		<div  class="board">
			<form id="f_updateForm" method = "post">
				<input type="hidden" id="faq_no" name="faq_no" value="${detail.faq_no }"/>
				<input type="hidden" id="" name="" value=""/>
				<table class="table table-bordered">
		    		<tr>
		    			<td>제목</td>
		    			<td colspan="3"><input type="text" id="faq_title" name="faq_title" class="form-control" value="${detail.faq_title }"></td>
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
		    			<td colspan="4"><textarea id="faq_content" name="faq_content" class="form-control">${detail.faq_content}</textarea></td>
		    		</tr>
				</table>
				<!-- 버튼들 -->
				<div class="col-md-1">
				<input type="button" class="btn btn-info btn-block" id="btn_faq_list" value="목록">
				</div>
				<div class="col-md-1 col-md-offset-10">
				<input type="button" class="btn btn-info btn-block" id="btn_faq_modify" value="수정">
				</div>
			</form>
		</div>
	</div>
</body>
</html>