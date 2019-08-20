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

	<style type="text/css">	
	#list_btn{background-color:black; color: white; }
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
					<a class="dropdown-item" href="#">회원 정보 조회 및 수정</a>
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
						<a class="nav-link" href="go_admin">관리자페이지로 이동</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>

	<h1>공지사항 게시판</h1>
	<br >
	<div class="container">
	
	<c:choose>
 	<c:when test="${admin == null && members_info!=null || members_info==null && admin == null}">
 	<div class="form-group">	
      <label for=notice_no>글번호:</label>
      <input type="hidden" name = "notice_no" value="${notice.notice_no}"><br />
      <input type="text" class="form-control" id="notice_no"  value="${notice.notice_no}" disabled="disabled"/>
    </div>
    
    <div class="form-group">	
      <label for=notice_no>등록일자:</label>
      <input type="hidden" name = "notice_date" value="${notice.notice_date}"><br />
      <input type="text" class="form-control" id="notice_date"  value="${notice.notice_date}" disabled="disabled"/>
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
	</c:when>
	
	<c:otherwise>
 	<div class="form-group">	
      <label for=notice_no>글번호:</label>
      <input type="hidden" name = "notice_no" value="${notice.notice_no}"><br />
      <input type="text" class="form-control" id="notice_no"  value="${notice.notice_no}" disabled="disabled"/>
    </div>
    
    <div class="form-group">	
      <label for=notice_no>등록일자:</label>
      <input type="hidden" name = "notice_date" value="${notice.notice_date}"><br />
      <input type="text" class="form-control" id="notice_date"  value="${notice.notice_date}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="notice_title">제목:</label>
      <input type="text" class="form-control" name = "notice_title" id="notice_title" value="${notice.notice_title}" />
    </div>
    
 	<div class="form-group">
  		<label for="notice_con">내용:</label>
  		<textarea class="form-control" rows="5" name = "notice_con" id="notice_con">${notice.notice_con}</textarea>
	</div>

	<br >
	<div class="form-group">
	<a type="button"  class="btn btn-primary" href="notice_delete?notice_no=${notice.notice_no}">삭제</a>
	<a type="button"  class="btn btn-primary" href="notice_update">수정</a>
	</div>
	</c:otherwise>
	</c:choose>
	</div>
	
	<div class="container">
		<button type="button" class="form-control" id="list_btn" onclick="location.href='/LectureLinkProject/go_notice'" >리스트 돌아가기</button>
	</div>	
	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>