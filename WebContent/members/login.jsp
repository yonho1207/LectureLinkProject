﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta  charset="utf-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		var msg = '${message}';		
		if(!msg){			
		}
		else{
			alert(msg);			
		}		
	});
	
</script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  
  	#login_Form{
  	
    margin:auto;
    padding:20px;
    width:500px;
    background-color:#EEEFF1;
    border-radius:5px;
  	}
  	
  	#login_btn{background-color:black; color: white; }
  
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
						
						<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
							관리자 메뉴
						</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">회원관리 페이지</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">강의등록 페이지</a>
					
						</div>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>
	


	<div class="container">		
		<form action="login" method="post" id="login_Form">
			  <div class="form-group">
			 	<h1>로그인</h1>
				<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해주세요"/><br />
				<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요"/><br />
				<input type="submit" class="form-control" id="login_btn" value="로그인"/><br />
				<a href="go_searchpwd">비밀번호 찾기</a>
			   </div>
			</form>${message}
	</div>
	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>