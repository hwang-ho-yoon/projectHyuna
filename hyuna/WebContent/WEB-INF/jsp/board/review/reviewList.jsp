<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %>
	<div id="wrapper">
		<div class="board">
		<form id="detailForm" name="detailForm">
			<input type="hidden" name="review_No" id="review_No">
			<%-- <input type="hidden" name="page" value="${data.page }">
			<input type="hidden" name="pageSize" value="${data.pageSize }"> --%>
		</form>
		<form>
			<table class="table table-bordered">
		    <thead>
		      <tr>     
		        <th width="10%">글번호</th>
		        <th width="10%">상품정보</th>
		        <th width="30%">제목</th>
		        <th width="10%">작성자</th>
		        <th width="10%">평점</th>
		        <th width="10%">작성일</th>
		        <th width="10%">조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:choose>
						<c:when test="${not empty reviewList }">
							<c:forEach var="review" items="${reviewList}" varStatus="status">
							<tr data-num="${review.review_No }">
								<td>${review.review_No }</td> <!-- 번호 -->
								<td>
									<c:choose>
										<c:when test="${review.prd_d_no==0 }"></c:when>									
									<c:otherwise>
										${review.prd_d_no }									
									</c:otherwise>
									</c:choose>								
									</td>
								<td>${review.review_score }</td>
								<td>
									<span class="goDetail">${review.review_title }</span>
								</td>
								<td>${review.mem_name}</td>
								<td>${review.review_writedate }</td>
								<td>${review.review_hit }</td>
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8">등록된 게시물이 존재하지 않습니다</td>
							</tr>
				 	</c:otherwise>
					</c:choose>
		    </tbody>
		  </table>
		</form>
		<form>
			<div class="col-md-1 col-md-offset-11">
			<input type="button" class="btn btn-info" id="review_write" value="글쓰기">
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
		
			<!-- 검색 -->
		<div id="boardSearch">
			<form id="f_search" name="f_search">
				<input type="hidden" id="page" name="page" value="${data.page }">
				<input type="hidden" id="order_by" name="order_by" value="${data.order_by }">
				<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc }">
				<table summary="검색">
					<colgroup>
						<col width="70&"></col>
						<col width="30&"></col>
					</colgroup>
					<tr>
						<td id="btd1">
							<label>검색조건</label>
							<select id="search" name="search">
								<option value="all">전체</option> 
								<option value="b_title">제목</option> 
								<option value="b_content">내용</option> 
								<option value="b_name">작성자</option> 
							</select>
							<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요">
							<input type="button" value="검색" id="searchData">						
					
						</td>
						<td id="btd2">한페이지에
							<select id="pageSize" name="pageSize">
								<option value="10">10줄</option>
								<option value="20">20줄</option>
								<option value="30">30줄</option>
								<option value="50">50줄</option>
								<option value="70">70줄</option>
								<option value="100">100줄</option>
							</select>
						</td>
					</tr>					
				</table>
			</form>
		</div>
<script type="text/javascript">
	$(function(){
		/* 검색 후 검색 대상과 검색 단어 출력 */
		if("<c:out value='${data.keyword}'/>"!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		
		/* 한 페이지에 보여줄 레코드 수 조회 후 선택한 값 그대로 출력 */
		if("<c:out value='${data.pageSize}'/>"!=""){
			$("#pageSize").val("<c:out value='${data.pageSize}'/>");			
		}
		
		/* 검색 대상이 변경될 때마다 처리 이벤트 */
		$("#search").change(function(){			
			if($("#search").val()=="all"){
				$("#keyword").val("전체 데이터 조회합니다");
			}else if($("#search").val()!="all"){
				$("#keyword").val("");
				$("#keyword").focus();				
			}
		});
		
		/* 검색 버튼 클릭시 처리 이벤트 */
		$("#searchData").click(function(){
			if($("#search").val()!="all"){
				if(!chkSubmit($('#keyword'),"검색어를"))return;
			}
			goPage(1);
		});
			
		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function(){			
			goPage(1);
		});
		
		/* 글쓰기 버튼 클릭 시 처리 이벤트 */
		$("#review_write").click(function(){
			location.href = "/board/review/reviewWrite.do";
		})
		
		//제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function(){
			var review_No = $(this).parents("tr").attr("data-num");
			$("#review_No").val(qna_no);
			//상세 페이지로 이동하기 위해 form 추가
			alert(qna_no);
			$("#detailForm").attr({
				"method":"get",
				"action":"/board/review/reviewDetail.do"
			});
			$("#detailForm").submit();
		});		
	});
	
	/* 정렬 버튼 클릭시 처리함수 */
	function setOrder(order_by){
		$("#order_by").val(order_by);
		if($("#order_sc").val()=='DESC'){
			$("#order_sc").val('ASC');
		}else{
			$("#order_sc").val('DESC');
		}
		goPage(1);
	}
	
	/* 검색과 한 페이지에 보여줄 레코드 수 처리 및 페이징을 */
	function goPage(page){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#page").val(page);
		$("#f_search").attr({
			"method":"get",
			"action":"/board/boardList.do"
		});
		$("#f_search").submit();
	}
</script>
