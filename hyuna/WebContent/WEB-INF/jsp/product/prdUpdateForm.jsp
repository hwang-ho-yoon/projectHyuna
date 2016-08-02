<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function() {
	$("input:checked").each(function(){
		if(this.checked)"Y"
		else"N"
	});
	$("#optionadd").click(function() {
		var add = $("#model option:selected").text();
		var add_no = $("#model").val();
		console.log(add_no+" :"+add);
		
		var color = $("#color option:selected").text();
		var color_no = $("#color").val();
		console.log(color_no+" :"+color);
		
		
		 var table = document.getElementById("tb_option");
		var tablerows = table.getElementsByTagName("tr").length;
		var prd_no=${detail.prd_no};
		

		if (!tableChk(add, color, "이미 입력되어 있는 옵셥입니다."))
			return;
		else {
			$.ajax({//ajax 최상위 , = jquery.ajax()
				url : "/product/prdOptAdd.do",//전송URL
				type : "POST",//전송시 method방식
				dataType : "text",//응답문서의 형식
				data:JSON.stringify({
					prd_no:prd_no,
					prd_d_display:$("#open").val(),
					prd_d_stock:$("#prdStockNum").val(),
					color_no:$("#color").val(),
					model_no:$("#model").val()
				}),
				error : function() {//실행시 오류가 발생 하엿을 경우
					alert('시스템오류 입니다. 관리자에게 문의하세요.');
				}, 
				success : function(resultData) {//정상실행되엇을경우 (결과를 담을 수 있는 변수로서 다른이름도 관ㄱㅖ없다.) 
					if(result=="SUCCESS"){
	                     alert("옵션추가완료");
	                     
	                  }
				}

			});
		} 
	});
});
function prdUpdate(prd_no){
			$("#prd_update").attr({
			"method" : "post",
			"action" : "/product/prdUpdate.do"
		});
		$("#prd_update").submit();
		
}
function tableChk(add1, add2, str) {
	//var model=$(".opt_tr").children(0).css('background','red');
	var tf = true;
	if (document.getElementById("tb_option").getElementsByTagName("tr").length > 1) {
		for (var start = 0; start < document.getElementById("tb_option").getElementsByTagName("tr").length - 1; start++) {
			var model = $(".tac:eq(" + start + ")").children('td:eq(2)').text();
			var color = $(".tac:eq(" + start + ")").children('td:eq(3)').text();
			console.log(model + "   " + color);
			if (add1 == model && add2 == color) {
				alert(str);
				tf = false;
				return;
			} else {
				tf = true;
			}
		}
	} else {
		tf = true;
	}
	return tf;
}

</script>
<div id="wrapper">
	<div class="container">
	
		<div class="row">
			<h1>상품수정</h1>
			<div style="float:right;margin-bottom:5px;">
				<button type="button" id="updatePrd" name="updatePrd" onclick="prdUpdate('${detail.prd_no}')">수정완료</button>
				<!-- <button type="button" id="regPrd" name="regPrd" onclick="prdWriteFrom()">새상품등록</button> -->
				<button type="button" id="PrdList" name="PrdList" onclick="prdRgtList()">상품목록</button>
			</div>
			<form id="prd_update" name="prd_update" enctype="multipart/form-data">
			<table class="shop_table">
				<tr>
					<td>제품코드</td>
					<td><input type="text" id="prd_no" name="prd_no"  value="${detail.prd_no}" readonly/></td>
					<td>* 상품명</td>
					<td><input type="text" id="prd_name" name="prd_name"  value="${detail.prd_name}"></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input type="text" id="prd_manufacturer"
						name="prd_manufacturer" value="${detail.prd_manufacturer}"/></td>
					<td>원산지</td>
					<td><input type="text" id="prd_origine" name="prd_origine" value="${detail.prd_origine}"/></td>
				</tr>
				<tr>
					<td>매입가</td>
					<td><input type="number" id="prd_prcprice" name="prd_prcprice" value="${detail.prd_prcprice}"/></td>
					<td>정상가</td>
					<td><input type="number" id="prd_orgprice" name="prd_orgprice" value="${detail.prd_orgprice}"/></td>
				</tr>
				<tr>
					<td>* 판매가</td>
					<td><input type="number" id="prd_saleprice" name="prd_saleprice" value="${detail.prd_saleprice}"/></td>
					<td>전시상태</td>
					<%-- <td><input type="checkbox" id="prd_display" name="checkbox" /> ${detail.prd_display}</td> --%>
					<td><select id="prd_display" name="prd_display"><option value='Y'>Y</option><option value='N'>N</option></select>${detail.prd_display}</td>
				</tr>
				<tr>
					<td colspan="4">상품설명</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="5" cols="20" id="prd_desc" name="prd_desc">${detail.prd_desc}</textarea></td>
				</tr>
				<%-- <tr>
					<td>옵션사용</td>
					<td colspan="3"><span>Color :  ${detail.prd_optclr}</span> 
					<span>Brand :  ${detail.prd_optbrd}</span> </td>

				</tr> --%>
				<tr>
					<td colspan="4">이미지 설정</td>
				</tr>
				<tr>
					<td>Main</td>
					<td colspan="3"><input type="file" name="file1" id="file1"><span>${detail.img_1 }</span>
				<tr>
					<td>Thumbnail</td>
					<td colspan="3"><input type="file" name="file2" id="file2"><span>${detail.img_2 }</span>
				</tr>
				<tr>
					<td>Detail</td>
					<td colspan="3"><input type="file" name="file3" id="file3"><span>${detail.img_3 }</span>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<br>
		<div class="row">
		<div id="optionAddDiv" class="optionAddDiv">
		<form id="optAdd">
			<table id="tb_option" class="table">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="25%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<tr id="tr_opt">
					<th>기종</th>
					<th>color</th>
					<th>재고</th>
					<th>공개</th>
					<th>추가</th>
				</tr>
				<tr id="tr_opt">
					<td>
					<select id="model">
						<option value="1">아이폰6/6S</option>
						<option value="2">아이폰6플러스</option>
						<option value="3">아이폰SE/5/5S</option>
						<option value="4">아이폰4/4S</option>
					</select></td>
					<td>
					<select id="color">
						<option value="1">빨강</option>
						<option value="2">노랑</option>
						<option value="3">파랑</option>
					</select>
					</td>
					<td><input type="number" step='5' min='0' id="prdStockNum"/></td>
					<td>
					<select id="open">
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
					</td>
					<td><button type='button' id='optionadd' class='optionadd'>+</button></td>
				</tr>
			</table>
		</form>	
		</div>
		
			<div id="optiontable" class="optiontable">
				<c:choose>
					<c:when test="${not empty optList }">
						<table id="tb_option" class="table">
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<tr id="tr_opt">
								<th>옵션번호</th>
								<th>Brand</th>
								<th>기종</th>
								<th>Color</th>
								<th>표시여부</th>
							</tr>


							<c:forEach var="opt" items="${optList }" varStatus="status">
								<tr class="tac" data-num="${opt.prd_d_no }">
									<td>${opt.prd_d_no }</td>
									<td>${opt.model_brand }</td>
									<td>${opt.model_machine }</td>
									<td>${opt.color_detail }</td>
									<td>${opt.prd_d_display }</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>등록된 옵션이 없습니다.</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>