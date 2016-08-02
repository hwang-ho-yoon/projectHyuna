<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript">
	$(function() {
		$("#postcodify_search_button").postcodifyPopUp();
		$("#pay_btn").click(function() {
			if (!chkOrder($("#reciName"), "성명을")) {
				return;
			} else if(!chkOrder($("#reciTel"), "연락처를")) {
				return;
			} else if(!chkOrder($("#reciZipCode"), "우편번호를")) {
				return;
			} else if(!chkOrder($("#reciAddr1"), "기본주소를")) {
				return;
			} else if(!chkOrder($("#reciAddr2"), "상세주소를")) {
				return;
			} else if(!chkOrder($("#message"), "배송메시지를")) {
				return;
			} else {
				if($("#payPlan").val() == "mutongjang") {
					if (!chkOrder($("#accHold"), "입금자명을")) {
						return;
					} else if (!chkOrder($("#accHoldNo"), "입금자 계좌번호를")) {
						return;
					}
				} else if($("#payPlan").val() == "card") {
					if (!chkOrder($("#cardNo"), "카드번호를")) {
						return;
					}
				} 
				$("#ogr_reciName").val($("#reciName").val());
				$("#ogr_reciTel").val($("#reciTel").val());
				$("#ogr_reciZipCode").val($("#reciZipCode").val());
				$("#ogr_reciAddr1").val($("#reciAddr1").val());
				$("#ogr_reciAddr2").val($("#reciAddr2").val());
				$("#ogr_payPlan").val($("#payPlan").val());
				$("#ogr_message").val($("#message").val());
				if ($("#payPlan").val() == "mutongjang") {
					$("#ogr_accHold").val($("#accHold").val());
					$("#ogr_accHoldNo").val($("#accHoldNo").val());
				} else if($("#payPlan").val() == "card") {
					$("#ogr_cardNo").val($("#cardNo").val());
				}
				$("#mem_no").val("${sessionScope.hyunaMember}");
			   
				$("#productTable tr").each(function () {
					var index = $(this).index();
					if (index != 0) {
				        $(this).find("input[name=prd_d_no]").attr("name", "OrderProductVO[" + (index-1) + "].prd_d_no");
				        $(this).find("input[name=ord_amount]").attr("name", "OrderProductVO[" + (index-1) + "].ord_amount");
					}
			    });
			    
			    $("#ord_frm").attr({
			    	"method" : "post",
			    	"action" : "/order/orderInsert.do"
			    });
			    $("#ord_frm").submit();
				
			}
		});
		$(".beasong").click(function() {
			if ($(this).val() == "sameMember") {
				$("#reciName").val("${member.mem_name}");
				$("#reciTel").val("${member.mem_tel}");
				$("#reciZipCode").val("${member.mem_post}");
				$("#reciAddr1").val("${member.mem_address1}");
				$("#reciAddr2").val("${member.mem_address2}");
				$("#message").val("");
				
				$("#reciName").attr("readonly" , true);
				$("#reciTel").attr("readonly" , true);
				$("#reciZipCode").attr("readonly" , true);
				$("#reciAddr1").attr("readonly" , true);
				$("#reciAddr2").attr("readonly" , true);
				$("#postcodify_search_button").attr("disabled", true);
				
				$("#reciName").css("background" , "white");
				$("#reciTel").css("background" , "white");
				$("#reciZipCode").css("background" , "white");
				$("#reciAddr1").css("background" , "white");
				$("#reciAddr2").css("background" , "white");
				
			} else if ($(this).val() == "newBeasong") {
				$("#reciName").val("");
				$("#reciTel").val("");
				$("#reciZipCode").val("");
				$("#reciAddr1").val("");
				$("#reciAddr2").val("");
				$("#message").val("");
				
				$("#reciName").attr("readonly" , false);
				$("#reciTel").attr("readonly" , false);
				$("#reciZipCode").attr("readonly" , false);
				$("#reciAddr1").attr("readonly" , false);
				$("#reciAddr2").attr("readonly" , false);
				$("#postcodify_search_button").attr("disabled", false);
			}
		});
		
		$("#payPlan").change(function () {
			if ($("#payPlan").val() == "mutongjang") {
				var data =	"<table class='table' style='margin-bottom: 0px'>"
					data += "<tr>"
					data +=	"<td>국민은행 : </td>"
					data +=	"<td>황호윤 210701-04-266770</td>"
					data += "</tr>"
					data += "<tr>"
					data +=	"<td>입금자명 : </td>"
					data += "<td><input type='text' class='form-control input-sm' id='accHold' name='accHold'></td>"
					data += "</tr>"
					data += "<tr>"
					data +=	"<td>입금자 계좌번호 : </td>"
					data += "<td><input type='text' class='form-control input-sm' id='accHoldNo' name='accHoldNo'></td>"
					data += "</tr>"
					data += "</table>"
				$("#payManager").html(data);
			} else {
				var data =	"<table class='table' style='margin-bottom: 0px'>"
					data += "<tr>"
					data +=	"<td>카드사 : </td>"
					data +=	"<td><select id='paySelect' class='form-control input-sm'>"
					data += "<option value='kb'>국민은행</option>"
					data += "<option value='sin'>신한은행</option>"
					data += "</select></td>"
					data += "</tr>"
					data += "<tr>"
					data +=	"<td>카드번호 : </td>"
					data += "<td><input type='text' class='form-control input-sm' id='cardNo' name='cardNo'></td>"
					data += "</tr>"
					data += "</table>";
				$("#payManager").html(data);
			}
		});
	});
	function chkOrder(v_item, v_name){
		if(v_item.val().replace(/\s/g,"")==""){
			$("#orderModal .modal-title").html("입력오류");
			$("#orderModal .modal-body").html(v_name+" 입력해 주세요");
			$('#orderModal').modal('show');
			return false;
		} else{
			return true;
		}
	}
