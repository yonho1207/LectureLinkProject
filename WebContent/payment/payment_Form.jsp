<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script> 
<script type="text/javascript">
$(function(){
	
	$("input:eq(1)").click(function(){
		window.open("payment/methodsOfPayment/account_Transfer.jsp", width=300, height=500);  
	}); 
	$("input:eq(2)").click(function(){
		window.open("payment/methodsOfPayment/credit_Card.jsp", width=300, height=500);  
	});
	$("input:eq(3)").click(function(){
		window.open("payment/methodsOfPayment/cell_Phone_Charge.jsp", width=300, height=500);  
	});
	$("input:eq(4)").click(function(){
		window.open("payment/methodsOfPayment/gift_Card_etc.jsp", width=300, height=500);  
	});
});
</script>
</head>
<body>
	<h1>결제 정보를 확인하여 주십시오</h1>
	<form method="get" action="payment_Confirm">
		<input type="hidden" name="id" id="id">
		<c:if test="${!empty selected_Lecture_List}">
		<table>
		 <thead>
		      <tr>
		         <th>강의 번호</th>
		         <th>강의 제목</th>
		         <th>결제일</th>
		         <th>이용권 종료일</th>
		         <th>가격</th>
		      </tr>
	    </thead>
	    <c:forEach var="selected_Lecture_List" items="${selected_Lecture_List}">
	    	<tr>
	    	<td>${selected_Lecture_List.lecture_no}</td>
	    	<td>${selected_Lecture_List.lecture_name}</td>
	    	<td>${selected_Lecture_List.payment_date}</td>
	    	<td>${selected_Lecture_List.period}</td>	    	
	    	<td>${selected_Lecture_List.price}</td>	    	
	    	</tr>	    	
	    </c:forEach>
		</table>	
	</c:if>
	<c:set var="total" value="0"/>
	<c:forEach var="price" items="${selected_Lecture_List}" varStatus="st">
		
		<c:set var="total" value="${total+price.price}"/>
		
	</c:forEach>
		<h1>총액 : ${total}</h1>
		<input type="button" value="현금 결제">
		<input type="button" value="카드 결제">
		<input type="button" value="휴대폰 결제">
		<input type="button" value="상품권 혹은 기프티콘">
	</form>

</body>
</html>