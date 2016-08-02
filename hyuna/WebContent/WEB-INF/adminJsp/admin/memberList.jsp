<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag1.tld" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">	
	
	$(function(){
		$("#wrapper").hide();
		var a = "${not empty sessionScope.admin }";
		if(a == "false"){
			alert("관리자 페이지 입니다 로그인을 해주세요.");
			location.href = "/admin/adminLogin.do";			
		}else{
			$("#wrapper").show();
		}		
		//이름 클릭시 상세 페이지 이동을 위한 처리 이벤트
		$(".goDetail").click(function(){			
			var mem_no = $(this).parents("tr").attr("data-num");
			$("#mem_no").val(mem_no);
			//상세 페이지로 이동하기 위해 form 추가
			
			$("#detailForm").attr({
				"method":"get",
				"action":"/admin/memberDetail.do"
			});
			$("#detailForm").submit();			
		});
		/* 검색 후 검색 대상과 검색 단어 출력 */
		if("<c:out value='${data.keyword}'/>"!=""){
			$("#keyword").val("<c:out value='${data.keyword}'/>");
			$("#search").val("<c:out value='${data.search}'/>");
		}
		
		$("#month").val("<c:out value='${data.month}'/>");
				
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
				
			}
			goPage(1);
		});
		
		/* 엑셀다운로드 버튼 클릭시 처리 이벤트 */
/* 		$("#excelDown").click(function(){
			$("#f_search").attr({
				"method":"get",
				"action":"/board/boardExcel.do"
			});
			$("#f_search").submit();
		}); */
			
		/* 한 페이지에 보여줄 레코드 수 변경될 때마다 처리 이벤트 */
		$("#pageSize").change(function(){			
			goPage(1);
		});
		
		$("#month").change(function(){			
			goPage(1);
		});
		
		//월별검색
		/* $("#monthSearch").click(function(){			
			$("#m_form").attr({
				"method":"get",
				"action":"/admin/memberList.do"
			});
			$("#m_form").submit();
		}); */
		
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
			"action":"/admin/memberList.do"
		});
		$("#f_search").submit();
	}

