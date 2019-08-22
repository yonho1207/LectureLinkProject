<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>以下の講義がサービス中でございます</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/x-jquery-tmpl" id="itemTemplate">
		<li id="lectureList">
			<img src="img/javaIcon.png" style="position: relative; right: 300px; top: 85px;">
			<input type='hidden' value ={{=lecture_no}}>
			<input type="hidden" value={{= lecture_no}}>
			<p style="font-size: x-large;">{{= lecture_name}}<br />
			{{= lecture_teacher}}<br />
			{{= description}}<br /></p>
			<p style="position: relative; left: 300px; bottom: 280px;"><button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/go_cmt_Fom?lecture_no={{= lecture_no}}&reqPage=1'" >講義詳細</button></p>
			<p style="position: relative; left: 300px; bottom: 260px;"><button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/go_Lecture_attend.do?lecture_no={{= lecture_no}}'" >講義ページへ</button></p>
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
				alert("リスト作成に問題が発生しました。")
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
				<option value=1>講義名での検索</option>
				<option value=2>講師名での検索</option>
			</select>
			<input type=text name="search_Word" id="search_Word">
			<input type="submit" value="検索">
		</form>
	</div>
	<%@ include file ="/companyLogo.jsp" %>
	
</body>
</html>