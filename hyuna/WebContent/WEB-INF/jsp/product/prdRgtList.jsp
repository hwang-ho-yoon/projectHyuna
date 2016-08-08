<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(function() {
		$("#event").hide();
		$("#expose").hide();
		$("#srch").hide();

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
		$("#searchSelector").change(function() {
			var searchCondition = $("#searchSelector").val();
			console.log(searchCondition);
			if (searchCondition == "all") {
				$("#event").hide();
				$("#expose").hide();
				$("#srch").hide();
			}
			if (searchCondition == "event") {
				$("#expose").hide();
				$("#srch").hide();
				$("#event").show();
			}
			if (searchCondition == "expose") {
				$("#event").hide();
				$("#srch").hide();
				$("#expose").show();

			}
			if (searchCondition == "code" || searchCondition == "name") {
				$("#expose").hide();
				$("#event").hide();
				$("#srch").val("");
				$("#srch").show();

			}
		});
		$("#s_search").click(function() {
			var s_Condition = $("#searchSelector").val();
			var keyword = "";
			console.log(s_Condition);
			
			if (s_Condition == "all") {

			}
			if (s_Condition == "event") {
				keyword = $("#event").val();
			}
			if (s_Condition == "expose") {

				keyword = $("#expose").val();
			}
			if (s_Condition == "code" || s_Condition == "name") {

				keyword = $("#srch").val();
			}
			$("#s_condition").val($("#searchSelector").val());
			$("#s_word").val(keyword);
			console.log($("#s_condition").val() + " / " + $("#s_word").val());
			$("#s_form").attr({
				"method" : "get",
				"action" : "/product/prdRgtList.do"
			});
			$("#s_form").submit();
		});

	});
	function prdWriteFrom() {
		location.href = "/product/prdWriteForm.do";
	}
</script>
<div id="wrapper">
	<div class="container">
		<div class="row">
			<h1>등록된 상품 목록</h1>
			<!-- 새상품 등록 -->
			<form id="search form-inline">
			<!-- <div class=""> -->
				<label for="searchSelector" class="control-label col-xs-2" > 상품검색조건 </label> 
			<!-- 	</div> -->
				<div class="col-xs-3">
				<select	id="searchSelector" class="form-control">
					<option value="all" selected>====전체====</option>
					<option value="event">행사적용</option>
					<option value="expose">노출여부</option>
					<option value="code">상품코드</option>
					<option value="name">상품이름</option>
				</select> 
</div>
			<div class="col-xs-3">
				<select id="event" class="form-control">
					<option value="L">Latest</option>
					<option value="B">Best</option>
				</select> 
				<select id="expose" class="form-control">
					<option value="N">N</option>
					<option value="Y">Y</option>
				</select> 
				<input type="text" id="srch" name="srch" >
			</div>
			<div class="col-xs-4">
					<button type="button" id="InsertBtn"
						class="btn btn-default pull-right btn-xs" onclick="prdWriteFrom()">상품등록</button>
					<button type="button" class="btn btn-default pull-right btn-xs"
						id="s_search">찾기</button>
			</div>
			</form>
		</div>
		<form id="looKDetail" name="looKDetail">
			<input type="hidden" id="prd_no" name="prd_no" />
		</form>
		<form id="s_form" name="s_form">
			<input type="hidden" id="s_condition" name="s_condition" /> <input
				type="hidden" id="s_word" name="s_word" />
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
				<thead>
					<tr>
						<th>코드</th>
						<th>상품명</th>
						<th>상태</th>
						<th>판매가</th>
						<th>등록일</th>
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
									<td><span class="goDetail">${prd.prd_name } <span>-
												${fn:substring(prd.prd_desc,0,30)}...</span></span></td>
									<td>${prd.prd_display }</td>
									<td>${prd.prd_saleprice }</td>
									<td>${prd.prd_inputdate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6" class="tac">등록된 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>