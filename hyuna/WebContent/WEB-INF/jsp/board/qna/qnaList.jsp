<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
	<div id="wrapper">
		<div class="board">
		<form>
			<table class="table table-bordered">
		    <thead>
		      <tr>     
		        <th width="10%">글번호</th>
		        <th width="10%">상품정보</th>
		        <th width="10%">카테고리</th>
		        <th width="30%">제목</th>
		        <th width="10%">작성자</th>
		        <th width="10%">작성일</th>
		        <th width="10%">조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:choose>
						<c:when test="${not empty qnaList }">
							<c:forEach var = "faq" items="${qnaList}" varStatus="status">
							<tr data-num="${qna.qna_no }">
								<td>${qna.qna_no }</td> <!-- 번호 -->
								<td>
									<span>${qna.qna_title }</span>
								</td>
								<td>${qna.qna_content}</td>
								<td>${qna.qna_writedate }</td>
								<td>${qna.qna_hit }</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">등록된 게시물이 존재하지 않습니다</td>
							</tr>
				 	</c:otherwise>
					</c:choose>
		    </tbody>
		  </table>
		</form>
		<form>
			<div class="col-md-1 col-md-offset-11">
			<input type="button" class="btn btn-info" id="qna_write" value="글쓰기">
			</div>
		</form>
		<div class="bottom">
		<form class="form-inline" role="form">
			<div class="col-md-5 col-md-offset-4 form-group" >
				<select class="form-control" id="select">
				  <option>제목</option>
				  <option>작성자</option>
				  </select>
		<input type="text" class="form-control" id="search" name="search" placeholder="검색">
		 <input type="button" class="btn btn-info" id="searchBtn" name="searchBtn" value="검색">
			</div>
		</form>
		</div>
		</div>
		<div id = "boardPage">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div>
		</div>
<script>
	$(function(){
		$("#qna_write").click(function(){
			location.href = "/board/qna/qnaWrite.do";
		})
	})
</script>
