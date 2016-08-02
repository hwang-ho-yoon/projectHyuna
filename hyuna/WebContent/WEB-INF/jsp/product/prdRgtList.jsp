<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" >
$(function() {
	$(".goDetail").click(function() {
		var prd_no = $(this).parents("tr").attr("data-num");
		$("#prd_no").val(prd_no);
		console.log("상품번호:" + $("#prd_no").val());
		//상세페이지로 이동하기 위해 form 을 추가
		$("#looKDetail").attr({
			"method" : "get",
			"action" : "/product/prdMgrDetail.do"
		});
		$("#looKDetail").submit();
	});
});
function prdWriteFrom() {
		location.href="/product/prdWriteForm.do";
}
</script>
<div id="wrapper">	
	<div class="container">
	<div class="row">
	<h1>등록된 상품 목록</h1>
	<!-- 새상품 등록 -->
	<div class="prdBtn">
	<button type="button" id="InsertBtn" class="btn btn-default pull-right" onclick="prdWriteFrom()">상품등록</button>
	</div>
	</div>
<form id="looKDetail" name="looKDetail">
	<input type="hidden" id="prd_no" name="prd_no"/>
</form>		
	<div class="row">
	<!-- 상품목록 테이블 -->
	<table class="table table-hover table-condensed">
  		<colgroup>
					<col width="10%" />
					<col width="60%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />					
		</colgroup>
  		<thead >
  			<tr>
  			<th>코드</th><th>상품명</th><th>상태</th><th>판매가</th><th>등록일</th>
  			</tr>
  		</thead>
  		<tbody>
  			<%--===========데이터 출력============ --%>
					<c:choose>
						<c:when test="${not empty prdRgtList }">
							<c:forEach var="prd" items="${prdRgtList }" varStatus="status">
								<!-- status 인텍스 상테를 판단가능하다. -->
								<tr class="tac" data-num="${prd.prd_no }">
									<td>${prd.prd_no }</td>
									<td><span class="goDetail">${prd.prd_name }
										<span>- ${fn:substring(prd.prd_desc,0,30)}...</span></span>
									</td>
									<td>${prd.prd_display }</td>
									<td>${prd.prd_saleprice }</td>
									<td>${prd.prd_inputdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise><tr><td colspan="6" class="tac"> 등록된 게시물이 없습니다.</td></tr></c:otherwise>						
					</c:choose>
  		</tbody>
	</table>
	</div>
	</div>
</div>