<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 정보 입력 화면 </title>
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
						<a class="nav-link" href="go_Lecture_List">강의 목록보기 </a>
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
			</ul>
		</nav>
	<br>
	

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
				<input type="checkbox" name="buy_Book" value="1">교재를 구매하시겠습니까?
				<input type="submit" value="구매 리스트에 추가하기">
				<input type="button" onclick="location.href='accept_Purchase.do'" value="결제 화면으로 이동하기">
		</form> 
				<input type="button" onclick="location.href='index.jsp'" value="메인 화면으로 이동하기">
		<h2>구매 선택하신 </h2>
		<table>
		<c:forEach var = "purchase_Basket" items="${purchase_Basket}" varStatus="status"> 
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