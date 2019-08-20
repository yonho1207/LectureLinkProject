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
  <script type="text/javascript"> 
  </script>
  
  <style type="text/css">
  	#insert_Payment_Info{
  		font-size: xx-large;
  		position: relative;
  		left: 200px;
  	}
  	#purchase_Basket{
  		font-size: xx-large;
  		position: relative;
  		left: 200px;  	
  	
  	}
  	#clear_Purchase_Basket{
  		font-size: xx-large;
  		position: relative;
  		left: 200px;  
  	
  	}
  	#payment_Date_Check{
  		position: fixed;
        right: 150px;
        background-color: #FFEFD5;
        height: 160px;
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
						
							<a class="nav-link" href="go_admin.admin">관리자페이지로 이동</a>
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
		강의 번호 :<select name="select_Lecture_Pick" id="select_Lecture_Pick">
				 <c:forEach var="select_Lecture" items="${lecture_List_Serve}">
				 	<option value="${select_Lecture.lecture_no}">${select_Lecture.lecture_name} / 교재 가격 : ${select_Lecture.text_price}</option>
				 </c:forEach>
				 </select><br />
		구매자 ID :<input type="text" name="id" value="${members_info.id}" readonly><br />			
		구매 일자:<input type="text" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
		기간 설정 :<input type="number" name="select_Price" id="select_Price" min="1" max="12" value="1"><br /> 
				<input type="checkbox" name="buy_Book" value="1">교재를 구매하시겠습니까? <br />
				<button type="submit">구매 리스트에 추가하기</button>
				<input type="button" onclick="location.href='accept_Purchase.do'" value="결제 화면으로 이동하기">
		</form> 
				
	
		<form action="payment_Date_Check" id="payment_Date_Check" method="post">
			구매 일자:<input type="text" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
			결제 월수:<input type="number" name="choose_Month" id="choose_Month" value="1" min="1" max="12"><br />
			예상 종료 일자 : <input type="text" name="period" id="period" value="${next_Month}" readonly/><br />
						<button onclick="check_Period_Button" id="check_Period_Button">계산하기</button><br />
		</form>
	
		<h2 style="position: relative; left: 200px">구매 선택하신 강의 목록</h2> 
		<table id="purchase_Basket">
		
		<c:forEach var = "purchase_Basket" items="${purchase_Basket}" varStatus="status"> 
			<p style="font-size: large; position: relative; left: 200px">
			구매하신 강의명 :${purchase_Basket.lecture_name}
			가격 : ${purchase_Basket.price}</p>
			<p style="font-size: x-large; position: relative; left: 200px">예상 만료 기간: ${purchase_Basket.period}</p><br />
		</c:forEach>
		</table>
		<form action="clear_Purchase_Basket.do" id="clear_Purchase_Basket">
			<input type="submit" value="장바구니 비우기">
			<input type="button" onclick="location.href='index.jsp'" value="메인 화면으로 이동하기">
		</form>
		
		
</body>
</html>