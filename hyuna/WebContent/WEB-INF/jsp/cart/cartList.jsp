<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Cart</title>
</head>
<script type="text/javascript">
	$(function() {
		/* 쇼핑계속하기 버튼 클릭 시 이벤트 처리 */
		$("#shopping").click(function() {
			location.href="../index.jsp";
		});
		
		// 담기버튼 클릭 시 이벤트 처리 */
		/* $("#addCart").click(function() {
			location.href="/cart/cartInsert.do";
		}); */		
		
		/* 전체 체크박스 클릭 시 이벤트 처리 */
		$("#allCheck").click(function() {
			if($("#allCheck").prop("checked")) {
					$("input[name=check]").prop("checked", true);
			} else {
					$("input[name=check]").prop("checked", false);
			}
		});

		/* 선택삭제 버튼 클릭 시 이벤트 */
		$("#checkDelete").click(function() {
			var selectCarts = [];
			
			$(".check").each(function() {
				if($(this).is(":checked")) {
					selectCarts.push($(this).val());
				}
			});
			$("#select").val(selectCarts);
			$("#selectForm").attr({
				"method":"post",
				"action":"/cart/chkDelete.do"
			});
			$("#selectForm").submit();
			
			//go_delete();
			
			
			//var arr = $('input[name=check]:checked').serializeArray().map(function(item) { return item.value });
			/* var arr = $('input[name=check]:checked').parents("tr").attr("data-num");
			console.log(arr);
			var table = document.getElementById("cartTable");
			var tableRow = table.rows.length;
			document.getElementById("cartTable").rows[0].css("background","pink");
			$("#cartTable").rows[0].css("background","pink"); */
			//console.log(document.getElementById("cartTable").rows[0].cell[3].text());
			//table.rows[1].$("td:eq(0)").css("background","pink");
			/* for(var i=1; i<tableRow; i++) {
				 table.rows[i].$("td:eq(0)").css("background","pink");
			}
			tableRow.css("background","pink"); */
					
			
		}); 
		
		/* 선택주문 버튼 클릭 시 이벤트 */
		$("#checkOrder").click(function() {
			var selectPrd_d_no = [];
			var selectQuantity = [];
			
			$(".check").each(function() {
				if($(this).is(":checked")) {
					selectPrd_d_no.push($(this).parents("tr").children().eq(2).attr("data-num"));
					selectQuantity.push($(this).parents("tr").children().eq(5).find("input[type='number']").val());
				}
			});
			$("#prd_d_no").val(selectPrd_d_no);
			$("#quantity").val(selectQuantity);
			$("#form2").attr({
				"method":"post",
				"action":"/order/orderWrite.do"
			});
			$("#form2").submit();
					
			
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
		
		// 수량변경
		$(".updateCount").click(function() {
			var cart_no = $(this).parents("tr").attr("data-num");
			var cart_quantity = $(this).parents("tr").children().eq(5).find("input[type='number']").val();
			$("#cart_no").val(cart_no);
			$("#cart_quantity").val(cart_quantity);
 			$("#form1").attr({
				"method":"POST",
				"action":"/cart/updateCount.do"
			});
			$("#form1").submit();
			//$("#cart_quantity").attr("href", "/cart/updateCount");
		});
		
		/* 전체주문 버튼 클릭 시 이벤트 */
		$("#allOrder").click(function() {
			
			if(confirm('상품을 전체 주문하시겠습니까?')) {
				$.ajax({
					type : 'POST',
					url : "/order/orderWrite.do",
					dataType : 'text',
					error : function() {
						alert('시스템 오류 입니다. 관리자에게 문의하세요.')
					},
					success : function(result) {
						console.log("result : " + result);
						if(result == 'SUCCESS') {
							alert("주문시작");
							location.href="/order/orderWrite.do";
						}
					}
				});
			}
		});	
	});
	
	function go_delete() {
		if($(":checkbox[name='check']:checked").length==0) {
			alert("삭제할 항목을 하나이상 체크해 주세요.");
			return;
		}
	}
	
	function del() {
		$(".wrap input:checked").each(function() {
			var checked=$(this).attr("checked");
			if(checked==true) {
				$(this).next().remove();
				$(this).remove();
			}
		});
	}
	
	
	
	
</script>
<body>
	<div class="single-product-area">
           <div class="row">               
               <div id="wrapper">
                   <div class="product-content-right">
                       <div class="woocommerce">
                       <form id="selectForm"><input type="hidden" id="select" name="select"></form>
                           <form id="form1">
                           	<input type="hidden" id="cart_no" name="cart_no" value="0">
                           	<input type="hidden" id="cart_quantity" name="cart_quantity" value="0">
                           </form>
                           <form id="form2">
                           	<input type="hidden" id="prd_d_no" name="prd_d_no" value="0">
                           	<input type="hidden" id="quantity" name="quantity" value="0">
                           </form>
                           <label><span style="font-size:33px">${sessionScope.hyunaname}</span>님의 장바구니입니다</label>
                               <table  class="shop_table cart" id="cartTable">
                                   <thead>
                                       <tr>
                                           <th class="product-remove">
                                           		<input type="checkbox" id="allCheck" name="allCheck">
                                           </th>
                                           <th class="product-thumbnail">상품이미지</th>
                                           <th class="product-name">상품명</th>
                                           <th class="product-name">옵션명</th>
                                           <th class="product-price">판매가</th>
                                           <th class="product-quantity">수량</th>
                                           <th class="product-subtotal">합계</th>
                                       </tr>
                                   </thead>
                                   <!-- ========================= 장바구니에 담긴 상품 리스트 출력 시작 ========================== -->
                                   <tbody>
                                   <c:choose>
                                   		<c:when test="${not empty cartList}">
                                   			<c:forEach var="cart" items="${cartList}" varStatus="status">
                                   				<tr class="cart_item" data-num="${cart.cart_no}">
                                           			<td><input type="checkbox" class="check" name="check" value="${cart.cart_no}" ></td>
                                   					<td class="product-thumbnail"><span class="goDetail"><img src="/main/${cart.img_1 }" style="height: auto;"> </span></td>
                                   					<td class="product-name" data-num="${cart.prd_d_no}"><span class="goDetail">${cart.prd_name}</span>
                                   					<td class="product-name">${cart.model_machine} - ${cart.color_detail}</td>
                                   					<td class="product-price">￦${cart.prd_saleprice}</td>
                                   					<td class="product-quantity">
                                   						<div class="quantity buttons_added">
                                                    		<input type="number" name="cart_quantity" class="form-control cart_quantity" title="Qty" value="${cart.cart_quantity}" min="0">
                                                			<button type="button" class="btn btn-default updateCount" style="margin-top: 0px" name="updateCount">수정</button>
		                                                </div>
                                   					</td>
                                           			<td class="product-subtotal">￦${cart.prd_saleprice*cart.cart_quantity}<c:set var="total" value="${cart.prd_saleprice*cart.cart_quantity}"/></td>
                                   				</tr>
                                   				<c:set var="sum" value="${sum + total}"/>
                                   			</c:forEach>
                                   		</c:when>
                                   	<c:otherwise>
                               			<tr>
                               				<td colspan="7" class="cart_item">장바구니가 비어 있습니다.</td>
                               			</tr>
                                   	</c:otherwise>
                                   </c:choose>
                                                                          
                                       <tr>
                                           <td class="actions" colspan="7">
                                               <div class="btn_group1">
	                                               	<button type="button" class="btn btn-primary" name="checkDelete" id="checkDelete">선택삭제</button>
	                                               	<button type="button" class="btn btn-primary" name="allDelete" id="allDelete">장바구니 비우기</button>
	                                               	<button type="button" class="btn btn-primary" name="checkOrder" id="checkOrder">선택주문</button>
                                               </div>
										<!-- </td>
										<td> -->
										   <div class="btn_group2">
											   <!-- <button type="button" class="btn btn-primary" name="addCart" id="addCart">담기</button> -->
											   <button type="button" class="btn btn-primary" name="shopping" id="shopping">쇼핑계속하기</button>
                                           </div>
                                         </td>
                                       </tr>                       
                                   </tbody>
                                   <!-- ========================= 장바구니에 담긴 상품 출력 종료 ========================== -->
                               </table>
                           

                           <div class="cart-collaterals">

                           <div class="cart_totals ">
                               <h2>Cart Totals</h2>

                               <table cellspacing="0">
                                   <tbody>
                                       <tr class="cart-subtotal">
                                           <th>총 주문금액</th>
                                           <td><span class="amount">￦<c:out value="${sum}"/></span></td>
                                      
                                          <th>배송비</th>
                                          <td><span class="deliveryCharge">￦2,500</span></td>
                                       
                                           <th>최종 결제금액</th>
                                           <%-- <td><strong><span class="amount">￦${cart.prd_saleprice+2500}</span></strong> </td> --%>
                                           <td><strong><span class="amount">￦<c:out value="${sum+2500}"/></span></strong> </td>
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