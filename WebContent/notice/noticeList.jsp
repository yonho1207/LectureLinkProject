<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8>
<title>공지사항게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
	<style type="text/css">
		#sel{font-size:40px;}
		.pagination{ display: table; margin-left: auto; margin-right: auto; }
		a:hover {text-decoration: underline; color: red;}
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



<h3>공지사항 게시판</h3>

	<div class="container">
	<table class="table">
		<tr>	
			<td>제목</td>
			<td>작성일시</td>
	
		<tr>	
			
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td><a href="notice_detail?notice_no=${notice.notice_no}">${notice.notice_title}</a></td>
					<td>${notice.notice_date}</td>
				</tr>
			</c:forEach>

			</table>	
		</div>	
		<c:if test="${admin!=null && members_info==null}">
	
		<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/notice_inputform'"  style="position: relative; left: 300px">글쓰기</button>
		
		</c:if>
		
		<ul class="pagination">
	<!-- 페이지 처리부분 -->
			<c:if test="${pageGroupResult.beforePage}">
				<a href="notice_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
			</c:if>
				
			<c:forEach var ="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>
				
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
						<span id="sel"><a href="notice_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					
					<c:otherwise>
						<a href="notice_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
					
				</c:choose>	
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage}">
				<a href="notice_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▶</a>
			</c:if>
		</ul>
			<%@ include file ="/companyLogo.jsp" %>
</body>
</html>