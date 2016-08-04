<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<script type="text/javascript">
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
<div id="wrapper">    
 <div class="maincontent-area">
      <!-- <div class="zigzag-bottom"></div> -->
        <div class="container">
            <div class="row"> 
               <div class="col-md-12">
                    <!--<div class="productList"><div class="latest-product">
                          <div class="product-carousel-prd"> -->
                            
                            
                            <div class="latest-product">
								<h2 class="section-title">Latest Products</h2>
									<div class="product-carousel">
<c:choose>
							<c:when test="${not empty prdListLatest }">
								<c:forEach var="prdLatest" items="${prdListLatest }" varStatus="status">

									<div class="single-product" style="float: left;">
										<div class="product-f-image" style="width: 250px;">
											<img id="fileImage" src="/main/${prdLatest.img_1 }"  ><!-- max-width: 760px; -->
											<div class="product-hover">
												<a href="#" class="add-to-cart-link"><i
													class="fa fa-shopping-cart"></i> Add to cart</a> <a
													href="javascript:lookDetail('${prdLatest.prd_no }');" class="view-details-link" data-num="${prdLatest.prd_no }"><i
													class="fa fa-link"></i> See details</a>
											</div>
										</div>

										
											<a href="javascript:lookDetail('${prdLatest.prd_no }');" data-num="${prdLatest.prd_no }"><h2> ${prdLatest.prd_name}</h2></a><h6>
										- ${fn:substring(prdLatest.prd_desc,0,10)}...
										</h6><%--  - ${prd.prd_desc} --%>
										
										
										<div class="product-carousel-price">
											<ins>${prdLatest.prd_saleprice}</ins>
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
                            <div class="single-product">
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
                            <!--<div class="single-product">
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
    
    
     <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                       <div class="latest-product">
								<h2 class="section-title">Best Products</h2>
									<div class="product-carousel">
                            <c:choose>
							<c:when test="${not empty prdListBest }">
								<c:forEach var="prdBest" items="${prdListBest }" varStatus="status">

									<div class="single-product" style="float: left;">
										<div class="product-f-image" style="width: 250px;">
											<img id="fileImage" src="/main/${prdBest.img_1 }"  ><!-- max-width: 760px; -->
											<div class="product-hover">
												<a href="#" class="add-to-cart-link"><i
													class="fa fa-shopping-cart"></i> Add to cart</a> <a
													href="javascript:lookDetail('${prdBest.prd_no }');" class="view-details-link" data-num="${prdBest.prd_no }"><i
													class="fa fa-link"></i> See details</a>
											</div>
										</div>

										
											<a href="javascript:lookDetail('${prdBest.prd_no }');" data-num="${prdBest.prd_no }"><h2> ${prdBest.prd_name}</h2></a><h6>
										- ${fn:substring(prdBest.prd_desc,0,10)}...
										</h6><%--  - ${prd.prd_desc} --%>
										
										
										<div class="product-carousel-price">
											<ins>${prdBest.prd_saleprice}</ins>
											<del>$100.00</del>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>등록된 상품이 없습니다.</c:otherwise>
						</c:choose> 
                            <!--<div class="single-product">
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
                            </div>
                        </div>-->
                     </div>  
                </div>
            </div>
        </div>
    </div>  
    </div>
    </div>