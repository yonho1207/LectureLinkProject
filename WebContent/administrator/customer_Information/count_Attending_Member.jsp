<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


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
		
		<h1>受講者数をカウントします。</h1>
			<form action="get_cnt_Attending_Member" method="post">				
				<select name="select_Lecture_Pick">
					<c:forEach var="select_Lecture" items="${lecture_List_Serve}">
				 		<option value="${select_Lecture.lecture_no}">${select_Lecture.lecture_name}</option>
				 	</c:forEach>
				</select><br />
				<div class="container" > 
					<p>受講者数</p>
		 			<div class="progress" id="progress" style="font-size: large; height: 40px"> 
						<div class="progress-bar" style="width: ${attending_CNT}%">
						${attending_CNT}</div>
					</div>				
		   		</div>
		   		<br />
		   		<div class="container" > 
		   			<p>年齢別の受講者</p>
					<c:forEach var="ageGroup" items="${ageGroup}">
			  			<div class="progress" id="progress" style="font-size: large; height: 40px"> 
							${ageGroup.ageGroup}代: 
							<div class="progress-bar" style="width:${ageGroup.ageGroupCount}%">
							${ageGroup.ageGroupCount}</div>
						</div>
					</c:forEach>
				</div>
			   	<button onclick="check_Period_Button">計算する</button><br />
			</form>
</body>
</html>