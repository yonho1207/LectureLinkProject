<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta  charset="utf-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript">
	
	$(function(){
		var msg = '${message}';		
		if(!msg){			
		}
		else{
			alert(msg);			
		}		
	});
	
</script>
</head>
<body>
	<h2>로그인</h2>
	<form action="login" method="post">
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"/><br />
		<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요"/><br />
	
		<input type="submit" value="로그인"/><br />
		<a href="go_searchpwd">비밀번호 찾기</a>
	</form>${message}
	
	

</body>
</html>