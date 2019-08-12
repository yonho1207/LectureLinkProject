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
</script>
</head>
<body>
	<h1>결제 정보를 확인하여 주십시오</h1>
	<form method="get" action="payment_Confirm.do">
		<c:if test="${!empty purchase_Basket}">
		<table>
			<c:forEach var = "purchase_Basket" items="${purchase_Basket}">
				구매하신 강의명 :${purchase_Basket.lecture_name}
				가격 : ${purchase_Basket.price} 
				예상 만료 기간: ${purchase_Basket.period}<br />
			</c:forEach>
		</table>
	</c:if>
	<c:set var="total" value="0"/>
	<c:forEach var="price" items="${purchase_Basket}" varStatus="st">
		
		<c:set var="total" value="${total+price.price}"/>
		
	</c:forEach>
		<h1>총액 : ${total}</h1>
		<input type="button" onclick="location.href='account_Transfer.do'" value="현금 결제">
		<input type="button" onclick="location.href='credit_Card.do'" value="카드 결제">
		<input type="button" onclick="location.href='cell_Phone_Bill.do'" value="휴대폰 결제">
		<input type="button" onclick="location.href='gift_Card_ETC.do'" value="상품권 혹은 기프티콘"><br />
		<input type="button" onclick="location.href='go_payment.do'" value="결제 화면으로 이동하기">
	</form>

</body>
</html>