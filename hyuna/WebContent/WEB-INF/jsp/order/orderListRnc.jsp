<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
	var group_no;
	$(function() {
		$(".ogr_no").click(function(){
			group_no = $(this).attr("data-num");
			location.href = "/order/orderDetail.do?ogr_no="+group_no;
		});
		$(".rncDetail").click(function() {
			group_no = $(this).parents("tr").children().eq(0).attr("data-num");
			var url = "/order/all/" + group_no + ".do";
			$.getJSON(url, function(data){
				$("#ogr_no").val(data.ogr_no);
				$("#rnc_date").val(data.rnc_date);
				$("#rnc_desc").val(data.rnc_desc);
				$('#rncDetailModal').modal('show');
			}).fail(function() {
				alert("시스템 오류 입니다. 관리자에게 문의 하세요");
			});
		}) 
	});
</script> 
	<div id="wrapper">
		<div class="col-md-12" style="padding: 0"> 
			<h3>주문 취소/반품 조회</h3> 
			<hr></hr>
		</div>
		<table class="table table-hover table-bordered">
			<tr>
				<th style="width: 21.3%; padding-top: 30px; padding-left: 60px">조회기간</th>
				<td>
					<div class="col-md-2" align="right">
						<label style="margin-top: 5px">시작일</label> 
					</div>
					<div class="col-md-4">
						<input type="date" class="form-control input-sm">
					</div>
					<div class="col-md-2" align="right">
						<label style="margin-top: 5px">종료일</label>
					</div>
					<div class="col-md-4">
						<input type="date" class="form-control input-sm">
					</div>
					 <div class="col-md-offset-2 col-md-10">
				    <div class="input-group">
				      <input type="text" style="margin-top: 5px" class="form-control input-sm">
				      <span class="input-group-btn">
				        <button class="btn btn-default btn-sm" type="button">검색</button>
				      </span>
				    </div><!-- /input-group -->
				  </div><!-- /.col-lg-6 -->
				</td>
			</tr>
		</table>
		<table class="table table-hover table-bordered">
			<tr>
				<th>주문번호</th>
				<th>주문 상품 정보</th>
				<th>상품 금액</th>
				<th>주문상태</th>
				<th>상세내역</th>
			</tr>
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty orderGroups}">
						<c:forEach var="orderGroup" items="${orderGroups}" varStatus="Groupstatus">
							<tr> 
								<td class="ogr_no" style="padding-top: 14px" data-num="${orderGroup.ogr_no}">${orderGroup.ogr_no}</td>
								<td style="padding-top: 14px">
									<c:forEach var="orderProduct" items="${orderGroup.orderProductVO}" varStatus="Productstatus">
										<c:if test="${Productstatus.index eq 0}">
											${orderProduct.prd_d_no} 외 ${fn:length(orderGroup.orderProductVO)}개
										</c:if>
									</c:forEach>
								</td>
								<td style="padding-top: 14px">
									<c:forEach var="orderProduct" items="${orderGroup.orderProductVO}" varStatus="Productstatus">
										<c:if test="${Productstatus.index eq 0}">
										<%-- <c:set var= "sum" value="${sum + test.column_id}"/> --%>
											${orderProduct.ord_amount}외 ${fn:length(orderGroup.orderProductVO)}개
										</c:if>
									</c:forEach>
								</td>
								<td style="padding-top: 14px">
									<c:choose>
										<c:when test="${orderGroup.ogr_state == 'standby_cancel'}">
											취소대기
										</c:when>
										<c:when test="${orderGroup.ogr_state == 'complete_cancel'}">
											취소완료
										</c:when>
										<c:when test="${orderGroup.ogr_state == 'standby_recall'}">
											반품대기
										</c:when>
										<c:when test="${orderGroup.ogr_state == 'complete_recall'}">
											반품완료
										</c:when>
										<c:otherwise>
											알수없는 상태입니다.
										</c:otherwise>
									</c:choose>
								</td>
								<td align="center">
									<button class="btn btn-default btn-sm rncDetail" style="margin: 0">상세보기</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">등록된 게시물이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
		</table>
		<div id="rncDetailModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">취소/반품 상세보기</h4>
		            </div>
		            <div class="modal-body" style="padding-bottom: 0px">
            			<form id="cancelFrm">
							<div class='form-group'>
								<div>
									<label>주문 번호</label>
									<input type="text" class="form-control input-sm" id="ogr_no" readonly="readonly" style="background: white;"/>
								</div>
								<div>
									<label>날짜</label>
									<input type="text" class="form-control input-sm" id="rnc_date"  readonly="readonly" style="background: white;"/>
								</div>
								<div>
									<label for='rnc_desc'>사유</label>
									<textarea class='form-control input-sm' rows='5' id="rnc_desc" readonly="readonly" style='resize: none; background: white;'> </textarea>
								</div>
							</div>
						</form>
		            </div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">확인</button>
            	   </div>
	         	</div>
         	</div>
         </div>
	</div>
