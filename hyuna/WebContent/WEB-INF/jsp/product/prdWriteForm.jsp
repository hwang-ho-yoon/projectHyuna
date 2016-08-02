<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			if (!tableChk(add, color, "이미 입력되어 있는 옵셥입니다."))
				return;
			else {
				new_tr = "<tr class='opt_tr'><td><span>" + add
						+ "</span><p >"+add_no+"</p></td>";
				new_tr += "<td><span>" + color + "</span><p >"+color_no+"</p></td>";
				new_tr += "<td><input type='number' class='form-control col-xs-2 input-sm' id='prd_d_stock' value="+0+" step='5' min='0'></td>";
				new_tr += "<td><input type='checkbox' id='prd_d_display' checked value='checked'></td>";
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
			console.log("abcd");
//			$("input:checkbox").is(":checked")?'Y':'N';
			console.log("chk_status-display: "+checkbox($("input:checkbox[id='prd_display']")))
			console.log("chk_status-color: "+checkbox($("input:checkbox[id='option_color']")))
			console.log("chk_status-brand: "+checkbox($("input:checkbox[id='option_brand']")))
//			$("input:checkbox[id='prd_display']").val(checkbox($("input:checkbox[id='prd_display']")));
			tableToText();
			$("#basicInfo").attr({"method":"post","action":"/product/productInsert.do"});
  		    $("#basicInfo").submit();
			
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
					tddata=	checkbox($(".opt_tr:eq(" + (i-1) + ")").children('td:eq('+j+')').find("input[type='checkbox']"));
					
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

<input type="text" id="options" name="options"/>

			<table class="shop_table">
				<tr>
					<td>제품코드</td>
					<td><input type="text" id="prd_no" name="prd_no" value="001"/></td>
					<td>* 상품명</td>
					<td><input type="text" id="prd_name" name="prd_name"  value="prd_001"/></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input type="text" id="prd_manufacturer"
						name="prd_manufacturer" value="(주)가리봉"/></td>
					<td>원산지</td>
					<td><input type="text" id="prd_origine" name="prd_origine" value="Corea"/></td>
				</tr>
				<tr>
					<td>매입가</td>
					<td><input type="number" id="prd_prcprice" name="prd_prcprice" value="20150"/></td>
					<td>정상가</td>
					<td><input type="number" id="prd_orgprice" name="prd_orgprice" value="20500"/></td>
				</tr>
				<tr>
					<td>* 판매가</td>
					<td><input type="number" id="prd_saleprice" name="prd_saleprice" value="25000"/></td>
					<td>전시상태</td>
					<td><input type="checkbox" id="prd_display" name="prd_display" checked/></td>
				</tr>
				<tr>
					<td colspan="4">상품설명</td>
				</tr>
				<tr>
					<td colspan="4">
					<textarea rows="5" cols="20" id="prd_desc" name="prd_desc"></textarea>
					</td>
				</tr>
				<tr>
					<td>옵션사용</td>
					<td colspan="3"><label class="checkbox-inline"> <input
							type="checkbox" id="option_color" name="option_color" checked/>Color
					</label> <label class="checkbox-inline"> <input type="checkbox"
							id="option_brand" name="option_brand" checked/>Brand
					</label></td>

				</tr>
				<tr>
					<td colspan="4">이미지 설정</td>
				</tr>
				<tr>
					<td>Main</td>
					<td colspan="3"><input type="file" name="file1" id="file1"></td>
				<tr>
					<td>Thumbnail</td>
					<td colspan="3"><input type="file" name="file2" id="file2"></td>
				</tr>
				<tr>
					<td>Detail</td>
					<td colspan="3"><input type="file" name="file3" id="file3"></td>
				</tr>
			</table>
		</form>
		
		<br>
		<div id="optionbrand" class="optionbrand">
			<select id="brand">
				<option value="1">SAMSUNG</option>
				<option value="2">LG</option>
				<option value="3">APPLE</option>
			</select> 
			<select id="model">
				<option value="1">아이폰6/6S</option>
				<option value="2">아이폰6플러스</option>
				<option value="3">아이폰SE/5/5S</option>
				<option value="4">아이폰4/4S</option>
				
			</select>
			<!-- <div id="optioncolor" class="optioncolor" style = "display:block; border:1px solid black; width:200px; float:left;" > -->

			<select id="color">
				<option value="1">빨강</option>
				<option value="2">노랑</option>
				<option value="3">파랑</option>
			</select>
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
			<button type="button" id="regPrd" name="regPrd">상품등록</button>
			<button type="button" id="PrdList" name="PrdList">상품목록</button>
		</div>
	</div>
</body>
</html>