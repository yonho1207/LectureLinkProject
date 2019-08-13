<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강했던 강의 목록</title>
</head>
<body>

	<h3>반갑습니다 ${members_info.id}님</h3> 
	귀하께서는 현재까지 이하의 강의를 수강하셨습니다.
	<c:forEach var="selected_Period_List" items="${selected_Period_List}">
			<h4>수강중이신 강의명 : ${selected_Period_List.lecture_name}</h4>	
			가격 : ${selected_Period_List.price}<br />
			구매하신 일시 : ${selected_Period_List.payment_date}<br />
			예상 만료 기간: ${selected_Period_List.period}<hr />
		</c:forEach>
	<br />
	<h3>이상과 같은 강의를 수강하셨습니다 이용해주셔서 감사합니다</h3>
	<input type="button" onclick="location.href='/LectureLinkProject/goMain'" value="메인 화면으로 이동하기">
	<input type="button" onclick="location.href='/LectureLinkProject/go_my_page.do'" value="마이 페이지로 이동하기">
</body>
</html>