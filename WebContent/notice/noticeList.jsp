<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8>
<title>告知フォーム</title>
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
							<a class="nav-link" href="go_qna">お問い合わせフォーム</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_notice">告知フォーム</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_payment.do">決済フォーム </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_Lecture_List?reqPage=1">講義リストへ </a>
						</li>
					<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					マイページ
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="go_Attending_Lecture.do">受講中の講義リストへ</a>
						<a class="dropdown-item" href="go_Attended_Lecture.do">受講済みの講義リスト</a>
						<a class="dropdown-item" href="go_Member_Profile.do">お客様の情報閲覧・修正</a>
					</div>
				
					<c:choose>
					<c:when  test="${members_info==null && admin==null}">
						<li class="nav-item">
							<a class="nav-link" href="go_login">ログイン</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_account">会員登録</a>
						</li>
					</c:when>
					<c:when test="${members_info!=null || admin!=null}">
						<li class="nav-item">
							<a class="nav-link" href="logout">ログアウト</a>
						</li>
					</c:when>
					</c:choose>
					<c:if test="${admin!=null && members_info==null}">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							管理者メニュー
						</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">会員情報管理フォーム</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">講義情報管理フォーム</a>						
						</div>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">サポートセンター </a>
					</li>
				</ul>
			</nav>



<h1>告知フォーム</h1>

		<div class="container">
			<c:choose>
			<c:when test="${members_info!=null}">		
			  <div class="card" id="card" style="width:250px">
				    <img class="card-img-top" src="img/java_logo_img.jpg" alt="Card image" style="width:100%">
				    <div class="card-body">
				      <h4 class="card-title">${members_info.id}</h4>
				      <p class="card-text">ようこそお越しくださいました ${members_info.id}様</p>
				      <a href="go_Attending_Lecture.do" class="btn btn-primary">受講中の講義リスト</a>
				      <form action="jump_To_Clicked_Lecture" method="post">			      	
				      	<select class="ui search selection dropdown" name= "search-select" id="search-select" size=3>
							<c:forEach var="attending_List" items="${attending_List}">
								<option value="${attending_List.lecture_no}"> ${attending_List.lecture_name}</option>
							</c:forEach>   	
							<input type="submit" value="移動する"> 
				      	</select>			     
				      </form>
				    </div>
				 </div>
				  <br>
		 	 </c:when>
		 	 <c:when test="${members_info==null}">
		 	 	 <div class="card" id="card" style="width:250px">
		 	 		<div class="card-body">
				      <h4 class="card-title">ようこそお越しくださいました。</h4>
				      <p class="card-text">ご利用になされるためには <a href="go_login">ログイン</a><br /> または <br /> 
				      		<a href="go_account">会員登録</a>をお済ませください。</p>
				    </div>
				  </div>
		 	 </c:when>
			</c:choose>
		 </div>

	<div class="container">
	<table class="table">
		<tr>	
			<td>タイトル</td>
			<td>日時</td>
		<tr>	
			<c:forEach var="notice" items="${noticeList}">
				<tr>
					<td><a href="notice_detail?notice_no=${notice.notice_no}">${notice.notice_title}</a></td>
					<td>${notice.notice_date}</td>
				</tr>
			</c:forEach>

			</table>	
		</div>	
	
		<c:if test="${admin != null}">
		<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/notice_inputform'" style="position: relative; left: 300px">書き込む</button>
		</c:if>
		
		<!-- 페이지 처리부분 -->
		<div class="container">
		<ul class="pagination" style="position: relative; left: 450px">
			<c:if test="${pageGroupResult.beforePage}">
				 <li class="page-item"><a class="page-link" href="notice_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">Previous</a></li>
			</c:if>
				
			<c:forEach var ="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>
				
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
						 <li class="page-item active"><span id="sel"><a class="page-link" href="notice_req_list?reqPage=${index}">${index}</a></span></li>
					</c:when>
					
					<c:otherwise>
						 <li class="page-item"><a class="page-link" href="notice_req_list?reqPage=${index}">${index}</a></li>
					</c:otherwise>
					
				</c:choose>	
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage}">
				<li class="page-item"><a class="page-link" href="notice_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">next</a></li>
			</c:if>
		</ul>
	</div>	
			<%@ include file ="/companyLogo.jsp" %>
</body>
</html>