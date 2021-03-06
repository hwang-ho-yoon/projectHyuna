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
			location.href = "/orderAdmin/orderAdminDetail.do?ogr_no="+group_no;
		});
		$("#delBtn").click(function() {
			$("#ogr_no").val(group_no);
			$("#ogr_delNo").val($("#delNo").val());
			$("#ogrListFrm").attr({
				"method" : "post",
				"action" : "/orderAdmin/orderAdminListDelivery.do"
			});
			$("#ogrListFrm").submit();
		});
		$(".ogr_approval").click(function() {
			group_no = $(this).parents("tr").children().eq(0).attr("data-num");
			$("#ogr_no").val(group_no);
			$("#ogrListFrm").attr({
				"method" : "post",
				"action" : "/orderAdmin/orderAdminListApproval.do"
			});
			$("#ogrListFrm").submit();
			
		});
		$(".ogr_delivery").click(function() {
			group_no = $(this).parents("tr").children().eq(0).attr("data-num");
			$("#delNo").val("");
			$('#delModal').modal('show');	
		});
	});
</script> 
	<div id="wrapper">
		<form id="ogrListFrm">
			<input type="hidden" id="ogr_no" name="ogr_no" value="">
			<input type="hidden" id="ogr_delNo" name="ogr_delNo" value="">
		</form>
		<div class="col-md-12" style="padding: 0"> 
			<h3>주문 조회</h3> 
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
				<th>상품 금액(수량)</th>
				<th>신청자</th>
				<th>주문상태</th>
				<th>승인/배송</th>
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
											${orderProduct.prd_name} - ${orderProduct.model_machine} - ${orderProduct.color_detail} 외 ${fn:length(orderGroup.orderProductVO)}개
										</c:if>
									</c:forEach>
								</td>
								<td style="padding-top: 14px">
									<c:forEach var="orderProduct" items="${orderGroup.orderProductVO}" varStatus="Productstatus">
										<c:set var= "sum" value="${sum + orderProduct.ord_amount * orderProduct.prd_saleprice}"/>
									</c:forEach>
										￦<c:out value="${sum}"/>
										<c:set var="sum" value="${sum * 0}"/>
								</td>
								<td style="padding-top: 14px">${orderGroup.mem_id}</td>
								<td style="padding-top: 14px">
									<c:choose>
										<c:when test="${orderGroup.ogr_state == 'standby_deposit'}">
											입금대기
										</c:when>
										<c:when test="${orderGroup.ogr_state == 'complete_deposit'}">
											입금완료
										</c:when>
										<c:when test="${orderGroup.ogr_state == 'standby_shipping'}">
											배송중
										</c:when>
										<c:when test="${orderGroup.ogr_state == 'complete_shipped'}">
											배송완료
										</c:when>
										<c:otherwise>
											알수없는 상태입니다.
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${orderGroup.ogr_state eq 'standby_deposit'}">
											<button class="btn btn-default btn-sm ogr_approval" style="margin: 0">승인</button>
										</c:when>
										<c:when test="${orderGroup.ogr_state eq 'complete_deposit'}">
											<button class="btn btn-default btn-sm ogr_delivery" style="margin: 0">배송</button>
										</c:when>
									</c:choose>
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
		<div id="delModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">배송 등록</h4>
		            </div>
		            <div class="modal-body">
		            	<div class="form-group" style="margin-bottom: 40px">
							<label for='delNo'>송장번호를 입력해주세요</label>
							<input type="text" class='form-control input-sm' id="delNo" name='delNo' />
						</div> 
		            </div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm" id="delBtn">저장</button>
		                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
            	   </div>
	         	</div>
         	</div>
         </div>
	</div>
