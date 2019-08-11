<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매 성공 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<h1>주문하신 상품의 구매가 정상적으로 처리되었습니다</h1>
		<table>
			<c:forEach var = "purchase_Basket" items="${purchase_Basket}">
				<h3>구매하신 강의명 :${purchase_Basket.lecture_name}</h3>
				가격 : ${purchase_Basket.price} 
				예상 만료 기간: ${purchase_Basket.period}<hr />
			</c:forEach>
		</table>
	<p>주문하신 내용과 다를 경우 관리자 메일을 통하여 연락해 주십시요</p>
	<input type="button" onclick="location.href='/LectureLinkProject/goMain'" value="메인 화면으로 이동하기">
	<input type="button" onclick="location.href='/LectureLinkProject/go_my_page.do'" value="마이 페이지로 이동하기">
</body>
</html>