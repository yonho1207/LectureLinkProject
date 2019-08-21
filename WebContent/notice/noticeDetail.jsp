<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html><head>
<meta charset=utf-8>
<title>告知詳細フォーム</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<style type="text/css">	
	#list_btn{background-color:black; color: white; }
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

	<h1>告知詳細フォーム</h1>
	<br >
	<div class="container">
	
	<c:choose>
 	<c:when test="${admin == null && members_info!=null || members_info==null && admin == null}">
 	<div class="form-group">	
      <label for=notice_no>告知番号：</label>
      <input type="hidden" name = "notice_no" value="${notice.notice_no}"><br />
      <input type="text" class="form-control" id="notice_no"  value="${notice.notice_no}" disabled="disabled"/>
    </div>
    
    <div class="form-group">	
      <label for=notice_no>作成者：</label>
      <input type="hidden" name = "notice_date" value="${notice.notice_date}"><br />
      <input type="text" class="form-control" id="notice_date"  value="${notice.notice_date}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="notice_title">タイトル：</label>
      <input type="hidden" name = "notice_no" value="${notice.notice_title}">
      <input type="text" class="form-control" name = "notice_title" id="notice_title" value="${notice.notice_title}" disabled="disabled"/>
    </div>
    
 	<div class="form-group">
  		<label for="notice_con">?�용:</label>
  		<input type="hidden" name = "notice_no" value="${notice.notice_con}">
  		<textarea class="form-control" rows="5" name = "notice_con" id="notice_con" disabled="disabled">${notice.notice_con}</textarea>
	</div>
	</c:when>
	
	<c:otherwise>
 	<div class="form-group">	
      <label for=notice_no>告知番号：</label>
      <input type="hidden" name = "notice_no" value="${notice.notice_no}"><br />
      <input type="text" class="form-control" id="notice_no"  value="${notice.notice_no}" disabled="disabled"/>
    </div>
    
    <div class="form-group">	
      <label for=notice_no>作成者：</label>
      <input type="hidden" name = "notice_date" value="${notice.notice_date}"><br />
      <input type="text" class="form-control" id="notice_date"  value="${notice.notice_date}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="notice_title">タイトル：</label>
      <input type="text" class="form-control" name = "notice_title" id="notice_title" value="${notice.notice_title}" />
    </div>
    
 	<div class="form-group">
  		<label for="notice_con">内容：</label>
  		<textarea class="form-control" rows="5" name = "notice_con" id="notice_con">${notice.notice_con}</textarea>
	</div>

	<br >
	<div class="form-group">
	<a type="button"  class="btn btn-primary" href="notice_delete?notice_no=${notice.notice_no}">削除する</a>
	<a type="button"  class="btn btn-primary" href="notice_update">修正する</a>
	</div>
	</c:otherwise>
	</c:choose>
	</div>
	
	<div class="container">
		<button type="button" class="form-control" id="list_btn" onclick="location.href='/LectureLinkProject/go_notice'" >リストへ戻る</button>
	</div>	
	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>