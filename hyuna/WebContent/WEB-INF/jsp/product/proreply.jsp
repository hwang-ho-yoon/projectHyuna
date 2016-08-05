<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	var qna_reply_writer = "";
	$(function(){		
		/* 기본 덧글 목록 불러오기 */
		var nim = "<c:out value='${sessionScope.hyunaname }'/>";
		var qna_no = "<c:out value='${detail.qna_no}'/>";		
		listAll(qna_no);
		
		//입력
		$("#replyInsert").click(function(){			
				var insertUrl = "/board/qnaReply/replyInsert.do";				
				$.ajax({
					url : insertUrl,
					type : "post",
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"
					},
					dataType:"text",
					data : JSON.stringify({
						qna_no:qna_no,
						qna_reply_writer:nim,						
						qna_reply_content:$("#qna_reply_content").val()
					}),
					error : function(){
						alert("실패했음");
					},
					success : function(resultData){
						if(resultData=="SUCCESS"){
							alert("댓글 등록이 완료되었습니다");
							dataReset();
							listAll(qna_no);
						}
					}
				});
			
		});
		
		//수정버튼 클릭시 수정폼 출력
		$(document).on("click", ".update_form",function(){
			var name = $(this).parents("li").attr("data-name");			
			if("${sessionScope.hyunaname }"!=name){
				alert("본인이 작성한 글만 수정 가능 합니다.");
				return;
			}else{
			$(".reset_btn").click();
			var conText = $(this).parents("li").children().eq(1).html();
			console.log("context"+conText);
			$(this).parents("li").find("button[type='button']").hide();
			$(this).parents("li").children().eq(0).html();
			var conArea = $(this).parents("li").children().eq(1);
			
			conArea.html("");
			var data="<table class='table table table-bordered'>";
				data +=	"<tr>";
				data +=	"<td width='10%' style='text-align: center; background: #F6F6F6'><label class='control-label'>댓글</label></td>";
				data +=	"<td width='70%''>";
				data +=	"<textarea class='form-control'  rows='2' style='resize: none; background: white 'id='content' name='qna_reply_content'>"+conText+"</textarea>";		               
				data +=	"</td>";
				data +=	"<td width='10%' align='center'><button type='button' class='update_btn btn btn-default'>확인</button></td>";
				data +=	"<td width='10%' align='center'><button type='button' class='reset_btn btn btn-default'>취소</button></td>";
				data +=	"</tr>";																
				data +=	"</table>";
			conArea.html(data);
			}
		});

		//수정취소 초기화
		$(document).on("click",".reset_btn",function(){
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("button[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});
				
		//수정
		$(document).on("click", ".update_btn", function(){			
			var qna_reply_no = $(this).parents("li").attr("data-num");			
			var qna_reply_content = $("#content").val();

				$.ajax({
					url : '/board/qnaReply/'+qna_reply_no+".do",
					type : "put",
					headers : {
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"PUT"},					
					data : JSON.stringify({ 
						qna_reply_content:qna_reply_content}),
					dataType : "text",
					success : function(result){
						console.log("result"+result);
						if(result=='SUCCESS'){
							alert("수정됨");
							listAll(qna_no);
						}
					}
				});
			
		});
		
		//삭제
		$(document).on("click", ".delete_btn", function(){
 			var qna_reply_no = $(this).parents("li").attr("data-num");
 			var name = $(this).parents("li").attr("data-name");
			if("${sessionScope.hyunaname }"!=name){			
				alert("본인이 작성한 글만 삭제 가능 합니다.");
				return;
			}else{
				if(confirm("삭제 하시겠습니까?")){
					$.ajax({
						url : '/board/qnaReply/'+qna_reply_no+".do",
						type : "delete",
						headers : {
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"delete"},
						dataType : "text",
						success : function(result){
							console.log("result"+result);
							if(result=='SUCCESS'){
								alert("삭제되었습니다");
								listAll(qna_no);
							}
						}
					});
				}else{
					return;
				}
			}
		});	
	}); 

	
	//리스트 요청 함수
	function listAll(qna_no){
		$("#comment_list").html("");
		var url = "/board/qnaReply/all/"+qna_no+".do";
		$.getJSON(url, function(data){
			console.log(data.length);
			
			$(data).each(function(){
				var qna_reply_no = this.qna_reply_no;
				qna_reply_writer = this.qna_reply_writer;
				var qna_reply_content = this.qna_reply_content;
				var qna_reply_modifydate = this.qna_reply_modifydate;
				addNewItem(qna_reply_no, qna_reply_writer, qna_reply_content, qna_reply_modifydate);
				
			});
		}).fail(function(){
			alert("덧글 목록을 불러오는데 실패");
		});
	}
		
	/* 새로운 글을 화면에 추가하기 위한 함수 */
	function addNewItem(qna_reply_no, qna_reply_writer, qna_reply_content, qna_reply_modifydate){
		//새로운 글이 추가될 li태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", qna_reply_no);
		new_li.attr("data-name", qna_reply_writer);
		new_li.addClass("comment_item");
		
		//작성자 정보가 지정될 <p>태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");
		
		//작성자 정보의 이름
		var name_span = $("<span>");
		name_span.addClass("qna_reply_writer");
		name_span.html(qna_reply_writer+"님");
		
		//작성일시
		var date_span = $("<span>");
		date_span.html(" / " +qna_reply_modifydate+ " ");
		
		//수정하기 버튼
		/* var up_input = $("<input>");
		up_input.attr({"type" : "button", "value" : "수정하기"});
		up_input.addClass("update_form"); */
		var up_input = $("<button>");
		up_input.attr({"type" : "button", "style" : "margin-right:10px"});
		up_input.html("수정");
		up_input.addClass("update_form btn btn-default");
		
		//삭제하기 버튼
		var del_input = $("<button>");
		del_input.attr({"type" : "button"});
		del_input.html("삭제");
		del_input.addClass("delete_btn btn btn-default");
		
		//내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(qna_reply_content);
		
		//조립하기
		writer_p.append(name_span).append(date_span).append(up_input).append(del_input);
		new_li.append(writer_p).append(content_p);
		$("#comment_list").append(new_li);
	
	}

	//등록후 텍스트 초기화
	function dataReset(){			
		$("#qna_reply_content").val("");
	}
</script>
</head>
<body>
	<div id="replyContainer">
		<h1></h1>
		<div id="comment_write"  style="margin-top: 100px">
			<form id="comment_form" name="comment_form">
			<input type="hidden" name="qna_reply_writer" id="qna_reply_writer" value="${sessionScope.hyunaname }">
			<table class="table table table-bordered">
				<tr>
					<td width="10%" style="text-align: center; background: #F6F6F6"><label class="control-label">댓글</label></td>
					<td width="80%">
						<textarea class="form-control"  rows="2" style='resize: none; background: white ' id="qna_reply_content" name="qna_reply_content"></textarea>		               
		            </td>
		            <td width="10%" align="center"><button type="button" id="replyInsert" class="btn btn-default">저장하기</button></td>
	            </tr>																
			</table>	
			</form>
		</div>
		<ul id="comment_list">
			<!-- 여기에 동적 생성 요소가 들어가게 됩니다 -->
		</ul>
	</div>
</body>
</html>