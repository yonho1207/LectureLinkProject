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
멤버리스트
<table>
			<tr>
				<td>회원번호</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>성</td>
				<td>이름</td>
				<td>성별</td>
				<td>전화번호</td>
				<td>생일</td>
				<td>이메일</td>
				<td>질문</td>
				<td>답</td>
				
				<!-- <td>상세보기</td> -->
			</tr>
			<c:forEach var="member" items="${members}">
				<tr>
				<td>${member.member_no}</td>
				<td><a href="member_detail?id=${member.id}">${member.id}</td>
				<td>${member.password}</td>
				<td>${member.lastname}</td>
				<td>${member.firstname}</td>
				<td>${member.gender}</td>
				<td>${member.phone}</td>
				<td>${member.birth}</td>
				<td>${member.email}</td>
				<td>${member.question}</td>
				<td>${member.answer}</td>
				<%-- <td><a href="product_detail?id=${product.id}">상세보기</a></td> --%>
				</tr>
			</c:forEach>
			
			
		</table>
</body>
</html>