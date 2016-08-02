<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>

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
			<tr>
				<td style="padding-top: 14px"><a href="/order/orderDetail.do">20160518212618</a></td>
				<td style="padding-top: 14px"><a href="#myModal" data-toggle="modal">비비드망고 땡땡이 아크릴 패치</a></td>
				<td style="padding-top: 14px">15,000원 (2개)</td>
				<td style="padding-top: 14px">구매완료</td>
				<td><button class="btn btn-default btn-sm" style="margin: 0">반품</button></td>
			</tr>
			<tr>
				<td style="padding-top: 14px">20160501821234</td>
				<td style="padding-top: 14px">갤럭시 노트 3 케이스</td>
				<td style="padding-top: 14px">19,000원 (1개)</td>
				<td style="padding-top: 14px">구매대기</td>
				<td><button class="btn btn-default btn-sm" style="margin: 0">취소</button></td>
			</tr>
		</table>
		
		<div id="myModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog modal-sm">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">송장번호 등록</h4>
		            </div>
		            <div class="modal-body">
		            	<label>주문번호  : 123124214</label><br>
		            <form class="form-inline">
		            	<label>송장번호 : </label><input type="text" class="form-control input-sm">
		            </form>
		            	
		         	</div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm">저장</button>
		                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">취소</button>
            	   </div>
	         	</div>
         	</div>
         </div>
	</div>

