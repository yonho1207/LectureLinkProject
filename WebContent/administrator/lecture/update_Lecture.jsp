<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 업데이트 화면</title>
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


	<h2>변경 하시고자 하는 강의의 정보를 수정해주세요</h2>
	<form method="post" action="update_Lecture.do">
		강의번호 : 	<input type="text" name="lecture_no" value="${lecture.lecture_no}" readonly><br />
		강의명 : <input type="text" id="lecture_name" name="lecture_name" value="${lecture.lecture_name}"><br />
		강사명 : <input type="text" id="lecture_teacher" name="lecture_teacher" value="${lecture.lecture_teacher}"><br />
		1개월 기준 수강료 : <input type="text" id="price" name="price" value="${lecture.price}"><br />
		교재 가격 : <input type="text" id="text_price" name="text_price" value="${lecture.text_price}"><br />
		<input type="submit" value="수정하기">
	</form><br />
	<input type="button" onclick="location.href='go_Main_in_Lectrue'" value="메인 화면으로 이동하기">
	<input type="button" onclick="location.href='go_Lecture_List.do'" value="강의 목록으로 이동하기">
</body>
</html>