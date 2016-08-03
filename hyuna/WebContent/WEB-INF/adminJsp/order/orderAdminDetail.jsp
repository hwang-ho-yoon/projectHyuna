<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div id="wrapper">
		<div class="col-md-12" style="padding: 0"> 
			<h3>결제정보</h3> 
			<hr></hr>
		</div>
		<table class="table table-hover table-bordered">
			<tr>
				<th style="width: 30%">주문금액</th>
				<td>90,000원</td>
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
		<table class="table table-hover table-bordered">
			<tr>
				<th>번호</th>
				<th>상품/옵션정보</th>
				<th>수량</th>
				<th>상품금액</th>
				<th>주문상태</th>
			</tr>
			<tr>
				<td>1</td>
				<td>비비드망고 땡땡이 아크릴 패치</td>
				<td>15,000원</td>
				<td>2</td>
				<td>구매완료</td>
			</tr>
			<tr>
				<td>2</td>
				<td>갤럭시 노트 3 케이스</td>
				<td>19,000원</td>
				<td>1</td>
				<td>구매완료</td>
			</tr>
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
	</div>
