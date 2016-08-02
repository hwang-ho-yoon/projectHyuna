<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>

  <script src="/include/board/js/ckeditor/ckeditor.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <!-- 게시판 전용
  게시판 전용
  게시판 전용
  게시판 전용
  게시판 전용
   -->
   </head>
   <body>
	<div id="wrapper">
		<div class="board">
			<form>
				<table class="table table-bordered">
		    		<tr>
		    			<td style="background-color:grey">제목</td>
		    			<td colspan="3">ㅁㄴㅇㅇㅇ</td>
		    		</tr>
		    		<tr>
		    			<td style="background-color:grey">작성자</td>
		    			<td colspan="3">ㅁㄴㅇㅇㅇ</td>
		    		</tr>
		    		<tr>
		    			<td style="background-color:grey">작성일</td>
		    			<td>2016-11-11</td>
		    			<td style="background-color:grey">조회수</td>
		    			<td colspan="2">1</td>
		    		</tr>
		    		<tr>
		    			<td colspan="4">본문</td>
		    		</tr>
				</table>
				<!-- 버튼들 -->
				<div class="col-md-1">
				<input type="button" class="btn btn-info btn-block" id="list" value="목록">
				</div>
				<div class="col-md-1 col-md-offset-9">
				<input type="button" class="btn btn-info btn-block" id="delete" value="삭제">
				</div>
				<div class="col-md-1">
				<input type="button" class="btn btn-info btn-block" id="modify" value="수정">
				</div>
			</form>
		</div>
	</div>
<script>
	$(function(){
		$("#write").click(function(){
			location.href = "/board/faqwrite.do";
		})
	})
</script>

