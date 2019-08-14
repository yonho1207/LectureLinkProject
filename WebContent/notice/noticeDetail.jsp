<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html><head>
<meta charset=utf-8>
<title>Q&A Detail Form</title>
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
			</ul>
		</nav>
	<br>



	<h1>Q&A 상세보기 게시판</h1>
	<br >
	<div class="container">
 	
 	<div class="form-group">	
      <label for=notice_no>글번호:</label>
      <input type="hidden" name = "notice" value="${notice.notice_no}"><br />
      <input type="text" class="form-control" id="notice"  value="${notice.notice_no}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="notice_title">제목:</label>
      <input type="hidden" name = "notice_no" value="${notice.notice_title}">
      <input type="text" class="form-control" name = "notice_title" id="notice_title" value="${notice.notice_title}" disabled="disabled"/>
    </div>
    
 	<div class="form-group">
  		<label for="notice_con">내용:</label>
  		<input type="hidden" name = "notice_no" value="${notice.notice_con}">
  		<textarea class="form-control" rows="5" name = "notice_con" id="notice_con" disabled="disabled">${notice.notice_con}</textarea>
	</div>
	
	<div class="form-group">
  		<label for="notice_date">내용:</label>
  		<input type="hidden" name = "notice_date" value="${notice.notice_date}">
  		<textarea class="form-control" rows="5" name = "notice_date" id="notice_date" disabled="disabled">${notice.notice_date}</textarea>
	</div>
 	
	</div>
	<br >
	<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/go_notice'">리스트 돌아가기</button>
	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>