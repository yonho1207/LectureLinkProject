<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>현금 결제 페이지</title>
</head>
<body>
	<h1>현금 결제를 선택하셨습니다</h1>
		<c:set var="total" value="0"/>
			<c:forEach var="price" items="${purchase_Basket}" varStatus="st">				
				<c:set var="total" value="${total+price.price}"/>
			</c:forEach>
		<h1>총액 : ${total}</h1>
		<form action="account_Transfer_Accept">
			<input type="submit">
		</form>
		
		<input type="button" onclick="location.href='accept_Purchase'" value="결제 화면으로 이동하기">
	
</body>
</html>