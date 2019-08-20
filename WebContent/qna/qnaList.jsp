<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8>
<title>Q&A게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  .pagination{
    position:absolute;
    top:0; left:0; bottom:0; right:0;
    height:10%; 
    margin:10% auto;
    }
  </style>
  
  <style type="text/css">
        #card{
            position: fixed;
              right: 0;
        }
        
        #search-select{
         width:85%;
         overflow: scroll;
         overflow-x:auto;
         overflow-y:auto;
         }
        
         #notice_Table{
         	width:75%;
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
	
<h3>Q&A게시판</h3>
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
				      	<select class="ui search selection dropdown" name= "search-select" id="search-select" size=3>
							<c:forEach var="attending_List" items="${attending_List}">
								<option value="${attending_List.lecture_no}"> ${attending_List.lecture_name}</option>
							</c:forEach>   	
							<input type="submit" value="바로가기"> 
				      	</select>			     
				      </form>
				    </div>
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

	<div class="container">
	<table class="table">
		<tr>	
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일시</td>
	
		<tr>	
			
			<c:forEach var="qna" items="${qnaList}">
				<tr>
					<td><a href="qna_detail?qna_no=${qna.qna_no}">${qna.qna_title}</a></td>
					<td>${qna.id}</td>
					<td>${qna.visited}</td>
					<td>${qna.qna_date}</td>
				</tr>
			</c:forEach>

			</table>	
		</div>	
		
	<table class="table">
		<c:if test="${members_info != null}">
			<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/qna_inputform'" style="position: relative; left: 300px">글쓰기</button>		
		</c:if>
	</table>
	
	<!-- 페이지 처리부분 -->
	<div class="container">
		<ul class="pagination" style="position: relative; left: 450px">
			<c:if test="${pageGroupResult.beforePage}">
				 <li class="page-item"><a class="page-link" href="qna_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">Previous</a></li>
			</c:if>
				
			<c:forEach var ="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>
				
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
						 <li class="page-item active"><span id="sel"><a class="page-link" href="qna_req_list?reqPage=${index}">${index}</a></span></li>
					</c:when>
					
					<c:otherwise>
						 <li class="page-item"><a class="page-link" href="qna_req_list?reqPage=${index}">${index}</a></li>
					</c:otherwise>
					
				</c:choose>	
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage}">
				<li class="page-item"><a class="page-link" href="qna_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">next</a></li>
			</c:if>
		</ul>	
	</div>	
			<%@ include file ="/companyLogo.jsp" %>
</body>
</html>