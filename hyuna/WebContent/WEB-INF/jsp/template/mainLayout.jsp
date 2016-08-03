<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰</title>
    
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="/include/css/bootstrap.min.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/include/css/font-awesome.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="/include/css/owl.carousel.css">
    <link rel="stylesheet" href="/include/css/style.css">
    <link rel="stylesheet" href="/include/css/responsive.css">
    <link rel="stylesheet" href="/include/css/common.css">
    
    <!-- Elements CSS -->
    <link rel="stylesheet" href="/include/css/elements/animate.min.css">
    <link rel="stylesheet" href="/include/css/elements/checkbox3.min.css">
    <link rel="stylesheet" href="/include/css/elements/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/include/css/elements/element.css">
    <link rel="stylesheet" href="/include/css/elements/flat-blue.css">
    <link rel="stylesheet" href="/include/css/elements/flat-green.css">
    <link rel="stylesheet" href="/include/css/elements/font-awesome.min.css">
    <link rel="stylesheet" href="/include/css/elements/jquery.dataTables.min.css">
    <link rel="stylesheet" href="/include/css/elements/select2.min.css">
    <link rel="stylesheet" href="/include/css/elements/bootstrap-switch.min.css">

	 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!-- 게시판 css-->
	<style>
	#list{
		 width:100%;
		}
		#write{
		width:80px;
		height:41;
		margin-left:5%;
		margin-right:0;
		}
		/* <-- width 60 height 41--> */
		.bottom{
		margin-bottom:15%;
		}
		#search{
		width:150px;
		height:41px;
		}
		#select{
		width:100px;
		height:41px;
		}
		#page{
		width: 250px;
		margin-top:20px;
		}
		#searchBtn{
		height:41px;
		padding:0px;
		margin:0px;
		width:80px;
		}
 	</style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  
  <!-- Include Editor style. -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.3.4/css/froala_editor.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.3.4/css/froala_style.min.css" rel="stylesheet" type="text/css" />
<!-- Include JS file. -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.3.4/js/froala_editor.min.js"></script>

<script>
		$(function(){
			$("#btn_faq_write").click(function(){
				$("#faq_writeform").attr({
					"method" : "post",
					"action" : "/board/faq/faqInsert.do"
				});
				$("#faq_writeform").submit();
				
				
			})
		
			
			$("#btn_faq_list").click(function(){
				location.href = "/board/faq/faqList.do";
			});
		
			$("#btn_faq_reset").click(function(){
				$("#faq_content").html("");
			});	
		})
</script>		



	
    
	<!-- jQuery와 Postcodify를 로딩한다 -->
<script src="/include/js/search.js"></script>

</head>
<body>
	<div>
		<header class="main-header">
			<tiles:insertAttribute name="header" />
		</header> <!-- /. main-header -->
		
		<div id="main-wrapper">
			<tiles:insertAttribute name="body" />
		</div>
		
		 <footer class="main-footer">
			<tiles:insertAttribute name="footer" />
		 </footer>
	</div>
</body>
</html>