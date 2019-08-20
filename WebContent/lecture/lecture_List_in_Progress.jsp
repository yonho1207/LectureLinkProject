�?<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<img src="img/javaIcon.png" style="position: relative; right: 300px; top: 85px;">
			<p style="font-size: x-large;">{{= lecture_name}}<br />
			{{= lecture_teacher}}<br />
			{{= description}}<br /></p>
			<p style="position: relative; left: 300px; bottom: 120px;"><button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/cmt_Fom1?reqPage=1'" >?�세 ?�이지</button></p>
			<p style="position: relative; left: 300px; bottom: 100px;"><button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/go_Lecture_attend.do?lecture_no={{= lecture_no}}'" >강의�? 가�?</button></p>
		</li>
	</script>
	
	<script type="text/javascript">
		$(function(){
			function addNewItem(lecture_no, lecture_name, lecture_teacher, price, text_price, description){
				var li_data = {
						"lecture_no": lecture_no,
						"lecture_name": lecture_name,
						"lecture_teacher": lecture_teacher,
						"price": price,
						"text_price" : text_price,
						"description": description
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
					var description = $(this).find("description").text();
					addNewItem(lecture_no, lecture_name, lecture_teacher, price, text_price, description);
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
				width: 80%;
		}
		
		#lecture_list{
		
			
		}
	</style>
	
	

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="goMain">Logo</a>
			<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="go_qna">문의 게시??</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_notice">공�??�항 게시??</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_payment.do">결제 ?�면?�로 </a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_Lecture_List?reqPage=1">강의 목록보기 </a>
					</li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				?�원 ?�보 조회
			</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="go_Attending_Lecture.do">?�강중인 강의 목록</a>
					<a class="dropdown-item" href="go_Attended_Lecture.do">?�강?�던 강의 목록</a>
					<a class="dropdown-item" href="#">?�원 ?�보 조회 �? ?�정</a>
				</div>
			
				<c:choose>
				<c:when  test="${members_info==null && admin==null}">
					<li class="nav-item">
						<a class="nav-link" href="go_login">로그??</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="go_account">?�원가??</a>
					</li>
				</c:when>
				<c:when test="${members_info!=null || admin!=null}">
					<li class="nav-item">
						<a class="nav-link" href="logout">로그?�웃</a>
					</li>
				</c:when>
				</c:choose>
				<c:if test="${admin!=null && members_info==null}">
					<li class="nav-item">
					
						<a class="nav-link" href="go_admin.admin">관리자?�이지�? ?�동</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 ?�터 </a>
					</li>				
			</ul>
		</nav>
	<br>
		
	<ul id="lecture_list" style="position: relative; left: 200px" >
	
	</ul>
	<div class="container">
		<ul class="pagination" style="position: relative; left: 550px">
		<c:if test="${pageGroupResult.beforePage}">
			 <li class="page-item"><a  class="page-link" href="go_Lecture_List?reqPage=${pageGroupResult.groupStartNumber-1}" class="previous">&#60;&#60;Previous</a></li>
		</c:if>
		<c:forEach var="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
			<c:choose>
				<c:when test="${pageGroupResult.selectPageNumber==index}">
					 <li class="page-item active"><span id="select"><a  class="page-link" href="go_Lecture_List?reqPage=${index}">${index}</a></span></li>
				</c:when>	
				<c:otherwise>
					 <li class="page-item"><a class="page-link" href="go_Lecture_List?reqPage=${index}">${index}</a></li>					
				</c:otherwise>
			</c:choose>
			
			
		</c:forEach>
		<c:if test="${pageGroupResult.afterPage}">
			<a href="go_Lecture_List?reqPage=${pageGroupResult.groupEndNumber+1}" class="previous"> next&#62;&#62;</a>
		</c:if>
		</ul>
	</div>
	<div class="container">
		<form action="search_Lecture" style="position: relative; left: 450px" >
			<select name="search_Option">
				<option value=1>강의명으�? 찾기</option>
				<option value=2>강사명으�? 찾기</option>
			</select>
			<input type=text name="search_Word" id="search_Word">
			<input type="submit" value="검??">
		</form>
	</div>
	<%@ include file ="/companyLogo.jsp" %>
	
</body>
</html>