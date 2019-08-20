<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="goMain">Logo</a>
			<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="go_qna">문의 게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_notice">공지사항 게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_payment.do">결제 화면으로 </a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_Lecture_List?reqPage=1">강의 목록보기 </a>
					</li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				회원 정보 조회
			</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="go_Attending_Lecture.do">수강중인 강의 목록</a>
					<a class="dropdown-item" href="go_Attended_Lecture.do">수강했던 강의 목록</a>
					<a class="dropdown-item" href="#">회원 정보 조회 및 수정</a>
				</div>
			
				<c:choose>
				<c:when  test="${members_info==null && admin==null}">
					<li class="nav-item">
						<a class="nav-link" href="go_login">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_account">회원가입</a>
					</li>
				</c:when>
				<c:when test="${members_info!=null || admin!=null}">
					<li class="nav-item">
						<a class="nav-link" href="logout">로그아웃</a>
					</li>
				</c:when>
				</c:choose>
				<c:if test="${admin!=null && members_info==null}">
					<li class="nav-item">
					
						<a class="nav-link" href="go_admin.admin">관리자페이지로 이동</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>
	

	<h1 style="position: relative; left: 200px">결제 정보를 확인하여 주십시오</h1>
	<form method="get" action="payment_Confirm.do" style="position: relative; left: 200px">
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
	<c:forEach var="price" items="${purchase_Basket}" varStatus="st" >
		
		<c:set var="total" value="${total+price.price}"/>
		
	</c:forEach>
		<h1>총액 : ${total}</h1>
		<input type="button" onclick="location.href='account_Transfer.do'" value="현금 결제" style="position: relative; left: 200px">
		<input type="button" onclick="location.href='credit_Card.do'" value="카드 결제" style="position: relative; left: 200px">
		<input type="button" onclick="location.href='cell_Phone_Bill.do'" value="휴대폰 결제" style="position: relative; left: 200px">
		<input type="button" onclick="location.href='gift_Card_ETC.do'" value="상품권 혹은 기프티콘" style="position: relative; left: 200px"><br />
		<input type="button" onclick="location.href='go_payment.do'" value="결제 화면으로 이동하기" style="position: relative; left: 200px">
	</form>
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>