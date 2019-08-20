<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3e23d516a6.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js"></script>
<style type="text/css">	
	#css{background-color:white; color: black; }
	
	#css{
     
    margin:auto;
    padding:20px;
    width:500px;
    background-color:#EEEFF1;
    border-radius:5px;
     }
</style>
<script type="text/javascript">
$(document).ready(function() {
	var gender = "${members.gender}";
	$('input[type=radio]').each(function name() {

		if (gender == $(this).val()) {
			$(this).attr('checked', 'checked')

		}
	});
	var question = "${members.question}"
		$('option').each(function() {

			if (question == $(this).val()) {
				$(this).attr('selected', 'selected')

			}

		});
});

</script>
<script type="text/javascript">
$(function(){
	$("#delete").click(function(){
		var con = confirm("정말 탈퇴시키겠습니까?");
		if(con==true){
		$('form').attr({action:'delete_member', method:'post'}).submit();
		alert("탈퇴시켰습니다");
		}
		else if(con!=true){
			
			alert("취소되었습니다.")
		}
	});
	
	
});


</script>

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
					
						<a class="nav-link" href="go_admin.admin">관리자페이지로 이동</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>
<form action="admin_update" method="post" id="css">
		
		<div class="form-group">	
     			<label for=member_no>회원번호</label> 
      			<input type="hidden" name = "member_no" value="${members.member_no}"><br />
      			<input type="text" class="form-control" id="member_no"  value="${members.member_no}" disabled="disabled"/>
    	</div>
		<input type="hidden" name="id" id="id" value="${members.id}" /><br />
		아이디<input type="text" class="form-control" name="id" value="${members.id}" disabled="disabled"/><br />
		비밀번호<input type="text" class="form-control" name="password" value="${members.password}"/><br />
		
		성<input type="text" class="form-control" name="lastname" value="${members.lastname}"/><br />
		이름<input type="text" class="form-control" name="firstname" value="${members.firstname}"/><br />
		전화번호<input type="text" class="form-control" name="phone" value="${members.phone}"/><br />
		이메일<input type="text" class="form-control" name="email" value="${members.email}"/><br />
		질문<select name="question">
				
				<option value="가장 친한 친구의 이름은?">가장 친한 친구의 이름은?</option>
				<option value="초등학교 선생님의 이름은?">초등학교 선생님의 이름은?</option>
				<option value="당신의 별명은?">당신의 별명은?</option>
			</select><br /><br />
		답<input type="text" class="form-control" name="answer" value="${members.answer}"/><br />
		
		<input type="submit" class="btn btn-primary" value="수정">
	
	</form>
	<form method="post" action="delete_member" id="css">
	<input type="hidden" name = "id" id="id" value="${members.id}">
	<button type="button" class="btn btn-primary" id="delete" >회원 탈퇴</button>
	</form>

</body>
</html>