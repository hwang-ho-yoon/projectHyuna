<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(function() {
		/*목록 버튼 클릭 시 처리 이벤트*/
		$("#orderList").click(function() {
			location.href="/order/orderList.do?page=${param.page}&pageSize=${param.pageSize}&keyword=${param.keyword}&keyword1=${param.keyword1 }";
		});
	});
</script>
	<div id="wrapper">
		<div class="col-md-12" style="padding: 0"> 
			<h3>결제정보</h3> 
			<hr></hr>
		</div>
		<table class="table table-hover table-bordered">
			<tr>
				<th style="width: 30%">주문금액</th>
				<td><c:out value="sum"></c:out></td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>
					<c:choose>
						<c:when test="${orderGroup.ogr_payPlan == 'card'}">
							카드결제							
						</c:when>
						<c:otherwise>
							무통장
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</table>
		<div class="col-md-12" style="padding: 0"> 
			<h3>주문 상품 정보</h3> 
			<hr></hr>
		</div>
		<table class="shop_table" id="productTable" >
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>옵션명</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${not empty productAllVO }">
					<c:forEach var="prdAll" items="${productAllVO }" varStatus="status">
						<tr>
							<td class="product-thumbnail"><input type="hidden" name="prd_d_no" value="${prdAll.prd_d_no }" /><img src="/main/${prdAll.img_1 }" alt="" class="center-block" style="height: auto;"></td>
							<td class="product-name">${prdAll.prd_name }</td>
							<td class="product-name">${prdAll.model_machine } - ${prdAll.color_detail }</td>
							<td class="product-price">${prdAll.prd_saleprice }</td>
							<td class="product-quantity"><input type="hidden" name="ord_amount" value="${prdAll.prd_d_stock }" />${prdAll.prd_d_stock }</td>
							<td class="product-subtotal">${prdAll.prd_saleprice * prdAll.prd_d_stock}<c:set var="total" value="${prdAll.prd_saleprice * prdAll.prd_d_stock}"/></td>
						</tr>
						<c:set var="sum" value="${sum + total}"/>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">등록된 상품이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div class="col-md-12" style="padding: 0"> 
			<h3>배송지 정보</h3> 
			<hr></hr>
		</div>
		<table class="table table-hover table-bordered">
			<tr>
				<th style="padding-top: 35px">받는사람</th>
				<td>
					${orderGroup.ogr_reciName} <br>
					(${orderGroup.ogr_reciZipCode}) ${orderGroup.ogr_reciAddr1} ${orderGroup.ogr_reciAddr2}<br>
					${orderGroup.ogr_reciTel}<br>
					${orderGroup.ogr_message}
				</td>
			</tr>
		</table>
		<table class="table">
			<tr>
				<td align="right" style="padding-right: 0"><button type="button" class="btn btn-primary btn-sm" id="orderList">목록</button></td>
			</tr>
		</table>
	</div>
