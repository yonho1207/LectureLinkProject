<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인터넷 강의 페이지 메인 화면</title>
</head>
<body>
<c:if test="${members_info!=null}">
	
	<form action="logout">
		<input type="submit" value="로그아웃"/>
	</form>
	</c:if>
<h1><a href="go_my_page">마이 페이지</a></h1>
<h1><a href="go_payment">결제화면</a></h1>
<h1><a href="go_login">로그인</a></h1>
<h1><a href="go_qna">Qna게시판</a></h1>
<h1><a href="go_account">회원가입</a></h1>
<h1><a href="go_cmt">댓글게시판</a></h1>
</body>
</html>