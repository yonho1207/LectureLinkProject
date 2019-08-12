<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>form</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js">
	
</script>
<style type="text/css">
	#signupForm input.error,#signupForm textarea.error{
		border : 1px dashed red;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#newpwdForm").validate({
			
			debug : false,
			rules:{
				
				password : {
					required : true,
					minlength : 4,
					maxlength : 8
				},
				repassword : {
					required : true,
					equalTo : "#password"					
				}
			},
			messages:{
				
				password : {
					required : "비밀번호를 입력해주세요",
					minlength : "비밀번호는 최소 {0}글자 이상이어야 합니다",
					maxlength : "비밀번호는 최대 {0}글자 이하여야 합니다"
				},
				repassword : {
					required : "비밀번호를 다시 입력해주세요",
					equalTo : "비밀번호 확인이 잘못되었습니다"					
				}
			}
			
			
		});
		
		
	});
	
	
	</script>

</head>
<body>
새 비밀번호<br />
${pwd_info}
<form method="post" id="newpwdForm" action="pwd_update">
<input type="hidden" name="member_no" id="member_no" value="${pwd_info.member_no}" />
<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요"/><br />
<input id="repassword" type="password" name="repassword" placeholder="비밀번호를 한번 더 입력해주세요"/><br />
<input type="submit" value="변경하기"/>
</form>

</body>
</html>