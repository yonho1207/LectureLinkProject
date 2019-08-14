<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
<script src="https://kit.fontawesome.com/3e23d516a6.js"></script>
<style>
	.move_To_Home:before{
		content: "\f015";
		font-family: FontAwesome;
   	 	font-style: normal;
    	font-weight: normal;
    	text-decoration: inherit;
	}
	a{
		margin-left: 15px;	
		margin-right: 15px;	
		text-align: center;
		line-height: 2.8;
		font-size: 20px;
	}
	header{
		background-color: silver;
		height : 60px;
		border: 3px solid black;
	}
	</style>
</head>
<body>
	<header style="background-color: silver">
		<a class="fas fa-home" href="goMain">홈으로 ||</a>
		<a class="fas fa-id-card" href="go_my_page.do">마이 페이지 ||</a>
		<a class="fas fa-coins"  href="go_payment.do">결제 화면으로 ||</a>
		<a class="far fa-list-alt"  href="go_qna">문의 게시판 ||</a>
		<c:choose>
		<c:when  test="${members_info==null}">
			<a class="fas fa-sign-in-alt" href="go_login">로그인 ||</a>
			<a  class="far fa-id-card" href="go_account">회원가입 ||</a>
		</c:when>
		<c:when test="${members_info!=null}">
			<form action="logout" class= "fas fa-sign-out-alt">
				<input type="submit" value="로그아웃"/>
			</form>
		</c:when>
		</c:choose>
		<c:if test="${members_info!=null && members_info.id=='admin'}">
			<a class="fas fa-user-shield" href="go_admin">관리자페이지로 이동</a>
		</c:if>
	</header>


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