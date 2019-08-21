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
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
  <script type="text/javascript"> 
  </script>
  
  <style type="text/css">
  	#insert_Payment_Info{
  		position: relative;
  		left: 200px;
  		top: 55px;
  		margin : -20px;
  	}
  	#purchase_Basket{
  		position: relative;
  		top: -220px;
  		left: 200px;  	
  		margin : -20px;
  	}
  	#clear_Purchase_Basket{
  		position: relative;
  		left: 200px;  
  	
  	}
  	#payment_Date_Check{
  		position: relative;
        left: 900px;
        top : -10px;
        background-color: #e6ffe6;
        height: 200px;
	 	width: 15%;	
  	}
  
  </style>
  
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
					<a class="dropdown-item" href="go_Member_Profile.do">회원 정보 조회 및 수정</a>
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
						
						<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
							관리자 메뉴
						</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">회원관리 페이지</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">강의등록 페이지</a>
					
						</div>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>
	

		

		<form method="get" action="payment_Process.do" id="insert_Payment_Info">
		<h1>구매하실 강의를 선택해주세요</h1>
		강의 번호 :<select name="select_Lecture_Pick" class="w3-select" id="select_Lecture_Pick" style="size: landscape;">
				 <c:forEach var="select_Lecture" items="${lecture_List_Serve}">
				 	<option value="${select_Lecture.lecture_no}">${select_Lecture.lecture_name} / 교재 가격 : ${select_Lecture.text_price}</option>
				 </c:forEach>
				 </select><br />
		구매자 ID :<input type="text" class="w3-input" name="id" value="${members_info.id}" readonly><br />			
		구매 일자:<input type="text"  class="w3-input" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
		기간 설정 :<input type="number"  name="select_Price" id="select_Price" min="1" max="12" value="1">
				기간 설정에 유의해주세요	<br /> 
				<span style="background-color: #e6ffe6;"><input type="checkbox" name="buy_Book" value="1">교재를 구매하시겠습니까? <br /></span>
				<img src="img/payment/add-to-cart.png"><input type="submit" value="카트에 추가" style="background-color:transparent;  border:0px transparent solid;">
				<a href="accept_Purchase.do" style="position: relative; left: 200px"><img src="img/payment/cash-register.png">결제 화면으로 이동하기</a>	
		</form> 
				
	
		<form action="payment_Date_Check" id="payment_Date_Check" method="post"> 
			구매 일자:<input type="text" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
			결제 월수:<input type="number" name="choose_Month" id="choose_Month" value="1" min="1" max="12"><br />
			예상 종료 일자 : <input type="text" name="period" id="period" value="${next_Month}" readonly/><br />
						<img src="img/payment/icons8-calculator-100.png">
						<button onclick="check_Period_Button" id="check_Period_Button" style="background-color:transparent;  border:0px transparent solid;">계산하기</button><br />
		</form>
		<a href="clear_Purchase_Basket.do" style="position: relative; left: 200px"><img src="img/payment/clearBasket.png">장바구니 비우기</a>
		<a href="goMain" style="position: relative; left: 200px"><img src="img/payment/home-location.png">메인으로</a>	
		<table id="purchase_Basket">		
		<c:forEach var = "purchase_Basket" items="${purchase_Basket}" varStatus="status"> 
			<p style="font-size: large; position: relative; left: 200px">
			구매하신 강의명 :${purchase_Basket.lecture_name}
			가격 : &#8361; ${purchase_Basket.price}</p>
			<p style="font-size: x-large; position: relative; left: 200px">예상 만료 기간: ${purchase_Basket.period}</p><br />
		</c:forEach>
		</table><br />
	
		<%@ include file ="/companyLogo.jsp" %>
		
</body>
</html>