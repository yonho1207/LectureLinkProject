<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
	<form action="login" method="post">
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"/><br />
		<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요"/><br />
		<input type="submit" value="로그인"/>
	</form>
	
	${message}

</body>
</html>