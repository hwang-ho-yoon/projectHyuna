<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	 <%@ page trimDirectiveWhitespaces="true" %>
	<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag2.tld" %>
<script type="text/javascript">
	$(function(){
		var prd_no = "${param.prd_no}";
		alert(prd_no);
		$.ajax({
			url : "/board/qna/proqnaList.do",
			type : "post",
			headers : {
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"
			},
			dataType:"text",
			data : JSON.stringify({
				prd_no:prd_no,				
			}),
		    error : function(){
				alert("실패");
		    },
		    success : function(resultData){			     
			    if(resultData==1){
					alert("성공");
			    }     
			}
		});
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
		$("#searchBtn").click(function(){			
			goPage(1);
		});
			
		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function(){			
			goPage(1);
		});
		
		/* 글쓰기 버튼 클릭 시 처리 이벤트 */
		$("#qna_write").click(function(){
			$("#propro").attr({
				"method":"post",
				"action":"/board/qna/qnaWrite1.do"
			});
			$("#propro").submit();
		});
		
		//제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function(){
			var qna_no = $(this).parents("tr").attr("data-num");
			$("#qna_no").val(qna_no);
			//상세 페이지로 이동하기 위해 form 추가
			
			$("#detailForm").attr({
				"method":"get",
				"action":"/board/qna/qnaDetail.do"
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
			"action":"/board/qna/qnaList.do"
		});
		$("#f_search").submit();
	}
</script>
<form id="propro">
<input type="hidden" name="pro_no" value="${detail.prd_no}">
</form>
	<div id="wrapper" style="margin-top: 50px;margin-bottom: 100px">	
		<div class="board">
		<!-- 상세이동 -->
		<form id="detailForm" name="detailForm">
			<input type="hidden" name="qna_no" id="qna_no">
			<%-- <input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.hyunaMember }"> --%>
			<input type="hidden" name="page" value="${data.page }">
			<input type="hidden" name="pageSize" value="${data.pageSize }">
		</form>
		<form>
			<table class="table table-bordered">
		    <thead>
		      <tr>     
		        <th width="10%" style="text-align: center; background: #F6F6F6">글번호
	        		<c:choose>					
						<c:when test="${data.order_by=='qno_no' and data.order_sc=='DESC' }"></c:when>						
					</c:choose>
		        </th>		        
		        <th width="10%" style="text-align: center; background: #F6F6F6">상품정보</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">카테고리</th>
		        <th width="30%" style="text-align: center; background: #F6F6F6">제목</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">작성자</th>
		        <th width="20%" style="text-align: center; background: #F6F6F6">작성일</th>
		        <th width="10%" style="text-align: center; background: #F6F6F6">조회수</th>
		      </tr>
		    </thead>
		    <tbody>
		     	<c:choose>
						<c:when test="${not empty qnaList }">
							<c:forEach var="qna" items="${qnaList}" varStatus="status">
							<tr data-num="${qna.qna_no }">
								<td align="center">${qna.qna_no }</td> <!-- 번호 -->
								<td align="center">
									
										${qna.prd_name }									
																	
									</td>
								<td align="center">${qna.qna_category }</td>
								<td>
									<span class="goDetail" style="cursor: pointer;">${qna.qna_title }</span>
								</td>
								<td align="center">${qna.mem_name}</td>
								<td align="center">${qna.qna_writedate }</td>
								<td align="center">${qna.qna_hit }</td>
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
		
		<form id="f_search">
			<input type="hidden" id="page" name="page" value="${data.page }">
			<input type="hidden" id="order_by" name="order_by" value="${data.order_by }">
			<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc }">		
			<select id="pageSize" name="pageSize">
				<option value="10">10개씩보기</option>
				<option value="20">20개씩보기</option>
				<option value="30">30개씩보기</option>
				<option value="50">50개씩보기</option>
				<option value="70">70개씩보기</option>
				<option value="100">100개씩보기</option>
			</select>
			<div class="col-md-1 col-md-offset-11">
				<button type="button" class="btn btn-default" id="qna_write" >글쓰기</button>
			</div>			
		
		<div id = "boardPage" align="center" style="margin-bottom: 20px">
			<tag:paging page="${param.page}" total="${total}" list_size="${data.pageSize}"/>
		</div>
		
		
			<div class="col-md-5 col-md-offset-4 form-group" >
				<select id="search" name="search" class="input-sm" style="height: 30px; width: 80px">
					<option value="all">전체</option>
					<option value="qna_title">제목</option>
					<option value="qna_content">내용</option>
					<option value="mem_name">작성자</option>
				</select>
				<input type="text"  id="keyword" name="keyword"  style="height: 30px; ">
				<button type="button" class="btn btn-default" id="searchBtn" style="height: 30px; width: 50px; margin-top: -5px">검색</button>
			</div>
		</form>
		</div>
		</div>


		

