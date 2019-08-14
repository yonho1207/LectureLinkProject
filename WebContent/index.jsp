<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인터넷 강의 페이지 메인 화면</title>
<script src="https://kit.fontawesome.com/3e23d516a6.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js"></script>
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
						<a class="nav-link" href="go_Lecture_List">강의 목록보기 </a>
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
				<c:if test="${admin!=null}">
					<li class="nav-item">
					<a class="nav-link" href="logout">로그아웃</a>
						<a class="nav-link" href="go_admin.admin">관리자페이지로 이동</a>
					</li>
				</c:if>
			</ul>
		</nav>
	<br>

	<div class="container">
		<c:choose>
		<c:when test="${members_info!=null}">		
		  <div class="card" id="card" style="width:250px">
			    <img class="card-img-top" src="img/java_logo_img.jpg" alt="Card image" style="width:100%">
			    <div class="card-body">
			      <h4 class="card-title">${members_info.id}</h4>
			      <p class="card-text">환영합니다 ${members_info.id}님</p>
			      <a href="go_Attending_Lecture.do" class="btn btn-primary">수강중인 강의 목록으로</a>
			      <form action="jump_To_Clicked_Lecture" method="post">			      	
			      	<select class="ui search selection dropdown" id="search-select" size=3>
						<c:forEach var="attending_List" items="${attending_List}">
							<option value="${attending_List.lecture_no}"> ${attending_List.lecture_name}</option>
						</c:forEach>   	
						<input type="submit" value="바로가기">
			      	</select>			     
			      </form>
			    </div>
			 
			  <br>
	 	 </c:when>
	 	 <c:when test="${members_info==null}">
	 	 	 <div class="card" id="card" style="width:250px">
	 	 		<div class="card-body">
			      <h4 class="card-title">방문해 주셔서 <br /> 감사합니다</h4>
			      <p class="card-text">이용하시려면 <a href="go_login">로그인</a> 혹은 <br /> 
			      		<a href="go_account">회원 가입</a>을 해주세요</p>
			    </div>
			  </div>
	 	 </c:when>
		</c:choose>
	 </div>
	 
	 <div class="lecture_Advertise" id="lecture_Advertise">
	 	<div class="advertise_Image" id="advertise_Image">
			 <iframe width="560" height="315" src="https://www.youtube.com/embed/htzo0mZS0yw" 
			 frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; 
			 picture-in-picture" allowfullscreen></iframe>
	 	</div><br />
	 	<div class="advertise_Text" id="advertise_Text">
	 		<h1>바뀌는 기사 시험에 대비하세요!</h1>
	 		<p>2020년 1회차부터 바뀌는 산업, 정보처리기사 시험<br />
	 		여러분은 대비가 되셨습니까? 여러 강의를 통해 축척된 노하우를 통해<br />
	 		저희가 여러분의 합격을 도와드리겠습니다</p>
	 	</div>
	 </div><br />
	 
	 <div class="notice_Table" id="notice_Table">
	 	<table class="table" style="table-layout: fixed">
			<tr>	
				<td>제목</td>
				<td>작성자</td>
				<td>공지 내용</td>
				<td>작성일시</td>
		
			<tr>				
			<c:forEach var="qna" items="${qnaList}" varStatus="status">
				<c:if test="${status.count==1}">
				<tr> 
					<td>${qna.qna_title}</td>
					<td>${qna.id}</td>
					<td style="width:50%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"	>${qna.qna_con}</td>
					<td>${qna.qna_date}</td>
				</tr><br />
				</c:if>
			</c:forEach>
		</table>	
	</div>	

</body>
</html>