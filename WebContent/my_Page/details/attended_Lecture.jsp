﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>受講なされた講義リスト</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	    <style type="text/css">
        #card{
            position: fixed;
              right: 0;
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
					<c:if test="${admin!=null}">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							管理者メニュー
						</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">会員情報管理フォーム</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">講義情報管理フォーム</a>						
						<a class="dropdown-item" href="go_Cutomer_Information.admin">会員情報分析</a>
						<a class="dropdown-item" href="go_Attend_Lecture.admin">受講者分析</a>
						<a class="dropdown-item" href="go_about_Pay.admin">決済情報通計</a>						
						</div>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">サポートセンター </a>
					</li>
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
		 
	

	
	<h3 style="position: relative; left: 200px">ようこそお越しくださいました ${members_info.id}様</h3> 
	<p style="position: relative; left: 200px">お客様は以下の講義を受講なされました。</p>
	<ul style="position: relative; left: 160px">
	<c:forEach var="selected_Period_List" items="${selected_Period_List}">
			<h4>受講済みの講義名： ${selected_Period_List.lecture_name}</h4>	
			値段： ${selected_Period_List.price}<br />
			お買い上げになった日時： ${selected_Period_List.payment_date}<br />
			満了日： ${selected_Period_List.period}<hr />
		</c:forEach>
	</ul>
	<br />
	<h3 style="position: relative; left: 80px">以上の講義を受講なされました、ご利用いただき誠にありがとうございました。</h3>
		<a href="goMain" style="position: relative; left: 700px"><img src="img/payment/home-location.png">メインページ</a>	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>