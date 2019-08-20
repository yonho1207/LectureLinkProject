<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
</head>
<body>
<form method="post" action="profile_update">
			<input type="hidden" name="id" id="id" value="${members_info.id}" /><br />
			id<input type="text" name="id" id="id" value="${members_info.id}" disabled="disabled"/>
			<br />
			성<input type="text" name="lastname" value="${members_info.lastname}"/><br />
			이름<input type="text" name="firstname" value="${members_info.firstname}"/><br />			
			
				
			성별	<input type="radio" name="gender" value="남" />남
				<input type="radio" name="gender" value="여" />여<br />
			전화번호<input type="text" name="phone" value="${members_info.phone}"/><br />
			생일<input type="text" name="birth" value="${members_info.birth}"/><br />
			이메일<input type="text" name="email" value="${members_info.email}"/><br />
			질문<select name="question">
				<option value="가장 친한 친구의 이름은?">가장 친한 친구의 이름은?</option>
				<option value="초등학교 선생님의 이름은?">초등학교 선생님의 이름은?</option>
				<option value="당신의 별명은?">당신의 별명은?</option>
				</select>
			<br />
			답<input type="text" name="answer" value="${members_info.answer}"/><br />
						
			<input type="reset" value="원래대로"/>
			<input type="submit" value="수정하기"  />
		</form>
</body>
</html>