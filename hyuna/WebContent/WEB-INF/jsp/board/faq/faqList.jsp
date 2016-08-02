<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
	<div id="wrapper">
		<div class="board">
		<form id="detailForm">
		<input type="hidden" id="faq_no" name="faq_no">
		</form>
		<form>
			<table class="table table-bordered">
		    <thead>
		      <tr>     
		  		<th width="10%">글번호</th>
		        <th width="60%">제목</th>
		        <th width="10%">작성자</th>
		        <th width="10%">작성일</th>
		        <th width="10%">조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:choose>
						<c:when test="${not empty faqList }">
							<c:forEach var = "faq" items="${faqList}" varStatus="status">
							<tr data-num="${faq.faq_no }">
								<td>${faq.faq_no }</td> <!-- 번호 -->
								<td>
									<span class="goDetail">${faq.faq_title }</span>
								</td>
								<td>${faq.adm_id}</td>
								<td>${faq.faq_writedate }</td>
								<td>${faq.faq_hit}</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise> --%>
							<tr>
								<td colspan="7">등록된 게시물이 존재하지 않습니다</td>
							</tr>
					</c:otherwise>
					</c:choose>
		    </tbody>
		  </table>
		</form>
	<%-- 	<div class="col-md-1 col-md-offset-5" id='boardPage'>
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div> --%>
		</div>
		<form>
			<div class="col-md-1 col-md-offset-11">
			<input type="button" class="btn btn-info" id="write" value="글쓰기">
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
		
<script>
	$(function(){
		$("#write").click(function(){
			location.href = "/board/faq/faqWrite.do";
		})
		$(".goDetail").click(function() {
			var faq_no = $(this).parents("tr").attr("data-num");
			$("#faq_no").val(faq_no);
			console.log("글번호 : " + faq_no);
			// 상세 페이지로 이동하기 위해 form 추가 (id : detailform)
			$("#detailForm").attr({
				"method" : "get",
				"action" : "/board/faq/faqDetail.do" 
			});
			$("#detailForm").submit();
		});
	})
</script>
