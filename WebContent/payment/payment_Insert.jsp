<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 정보 입력 화면 </title>
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

		<h1>구매하실 강의를 선택해주세요</h1>

		<form method="get" action="payment_Process.do">
		강의 번호 :<select name="select_Lecture_Pick" id="select_Lecture_Pick">
				 <c:forEach var="select_Lecture" items="${lecture_List_Serve}">
				 	<option value="${select_Lecture.lecture_no}">${select_Lecture.lecture_name}</option>
				 </c:forEach>
				 </select><br />
		구매자 ID : <input type="text" name="id" value="${members_info.id}" readonly><br />
		구매 일자: <input type="text" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
		예상 종료 일자 : <input type="text" name="period" id="period" value= "${one_Month_Later}" readonly/><br />
		가격: 	<select name="select_Price">
				<option value="1" > 1개월</option>
				<option value="6" > 6개월</option>
				</select><br />
				<input type="submit" value="구매 리스트에 추가하기">
				<input type="button" onclick="location.href='accept_Purchase.do'" value="결제 화면으로 이동하기">
		</form> 
				<input type="button" onclick="location.href='index.jsp'" value="메인 화면으로 이동하기">
		<h2>구매 선택하신 </h2>
		<table>
		<c:forEach var = "purchase_Basket" items="${purchase_Basket}"> 
			구매하신 강의명 :${purchase_Basket.lecture_name}
			가격 : ${purchase_Basket.price} 
			예상 만료 기간: ${purchase_Basket.period}<br />
		</c:forEach>
		</table>
		<form action="clear_Purchase_Basket.do">
			<input type="submit" value="장바구니 비우기">
		</form>
</body>
</html>