<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록된 강의 목록</title>
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
		<c:if test="${admin!=null}">
			<a class="fas fa-user-shield" href="go_admin.admin">관리자페이지로 이동</a>
		</c:if>
	</header>


	<table>
		<tr>
			<th>강의 번호</th>
			<th>강의명</th>
			<th>강사</th>
			<th>수강료</th>
			<th>교재비</th>
		</tr>
		<tbody>
		<c:forEach var="lecture_List" items="${lecture_List}">
			<tr>
				<td><a href="go_Lecture_Update.do?lecture_no=${lecture_List.lecture_no}">${lecture_List.lecture_no}</a></td>
				<td>${lecture_List.lecture_name}</td>
				<td>${lecture_List.lecture_teacher}</td>
				<td>${lecture_List.price}</td>
				<td>${lecture_List.text_price}</td>
				<td><input type="button" onclick="location.href='delete_Lecture.do?lecture_no=${lecture_List.lecture_no}'" value="삭제하기"></td>
				<td></td>
			</tr>
		</c:forEach>
		</tbody>
	</table><br />
	<input type="button" onclick="location.href='go_Main_in_Lectrue'" value="메인 화면으로 이동하기">
</body>
</html>