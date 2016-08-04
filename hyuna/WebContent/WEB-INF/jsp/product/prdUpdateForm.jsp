<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
$(function() {
	$("#PrdList").click(function() {
		location.href="/product/prdRgtList.do";
	});
	var prd_no="<c:out value='${detail.prd_no}'/>";
	$("input:checked").each(function(){
		if(this.checked)"Y"
		else"N"
	});
	
	$(document).on("click", "#optDelete", function(){
		 var r_num  = $(this).parents("tr").attr("data-num");// 
	     console.log("r_num: " + r_num);
		if(confirm("해당옵션을 정말 삭제하시겠습니까?")){
			var add = $("#model option:selected").text();
			var add_no = $("#model").val();
			console.log(add_no+" :"+add);
			
			var color = $("#color option:selected").text();
			var color_no = $("#color").val();
			console.log(color_no+" :"+color);
			
			
			 var table = document.getElementById("tb_option");
			var tablerows = table.getElementsByTagName("tr").length;
			var prd_no=${detail.prd_no};
			
			//var prd_d_display= $("#open").val();
			//var prd_d_stock= $("#prd_d_stock").val();
			//	if(prd_d_stock==null){
			//		prd_d_stock=0;
			//	}
			//console.log(prd_d_display+" :"+prd_d_stock);
			
			$.ajax({//ajax 최상위 , = jquery.ajax()
				url : "/product/prdOptDelete.do",//전송URL
				type : "POST",//전송시 method방식
				headers:{
					"content-Type":"application/json",
					"X-HTTP-Method-Overide":"POST"
				},
				dataType : "text",//응답문서의 형식
				data:JSON.stringify({
					prd_d_no:r_num,
					prd_no:prd_no
				}),
				error : function() {//실행시 오류가 발생 하엿을 경우
					alert('시스템오류 입니다. 관리자에게 문의하세요.');
				}, 
				success : function(resultData) {//정상실행되엇을경우 (결과를 담을 수 있는 변수로서 다른이름도 관ㄱㅖ없다.) 
					//if(result=="SUCCESS"){
	                     alert("옵션삭제완료");
	                  //}
	                     prdUpdateForm();
				}

			});
			
			
		}
			return;
		
		});
	$(document).on("click", "#displayConfirm", function(){
	        var r_num  = $(this).parents("tr").attr("data-num");// 
		    console.log("r_num: " + r_num);
			
			var prd_no=${detail.prd_no};
			//$("li:eq(2)")
			
			//var color = $(".opt_tr:eq(" + start + ")").children('td:eq(1)').find('span').css("background", "pink");;
			var prd_d_display=  $(this).parents("tr").children('td:eq(4)').find('#openOpt option:selected').text();
			//var prd_d_display=  $(this).children("td:eq(4)").find('#openOpt option:selected').val();
			
			
			var prd_d_stock= $(this).parents("tr").children('td:eq(5)').find('#prd_d_stock').val();
				if(prd_d_stock==null){
					prd_d_stock=0;
				}
			console.log(prd_no+":"+prd_d_display+" :"+prd_d_stock);
			
			$.ajax({//ajax 최상위 , = jquery.ajax()
				url : "/product/prdOptUpdate.do",//전송URL
				type : "POST",//전송시 method방식
				headers:{
					"content-Type":"application/json",
					"X-HTTP-Method-Overide":"POST"
				},
				dataType : "text",//응답문서의 형식
				data:JSON.stringify({
					prd_d_no:r_num,
					prd_no:prd_no,
					prd_d_stock:prd_d_stock,
					prd_d_display:prd_d_display
				}),
				error : function() {//실행시 오류가 발생 하엿을 경우
					alert('시스템오류 입니다. 관리자에게 문의하세요.');
				}, 
				success : function(resultData) {//정상실행되엇을경우 (결과를 담을 수 있는 변수로서 다른이름도 관ㄱㅖ없다.) 
	                     alert("확인");
	                     prdUpdateForm();
				}
			}); 
		});
	
	$("#optionadd").click(function() {
		
		
		var add = $("#model option:selected").text();
		var add_no = $("#model").val();
		console.log(add_no+" :"+add);
		
		var color = $("#color option:selected").text();
		var color_no = $("#color").val();
		console.log(color_no+" :"+color);
		
		
		var table = document.getElementById("tb_option");
		//var tablerows = table.getElementsByTagName("tr").length;
		var prd_no=${detail.prd_no};
		
		var prd_d_display= $("#open").val();
		var prd_d_stock= $("#prdStockNum").val();
		if(prd_d_stock==null){
			prd_d_stock=0;
		}
		console.log(prd_d_display+" :"+prd_d_stock);
		//if(table!=null){
			if (!tableChk(add, color, "이미 입력되어 있는 옵셥입니다."))
				return;
		//}
		else {
			$.ajax({//ajax 최상위 , = jquery.ajax()
				url : "/product/prdOptAdd.do",//전송URL
				type : "POST",//전송시 method방식
				headers:{
					"content-Type":"application/json",
					"X-HTTP-Method-Overide":"POST"
				},
				dataType : "text",//응답문서의 형식
				data:JSON.stringify({
					prd_no:prd_no,
					prd_d_display:'Y',
					prd_d_stock:prd_d_stock,
					color_no:color_no,
					model_no:add_no
				}),
				error : function() {//실행시 오류가 발생 하엿을 경우
					alert('시스템오류 입니다. 관리자에게 문의하세요.');
				}, 
				success : function(resultData) {//정상실행되엇을경우 (결과를 담을 수 있는 변수로서 다른이름도 관ㄱㅖ없다.) 
					//if(result=="SUCCESS"){
	                     alert("옵션추가완료");
	                  //}
	                     prdUpdateForm();
				}

			});
		}  
	});
	$("#delPrd").click(function() {
		var table = document.getElementById("tb_option");
		console.log(table);
		if(table!=null){
			console.log("not null");
			var tablerows = table.getElementsByTagName("tr").length;
			console.log(tablerows);
		 	if(tablerows>1){
		 		if(confirm("상품의 옵션이 아직 존재합니다. 상품을 삭제하시겠습니까?")){
		 			prdDelete();
		 		}else return;
			} 
	 	}else{
	 		if(confirm("상품을 삭제하시겠습니까?")){
	 			prdDelete();
	 		}else return;
	 	}
	});
	/* $(function() {
		  $("textarea.prd_desc").keyup(function () {//{'list-style':'none','border':'1px solid red'}
		    $(this).css({'height':'1px','weight':'500px'}).css("height",(20+$(this).prop("scrollHeight"))+"px");
		  });
	}); */
});
function prdDelete(){
	$("#lookUpdate").attr({
		"method" : "post",
		"action" : "/product/prdDelete.do"
	});
	$("#lookUpdate").submit();
}

