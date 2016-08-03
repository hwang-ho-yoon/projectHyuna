<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="/hyuna/include/js/board.js"></script>
<script type="text/javascript" src="/hyuna/include/js/jquery-1.12.2.min.js"></script>
<script type="text/javascript" src="/hyuna/include/js/search.js"></script> -->
<script type="text/javascript">
	$(function() {
		$(document).on("click", "#addCart", function(){
			//$("#addCart").click(function() {
				$("#cart_quantity").val($("#quantity").val());
				$("#color_no").val($("#color").val());
				$("#model_no").val($("#machine").val());
				console.log($("#quantity").val());
				console.log($("#color").val());
				console.log($("#machine").val());
				console.log($("#cart_quantity").val());
				console.log($("#color_no").val());
				console.log($("#model_no").val());
				
				$("#addCartVal").attr({
					"method" : "post",
					"action" : "/cart/cartInsert.do"
				});
				
				$("#addCartVal").submit();
				
				
			});
			//location.href="/cart/cartInsert.do";
		});
	//});
</script>
<div id="wrapper">
	<div class="single-product-area">
		<div class="container">
			<div class="row">
				<div class="product-breadcroumb">
					<a href="">Home</a> <a href="">Category Name</a> <a href="">Sony
						Smart TV - 20151234587979879</a>
				</div>
				
				<form id="addCartVal">
					<input type="hidden" id="cart_quantity" name="cart_quantity"/>
					<input type="hidden" id="model_no" name="model_no"/>
					<input type="hidden" id="color_no" name="color_no"/>
					<!-- <input type="hidden" id="mem_no" name="mem_no" /> -->
				</form>
				
				<div class="row">
					<div class="col-sm-6 ">
						<div class="product-images" >
							<!-- style="height: auto; width: 100%; border:1px solid gold;"   div 영역표시하기.-->
							<div class="product-main-img"   >
							<!-- <img src="/include/image/product-2.jpg" alt=""class="center-block">-->
								<img src="/main/${detail.img_1 }" alt="" class="center-block" style="height: auto; width: 40%; ">
								<img src="/main/${detail.img_1 }" alt="" class="center-block" style="height: auto; width: 40%; ">
									
							</div>
						</div>
					</div>
					<div class="product-inner">
						<h2 class="product-name">${detail.prd_name}</h2>
						<div class="product-inner-price">
							<ins>${detail.prd_saleprice}</ins>
							<del>$100.00</del>
						</div>
						<form action="" class="cart">
							<div class="quantity">
								<input type="number" size="4" class="input-text qty text"
									title="Qty" value="1" id="quantity" name="quantity" min="1" step="1">
							</div>
							<!-- <button class="add_to_cart_button" type="submit" id="addCart">Add to cart</button> -->
						<button class="addCart" type="button" id="addCart">Add to cart</button>
						<!-- <div class="product-inner-category">
							<p>
								Category: <a href="">Summer</a>. Tags: <a href="">awesome</a>, <a
									href="">best</a>, <a href="">sale</a>, <a href="">shoes</a>.
							</p>
						</div> -->
						<br>
						<div>
							<select id="machine" class="col-md-4">
								<option value="1">아이폰6/6S</option>
								<option value="2">아이폰6플러스</option>
								<option value="3">아이폰SE/5/5S</option>
								<option value="4">아이폰4/4S</option>
							</select> <br>
							<select id="color" class="col-md-4" value="color_no">
								<option value="1">빨강</option>
								<option value="2">노랑</option>
								<option value="3">파랑</option>
							</select>
						
						</div>
						</form>
<br>
						<div role="tabpanel">
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
										<img src="/detail${detail.img_3 }" class="center-block"/>
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
