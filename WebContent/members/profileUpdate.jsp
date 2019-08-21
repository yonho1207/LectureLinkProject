<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	var gender = "${newmember.gender}";
	$('input[type=radio]').each(function name() {

		if (gender == $(this).val()) {
			$(this).attr('checked', 'checked')

		}
	});
	var question = "${newmember.question}"
		$('option').each(function() {

			if (question == $(this).val()) {
				$(this).attr('selected', 'selected')

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
	
<form method="post" action="profile_update" id="css">
			<h2>회원정보 수정</h2>
			<div class="form-group">	
     			<label for=id>아이디:</label> 
      			<input type="hidden" name = "id" value="${newmember.id}"><br />
      			<input type="text" class="form-control" name = "id" id="id"  value="${newmember.id}" disabled="disabled"/>
    		</div>
			<div class="form-group">	
     			<label for=lastname>성:</label>       			
      			<input type="text" class="form-control" name = "lastname" id="lastname"  value="${newmember.lastname}"/>
    		</div>
			<div class="form-group">	
     			<label for=firstname>이름:</label>       			
      			<input type="text" class="form-control" name="firstname" id="firstname"  value="${newmember.firstname}"/>
    		</div>			
			
				
			성별	<br />
			
				<input type="radio" name="gender" value="남" />남
				<input type="radio" name="gender" value="여" />여<br /><br />
			<div class="form-group">	
     			<label for=phone>핸드폰 번호:</label>       			
      			<input type="text" class="form-control" id="phone" name="phone"  value="${newmember.phone}" />
    		</div>
			생일<input type="date" name="birth" value="${newmember.birth}"/><br /><br />
			<div class="form-group">	
     			<label for=email>이메일:</label>       			
      			<input type="text" class="form-control" id="email" name="email" value="${newmember.email}" />
    		</div>
			질문<select name="question">
				<option value="가장 친한 친구의 이름은?">가장 친한 친구의 이름은?</option>
				<option value="초등학교 선생님의 이름은?">초등학교 선생님의 이름은?</option>
				<option value="당신의 별명은?">당신의 별명은?</option>
				</select>
			<br /><br />
			<div class="form-group">	
     			<label for=answer>답:</label>       			
      			<input type="text" class="form-control" id="answer" name="answer" value="${newmember.answer}" />
    		</div>
						
			<input type="reset" value="원래대로"/>
			<input type="submit" value="수정하기"  />
		</form>
</body>
</html>