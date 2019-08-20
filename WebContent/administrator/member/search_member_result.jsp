<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${!empty search_result}">
	<table>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>설명</td>
				<td>가격</td>
				<!-- <td>상세보기</td> -->
			</tr>
			<c:forEach var="memberList" items="${search_result}">
			<tr>
				<td>${memberList.id}</td>
				<td>${memberList.lastname}</td>
				<td>${memberList.email}</td>
				<td>${memberList.gender}</td>
				
		</tr>
			
			
			</c:forEach>
	
	</table>
	</c:if>

</body>
</html>