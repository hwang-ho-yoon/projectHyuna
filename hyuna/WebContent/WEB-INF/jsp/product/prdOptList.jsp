<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(function(){
		$(document).ready(function(){ 
			setNumber();
		});
		$("#add1").click(function(){
			var brdrows=$("#brdList tr").length;
			var brd=$("#brd").val();
			var mchn=$("#mchn").val();
			if(brd!=""&&mchn!=""){
				$.ajax({
						url:"/product/insertBrdOpt.do",
						type:"post",
						headers:{"content-Type":"application/json",
							"X-HTTP-Method-Overide":"POST"},
						dataType:"text",
						data:JSON.stringify({
							model_brand:brd,
							model_machine:mchn							
						}),
						error:function(){
							alert('사이트접속에 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요.');
						},
						success:function(resultData){
						makebrdTd(brdrows,brd,mchn);
						}
					
					});
				
			}else{
				alert("기기의 브랜드와 기기명을 입력해주세요");
			}
		})
		$("#add2").click(function(){
			var clrrows=$("#clrList tr").length;
			var name=$("#name").val();
			var desc=$("#desc").val();
			if(name!=""&&desc!=""){
				$.ajax({
					url:"/product/insertClrOpt.do",
					type:"post",
					headers:{"content-Type":"application/json",
						"X-HTTP-Method-Overide":"POST"},
					dataType:"text",
					data:JSON.stringify({
						color:name,
						color_detail:desc							
					}),
					error:function(){
						alert('사이트접속에 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요.');
					},
					success:function(resultData){
						makeclrTd(clrrows,name,desc);	
					}
				
				});
							
			}else{
				alert("컬러의 컬러명과 상세를 입력해주세요");
			}
		})
		
		$("#m_delete").click(function(){
			var cnt=0;
			var dataList="";
			 $('#brdList').find('tr').each(function () {
			        var row = $(this);
			        if (row.find('input[type="checkbox"]').is(':checked')){ 
			        	cnt++;
			        	dataList+=row.data("num")+",";
			        	
			        	//console.log(row.data("num"));
							//row.attr({'hidden':'hidden'})
			        		//console.log(row.find("#data-num").val());
						row.remove();
			        }
			});		
			if(cnt<1){
				 alert("삭제할 기기를 선택해주세요.");
				 return;
			}
			console.log();
			 $.ajax({
					url:"/product/deleteOpt.do",
					type:"post",
					data:"dataList="+dataList,
					error:function(){
						alert('사이트접속에 문제로 정상작동하지 못하였습니다. 잠시후 다시 시도해주세요.');
					},
					success:function(resultData){
						setNumber();
					}
				
				});
		});
		
		
	});	
	function makebrdTd(brdrows,brd,mchn){
	    $('#brdList > tbody:last').append("<tr data-num=''><td><input type='checkbox'></td><td>"+brdrows+"</td><td>"+brd+"</td><td>"+mchn+"</td></tr>");		
	    $("#brd").val("");
		$("#mchn").val("");
	}
	
	function makeclrTd(clrrows,name,desc){
        $('#clrList > tbody:last').append("<tr data-num=''><td><input type='checkbox'></td><td>"+clrrows+"</td><td>"+name+"</td><td>"+desc+"</td></tr>");			
        $("#name").val("");
		$("#desc").val("");	
	}
	function setNumber(){
	    var rownum=0;
		$('#brdList>tbody').find('tr').each(function () {
			
	        var row = $(this);
	        rownum+=1;
	        console.log(rownum);
	        $(this).find('td:eq(1)').text(rownum);
	    });
	}
</script>
<div id="wrapper">
	<div class="container">
		<div class="row">
				<div class="col-sm-6">
				<div id="addMtb">
				<h1>기기추가</h1>
				<table style="margine:10px">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<tr>
						<td colspan='3'><!-- <button type="button" id="m_save" class="">
								저장</button> -->
							<button type="button" id="m_delete" class="">삭제</button></td>
					</tr>
					<tr>
						<td style="padding-right:5px;">Brand<input type="text" id="brd" class="form-control" maxlength="30"  ></td>
						<td style="padding-right:5px;">Machine <input type="text" id="mchn" maxlength="50" class="form-control"></td>
						<td style="padding-top:17px;"><button type="button" id="add1" style="align:center;">+</button></td>
					</tr>
				</table>
				</div>
				<br>
				<div id="realaddMtb">
				<table id=brdList class="table table-condensed table-bordered" style="padding:50px;">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<td style="text-align:center" >check</td>
							<td style="text-align:center">번호</td>
							<td>브랜드</td>
							<td>기기명</td>
						</tr>
					</thead>
					<tbody>	
						<c:choose>
							<c:when test="${not empty brdList }">
								<c:forEach var="brd" items="${brdList}"	varStatus="status">
									<tr data-num="${brd.model_no}">
										<td style="text-align:center" ><input type="checkbox" id="brdChk"></td>
										<td style="text-align:center">${brd.model_no}</td>
										<td>${brd.model_brand}</td>
										<td>${brd.model_machine}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>등록된옵션이 없습니다.</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				</div>
				
				</div>
				
				<div class="col-sm-6">
				
				<div id="addCtb">
				<h1>색상추가</h1>
				<table >
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="10%">
					</colgroup>
					<tr>
						<td colspan='3'><button type="button" id="c_save" class="">
								저장</button>
						<!-- 	<button type="button" id="c_delete" class="">삭제</button> -->
						</td>
					</tr>
					<tr>
						<td style="padding-right:5px;">Name <input type="text" id="name" class="form-control"></td>
						<td style="padding-right:5px;">Desc <input type="text" id="desc" class="form-control"></td>
						<td style="padding-top:17px;"><button type="button" id="add2">+</button></td>
					</tr>
				</table>
				</div>
				<br>
				<div id="realaddCtb">
				<%--기존 색상 목룍을 표시한다 --%>
				<table id=clrList class="table table-condensed table-bordered">
				<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<td  style="text-align:center" >check</td>
							<td style="text-align:center">번호</td>
							<td>구분</td>
							<td>색상명</td>
						</tr>
					</thead>
					<tbody>	
						<c:choose>
							<c:when test="${not empty clrList }">
								<c:forEach var="clr" items="${clrList}"	varStatus="status">
									<tr data-num="${clr.color_no}">
										<td  style="text-align:center" ><input type="checkbox" id="clrChk"></td>
										<td style="text-align:center">${clr.color_no}</td>
										<td>${clr.color_name}</td>
										<td>${clr.color_detail}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>등록된옵션이 없습니다.</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				</div>

				</div>


	</div>
</div>
</div>