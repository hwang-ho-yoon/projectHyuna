<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
/* $(function(){
	$("#updatePrd").click(function(){
		$("#lookUpdate").attr({
			"method" : "post",
			"action" : "/product/prdUpdateFrom.do"
		});
		$("#lookUpdate").submit();
	});
	$("#regPrd").click(function(){
	location.href="/product/prdWriteForm.do";
	});
	$("#PrdList").click(function() {
		location.href="/product/prdRgtList.do";
	});
}); */
$(function(){
	
	$("img").error(function() {
		// 다른 이미지로 src속성을 변경
		$(this).attr("src", "/images/common/CheckMarkX.jpg");
	}).each(function() {
		$(this).attr("src", $(this).attr("src"));
	});
	
	var img1=$("<img>");//이미지객체를 만들겠다.
	var img2=$("<img>");//이미지객체를 만들겠다.
	var img3=$("<img>");//이미지객체를 만들겠다.
	
	$("#imgMainView").hover(function(){//영역안에 마우스를줬을때.
		img1.attr({
			src:"/main/${detail.img_1}",
			width:"450px",
			height:"200px"
		});
		img1.addClass("imgViewData");
		$("#imgMainArea").append(img1);
	}, function(){//영역안에서 벗어났을때
		img1.remove();
	});
	
	$("#imgThumbnailView").hover(function(){//영역안에 마우스를줬을때.
		
		img2.attr({
			src:"/thumbnail/${detail.img_2}",
			width:"450px",
			height:"200px"
		});
		img2.addClass("imgViewData");
		$("#imgThumbnailArea").append(img2);
	}, function(){//영역안에서 벗어났을때
		img2.remove();
	});
	
	$("#imgDetailView").hover(function(){//영역안에 마우스를줬을때.
		
		img3.attr({
			src:"/detail/${detail.img_3}",
			width:"450px",
			height:"200px"
		});
		img3.addClass("imgViewData");
		$("#imgDetailArea").append(img3);
	}, function(){//영역안에서 벗어났을때
		img3.remove();
	});	
});
function prdUpdateForm(prd_no){
	$("#lookUpdate").attr({
		"method" : "post",
		"action" : "/product/prdUpdateForm.do"
	});
	$("#lookUpdate").submit();
}
function prdWriteFrom(){
	location.href="/product/prdWriteForm.do";
}
function prdRgtList(){
	location.href="/product/prdRgtList.do";
}

</script>
<div id="wrapper">

	<div class="container">
	<%--=================상품 수정을 위한 form========================== --%>
		<form name="lookUpdate" id="lookUpdate">
			<input type="hidden" name="prd_no" id="prd_no" value="${detail.prd_no }"/>
			<%--<input type="hidden" name="page" value="${data.page}" /> 아이디는 유일한값이다. 한페이지에 하나만.!!!!!!!!!!!!!!!!!!!!!!!! 
			<input type="hidden" name="pageSize" value="${data.pageSize}" /> --%>
		</form>
		<div class="row">
			<h1>등록상품상세</h1>
			<div style="float:right;margin-bottom:5px;">
				<button type="button" class="btn btn-default" id="updatePrd" name="updatePrd" onclick="prdUpdateForm(${detail.prd_no})">상품수정</button>
				<button type="button" class="btn btn-default" id="regPrd" name="regPrd" onclick="prdWriteFrom()">새상품등록</button>
				<button type="button" class="btn btn-default" id="PrdList" name="PrdList" onclick="prdRgtList()">상품목록</button>
			</div>
			<table class="shop_table table-condensed">
				<tr>
					<td>제품코드</td>
					<td>${detail.prd_no}</td>
					<td>* 상품명</td>
					<td>${detail.prd_name}</td>
				</tr>
				<tr>
					<td>제조사</td>
					<td>${detail.prd_manufacturer}</td>
					<td>원산지</td>
					<td>${detail.prd_origine}</td>
				</tr>
				<tr>
					<td>매입가</td>
					<td>${detail.prd_prcprice}</td>
					<td>정상가</td>
					<td>${detail.prd_orgprice}</td>
				</tr>
				<tr>
					<td>* 판매가</td>
					<td>${detail.prd_saleprice}</td>
					<td>전시상태</td>
					<td>${detail.prd_display}</td>
				</tr>
				<tr>
					<td colspan="4">상품설명</td>
				</tr>
				<tr>
					<td colspan="4">${detail.prd_desc}</td>
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
					<td colspan="3"><label id="imgMainView">${detail.img_1 }</label><span id="imgMainArea"></span></td>
				<tr>
					<td>Thumbnail</td>
					<td colspan="3"><label id="imgThumbnailView">${detail.img_2 }</label><span id="imgThumbnailArea"></span></td>
				</tr>
				<tr>
					<td>Detail</td>
					<td colspan="3"><label id="imgDetailView">${detail.img_3 }</label><span id="imgDetailArea"></span></td>
				</tr>
			</table>
			</form>
		</div>
		<br>
		<div class="row">
			<div id="optiontable" class="optiontable">
				<c:choose>
					<c:when test="${not empty optList }">
						<table id="tb_option" class="table table-condensed">
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<tr id="tr_opt">
								<th>옵션번호</th>
								<th>Color</th>
								<th>Brand</th>
								<th>기종</th>
								<th>표시여부</th>
							</tr>


							<c:forEach var="opt" items="${optList }" varStatus="status">
								<tr class="tac" data-num="${opt.prd_d_no }">
									<td>${opt.prd_d_no }</td>
									<td>${opt.color_detail }</td>
									<td>${opt.model_brand }
									<td>${opt.model_machine }</td>
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