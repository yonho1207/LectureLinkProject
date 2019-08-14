<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새로운 강의 넣기</title>
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
	</header>


	<h2>새로 작성하고자 하는 강의의 정보를 입력해주세요</h2>
	<form method="post" action="insert_Lecture.do">
		강의명 : <input type="text" id="lecture_name" name="lecture_name"><br />
		강사명 : <input type="text" id="lecture_teacher" name="lecture_teacher"><br />
		1개월 기준 수강료 : <input type="text" id="price" name="price"><br />
		교재 가격 : <input type="text" id="text_price" name="text_price"><br />
		<input type="submit">
	</form>
</body>
</html>