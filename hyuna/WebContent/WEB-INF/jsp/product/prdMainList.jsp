<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<script type="text/javascript">
<%-- $(function() {
var file="<c:out value='${prdMainList.img_1}'/>";
console.log(file);
if(file!=""){
	$("#fileImage").attr({
		src:"/main/${prdMainList.img_1}",
		width:"450px",
		hight:"200px"
	});
}else{
	
}
}); --%>
function lookDetail(prd_no){
	console.log("상품번호:" + prd_no);
	$("#prd_no").val(prd_no);	
	$("#lookDetail").attr({
		"method" : "get",
		"action" : "/product/prdSingleDetail.do"
	});
	$("#lookDetail").submit();
}
</script>
<%--=================상세페이지 이동을 위한 form========================== --%>
		<form name="lookDetail" id="lookDetail">
			<input type="hidden" name="prd_no" id="prd_no" />
			<%--<input type="hidden" name="page" value="${data.page}" /> 아이디는 유일한값이다. 한페이지에 하나만.!!!!!!!!!!!!!!!!!!!!!!!! 
			<input type="hidden" name="pageSize" value="${data.pageSize}" /> --%>
		</form>

<div class="maincontent-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="latest-product">
					<h2 class="section-title">Latest Products</h2>
					<div class="product-carousel">

						 <c:choose>
							<c:when test="${not empty prdMainList }">
								<c:forEach var="prd" items="${prdMainList }" varStatus="status">

									<div class="single-product" style="float: left;">
										<div class="product-f-image" style="width: 250px;">
											<img id="fileImage" src="/main${prd.img_1 }"  ><!-- max-width: 760px; -->
											<div class="product-hover">
												<a href="#" class="add-to-cart-link"><i
													class="fa fa-shopping-cart"></i> Add to cart</a> <a
													href="javascript:lookDetail('${prd.prd_no }');" class="view-details-link" data-num="${prd.prd_no }"><i
													class="fa fa-link"></i> See details</a>
											</div>
										</div>

										
											<a href="javascript:lookDetail('${prd.prd_no }');" data-num="${prd.prd_no }"><h2> ${prd.prd_name}</h2></a><h6>
										- ${fn:substring(prd.prd_desc,0,10)}...
										</h6><%--  - ${prd.prd_desc} --%>
										
										
										<div class="product-carousel-price">
											<ins>${prd.prd_saleprice}</ins>
											<del>$100.00</del>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>등록된 상품이 없습니다.</c:otherwise>
						</c:choose> 

						<!--                             
						<div class="single-product">
                                <div class="product-f-image">
                                    <img src="include/image/product-2.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2>Nokia Lumia 1320</h2>
                                <div class="product-carousel-price">
                                    <ins>$899.00</ins> <del>$999.00</del>
                                </div> 
                            </div>
                            
                            <div class="single-product" style="float: left;">
                                <div class="product-f-image">
                                    <img src="include/image/product-3.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2>LG Leon 2015</h2>

                                <div class="product-carousel-price">
                                    <ins>$400.00</ins> <del>$425.00</del>
                                </div>                                 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="include/image/product-4.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">Sony microsoft</a></h2>

                                <div class="product-carousel-price">
                                    <ins>$200.00</ins> <del>$225.00</del>
                                </div>                            
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="include/image/product-5.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2>iPhone 6</h2>

                                <div class="product-carousel-price">
                                    <ins>$1200.00</ins> <del>$1355.00</del>
                                </div>                                 
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="include/image/product-6.jpg" alt="">
                                    <div class="product-hover">
                                        <a href="#" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="single-product.html" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><a href="single-product.html">Samsung gallaxy note 4</a></h2>

                                <div class="product-carousel-price">
                                    <ins>$400.00</ins>
                                </div>                            
                            </div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End main content area -->


<div class="maincontent-area">
	<div class="zigzag-bottom"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="latest-product">
					<h2 class="section-title">Best Products</h2>
					<div class="product-carousel">
						<div class="single-product">
							<div class="product-f-image">
								<img src="include/image/product-1.jpg" alt="">
								<div class="product-hover">
									<a href="#" class="add-to-cart-link"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										href="single-product.html" class="view-details-link"><i
										class="fa fa-link"></i> See details</a>
								</div>
							</div>

							<h2>
								<a href="single-product.html">Samsung Galaxy s5- 2015</a>
							</h2>

							<div class="product-carousel-price">
								<ins>$700.00</ins>
								<del>$100.00</del>
							</div>
						</div>
						<div class="single-product">
							<div class="product-f-image">
								<img src="include/image/product-2.jpg" alt="">
								<div class="product-hover">
									<a href="#" class="add-to-cart-link"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										href="single-product.html" class="view-details-link"><i
										class="fa fa-link"></i> See details</a>
								</div>
							</div>

							<h2>Nokia Lumia 1320</h2>
							<div class="product-carousel-price">
								<ins>$899.00</ins>
								<del>$999.00</del>
							</div>
						</div>
						<div class="single-product">
							<div class="product-f-image">
								<img src="include/image/product-3.jpg" alt="">
								<div class="product-hover">
									<a href="#" class="add-to-cart-link"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										href="single-product.html" class="view-details-link"><i
										class="fa fa-link"></i> See details</a>
								</div>
							</div>

							<h2>LG Leon 2015</h2>

							<div class="product-carousel-price">
								<ins>$400.00</ins>
								<del>$425.00</del>
							</div>
						</div>
						<div class="single-product">
							<div class="product-f-image">
								<img src="include/image/product-4.jpg" alt="">
								<div class="product-hover">
									<a href="#" class="add-to-cart-link"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										href="single-product.html" class="view-details-link"><i
										class="fa fa-link"></i> See details</a>
								</div>
							</div>

							<h2>
								<a href="single-product.html">Sony microsoft</a>
							</h2>

							<div class="product-carousel-price">
								<ins>$200.00</ins>
								<del>$225.00</del>
							</div>
						</div>
						<div class="single-product">
							<div class="product-f-image">
								<img src="include/image/product-5.jpg" alt="">
								<div class="product-hover">
									<a href="#" class="add-to-cart-link"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										href="single-product.html" class="view-details-link"><i
										class="fa fa-link"></i> See details</a>
								</div>
							</div>

							<h2>iPhone 6</h2>

							<div class="product-carousel-price">
								<ins>$1200.00</ins>
								<del>$1355.00</del>
							</div>
						</div>
						<div class="single-product">
							<div class="product-f-image">
								<img src="include/image/product-6.jpg" alt="">
								<div class="product-hover">
									<a href="#" class="add-to-cart-link"><i
										class="fa fa-shopping-cart"></i> Add to cart</a> <a
										href="single-product.html" class="view-details-link"><i
										class="fa fa-link"></i> See details</a>
								</div>
							</div>

							<h2>
								<a href="single-product.html">Samsung gallaxy note 4</a>
							</h2>

							<div class="product-carousel-price">
								<ins>$400.00</ins>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- End main content area -->
