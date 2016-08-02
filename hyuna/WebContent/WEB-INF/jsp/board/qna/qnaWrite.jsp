<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	 
<script type="text/javascript">
	$(function(){
		$("#insertBtn").click(function(){			
			if(!cccc($("#qna_title"),"제목을 "))return;
			else if(!cccc($("#qna_content"),"내용을 "))return;
			else{
				$("#qna_write").attr({
					"method":"post",
					"action":"/board/qna/qnaInsert.do"
				});
				$("#qna_write").submit();
			}
		});
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
<div id="wrapper">
	<div class="bottom">
		<form id="qna_write">
			<table class="table table table-bordered" enctype="multipart/form-data">			
				<tr>
					<td width="10%"><label class="control-label">제목</label></td>
					<td width="15%">
					<input type="hidden" id="mem_no" name="mem_no" value="${sessionScope.hyunaMember }">
						<select class="form-control" id="qna_category" name="qna_category">
						<option value="qq">상품문의</option>
						<option value="dd">배송문의</option>
						<option value="etc">기타문의</option>
						</select>
					</td>
					<td width="75%">
						<input type="text"  name="faq_title" class="form-control" id="qna_title" name="qna_title">
					</td>
				</tr>
				<tr>
					<td width="10%"><label class="control-label">내용</label></td>
					<td colspan="2">
						<textarea  name="text_area" class="form-control"  rows="10" style='resize: none; ' id="qna_content" name="qna_content"></textarea>		               
		            </td>
	            </tr>
	            <tr>
	            	<td>
	            		<label class="control-label">첨부 파일</label>
	            	</td>
	            	<td colspan="3">
	            		<input type="file" id="inputdefault" class="form-control" name="file"/>
	            	</td>
	            </tr>
			</table>
			<div class="col-md-1 col-md-offset-0" >
				<input  class="btn" type="button" value="목록" id="listBtn">
			</div>
			<div class="col-md-1 col-md-offset-9">
				<input class="btn" type="button" value="등록" id="insertBtn">
			</div>
			<div class="col-md-1 col-md-offset-0">
				<input class="btn" type="button" value="취소" id="cancelBtn">
			</div>
		</form>
	</div>
</div>







