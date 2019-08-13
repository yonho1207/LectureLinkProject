<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 수강중인 강의 목록</title>
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

	<h3>반갑습니다 ${members_info.id}님</h3> 
	귀하께서는 현재 이하의 강의를 수강중이십니다.
		<c:forEach var="attending_List" items="${attending_List}">
			<h4>수강중이신 강의명 : ${attending_List.lecture_name}</h4>	
			구매하신 일시 : ${attending_List.payment_date}<br />
			예상 만료 기간: ${attending_List.period}<hr />
		</c:forEach>
	<br />
	<h3>이상과 같은 강의를 수강중이십니다 이용해주셔서 감사합니다</h3>
	<input type="button" onclick="location.href='/LectureLinkProject/goMain'" value="메인 화면으로 이동하기">
	<input type="button" onclick="location.href='/LectureLinkProject/go_my_page.do'" value="마이 페이지로 이동하기">
</body>
</html>