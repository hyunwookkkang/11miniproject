<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	function fncGetProductList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		$("#currentPage").val(currentPage)
	   	//document.detailForm.submit();
		$("form").attr("method" , "GET").attr("action" , "/product/listProduct").submit();
	}
	$(function() {
		var menu = "${menu}"; 
		 
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
		 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
			fncGetProductList(1);
		});
		
		//==> userId LINK Event ����ó��
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				var prodNo = $(this).closest("tr").data("prodno");
					//Debug..
					//alert(  $( this ).text().trim() );${vo.prodNo}
					//self.location ="/product/getProduct?prodNo="+$(this).text().trim()+"&menu=${menu}";
				//self.location ="/product/getProduct?prodNo="+$(this).text().trim()+"&menu=${menu}";
				//��: $(this).text() �̰� Ŭ���� ��ǰ���� ��ȯ�ϴ� �ٲ�
				var doubleClick = $("#"+prodNo);//��:����Ŭ�� ��ġ�� �߰� jquery�� prodNo�� �ش��ϴ� id�� ������ ������ ����
				if(doubleClick.children().length>0){//��:�̹� ������ �ִ� ��� �ش� �ڽ��� ������ 0 �ʰ���
					doubleClick.empty();//��:����
				}
				else{
				<c:if test="${menu == 'manage'}">
				self.location = "/product/updateProductView?prodNo=" + prodNo + "&menu=${menu}";
				</c:if>
				<c:if test="${menu == 'search'}">
				var prodNo = $(this).closest("tr").data("prodno");
				$.ajax( 
						{
							url : "/product/json/getProduct/"+prodNo ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h3>"
															+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
															+"��ǰ��: "+JSONData.prodName+"<br/>"
															+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
															+"���� : "+JSONData.price+"<br/>"
															+"��������: "+JSONData.manuDate+"<br/>"
															+"����� : "+JSONData.regDateString+"<br/>"
															+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#"+prodNo+"" ).html(displayValue);
							}
					});
				//self.location = "/product/getProduct?prodNo=" + $(this).closest("tr").data("prodno") + "&menu=${menu}";
				</c:if>
				}
				
			});
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");//�� ���еǸ� ��� �� �Ǵ���
	});		
		
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

 <!--<form name="detailForm" action="/product/listProduct" method="get">  -->
 <form name="detailForm">
<input type="hidden" name="menu" value="${menu}">


<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
                    <c:if test="${menu=='manage'}">
						<td width="93%" class="ct_ttl01">��ǰ ����</td>
					</c:if>
					<c:if test="${menu=='search'}">
						<td width="93%" class="ct_ttl01">��ǰ �˻�</td>
					</c:if>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
        <select name="searchCondition" class="ct_input_g" style="width:80px" >
        	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" :'' }>��ǰ��ȣ</option>
        	<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" :''}>��ǰ��</option>
        	<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" :''}>��ǰ����</option>
        </select>
        <input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword:''}"  
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!--<a href="javascript:fncGetProductList('1');">�˻�</a>  -->
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage}  ������</td>
	</tr>
	<tr>
		<!-- <td class="ct_list_b" width="100">No</td>��ǰ��ȣ�� �󼼰˻�  -->
		<td class="ct_list_b" width="100">
				No
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��<br>
		<h7>(no click:������)</h7></td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<c:set var="i" value="0" />
	<c:forEach var="vo" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop" data-prodno="${vo.prodNo}">
		<td align="center">${ i }</td>
		<td></td>
		<c:if test="${menu=='manage'}" >
			<!-- <td align="left"><a href="/product/updateProductView?prodNo=${vo.prodNo}&menu=${param.menu}">${vo.prodName}</a></td> -->
			${vo.prodName}
		</c:if>
		<td>${vo.prodName}</td>
		<td></td>
		<td align="left">${vo.price}</td>
		<td></td>
		<td align="left">${vo.regDate}</td>
		<td></td>
		<td align="left">
			�Ǹ���
		</td>	
	</tr>
	<tr>
		<td id= "${vo.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		<jsp:include page="../common/pageNavigator2.jsp"/>
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
