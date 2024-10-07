<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS --><!-- 마우스 올리면 바로 뜸 -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
	<!-- Bootstrap Dropdown Hover JS --><!-- 마우스 떠나면 다시 숨김 -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   <!-- 달력을 위해 추가 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
   
   
   <!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "등록"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddProduct();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
		});	
		
		//=============가격" 유효성Check  Event 처리 =============
		 $(function() {
			 
			 $("input[name='price']").on("change" , function() {
					
				 var price=$("input[name='price']").val();
			    
				 if(isNaN(price) || price.length < 1){
			    	alert("가격은 숫자만 입력 가능합니다.");
			     }
			});
		});	
		
		 $(function() {
			    $('#manuDate').datepicker({
			        format: 'yyyy-mm-dd', // 날짜 형식
			        autoclose: true, // 날짜 선택 후 자동 닫힘
			        todayHighlight: true // 오늘 날짜 강조
			    });
			 // 버튼 클릭 시 Datepicker 활성화
		        $('#datepickerButton').click(function() {
		            $('#manuDate').datepicker('show'); // Datepicker를 항상 보이도록 함
		        });

		        // 사용자가 날짜를 선택할 때 'datepicker'를 숨김
		        $('#manuDate').on('changeDate', function() {
		            $('#manuDate').datepicker('hide'); // 날짜 선택 후 닫기
		        });
			});

	function fncAddProduct() {
 	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate =$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	//유효성으로 가격만 확인
	if(isNaN(price) || price.length < 1) {//Not-a-Number 로 숫자면 false를 반환
    alert("가격은 숫자만 입력 가능합니다.");
    return;
	}
	
		$("form").attr("method","POST").attr("action","/product/addProduct").submit();
	}
</script>
</head>

<body>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품등록</h3>
	       <h5 class="text-muted">판매 하실 물건 정보를 <strong class="text-danger">등록</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		<div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" placeholder="제조일자">
		    </div>
		     <div class="col-sm-3">
		      <button type="button" class="btn btn-info" id="datepickerButton">제조일자선택</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="가격">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName" placeholder="나중에 이미지업로드">
		    </div>
		  </div>
		<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
</div>
</body>
</html>