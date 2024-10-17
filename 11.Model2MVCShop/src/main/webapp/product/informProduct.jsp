<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 100px;
        }
    </style>
    <script type="text/javascript">
    
    $(function() {
		$( "button:contains('목록')" ).on("click" , function() {
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=search").submit();
		});
    });
    </script>
    </head>
<body>

	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	
	
	<div class="page-header text-center">
	       <h3 class=" text-info">상품정보</h3>
	    </div>
	   
	   <form class="form-horizontal">
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상 품 이 름</strong></div>
			<div class="col-xs-8 col-md-4">${vo.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>상품 상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${vo.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>제 조 일 자</strong></div>
			<div class="col-xs-8 col-md-4">${vo.manuDate}</div>
		</div>

		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>이미지</strong></div>
			<div class="col-xs-8 col-md-4">${vo.fileName}</div>
		</div>
		
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">목록</button>
	  		</div>
		</div>
		
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		