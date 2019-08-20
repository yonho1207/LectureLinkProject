﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>form tag</title>
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
				lastname:"성은 필수 입력입니다.",
				firstname:"이름은 필수 입력입니다.",
				gender : "성별을 체크해주세요",
				question : "비밀번호 찾기를 위한 질문을 입력해주세요",
				answer : "비밀번호 찾기를 위한 질문의 답을 입력해주세요",
				birth:"생일을 입력해주세요",
				phone : {
					required:"전화번호를 입력해주세요"
					
				},
				id : {
					required:"아이디를 입력해주세요",
					minlength : "아이디는 최소 {0}글자 이상이어야 합니다"
				},
				password : {
					required : "비밀번호를 입력해주세요",
					minlength : "비밀번호는 최소 {0}글자 이상이어야 합니다",
					maxlength : "비밀번호는 최대 {0}글자 이하여야 합니다"
				},
				repassword : {
					required : "비밀번호를 다시 입력해주세요",
					equalTo : "비밀번호 확인이 잘못되었습니다"					
				},
				email :{
					required : "이메일을 입력해주세요",
					email : "이메일 형식에 맞지 않습니다"
				},
				
				
				agree : "약관동의에 체크해주세요"
			
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
					alert("아이디를 입력하세요");
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
	        alert("공백을 사용할 수 없습니다.\n\n공백은 자동으로 지워집니다.");
	        obj.focus();
	        obj.value = obj.value.replace(' ','');
	        return false;
	    }
	}
	
	$(function(){
		$("#signup").click(function(){
			alert(idck)
		if(idck==0 && idckv==document.getElementById("id").value){
			
			alert("중복된 아이디입니다.")
		}
		if(idck==0 && idckv!=document.getElementById("id").value){
			alert("중복체크는 필수입니다.");
			
		}
			
		if(idck==2 ){
			alert("중복체크는 필수입니다.");
			
		}
				
		if(idck==1 && idckv==document.getElementById("id").value){
			alert("회원가입을 환영합니다.다시 로그인 해주세요.");
			$('form').attr({action:'input_account', method:'post'}).submit();
		}
		else if(idck==1 && idckv!=document.getElementById("id").value){
			alert("새로 입력한 아이디 중복체크");
			
		}
		
		
		
			});
			
	});
	
	
</script> 
<script type="text/javascript">
$(document).ready(function() {
	
	$('input[type=radio]').each(function name() {

		if (gender == $(this).val()) {
			$(this).attr('checked', 'checked')

		}
	
});

</script>
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
						<a class="nav-link" href="go_Lecture_List">강의 목록보기 </a>
					</li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
				회원 정보 조회
			</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="go_Attending_Lecture.do">수강중인 강의 목록</a>
					<a class="dropdown-item" href="go_Attended_Lecture.do">수강했던 강의 목록</a>
					<a class="dropdown-item" href="#">회원 정보 조회 및 수정</a>
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
				<c:if test="${members_info!=null && members_info.id=='admin'}">
					<li class="nav-item">
						<a class="nav-link" href="go_admin">관리자페이지로 이동</a>
					</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>
	<div class="container">
	<h3>회원등록</h3>
		
		<form method="post" id="signupForm" action="input_account">
			id<input type="text"name="id" id="id" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"/>
			<input type="button" id="checkid" value="중복검사"/><span class="console"></span>	<br />
			password<input type="password" name="password" id="password"/><br />
			비밀번호 확인<input id="repassword" type="password" name="repassword"/><br />
			성<input type="text" name="lastname" /><br />
			이름<input type="text" name="firstname" /><br />
			성별<input type="radio" name="gender" value="남"/>남
				<input type="radio" name="gender" value="여"/>여<br />
			전화번호<input type="text" name="phone" /><br />
			생일<input type="date" name="birth"><br />
			이메일<input type="text" name="email" /><br />
			질문<select name="question">
				<option value="가장 친한 친구의 이름은?">가장 친한 친구의 이름은?</option>
				<option value="초등학교 선생님의 이름은?">초등학교 선생님의 이름은?</option>
				<option value="당신의 별명은?">당신의 별명은?</option>
				</select>
			<br />
			답<input type="text" name="answer" /><br />
			약관 동의합니다.<input id="agree" type="checkbox" name="agree"/><br />
			
			
			<input type="reset" value="원래대로"/>
			<input type="button" id="signup" value="가입하기"  />
		</form>
	</div>
</body>
</html>