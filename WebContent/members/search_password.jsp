<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form action="search_pwd" method="post">
	<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"/><br />
	<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요"/><br />
	질문<select name="question" id="question">
				<option value="가장 친한 친구의 이름은?">가장 친한 친구의 이름은?</option>
				<option value="초등학교 선생님의 이름은?">초등학교 선생님의 이름은?</option>
				<option value="당신의 별명은?">당신의 별명은?</option>
		</select><br />
	<input type="text" name="answer" id="answer" placeholder="질문에 대한 답을 입력해주세요"/><br />
	<input type="submit" value="제출"/><br />
	</form>
	${message}
</body>
</html>