<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	
	function fncGetProductList(currentPage) {
		var menu = $("input[name='menu']").val();
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "GET").attr("action" , "/product/listProduct?menu="+menu).submit();
	}
	
	
	
	//검색
	$(function() {
    $(".search-btn").on("click", function() {
        var searchCondition = $("select[name='searchCondition']").val(); // 현재 선택된 검색 조건
        var searchKeyword = $("#searchKeyword").val(); // 검색어


        var isNumeric = /^\d+$/.test(searchKeyword);  // 정규표현식으로 숫자인지 검사
        //test메서드는 정규 표현식이 주어진 문자열과 일치하는지 검사하고 ture, false를 반환
        //^:문자열시작, /d: 숫자(0~9) +:하나 이상의 숫자, $:문자열의 끝 따라서 문자열이 오직 숫자로만 
        //이루어져 있여야 하며, 최소한 하나의 숫자가 포함되어야 한다.

        if ((searchCondition == 0 || searchCondition == 2) && !isNumeric) {
            alert("상품 번호와 상품 가격은 숫자만 입력 가능합니다.");
            return;  
        }

        // 유효성 검사 통과 시 검색 실행
        fncGetProductList(1);
    });
});
	
	 $(function() {
		
		 $( "td:nth-child(2)" ).on("click" , function() {
			 var prodNo = $(this).closest("tr").data("prodno");
			 var menu = "${menu}"; 
			 <c:if test="${menu == 'manage'}">
				self.location = "/product/updateProductView?prodNo=" + prodNo + "&menu="+menu;
			 </c:if>
			<c:if test="${menu == 'search'}">
			self.location = "/product/getProduct?prodNo=" + prodNo + "&menu="+menu;
			</c:if>
		});
		 $( "td:nth-child(2)" ).css("color" , "red");
		 $(".ct_list_pop td:nth-child(6)").on("click", function() {
             var prodNo = $(this).closest("tr").data("prodno");
             // 상품 상세 정보 로드
             $.ajax({
                 url: "/product/json/getProduct/" + prodNo,
                 method: "GET",
                 dataType: "json",
                 success: function(data) {
                     var displayValue = "<h6>상품번호: " + data.prodNo + "<br/>" +
                         "상품명: " + data.prodName + "<br/>" +
                         "상품상세정보: " + data.prodDetail + "<br/>" +
                         "가격: " + data.price + "<br/>" +
                         "제조일자: " + data.manuDate + "<br/>" +
                         "등록일: " + data.regDateString + "<br/>" +
                         "상품이미지: " + data.fileName + "</h6>";
                      $("h6").remove();
                     $("#" + prodNo).html(displayValue);
                 }
             });
         });
		 
		 $( ".ct_list_pop td:nth-child(6)" ).css("color" , "blue");
			$("h7").css("color" , "red");
			
			//==> 아래와 같이 정의한 이유는 ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		 
	 });
		
</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
<div class="container">
	
		<div class="page-header text-info">
			<input type="hidden" name="menu" value="${menu}">
			<p>현재 menu 값: ${menu}</p>
			<c:if test="${menu=='manage'}">
						<h3>상 품 관 리</h3>
			</c:if>
			<c:if test="${menu=='search'}">
				<h3>상품 검색</h3>
			</c:if>
	    </div>
	    
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    <input type="hidden" name="menu" value="${menu}">
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" :'' }>상품번호</option>
        				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" :''}>상품명</option>
        				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" :''}>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  <button type="button" class="btn btn-default search-btn">검색</button>
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명<br><h7>(no click:상세정보)</h7></th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
            <th align="left">간략정보</th>
          </tr>
        </thead>
        
        <tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="vo" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop" data-prodno="${vo.prodNo}">
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${vo.prodName}</td>
			  <td align="left">${vo.price}</td>
			  <td align="left">${vo.regDate}</td>
			  <td align="left">판매중</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id= "${vo.prodNo}"></i>
			  	<input type="hidden" value="${vo.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
        
        </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new2.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>


