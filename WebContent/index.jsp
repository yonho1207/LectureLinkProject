<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
	<c:if test="${members_info==null}">
	<h1><a href="go_login">로그인</a></h1>
	
	</c:if>
	<c:if test="${members_info!=null && members_info.id=='admin'}">
	<h1><a href="go_admin">관리자페이지로 이동</a></h1>
	</c:if>
<h1><a href="go_my_page.do">마이 페이지</a></h1>
<h1><a href="go_payment.do">결제화면</a></h1>

<h1><a href="go_qna">Qna게시판</a></h1>
<h1><a href="go_account">회원가입</a></h1>
<h1><a href="go_cmt">댓글게시판</a></h1>
</body>
</html>