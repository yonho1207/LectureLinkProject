<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>form</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js">
	
</script>
<style type="text/css">
	#signupForm input.error,#signupForm textarea.error{
		border : 1px dashed red;
	}
</style>

<script type="text/javascript">
	$(function(){
		$("#newpwdForm").validate({
			
			debug : false,
			rules:{
				
				password : {
					required : true,
					minlength : 4,
					maxlength : 8
				},
				repassword : {
					required : true,
					equalTo : "#password"					
				}
			},
			messages:{
				
				password : {
					required : "비밀번호를 입력해주세요",
					minlength : "비밀번호는 최소 {0}글자 이상이어야 합니다",
					maxlength : "비밀번호는 최대 {0}글자 이하여야 합니다"
				},
				repassword : {
					required : "비밀번호를 다시 입력해주세요",
					equalTo : "비밀번호 확인이 잘못되었습니다"					
				}
			}
			
			
		});
		
		
	});
	
	
	</script>
	<style type="text/css">
		#newpwdForm{
			font-size: xx-large;
	  		position: relative;
	  		left: 200px;
		}
	
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
			</li>
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
	


	

	<form method="post" id="newpwdForm" action="pwd_update">
		<h1>새 비밀번호</h1><br />
		<input type="hidden" name="member_no" id="member_no" value="${pwd_info.member_no}" />
		<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요"/><br />
		<input id="repassword" type="password" name="repassword" placeholder="비밀번호를 한번 더 입력해주세요"/><br />
		<input type="submit" value="변경하기"/>
	</form>
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>