</script>
</head>
<body>
<div id="wrapper">
	<div class="contentTit" class="col-md-12"><h3>회원 리스트</h3></div>
		<div>
		<form id="m_form">		
			총 회원수:${memTotal } 오늘 가입:${today } 어제 가입:${yesterday } 일주일간:${week } 한달간:${month }

		</form>			
		</div>
		
		<!-- 상세 페이지 이동을 위한 form -->
		<form id="detailForm" name="detailForm">
			<input type="hidden"  name="mem_no" id="mem_no">
		 	<input type="hidden"  name="page" value="${data.page }">
			<input type="hidden"  name="pageSize" value="${data.pageSize }">
			<input type="hidden" name="month" value="${data.month }">
		</form> 
		
		<!-- 검색기능 시작 -->
		<div id="boardSearch">
			<form id="f_search" name="f_search" class="form-inline">
				<input type="hidden" id="page" name="page" value="${data.page }">
				<input type="hidden" id="order_by" name="order_by" value="${data.order_by }">
				<input type="hidden" id="order_sc" name="order_sc" value="${data.order_sc }">
				<table summary="검색" class="col-md-12 table" >
					<tr>				
						<td id="btd1" style="width: 170px">				
							<label>검색조건</label>
							<select id="search" name="search" class="form-control input-sm" style="height: 30px; width: 80px">
								<option value="all">전체</option> 
								<option value="mem_name">이름</option> 
								<option value="mem_id">아이디</option>								
								<option value="mem_registdate">아이디</option>								
							</select>
						</td>
						<td>	
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="input-sm form-control">&nbsp;
							<button type="button" id="searchData" class="btn btn-default btn-sm" style="margin: 0">검색</button>
						</td>	
						
						<td id="btd2" style="width: 40%">
						<button type="button" id="excelDown" class="btn btn-default btn-sm" style="margin: 0">엑셀 다운로드</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;한페이지에						
							<select id="pageSize" name="pageSize" class="form-control input-sm" style="height: 30px; width: 80px">
								<option value="5">5줄</option>
								<option value="10">10줄</option>
								<option value="15">15줄</option>
								<option value="20">20줄</option>
								<option value="30">30줄</option>
								<option value="50">50줄</option>
							</select>
							<select id="month" name="month" style="height: 25px">
								<option value="" selected="selected">-전체-</option>
								<option value="/01/">1월</option>
								<option value="/02/">2월</option>
								<option value="/03/">3월</option>
								<option value="/04/">4월</option>
								<option value="/05/">5월</option>
								<option value="/06/">6월</option>
								<option value="/07/">7월</option>
								<option value="/08/">8월</option>
								<option value="/09/">9월</option>
								<option value="/10/">10월</option>
								<option value="/11/">11월</option>
								<option value="/12/">12월</option>
							</select>														
						</td>
					</tr>					
				</table>
			</form>
		</div>
					
		<!-- =======================리스트 시작	========================= -->
		<div id="boardList" class="col-md-12">
		<table summary="게시판 리스트" style="background:white; " class="col-md-12 table">
			<colgroup>
				<col width="10%"/>
				<col width="10%"/>
				<col width="20%"/>
				<col width="30%"/>
				<col width="30%"/>
			</colgroup>
			<thead>
 				<tr>
					<th><a href="javascript:setOrder('mem_no');">회원번호
 						<c:choose>
							<c:when test="${data.order_by=='mem_no' and data.order_sc=='ASC' }">▲</c:when>
							<c:when test="${data.order_by=='mem_no' and data.order_sc=='DESC' }">▼</c:when>
							<c:otherwise>▲</c:otherwise>
						</c:choose>
					</a></th>
					<th><a href="javascript:setOrder('mem_name');">이름
						<c:choose>
							<c:when test="${data.order_by=='mem_name' and data.order_sc=='ASC' }">▲</c:when>
							<c:when test="${data.order_by=='mem_name' and data.order_sc=='DESC' }">▼</c:when>
							<c:otherwise>▲</c:otherwise>
						</c:choose>
					</a></th>
					<th><a href="javascript:setOrder('mem_registdate');">아이디
						<c:choose>
							<c:when test="${data.order_by=='mem_registdate' and data.order_sc=='ASC' }">▲</c:when>
							<c:when test="${data.order_by=='mem_registdate' and data.order_sc=='DESC' }">▼</c:when>
							<c:otherwise>▲</c:otherwise>
						</c:choose>
					</a></th>
					<th><a href="javascript:setOrder('mem_registdate');">회원 가입일
						<c:choose>
							<c:when test="${data.order_by=='mem_registdate' and data.order_sc=='ASC' }">▲</c:when>
							<c:when test="${data.order_by=='mem_registdate' and data.order_sc=='DESC' }">▼</c:when>
							<c:otherwise>▲</c:otherwise>
						</c:choose>
					</a></th>				
					<th><a href="javascript:setOrder('mem_updatedate');">마지막 수정일
						<c:choose>
							<c:when test="${data.order_by=='mem_updatedate' and data.order_sc=='ASC' }">▲</c:when>
							<c:when test="${data.order_by=='mem_updatedate' and data.order_sc=='DESC' }">▼</c:when>
							<c:otherwise>▲</c:otherwise>
						</c:choose>
					</a></th>								
				</tr>
			</thead>
			<tbody>
			<!-- 데이터 출력 -->
			<c:choose>
				<c:when test="${not empty memberList }">
					<c:forEach var="member" items="${memberList }" varStatus="status">
						<tr class="tac" data-num="${member.mem_no }">
							<td>${member.mem_no }</td>
							<td class="tal">
							 	<span class="goDetail" style="cursor: pointer;">${member.mem_name }*</span>
							</td>
							<td>${member.mem_id }****</td>
							<td>${member.mem_registdate }</td>
							<td>${member.mem_updatedate }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="4" class="tac">회원이 존재하지 않습니다</td>
				</tr>
				</c:otherwise>
			</c:choose>			
			</tbody>
		</table>
		</div>
		<!-- 리스트 종료 -->
		
		<!-- 글쓰기 버튼 출력 시작 -->
		<div class="contentBtn">
			<input type="button" value="" id="InsertFormBtn" disabled="disabled" style="background: white">
		</div>
		<!-- 글쓰기 버튼 출력 종료 -->
		
		<!-- 페이지 네비게이션 시작 -->
		<div id="boardPage" align="center" style="margin-bottom: 20px">
			 <tag:paging page="${param.page }" total="${total }" list_size="${data.pageSize }"/> 
		</div>
		<!-- 페이지 네비게이션 종료 -->
		
	</div>
</body>
</html>