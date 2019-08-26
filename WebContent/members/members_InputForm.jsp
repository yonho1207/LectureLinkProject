<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>会員登録フォーム</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://kit.fontawesome.com/3e23d516a6.js"></script>
<style type="text/css">
	#signupForm input.error,#signupForm textarea.error{
		border : 1px dashed red;
	}
	#signupForm{background-color:white; color: black; }
	
	#signupForm{
     
    margin:auto;
    padding:20px;
    width:500px;
    background-color:#EEEFF1;
    border-radius:5px;
     }
</style>

<script type="text/javascript">


	$(function(){
		$("#signupForm").validate({
			debug : false,
			rules:{
				id : {
					required : true,
					minlength : 4
					
				},
				password : {
					required : true,
					minlength : 4,
					maxlength : 8
				},
				repassword : {
					required : true,
					equalTo : "#password"					
				},
				lastname : "required",
				
				firstname : "required",
				
				gender : {
					required : true					
				},
				phone : {
					required : true
					
				},
				birth: {
					required : true
					
				},
				email :{
					required : true,
					email : true
				},
				question : "required",
				answer : "required",
				agree : "required"
			},
			messages:{
				lastname:"苗字の入力は必須です。",
				firstname:"名前の入力は必須です。",
				gender : "性別をチェックしてください。",
				question : "パスワード再設定質問の入力は必須です。",
				answer : "パスワード再設定答えの入力は必須です。",
				birth:"お誕生日の入力は必須です。",
				phone : {
					required:"連絡先の入力は必須です。"
					
				},
				id : {
					required:"IDを入力してください。",
					minlength : "IDは最小{0}字まで入力できます。"
				},
				password : {
					required : "パスワードを入力してください。",
					minlength : "パスワードは最小{0}字まで入力できます。",
					maxlength : "パスワードは最大{0}字まで入力できます。"
				},
				repassword : {
					required : "パスワードをもう一度入力してください。",
					equalTo : "パスワードが一致しません。"				
				},
				email :{
					required : "メールアドレスを入力してください。",
					email : "正しいメールアドレスを入力してください。"
				},
				
				
				agree : "´同義する´項目がチェックされていません。"
			
			}
			
			
			
		});
		
		
	});
	
	var idck=2;
	var idckv=0;
	var cnt=0;
	$(function(){
		$("#checkid").click(function(){
			
			
				var input_val=$("#id").val();
				//alert(input_val);
				if(!input_val){
					alert("IDを入力してください。");
					return false;
					
				}
				var url = "idcheck";
				
				$.get(url,{"id":input_val},function(xml){
					
					var result = $(xml).find("idcheck_result").text();
					cnt = $(xml).find("idcheck_cnt").text();
					$(".console").html(result);
					
					if(cnt>0){
						idck = 0;
						idckv = document.getElementById("id").value;
						return false;
						
						
					}else if(cnt==0){
						idck = 1;
						idckv = document.getElementById("id").value;
						return true;
						
						
					}
					
				});
		});
		
		
	});
	function noSpaceForm(obj) {
	    var str_space = /\s/;
	    if(str_space.exec(obj.value)) {
	        alert("空白が存在します、\n\n空白は自動的に削除されます。");
	        obj.focus();
	        obj.value = obj.value.replace(' ','');
	        return false;
	    }
	}
	
	$(function(){
		$("#signup").click(function(){
		if(idck==0 && idckv==document.getElementById("id").value){
			
			alert("同じIDが使用中です、")
		}
		if(idck==0 && idckv!=document.getElementById("id").value){
			alert("重なるIDがあるか確認してください。");
			
		}
			
		if(idck==2 ){
			alert("重なるIDがあるか確認してください。");
			
		}
				
		if(idck==1 && idckv==document.getElementById("id").value){
			
			$('form').attr({action:'input_account', method:'post'}).submit();
		}
		else if(idck==1 && idckv!=document.getElementById("id").value){
			alert("入力されたIDに変更がありました、もう一度重なるIDがあるか確認してください。");
			
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
	
		
		<form method="post" id="signupForm" action="input_account">
			<h2>会員登録</h2>
			ID：<input type="text"name="id" id="id" class="form-control" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
			<input type="button" id="checkid" value="IDチェック"/><span class="console"></span>	<br /><br />
			パスワード：<input type="password"  class="form-control" name="password" id="password"/><br />
			パスワードの再確認：<input id="repassword" class="form-control" type="password" name="repassword"/><br />
			苗字<input type="text" name="lastname" class="form-control"/><br />
			名前<input type="text" name="firstname" class="form-control"/><br />
			性別：<br />
				<input type="radio" name="gender" value="male"/>男
				<input type="radio" name="gender" value="female"/>女<br /><br />
			連絡先：<input type="text" name="phone" class="form-control"/><br />
			生年月日：<br />
				<input type="date" name="birth"><br /><br />
			メールアドレス：<input type="text" name="email" class="form-control"/><br />
			パスワード再設定質問　<select name="question">
				<option value="一番親しい友達の名前は？">一番親しい友達の名前は？</option>
				<option value="小学校の頃の先生の名前は？">小学校の頃の先生の名前は？</option>
				<option value="あなたのあだ名は？">あなたのあだ名は？</option>
				</select>
			<br /><br />
			パスワード再設定の答え：
			<input type="text" name="answer" class="form-control"/><br />
			同義する：<input id="agree" type="checkbox" name="agree"/><br />
			
			
			<input type="reset" value="リセット"/>
			<input type="button" id="signup" value="会員登録"  />
		</form>
	</div>
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>