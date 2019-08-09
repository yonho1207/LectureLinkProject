<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form action="search_pwd" method="post">
	<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"/><br />
	<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요"/><br />
	질문<select name="question">
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