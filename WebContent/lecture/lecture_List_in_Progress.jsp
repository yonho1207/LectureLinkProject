<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page isELIgnored = "true"  %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/x-jquery-tmpl" id="itemTemplate">
		<li id="lectureList">
			<p style="font-size: x-large;"><a href="go_Lecture_attend.do?lecture_no=${lecture_no}">${lecture_name}</a></p> 
			<p style="font-size: large;">${lecture_teacher}</p>
		</li>
	</script>
	
	<script type="text/javascript">
		$(function(){
			function addNewItem(lecture_no, lecture_name, lecture_teacher, price, text_price){
				var li_data = {
						"lecture_no": lecture_no,
						"lecture_name": lecture_name,
						"lecture_teacher": lecture_teacher,
						"price": price,
						"text_price" : text_price
				};
				var new_li = $("#itemTemplate").tmpl(li_data);
				$("#lecture_list").append(new_li);
				
			}
			$.get("lecture_Tmpl",{},function(data){
				$(data).find("item").each(function(){
					var lecture_no = $(this).find("lecture_no").text();
					var lecture_name = $(this).find("lecture_name").text();
					var lecture_teacher = $(this).find("lecture_teacher").text();
					var price = $(this).find("price").text();
					var text_price = $(this).find("text_price").text();
					addNewItem(lecture_no, lecture_name, lecture_teacher, price, text_price);
				});
			}).fail(function(){
				alert("CALL FAILED")
			});
		});
	</script>
	<style type="text/css">
		#lectureList{
				border-style: solid;
				border-width: 1px;
				text-align: center;
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
		
	<ul id="lecture_list">
	
	</ul>

	<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/cmt_Fom1'" >댓글</button>
	
</body>
</html>