<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 수강중인 강의 목록</title>
</head>
<body>

	<h3>반갑습니다 ${members_info.id}님</h3> 
	귀하께서는 현재 이하의 강의를 수강중이십니다.
		<c:forEach var="attending_List" items="${attending_List}">
			<h4>수강중이신 강의명 : ${attending_List.lecture_name}</h4>			
			구매하신 일시 : ${attending_List.payment_date}<br />
			예상 만료 기간: ${attending_List.period}<hr />
		</c:forEach>
	<br />
	<input type="button" onclick="location.href='/LectureLinkProject/goMain'" value="메인 화면으로 이동하기">
	<input type="button" onclick="location.href='/LectureLinkProject/go_my_page.do'" value="마이 페이지로 이동하기">
</body>
</html>