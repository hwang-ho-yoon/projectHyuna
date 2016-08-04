<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag2.tld" %>
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
			var review_no = $(this).parents("tr").attr("data-num");
			$("#review_no").val(review_no);
			//상세 페이지로 이동하기 위해 form 추가
			
			$("#detailForm").attr({
				"method":"get",
				"action":"/board/review/reviewDetail.do"
			});
			$("#detailForm").submit();
		});
		
		$(".goDetail").mouseout(function(){
			$(this).css("text-decoration","none");	
		});
		$(".goDetail").mouseover(function(){
			$(this).css("text-decoration","underline");	
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
			"action":"/board/review/reviewList.do"
		});
		$("#f_search").submit();
	}
</script>
	<div id="wrapper" style="margin-top: 50px">
		<div class="board">
		<form id="detailForm" name="detailForm">
			<input type="hidden" name="review_no" id="review_no">
			<input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.hyunaMember }">
			<input type="hidden" name="page" value="${data.page }">
			<input type="hidden" name="pageSize" value="${data.pageSize }">
		</form>
		<form>
			<table class="table table-bordered">
		    <thead>
		      <tr>     
		        <th width="10%" style="text-align: center; background: #F6F6F6">글번호</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">상품정보</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">제목</th>
		        <th width="30%" style="text-align: center; background: #F6F6F6">작성자</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">평점</th>
		        <th width="20%" style="text-align: center; background: #F6F6F6">작성일</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:choose>
						<c:when test="${not empty reviewList }">
							<c:forEach var="review" items="${reviewList}" varStatus="status">
							<tr data-num="${review.review_no }">
								<td align="center">${review.review_no }</td> <!-- 번호 -->
								<td align="center">
									
										${review.prd_name }									
																	
									</td>
								
								<td>
									<span class="goDetail" style="cursor: pointer;">${review.review_title }</span>
								</td>
								<td align="center">${review.mem_name}</td>
								<td align="center">${review.review_score }</td>
								<td align="center">${review.review_writedate }</td>
								<td align="center">${review.review_hit }</td>
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
		<!-- 검색밑 페이징 -->
		<form>
			<select id="pageSize" name="pageSize">
				<option value="10">10줄</option>
				<option value="20">20줄</option>
				<option value="30">30줄</option>
				<option value="50">50줄</option>
				<option value="70">70줄</option>
				<option value="100">100줄</option>
			</select>
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-default" id="review_write" >글쓰기</button>
			</div>			
		</form>
		<div id = "boardPage" align="center" style="margin-bottom: 20px">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div>
		<div class="bottom">
		<form class="form-inline" role="form">
			<div class="col-md-5 col-md-offset-4 form-group" >
				<select id="search" name="search" class="form-control input-sm" style="height: 30px; width: 80px">
					<option>제목</option>
					<option>작성자</option>
				</select>
				<button type="button" class="btn btn-default" id="searchBtn" >검색</button>
				<input type="text" class="form-control" id="search" name="search" placeholder="검색">
				
			</div>
		</form>
		</div>
		</div>

		</div>

