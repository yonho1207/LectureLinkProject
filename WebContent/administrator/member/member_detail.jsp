<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<form action="admin_update" method="post">
		
		회원번호<input type="text" class="form-control" name="member_no" value="${members.member_no}" disabled="disabled"/><br />
		<input type="hidden" name="id" id="id" value="${members.id}" /><br />
		아이디<input type="text" class="form-control" name="id" value="${members.id}" disabled="disabled"/><br />
		비밀번호<input type="text" class="form-control" name="password" value="${members.password}"/><br />
		
		성<input type="text" class="form-control" name="lastname" value="${members.lastname}"/><br />
		이름<input type="text" class="form-control" name="firstname" value="${members.firstname}"/><br />
		전화번호<input type="text" class="form-control" name="phone" value="${members.phone}"/><br />
		이메일<input type="text" class="form-control" name="email" value="${members.email}"/><br />
		질문<input type="text" class="form-control" name="question" value="${members.question}"/><br />
		답<input type="text" class="form-control" name="answer" value="${members.answer}"/><br />
		
		<input type="submit" class="btn btn-primary" value="수정">
	
	</form>

</body>
</html>