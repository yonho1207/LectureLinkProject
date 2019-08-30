﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>会員情報詳細</title>
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
		var con = confirm("本当に退会させますか？");
		if(con==true){
		$('form').attr({action:'delete_member', method:'post'}).submit();
		alert("退会処理が行われました。");
		}
		else if(con!=true){
			
			alert("キャンセルされました。")
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
	
		
<form action="admin_update" method="post" id="css">
		
		<div class="form-group">	
     			<label for=member_no>会員番号</label> 
      			<input type="hidden" name = "member_no" value="${members.member_no}"><br />
      			<input type="text" class="form-control" id="member_no"  value="${members.member_no}" disabled="disabled"/>
    	</div>
		<input type="hidden" name="id" id="id" value="${members.id}" /><br />
		ID：<input type="text" class="form-control" name="id" value="${members.id}" disabled="disabled"/><br />
		パスワード：<input type="text" class="form-control" name="password" value="${members.password}"/><br />
		
		苗字：<input type="text" class="form-control" name="lastname" value="${members.lastname}"/><br />
		名前：<input type="text" class="form-control" name="firstname" value="${members.firstname}"/><br />
		連絡先：<input type="text" class="form-control" name="phone" value="${members.phone}"/><br />
		メールアドレス：<input type="text" class="form-control" name="email" value="${members.email}"/><br />
		パスワード再設定質問　　<select name="question">
				
				<option value="一番親しい友達の名前は？">一番親しい友達の名前は？</option>
				<option value="小学校の頃の先生の名前は？">小学校の頃の先生の名前は？</option>
				<option value="あなたのあだ名は？">あなたのあだ名は？</option>
			</select><br /><br />
		パスワード再設定の答え　<input type="text" class="form-control" name="answer" value="${members.answer}"/><br />
		
		<input type="submit" class="btn btn-primary" value="修正">
	
	</form>
	<form method="post" action="delete_member" id="css">
	<input type="hidden" name = "id" id="id" value="${members.id}">
	<button type="button" class="btn btn-primary" id="delete" >退会</button>
	</form>

</body>
</html>