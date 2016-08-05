<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
var new_select;
	$(function() {
		
		$(document).on("click", "#addCart", function(){
	         //$("#addCart").click(function() {
	            $("#cart_quantity").val($("#quantity").val());
	            $("#color_no").val($("#color").val());
	            $("#model_no").val($("#model").val());
	            
	            $("#addCartVal").attr({
	               "method" : "post",
	               "action" : "/cart/cartInsert.do"
	            });	            
	            $("#addCartVal").submit();            
	            
	         });		
		
		
	         $("#model").change(function(){
			var model_no=$("#model option:selected").val();
			var prd_no=$("#prd_nol").val();
			if(model_no!="non"&&prd_no!="non"){
				optListAll(prd_no,model_no);
			}
		});	
	         
	});
	
	function optListAll(prd_no, model_no){
		$("#model_nol").val(model_no);
		console.log($("#prd_nol").val()+"	"+$("#model_nol").val());
		$("#colorOpt").html("");
		
		new_select = $("<select>");
		new_select.attr({"id":"color"});
		new_select.css("width","150px");
		$("#colorOpt").append(new_select);
		$.ajax({
		url:"/product/colorOptList.do",
		type : "POST",//전송시 method방식
		data : $("#colorSelect").serialize(),//번호랑 비밀번호가 폼안에 있으므로 폼전체 데이터 전송
		dataType : "json",//응답문서의 형식
		error : function() {//실행시 오류가 발생 하엿을 경우
				alert('시스템오류 입니다. 관리자에게 문의하세요.');
			}, 
		success : function(data) {
			$.each(data,function(index,value){
				var color_no = value.color_no;
				var color_detail = value.color_detail;
				console.log(color_no+" "+color_detail);
				addNewItem(color_no, color_detail);
			});
		}		
			
		
		});
	}
	
	function addNewItem(color_no, color_detail){
		new_select.append($('<option value="'+ color_no +'">' + color_detail + '</option>'));
			
	}
</script>
<div id="wrapper">
	<div class="single-product-area">
		<div class="container">
			<div class="row">
				<div class="product-breadcroumb">
					<!-- <a href="">Home</a> <a href="">Category Name</a> <a href="">Sony
						Smart TV - 2015</a> -->
				</div>
				<!-- color option가져오는부분 -->
				<form id="colorSelect">
					<input type="hidden" id="model_nol" name="model_nol" />
					<input type="hidden" id="prd_nol" name="prd_nol" value="${detail.prd_no}"/>
				</form>
				
				<form id="addCartVal">
               <input type="hidden" id="cart_quantity" name="cart_quantity"/>
               <input type="hidden" id="model_no" name="model_no"/>
               <input type="hidden" id="color_no" name="color_no"/>
               <input type="hidden" id="prd_no" name="prd_no" value="${param.prd_no}" />
               <!-- <input type="hidden" id="mem_no" name="mem_no" /> -->
            	</form>
				
				
				<div class="row">
					<div class="col-sm-6 ">
						<div class="product-images" >
							<!-- style="height: auto; width: 100%; border:1px solid gold;"   div 영역표시하기.-->
							<div class="product-main-img"   >
							<!-- <img src="/include/image/product-2.jpg" alt=""class="center-block">-->
								<img src="/main/${detail.img_1 }" alt="" class="center-block" style="height: auto; width: 40%; ">																
							</div>
						</div>
					</div>
					<div class="product-inner">
						<h2 class="product-name">${detail.prd_name}</h2>
							<div class="product-inner-price">
								<ins>${detail.prd_saleprice}</ins>
								<del>${detail.prd_orgprice}</del>
							</div>
						<form action="" class="cart">
							<div class="quantity" style="float:left;border:1px;">
								<input type="number" size="4" class="input-text qty text"
									title="Qty" value="1" name="quantity" min="1" step="1" id="quantity">
							<button class="add_to_cart_button" type="button" id="addCart">Add to cart</button>
							</div>
						
							
						
						<!-- <div class="product-inner-category">
							<p>
								Category: <a href="">Summer</a>. Tags: <a href="">awesome</a>, <a
									href="">best</a>, <a href="">sale</a>, <a href="">shoes</a>.
							</p>
						</div> -->
						<br>
						<div class="col-md-5" style="padding-left:0px; margin-top:10px;">
							<c:choose>
								<c:when test="${not empty opt }">
								<select id="model" style="width:150px;">
									<option value="non">===선택===</option>
									<c:forEach var="opt" items="${opt}" varStatus="status">
										<option value="${opt.model_no }">${opt.model_machine }</option>
									</c:forEach>
								</select>
								</c:when>						
						<c:otherwise>등록된옵션이 없습니다.</c:otherwise> 
						</c:choose>
						
							<span id="colorOpt">
								<%-- <c:choose>
									<c:when test="${not empty opt }">
									<select id="color" style="width:150px;">
										<c:forEach var="opt" items="${opt}" varStatus="status">
										<option value="${opt.model_no }">${opt.model_machine }</option>
										</c:forEach>
									</select>
									</c:when>						
								<c:otherwise>등록된옵션이 없습니다.</c:otherwise> 
								</c:choose> --%>
							</span>
						</div>		
						</form>
						</div>
<br>
						<div role="tabpanel" style="margin-top:30px;">
							<ul class="product-tab" role="tablist">
								<li role="presentation" class="active"><a href="#home"
									aria-controls="home" role="tab" data-toggle="tab">Description</a>
								</li>
								<li role="presentation"><a href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab">Reviews</a>
								</li>
							</ul>
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="home">
									<!-- <h2>Product Description</h2> -->
									<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam tristique, diam in consequat iaculis, est purus iaculis
										mauris, imperdiet facilisis ante ligula at nulla. Quisque
										volutpat nulla risus, id maximus ex aliquet ut. Suspendisse
										potenti. Nulla varius lectus id turpis dignissim porta.
										Quisque magna arcu, blandit quis felis vehicula, feugiat
										gravida diam. Nullam nec turpis ligula. Aliquam quis blandit
										elit, ac sodales nisl. Aliquam eget dolor eget elit malesuada
										aliquet. In varius lorem lorem, semper bibendum lectus
										lobortis ac.</p>

									<p>Mauris placerat vitae lorem gravida viverra. Mauris in
										fringilla ex. Nulla facilisi. Etiam scelerisque tincidunt quam
										facilisis lobortis. In malesuada pulvinar neque a consectetur.
										Nunc aliquam gravida purus, non malesuada sem accumsan in.
										Morbi vel sodales libero.</p> -->
									<img src="/detail/${detail.img_3 }" class="center-block"/>
								</div>
								<!-- review 부분 -->
								<div role="tabpanel" class="tab-pane fade" id="profile">
									<h2>Reviews</h2>
									<div class="submit-review">
										<p>
											<label for="name">Name</label> <input name="name" type="text">
										</p>
										<p>
											<label for="email">Email</label> <input name="email"
												type="email">
										</p>
										<div class="rating-chooser">
											<p>Your rating</p>

											<div class="rating-wrap-post">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<p>
											<label for="review">Your review</label>
											<textarea name="review" id="" cols="30" rows="10"></textarea>
										</p>
										<p>
											<input type="submit" value="Submit">
										</p>
									</div>
								</div>
								<!-- review 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

