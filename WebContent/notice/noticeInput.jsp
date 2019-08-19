<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html><head>
<meta charset=utf-8>
<title>Q&A Input Form</title>
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
					<a class="nav-link" href="go_payment.do">결제 화면으로 </a>
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
				<c:when  test="${members_info==null}">
					<li class="nav-item">
						<a class="nav-link" href="go_login">로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_account">회원가입</a>
					</li>
				</c:when>
				<c:when test="${members_info!=null}">
					<li class="nav-item">
						<a class="nav-link" href="logout">로그아웃</a>
					</li>
				</c:when>
				</c:choose>
				<c:if test="${members_info!=null && members_info.id=='admin'}">
					<li class="nav-item">
						<a class="nav-link" href="go_admin">관리자페이지로 이동</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>



	<h1>공지사항 작성 게시판</h1>
	<div class="container">
	
	<form action="notice_insert">
    <div class="form-group">	
      <label for=id></label>
      <input type="hidden" name = "id" value="admin"><br />
    </div>
    
     <input type="hidden" name = "member_no" value="${members_info.member_no}"><br />
     
    <div class="form-group">
      <label for="notice_title">제목:</label>
      <input type="text" class="form-control" name="notice_title" id="notice_title" >
    </div>
    
 	<div class="form-group">
  		<label for="notice_con">내용:</label>
  		<textarea class="form-control" rows="5" name="notice_con" id="notice_con"></textarea>
	</div>
    
    <button type="submit"  class="btn btn-primary">글쓰기</button>
 	</form>
	</div>
	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>