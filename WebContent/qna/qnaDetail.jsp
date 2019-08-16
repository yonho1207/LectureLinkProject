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
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>
	
	<h1>Q&A 상세보기 게시판</h1>
	<br >
	<div class="container">
	
	<form action="qna_update" method="post">

	<input type="hidden" name = "qna_grp" id ="qna_grp" value="${qna.grp}"><br />
	
	<div class="form-group">	
      <label for=qna_no>글번호:</label> 
      <input type="hidden" name = "qna_no" value="${qna.qna_no}"><br />
      <input type="text" class="form-control" id="qna_no"  value="${qna.qna_no}" disabled="disabled"/>
    </div>
	
    <div class="form-group">	
      <label for=id>작성자:</label>
      <input type="hidden" name = "id" value="${qna.id}"><br />
      <input type="text" class="form-control" id="id"  value="${qna.id}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="qna_title">제목:</label>
      <input type="text" class="form-control" name = "qna_title" id="qna_title" value="${qna.qna_title}"/>
    </div>
    
 	<div class="form-group">
  		<label for="qna_con">내용:</label>
  		<textarea class="form-control" rows="5" name = "qna_con" id="qna_con">${qna.qna_con}</textarea>
	</div>
	
	<c:if test="${members_info.id == qna.id}">
	<div class="form-group">
  	<input type="submit"  class="btn btn-primary" value="수정">
  	
  	<a type="button"  class="btn btn-primary" href="qna_delete?qna_no=${qna.qna_no}">삭제</a>
  	</div>
 	</c:if>
 	</form>
	</div>
	
	<div class="container">
	<div class="form-group">	
	<hr>
	댓글: &nbsp; ${qna_cmt.qna_title}  &nbsp;&nbsp; ${qna_cmt.qna_date} 
	<textarea class="form-control" rows="5" cols="50" disabled="disabled"> ${qna_cmt.qna_con}</textarea>
	</div>
	</div>
	
	<c:if test="${admin!=null && members_info==null}">
	<hr>
	<br >
	
	<div class="container">
	<button data-toggle="collapse" data-target="#admin_cmt" class="btn btn-primary">관리자 댓글달기</button>
	
	<div id="admin_cmt" class="collapse">
	
	<form action="qna_cmt_insert" method="post">

	<input type="hidden" name = "admin_no" value="${members_info.member_no}">
	<input type="hidden" name = "qna_cmt_no" value="${qna.qna_no}"><br />
	<input type="hidden" name = "qna_cmt_grp" value="${qna.grp}">
	
    <div class="form-group">	
      <label for=id>작성자:</label>
      <input type="hidden" name = "admin_id" value="${qna.id}"><br />
      <input type="text" class="form-control" id="admin_id"  value="${qna.id}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="qna_title">제목:</label>
      <input type="text" class="form-control" name = "qna_cmt_title" id="qna_cmt_title" "/>
    </div>
    
 	<div class="form-group">
  		<label for="qna_con">내용:</label>
  		<textarea class="form-control" rows="5" name = "qna_cmt_con" id="qna_cmt_con"></textarea>
	</div>
	
	<input type="submit"  class="btn btn-primary" value="등록">
	</form>
	</div>
	</div>
	</c:if>
	
	<br >
	<div class="container">
	<button type="button" class="form-control" id="list_btn" onclick="location.href='/LectureLinkProject/go_qna'" >리스트 돌아가기</button>
	</div>
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>