<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록된 강의 목록</title>
</head>
<body>
	<table>
		<tr>
			<th>강의 번호</th>
			<th>강의명</th>
			<th>강사</th>
			<th>수강료</th>
			<th>교재비</th>
		</tr>
		<tbody>
		<c:forEach var="lecture_List" items="${lecture_List}">
			<tr>
				<td><a href="go_Lecture_Update.do?lecture_no=${lecture_List.lecture_no}">${lecture_List.lecture_no}</a></td>
				<td>${lecture_List.lecture_name}</td>
				<td>${lecture_List.lecture_teacher}</td>
				<td>${lecture_List.price}</td>
				<td>${lecture_List.text_price}</td>
				<input type="button" onclick="location.href='go_Main_in_Lectrue'" value="삭제하기">
			</tr>
		</c:forEach>
		</tbody>
	</table><br />
	<input type="button" onclick="location.href='go_Main_in_Lectrue'" value="메인 화면으로 이동하기">
</body>
</html>