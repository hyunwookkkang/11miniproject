<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.model2.mvc.service.domain.Product" %>
    
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	/////////////////////////////////////////////////////이 아래부터 시작
	$(function() {
		$( "button" ).on("click" , function() {
			self.location = "/product/addPurchaseView?prod_no=${product.prodNo}"
		});
		
		 $( "button" ).on("click" , function() {
			history.go(-1);
		});
		
		// $( "td.ct_btn01:contains('구매')" ).on("click" , function() {
				//self.location = "/product/addPurchaseView?prod_no=${product.prodNo}"
		//	});
	});
	</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
	+<div class="page-header">
	       <h3 class=" text-info">상품상세조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상 품 번 호</strong></div>
			<div class="col-xs-8 col-md-4">${vo.prodNo}</div>
		</div>
		
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
	  		<div class="col-xs-4 col-md-2 "><strong>등 록 일 자</strong></div>
			<div class="col-xs-8 col-md-4">${vo.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구 매</button>
	  		</div>
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">취 소</button>
	  		</div>
		</div>
		
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>