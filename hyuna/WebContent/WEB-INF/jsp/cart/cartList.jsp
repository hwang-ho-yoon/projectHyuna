<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/hyuna/include/fonts/fontawesome-webfont.eot">
<link rel="stylesheet" href="/hyuna/include/fonts/fontawesome-webfont.woff">
<link rel="stylesheet" href="/hyuna/include/fonts/fontawesome-webfont.ttf">
<link rel="stylesheet" href="/hyuna/include/fonts/fontawesome-webfont.svg">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Cart</title>
</head>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="/hyuna/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript">
	$(function() {
		/* 쇼핑계속하기 버튼 클릭 시 이벤트 처리 */
		$("#shopping").click(function() {
			location.href="../index.jsp";
		});		
		
		/* 전체 체크박스 클릭 시 이벤트 처리 */
		$("#allCheck").click(function() {
			if($("#allCheck").prop("checked")) {
					$("input[name=check]").prop("checked", true);
			} else {
					$("input[name=check]").prop("checked", false);
			}
		});
		
		// 담기버튼 클릭 시 이벤트 처리 */
		$("#addCart").click(function() {
			location.href="/cart/cartInsert.do";
		});		
		
		/* 장바구니 비우기 버튼 클릭 시 이벤트 */
		$("#allDelete").click(function() {
			
			if(confirm('장바구니를 비우겠습니까?')) {
				$.ajax({
					type : 'POST',
					url : "/cart/cartDelete.do",
					dataType : 'text',
					error : function() {
						alert('시스템 오류 입니다. 관리자에게 문의하세요.')
					},
					success : function(result) {
						console.log("result : " + result);
						if(result == 'SUCCESS') {
							alert("비우기 완료");
							location.href="/cart/cartList.do";
						}
					}
				});
			}
		});
	});

</script>
<body>
	<div class="single-product-area">
           <div class="row">               
               <div id="wrapper">
                   <div class="product-content-right">
                       <div class="woocommerce">
                           <form method="post" action="#">
                               <table cellspacing="0" class="shop_table cart">
                                   <thead>
                                       <tr>
                                           <th class="product-remove">
                                           		<input type="checkbox" id="allCheck" name="allCheck">
                                           </th>
                                           <th class="product-thumbnail">&nbsp;</th>
                                           <th class="product-name">상품명</th>
                                           <th class="product-name">옵션명</th>
                                           <th class="product-price">판매가</th>
                                           <th class="product-quantity">수량</th>
                                           <th class="product-deliveryCharge">배송비</th>
                                           <th class="product-subtotal">합계</th>
                                       </tr>
                                   </thead>
                                   <!-- ========================= 장바구니에 담긴 상품 리스트 출력 시작 ========================== -->
                                   <tbody>
                                   <c:choose>
                                   		<c:when test="${not empty cartList}">
                                   			<c:forEach var="cart" items="${cartList}" varStatus="status">
                                   				<tr class="cart_item">
                                           			<td><input type="checkbox" id="check" name="check"></td>
                                   					<td class="product-thumbnail"><span class="goDetail">${cart.img_1}</span></td>
                                   					<td class="product-name"><span class="goDetail">${cart.prd_name}</span>
                                   					<td class="product-name">${cart.model_machine} - ${cart.color_detail}</td>
                                   					<td class="product-price">￦${cart.prd_saleprice}</td>
                                   					<td class="product-quantity">
                                   						<div class="quantity buttons_added">
                                                    		<input type="number" class="form-control" title="Qty" value="${cart.cart_quantity}" min="0">
                                                			<button type="button" class="btn btn-default" style="margin-top: 0px">수정</button>
		                                                </div>
                                   					</td>
                                   					<td class="product-deliveryCharge"><span class="amount">￦2,500</span></td>
                                           			<td class="product-subtotal">￦${cart.prd_saleprice+2500}</td>
                                   				</tr>
                                   			</c:forEach>
                                   		</c:when>
                                   	<c:otherwise>
                               			<tr>
                               				<td colspan="8" class="cart_item">장바구니가 비어 있습니다.</td>
                               			</tr>
                                   	</c:otherwise>
                                   </c:choose>
                                                                          
                                       <tr>
                                           <td class="actions" colspan="8">
                                               <div class="btn_group1">
	                                               	<button type="button" class="btn btn-primary" name="checkDelete" id="checkDelete">선택삭제</button>
	                                               	<button type="button" class="btn btn-primary" name="allDelete" id="allDelete">장바구니 비우기</button>
	                                               	<button type="button" class="btn btn-primary" name="checkOrder" id="checkOrder">선택주문</button>
                                               </div>
										<!-- </td>
										<td> -->
										   <div class="btn_group2">
											   <button type="button" class="btn btn-primary" name="addCart" id="addCart">담기</button>
											   <button type="button" class="btn btn-primary" name="shopping" id="shopping">쇼핑계속하기</button>
											   <button type="button" class="btn btn-primary" name="allOrder" id="allOrder">전체주문</button>
                                           </div>
                                         </td>
                                       </tr>                       
                                   </tbody>
                                   <!-- ========================= 장바구니에 담긴 상품 출력 종료 ========================== -->
                               </table>
                           </form>

                           <div class="cart-collaterals">

                           <div class="cart_totals ">
                               <h2>Cart Totals</h2>

                               <table cellspacing="0">
                                   <tbody>
                                       <tr class="cart-subtotal">
                                           <th>총 주문금액</th>
                                           <td><span class="amount">￦${cart.prd_saleprice}</span></td>
                                      
                                          <th>배송비</th>
                                          <td><span class="deliveryCharge">￦2,500</span></td>
                                       
                                           <th>최종 결제금액</th>
                                           <td><strong><span class="amount">￦${cart.prd_saleprice+2500}</span></strong> </td>
                                       </tr>
                                   </tbody>
                               </table>
                           </div>
                                                                                 
                           <div class="xans-element- xans-order xans-order-basketguide clearfix "><h4>장바구니 이용안내</h4>
	                           <div class="basketguide_right">
									<ul class="guide_center">
										<li><span class="center">무이자할부 상품 주문의 경우,무이자할부 혜택을 받으시려면 "장바구니 - 무이자할부 상품" 아래의 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</span></li>
								        <li class="guide_center_second">
											<span class="center">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이선택된 모든 상품에 대한 주문/결제가 이루어집니다.</span><br/><span class="nobg">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</span>
										</li>
								        <li><span class="center">선택하신 상품의 수량을 변경하시려면 수량변경 후 [수정] 버튼을 누르시면 됩니다. [쇼핑 계속] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다. </span></li>
								        <li><span class="center">장바구니에 담긴 상품은 기한에 관계없이 보관됩니다. 보관을 원치않는 상품은 직접 선택하여 삭제해 주시기 바랍니다.</span></li>
								    </ul>
								</div>
							</div>

                           </div>
                       </div>                        
                   </div>                    
               </div>
           </div>
       </div>
	</body>