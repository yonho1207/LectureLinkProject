<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
관리자 멤버 상세
${members}
<form action="admin_update" method="post">
		<input type="text" class="form-control" name="member_no" value="${members.member_no}"/><br />
		<input type="hidden" name="id" value="${members.id}" /><br />
		<input type="text" class="form-control" name="id" value="${members.id}" disabled="disabled"/><br />
		<input type="text" class="form-control" name="password" value="${members.password}"/><br />
		
		<input type="text" class="form-control" name="lastname" value="${members.lastname}"/><br />
		<input type="text" class="form-control" name="firstname" value="${members.firstname}"/><br />
		<input type="text" class="form-control" name="phone" value="${members.phone}"/><br />
		<input type="text" class="form-control" name="email" value="${members.email}"/><br />
		<input type="text" class="form-control" name="question" value="${members.question}"/><br />
		<input type="text" class="form-control" name="answer" value="${members.answer}"/><br />
		
		<input type="submit" class="btn btn-primary" value="수정">
	
	</form>

</body>
</html>