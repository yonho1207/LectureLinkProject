<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
					<a class="nav-link" href="go_qna">문의 게시??</a>
					</li>
					<li class="nav-item">
					<a class="nav-link" href="go_payment.do">결제 ?�면?�로 </a>
				</li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				?�원 ?�보 조회
			</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="go_Attending_Lecture.do">?�강중인 강의 목록</a>
					<a class="dropdown-item" href="go_Attended_Lecture.do">?�강?�던 강의 목록</a>
					<a class="dropdown-item" href="#">?�원 ?�보 조회 �? ?�정</a>
				</div>
			
				<c:choose>
				<c:when  test="${members_info==null}">
					<li class="nav-item">
						<a class="nav-link" href="go_login">로그??</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_account">?�원가??</a>
					</li>
				</c:when>
				<c:when test="${members_info!=null}">
					<li class="nav-item">
						<a class="nav-link" href="logout">로그?�웃</a>
					</li>
				</c:when>
				</c:choose>
				<c:if test="${members_info!=null && members_info.id=='admin'}">
					<li class="nav-item">
						<a class="nav-link" href="go_admin">관리자?�이지�? ?�동</a>
					</li>
				</c:if>
			</ul>
		</nav>
	<br>


관리자 ?�용?�이지
</body>
</html>