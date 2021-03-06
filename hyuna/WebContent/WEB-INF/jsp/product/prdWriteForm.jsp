<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <script type="text/javascript" src="jquery-1.11.0.min.js"></script> -->
<script>
	/* <tr id="tr_opt"><th>기종</th><th>color</th><th>재고</th><th>공개</th></tr> */
	$(function() {
		
		
		$("#PrdList").click(function() {
			location.href="/product/prdRgtList.do";
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

			if(add_no=="non"||color_no=="non"){
				alert("옵션을 선택해 주세요");
				return;
			}
			if (!tableChk(add, color, "이미 입력되어 있는 옵셥입니다."))
				return;
			else {
				new_tr = "<tr class='opt_tr'><td><span>" + add
						+ "</span><p hidden>"+add_no+"</p></td>";
				new_tr += "<td><span>" + color + "</span><p hidden>"+color_no+"</p></td>";
				new_tr += "<td><input type='number' class='form-control col-xs-2 input-sm' id='prd_d_stock' value="+0+" step='5' min='0'></td>";
				new_tr += "<td><select class='prd_d_display' ><option value='Y'> Y </option><option value='N'> N </option></select></td>";
				new_tr += "<td><button type='button' id='minus' class='minus'>-</button></td></tr>";
				$("#tb_option").append(new_tr);
			}
		});

		//옵션없애기
		$(document).on("click", ".minus", function() {
			var rowtr = $(this).parents("tr");
			rowtr.remove();
		});

		$("input:checkbox").each(function(){
			if(this.checked)"Y"
			else"N"
		});
		//상품등록버튼
		$("#regPrd").click(function() {
			if(!chkSubmit($("#prd_name"),"상품이름을")){
				$("#prd_name").focus();
				return;
			}
			if(!chkSubmit($("#prd_manufacturer"),"제조사를")){
				$("#prd_manufacturer").focus();
				return;
			}
			if(!chkSubmit($("#prd_origine"),"원산지를")){
				$("#prd_origine").focus();
				return;
			}
			if(!chkSubmit($("#prd_desc"),"상품설명을")){
				$("#prd_desc").focus();
				return;
			}
			if(!chkSubmit($("#file1"),"상품이미지를")){
				$("#file1").focus();
				return;
			}
			if(!chkSubmit($("#file2"),"상품이미지를")){
				$("#file2").focus();
				return;
			}
			if(!chkSubmit($("#file3"),"상품이미지를")){
				$("#file3").focus();
				return;
			}
			
			console.log("file1val"+$('#file1').val());
			console.log("file2val"+$('#file2').val());
			console.log("file3val"+$('#file3').val());
			
			
			if($('#file1').val()!=""){
				if(!chkfile($('#file1'))){
					$('#file1').focus();
					return;	
				}
			}
			if($('#file2').val()!=""){
				if(!chkfile($('#file2'))){
					$('#file2').focus();
					return;
				}
			}
			if($('#file3').val()!=""){
				if(!chkfile($('#file3'))){
					$('#file3').focus();
					return;
				}
			}				
			
			console.log("abcd");
//			$("input:checkbox").is(":checked")?'Y':'N';
			console.log("chk_status-display: "+checkbox($("input:checkbox[id='prd_display']")))
			console.log("chk_status-color: "+checkbox($("input:checkbox[id='option_color']")))
			console.log("chk_status-brand: "+checkbox($("input:checkbox[id='option_brand']")))
			
			$("input:checkbox[id='prd_display']").val(checkbox($("input:checkbox[id='prd_display']")));
			$("input:checkbox[id='option_color']").val(checkbox($("input:checkbox[id='option_color']")));
			$("input:checkbox[id='option_brand']").val(checkbox($("input:checkbox[id='option_brand']")));
			
			console.log($("input:checkbox[id='prd_display']").val()+"/"+$("input:checkbox[id='option_color']").val()+"/"+$("input:checkbox[id='option_brand']").val())
			var table = document.getElementById("tb_option");
			var tablerows = table.getElementsByTagName("tr").length;
			console.log("console: "+table+"/"+tablerows);
				if(tablerows<2){
					alert("옵션을 추가해주세요.");
					return;
				}else{
					tableToText();
					$("#basicInfo").attr({"method":"post","action":"/product/productInsert.do"});
		  		    //$("#basicInfo").submit();
				}
			
		});
	});
	
	function onSuccess(json, status) {
		alert($.trim(json));
	}
	function onError(data, status) {
		alert("error");
	}

	//옵션값이 중복되는지 체크한다.
	function tableChk(add1, add2, str) {
		//var model=$(".opt_tr").children(0).css('background','red');
		var tf = true;
		if (document.getElementById("tb_option").getElementsByTagName("tr").length > 1) {
			for (var start = 0; start < document.getElementById("tb_option").getElementsByTagName("tr").length - 1; start++) {
				var model = $(".opt_tr:eq(" + start + ")").children('td:eq(0)').find('span').text();
				var color = $(".opt_tr:eq(" + start + ")").children('td:eq(1)').find('span').text();
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

	function chkSubmit(v_item, v_name) {
		if (v_item.val().replace(/\s/g, "") == "") {
			alert(v_name + " 입력해 주세요.");
			v_item.val("");
			v_item.focus();
			return false;
		} else {
			return true;
		}
	}
	
	function chkfile(file){
		var tf=true;
		var ext =file.val().split('.').pop().toLowerCase();//pop()==>마지막원소값.
		if(jQuery.inArray(ext,['gif','png','jpg','jpeg'])== -1){
			alert('gif,png,jpg,jpeg 파일만 업로드 할 수 있습니다.');
			tf=false;
			
		}
		return tf;		
	}
/* 	function tableToJson(table) { // 변환 함수
	    var data = [];
	    var headers = [];
	    for(var i=0; i<table.rows[0].cells.length; i++) {
	        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
	    }
    
	    for(var i=1; i<table.rows.length; i++) {
	        var tableRow = table.rows[i];
	        var rowData = {};

			for (var j = 0; j < tableRow.cells.length ; j++) {
				if (j==0||j==1) {
					var tabledata = $(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find('span').text();
					console.log(tabledata);
					rowData[headers[j]] = tabledata;
				} else {
					var tabledata = $(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find("input[type='number']").val();
					console.log(tabledata);
					rowData[headers[j]] = tabledata;
				}
			}
	        data.push(rowData);
	    }

	    return data;
	} */
	function tableToText(){
		var table = document.getElementById("tb_option");
        var tddata="";
        var tabledata="";
		for(var i=1; i<table.rows.length; i++) {
	        var tableRow = table.rows[i];
	        //var rowData = {};


			for (var j = 0; j < tableRow.cells.length-1 ; j++) {
				if (j==0||j==1) {
					tddata=  $(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find('p').text()+"," ;
					console.log(i+"/"+j+" : "+tddata);
					//rowData[headers[j]] = tabledata;
					//tabledata+=tabledata;
				} else {
					if(j==2)
					tddata=  $(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find("input[type='number']").val()+",";
					else
					//tddata=	checkbox($(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find("input[type='checkbox']"));
						tddata=	$(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find(".prd_d_display").val();
					
					console.log(i+"/"+j+" : "+tddata);
				}
				
				tabledata+=tddata;
				tddata+=",";
			}
			tabledata+="/";
			//console.log(i+" : "+tabledata);
	    }
		console.log(tabledata);
		$("#options").val(tabledata);
	}
	function checkbox(chk){
			if(chk.is(":checked")){
				return 'Y';
			}else{
				return 'N';
			}
	}
</script>
</head>
<body>
	<div id="wrapper">
		<form id="basicInfo" name="basicInfo" enctype="multipart/form-data">
			<h1>상품등록</h1>

<input type="hidden" id="options" name="options"/>

			<table class="shop_table table-condense">
				<tr>
					<td>제품코드</td>
					<td><input type="text" id="prd_no" name="prd_no" class="form-control col-xs-3 input-sm" readonly/></td>
					<td>* 상품명</td>
					<td><input type="text" id="prd_name" name="prd_name"  class="form-control col-xs-3 input-sm" maxlength="100"/></td>
				</tr>
				
				<tr>
					<td>제조사</td>
					<td><input type="text" id="prd_manufacturer"
						name="prd_manufacturer" value="" maxlength="100" class="form-control col-xs-3 input-sm"/></td>
					<td>원산지</td>
					<td><input type="text" id="prd_origine" name="prd_origine" maxlength="30" class="form-control col-xs-3 input-sm" /></td>
				</tr>
				<tr>
					<td>매입가</td>
					<td><input type="number" id="prd_prcprice" name="prd_prcprice" class="form-control col-xs-3 input-sm" min="0"/></td>
					<td>정상가</td>
					<td><input type="number" id="prd_orgprice" name="prd_orgprice" class="form-control col-xs-3 input-sm" min="0"/></td>
				</tr>
				<tr>
					<td >* 판매가</td>
					<td><input type="number" id="prd_saleprice" name="prd_saleprice" class="form-control col-xs-3 input-sm" min="0"/></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="4">상품설명</td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea rows="8" cols="130" id="prd_desc" name="prd_desc" maxlength="1000" class="form-control" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td>옵션사용</td>
					<td colspan="3">
					<label class="checkbox-inline"> 
					<input type="checkbox" id="option_color" name="option_color" checked/>Color
					</label> 
					<label class="checkbox-inline"> 
					<input type="checkbox" id="option_brand" name="option_brand" checked/>Brand
					</label></td>

				</tr>
				<tr>
					<td colspan="4">이미지 설정</td>
				</tr>
				<tr>
					<td>Main</td>
					<td colspan="3"><input type="file" name="file1" id="file1" class="form-control input-sm"></td>
				<tr>
					<td>Thumbnail</td>
					<td colspan="3"><input type="file" name="file2" id="file2" class="form-control input-sm"></td>
				</tr>
				<tr>
					<td>Detail</td>
					<td colspan="3"><input type="file" name="file3" id="file3" class="form-control input-sm"></td>
				</tr>
			</table>
		</form>
		
		<br>
		<div id="optionbrand" class="optionbrand" class="row">
			<c:choose>
				<c:when test="${not empty modelList }">
					<select id="model" style="width:150px;" class="form-control col-sm-2 input-sm">
						<option value="non">===선택===</option>
						<c:forEach var="modelList" items="${modelList}" varStatus="status">
							<option value="${modelList.model_no }">${modelList.model_machine }</option>
						</c:forEach>
					</select>
				</c:when>						
			<c:otherwise>등록된옵션이 없습니다.</c:otherwise> 
			</c:choose>
			<!-- <div id="optioncolor" class="optioncolor" style = "display:block; border:1px solid black; width:200px; float:left;" > -->

			<c:choose>
				<c:when test="${not empty colorList }">
					<select id="color" style="width:150px;" class="form-control col-sm-2 input-sm">
						<option value="non">===선택===</option>
						<c:forEach var="colorList" items="${colorList}" varStatus="status">
							<option value="${colorList.color_no }">${colorList.color_detail }</option>
						</c:forEach>
					</select>
				</c:when>						
			<c:otherwise>등록된옵션이 없습니다.</c:otherwise> 
			</c:choose>
			<!-- </div> -->

			<button type="button" id="optionadd" name="optionadd" class="btn btn-default pull-right btn-xs">+</button>

		</div>
		<!-- 선택된옵션표 -->
		<div id="optiontable" class="optiontable">
			<table id="tb_option" class="table">
				<colgroup>
					<col width="25%" />
					<col width="25%" />
					<col width="25%" />
					<col width="15%" />
					<col width="10%" />
				</colgroup>
				<tr id="tr_opt">
					<th>기종</th>
					<th>color</th>
					<th>재고</th>
					<th>공개</th>
					<th>선택</th>
				</tr>


			</table>
			<table style="align:right;">
			<tr ><td ><button type="button" class="btn btn-default" id="regPrd" name="regPrd">상품등록</button><button type="button" class="btn btn-default" id="PrdList" name="PrdList">상품목록</button></td></tr>
			
			
			</table>
		</div>
	</div>
</body>
</html>