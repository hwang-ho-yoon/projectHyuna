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
		$(".ogr_cancel").click(function() {
			group_no = $(this).parents("tr").children().eq(0).attr("data-num");
			$("#cancel_desc").val("");
			$('#cancelModal').modal('show');			
		});
		$(".ogr_recall").click(function() {
			group_no = $(this).parents("tr").children().eq(0).attr("data-num");
			$("#recall_desc").val("");
			$('#recallModal').modal('show');			
		});
		$("#cancelBtn").click(function() {
			$("#cancel_ogr_no").val(group_no);
			$("#cancelFrm").attr({
				"method" : "post",
				"action" : "/order/orderCancel.do"
			});
			$("#cancelFrm").submit();
		});
		$("#recallBtn").click(function() {
			$("#recall_ogr_no").val(group_no);
			$("#recallFrm").attr({
				"method" : "post",
				"action" : "/order/orderRecall.do"
			});
			$("#recallFrm").submit();
		});
	});
</script> 
	<div id="wrapper">
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
				<th>주문상태</th>
				<th>반품/취소</th>
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
										<c:when test="${orderGroup.ogr_state eq 'standby_deposit' || orderGroup.ogr_state eq 'complete_deposit'}">
											<button class="btn btn-default btn-sm ogr_cancel" style="margin: 0">취소</button>
										</c:when>
										<c:when test="${orderGroup.ogr_state eq 'standby_shipping' || orderGroup.ogr_state eq 'complete_shipped'}">
											<button class="btn btn-default btn-sm ogr_recall" style="margin: 0">반품</button>
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
		<div id="cancelModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">주문 취소</h4>
		            </div>
		            <div class="modal-body" style="padding-bottom: 0px">
            			<form id="cancelFrm">
            				<input type="hidden" id="cancel_ogr_no" name="ogr_no" value="0">
							<div class='form-group'>
								<label for='rnc_desc'>취소 사유를 입력해주세요</label>
								<textarea class='form-control input-sm' rows='5' id="cancel_desc" name='rnc_desc' style='resize: none;'> </textarea>
							</div>
						</form>
		            </div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm" id="cancelBtn">저장</button>
		                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
            	   </div>
	         	</div>
         	</div>
         </div>
         
		<div id="recallModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">주문 반품</h4>
		            </div>
		            <div class="modal-body" style="padding-bottom: 0px">
            			<form id="recallFrm">
            			<input type="hidden" id="recall_ogr_no" name="ogr_no" value="0">
							<div class='form-group'>
								<label for='rnc_desc'>반품 사유를 입력해주세요</label>
								<textarea class='form-control input-sm' rows='5' id="recall_desc" name='rnc_desc' style='resize: none;'> </textarea>
							</div>
						</form>
		            </div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm" id="recallBtn">저장</button>
		                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
            	   </div>
	         	</div>
         	</div>
         </div>
	</div>
