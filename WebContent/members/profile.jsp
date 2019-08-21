<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>お客様の情報</title>
<script type="text/javascript">
$(function(){
	$("#delete").click(function(){
		var con = confirm("本当に退会なさいますか？");
		if(con==true){
		$('form').attr({action:'delete_member', method:'post'}).submit();
		alert("ご利用いただき誠にありがとうございました。")
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
					<c:if test="${admin!=null && members_info==null}">
						<li class="nav-item">
						
							<a class="nav-link" href="go_admin.admin">管理者ページへ</a>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">サポートセンター </a>
					</li>
				</ul>
			</nav>
		<br>
	

	
			<form method="post" action="delete_member" id="css">
			<h2>회원정보</h2>
				<div class="form-group">	
     			<label for=member_no>会員番号：</label> 
      			<input type="hidden" name = "member_no" value="${newmember.member_no}"><br />
      			<input type="text" class="form-control" id="member_no"  value="${newmember.member_no}" disabled="disabled"/>
    			</div>

    			<div class="form-group">	
     			<label for=id>ID：</label> 
      			<input type="hidden" name = "id" id="id" value="${newmember.id}"><br />
      			<input type="text" class="form-control" id="id"  value="${newmember.id}" disabled="disabled"/>
    			</div>
				
				<div class="form-group">	
     			<label for=password>パスワード：</label>       			
      			<input type="text" class="form-control" id="password"  value="${newmember.password}" disabled="disabled"/>
    			</div>
				<div class="form-group">	
     			<label for=lastname>苗字：</label>       			
      			<input type="text" class="form-control" id="lastname"  value="${newmember.lastname}" disabled="disabled"/>
    			</div>
    			<div class="form-group">	
     			<label for=firstname>名前：</label>       			
      			<input type="text" class="form-control" id="firstname"  value="${newmember.firstname}" disabled="disabled"/>
    			</div>
				<div class="form-group">	
     			<label for=gender>性別：</label>       			
      			<input type="text" class="form-control" id="gender"  value="${newmember.gender}" disabled="disabled"/>
    			</div>
				<div class="form-group">	
     			<label for=phone>連絡先：</label>       			
      			<input type="text" class="form-control" id="phone"  value="${newmember.phone}" disabled="disabled"/>
    			</div>
    			<div class="form-group">	
     			<label for=birth>お誕生日：</label>       			
      			<input type="text" class="form-control" id="birth"  value="${newmember.birth}" disabled="disabled"/>
    			</div>
    			<div class="form-group">	
     			<label for=email>メールアドレス：</label>       			
      			<input type="text" class="form-control" id="email"  value="${newmember.email}" disabled="disabled"/>
    			</div>
    			<div class="form-group">	
     			<label for=question>パスワード再設定質問</label>       			
      			<input type="text" class="form-control" id="question"  value="${newmember.question}" disabled="disabled"/>
    			</div>
    			<div class="form-group">	
     			<label for=answer>パスワード再設定答え</label>       			
      			<input type="text" class="form-control" id="answer"  value="${newmember.answer}" disabled="disabled"/>
    			</div>
				
			
			
			<button type="button" class="form-control" onclick="location.href='/LectureLinkProject/go_profile_update.do'" >修正する</button>
			<button type="button" class="form-control" id="delete" >退会する</button>
			
			</form>
			
</body>
</html>