function prdUpdateForm(){
	$("#lookUpdate").attr({
		"method" : "post",
		"action" : "/product/prdUpdateForm.do"
	});
	$("#lookUpdate").submit();
}

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
<form name="lookUpdate" id="lookUpdate">
	<input type="hidden" name="prd_no" id="prd_no" value="${detail.prd_no }"/>
</form>
	<div class="container">
	
		<div class="row">
			<h1>상품수정</h1>
			<div style="float:right;margin-bottom:5px;">
				<button type="button" class="btn btn-default" id="updatePrd" name="updatePrd" onclick="prdUpdate('${detail.prd_no}')">수정완료</button>
				<button type="button" class="btn btn-default" id="delPrd" name="delPrd" onclick="prdWriteFrom()">상품삭제</button>
				<button type="button" class="btn btn-default" id="PrdList" name="PrdList">상품목록</button>
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
					<td colspan="4"><textarea rows="8" cols="130" id="prd_desc" name="prd_desc" class="prd_desc form-control"  style="resize: none;">${detail.prd_desc}</textarea></td>
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
			<table id="tb_optionAdd" class="table">
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
				<tr id="tr_opt" data-num="${detail.prd_no}">
					<td>
					
					<c:choose>
				<c:when test="${not empty modelList }">
					<select id="model" style="width:150px;">
						<option value="non">===선택===</option>
						<c:forEach var="modelList" items="${modelList}" varStatus="status">
							<option value="${modelList.model_no }">${modelList.model_machine }</option>
						</c:forEach>
					</select>
				</c:when>						
			<c:otherwise>등록된옵션이 없습니다.</c:otherwise> 
			</c:choose>
					
					</td>
					<td>
					
					<c:choose>
				<c:when test="${not empty colorList }">
					<select id="color" style="width:150px;">
						<option value="non">===선택===</option>
						<c:forEach var="colorList" items="${colorList}" varStatus="status">
							<option value="${colorList.color_no }">${colorList.color_detail }</option>
						</c:forEach>
					</select>
				</c:when>						
			<c:otherwise>등록된옵션이 없습니다.</c:otherwise> 
			</c:choose>
					
					</td>
					<td><input type="number" step='5' min='0' id="prdStockNum"  value="0"/></td>
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
								<col width="10%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<tr id="tr_opt">
								<th>옵션번호</th>
								<th>Brand</th>
								<th>기종</th>
								<th>Color</th>
								<th>표시여부</th>
								<th>재고</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>


							<c:forEach var="opt" items="${optList }" varStatus="status">
								<c:if test="${opt.prd_d_display=='Y' }">
								<tr class="tac" data-num="${opt.prd_d_no }">
									<td>${opt.prd_d_no }</td>
									<td>${opt.model_brand }</td>
									<td>${opt.model_machine }</td>
									<td>${opt.color_detail }</td>
									<td>
										${opt.prd_d_display }
									</td>
									<td><input type="number" id="prd_d_stock" name="prd_d_stock" value="${opt.prd_d_stock }"></td>
									<td><input type="button" id="displayConfirm" name="displayConfirm" value="확인"/></td>
									<td><input type="button" id="optDelete" name="optDelete" value="삭제"/></td>
								</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>등록된 옵션이 없습니다.</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>