</script>
	<div id="wrapper">
		<div class="col-md-12" style="padding: 0"> 
			<h3>상품정보</h3> 
			<hr></hr>
		</div>
		 <form id="ord_frm" name="ord_frm">
         	<input type="hidden" id="mem_no" name="mem_no" value="">
         	<input type="hidden" id="ogr_reciName" name="ogr_reciName" value="">
         	<input type="hidden" id="ogr_reciTel" name="ogr_reciTel" value="">
         	<input type="hidden" id="ogr_reciZipCode" name="ogr_reciZipCode" value="">
         	<input type="hidden" id="ogr_reciAddr1" name="ogr_reciAddr1" value="">
         	<input type="hidden" id="ogr_reciAddr2" name="ogr_reciAddr2" value="">
         	<input type="hidden" id="ogr_message" name="ogr_message" value="">
         	<input type="hidden" id="ogr_payPlan" name="ogr_payPlan" value="">
         	<input type="hidden" id="ogr_accHold" name="ogr_accHold" value="">
         	<input type="hidden" id="ogr_accHoldNo" name="ogr_accHoldNo" value="">
         	<input type="hidden" id="ogr_cardNo" name="ogr_cardNo" value="0">
		<table class="table table-hover table-bordered" id="productTable" >
			<tr>
				<td>이미지</td>
				<td>상품명</td>
				<td>판매가</td>
				<td>수량</td>
				<td>합계</td>
			</tr>
			<tr>
				<td><input type="hidden" name="prd_d_no" value="1" />이미지1</td>
				<td>비비므망고 땡땡이 아크릴 패치</td>
				<td>15,000원</td>
				<td><input type="hidden" name="ord_amount" value="4" />2</td>
				<td>30000원</td>
			</tr>
			<tr>
				<td><input type="hidden" name="prd_d_no" value="2" />이미지1</td>
				<td>갤럭시 s6</td>
				<td>26,000원</td>
				<td><input type="hidden" name="ord_amount" value="3" />2</td>
				<td>70000원</td>
			</tr>
		</table>
		
		<div class="col-md-offset-8" align="right">
			<table class="table table-hover table-bordered">
				<tr>
					<td>총 주문 금액</td>
					<td>30000원</td>
				</tr>
			</table>
		</div>
		</form>
		
		<div class="col-md-5" style="padding: 0">
			<font size="5px">배송지 정보</font>
		</div>
		<div class="col-md-7" align="right" style="padding-right: 0px; padding-top: 10px">
			<div class="radio3 radio-check radio-inline" style="padding: 0" align="right"> 
				<input type="radio" id="radio4" name="radio2" value="sameMember" checked="checked" class="beasong">
				<label for="radio4"> 주문자와 동일</label>
			</div>
			<div class="radio3 radio-check radio-inline" style="padding: 0" align="right"> 
				<input type="radio" id="radio5" name="radio2" value="newBeasong" class="beasong">
				<label for="radio5"> 새로운 배송지</label>
			</div>
		</div>
		<div class="col-md-12" style="padding: 0">
			<hr></hr>
		</div>
		<table class="table table-hover table-bordered">
			<tr>
				<td style="padding-top: 12px">성명</td>
				<td><input type="text" class="form-control input-sm" id="reciName" name="reciName" readonly="readonly" style="background: white;" value="${member.mem_name} "></td>
				<td style="padding-top: 12px">연락처</td>
				<td><input type="text" class="form-control input-sm" id="reciTel" name="reciTel" readonly="readonly" style="background: white;" value="${member.mem_tel} "></td>
			</tr>
			<tr>
				<td style="padding-top: 12px">우편번호</td>
				<td><div class="form-inline"> <input type="text" class="form-control input-sm postcodify_postcode5" readonly="readonly" style="background: white;" id="reciZipCode" name="reciZipCode" value="${member.mem_post} "><button id="postcodify_search_button" class="btn btn-default btn-sm" style="margin: 0" disabled="disabled">검색</button></div></td>
				<td style="padding-top: 12px">기본주소</td>
				<td><input type="text" class="form-control input-sm postcodify_jibeon_address" readonly="readonly" style="background: white;" id="reciAddr1" name="reciAddr1" value="${member.mem_address1} "></td>
			</tr>
			<tr>
				<td style="padding-top: 12px">상세주소</td>
				<td colspan="3"><input type="text" class="form-control input-sm postcodify_details" id="reciAddr2" name="reciAddr2" readonly="readonly" style="background: white;" value="${member.mem_address2}"></td>
			</tr>
			<tr>
				<td style="padding-top: 12px">메시지</td>
				<td colspan="3"><input type="text" class="form-control input-sm" id="message" name="message"></td>
			</tr>
		</table>
		
		<div class="col-md-12" style="padding: 0"> 
			<h3>결제 정보</h3> 
			<hr></hr>
		</div>
		<table class="table table-hover table-bordered">
			<tr>
				<td style="width: 23%">결제금액</td>
				<td>30000원</td>
			</tr>
			<tr>
				<td>결제방식</td>
				<td>
					<select id="payPlan" class="form-control input-sm">
						<option value="mutongjang" selected="selected">무통장</option>
						<option value="card">카드결제</option>
					</select> 
				</td>
			</tr>
			<tr>
				<td style="padding-top: 35px">결제도우미</td>
				<td>
					<span id="payManager">
						<table class='table' style="margin-bottom: 0px">
							<tr>
								<td>국민은행 : </td>
								<td>황호윤 210701-04-266770</td>
							</tr>
							<tr>
								<td>입금자명 : </td>
								<td><input type='text' class='form-control input-sm' id="accHold" name="accHold"></td>
							</tr>
							<tr>
								<td>입금자 계좌번호 : </td>
								<td><input type='text' class='form-control input-sm' id="accHoldNo" name="accHoldNo"></td>
							</tr>
						</table>
					</span>
				</td>
			</tr>
		</table>
		<div align="center">
			<button class="btn btn-default" id="pay_btn">결제</button>
			<button class="btn btn-default">취소</button>
		</div>
		
		
		<div id="orderModal" class="modal fade" data-backdrop="static">
	    	<div class="modal-dialog modal-sm">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title"></h4>
		            </div>
		            <div class="modal-body">
		         	</div>
		           <div class="modal-footer">
		                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">확인</button>
            	   </div>
	         	</div>
         	</div>
         </div>
	</div>
