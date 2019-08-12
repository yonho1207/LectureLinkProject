<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>강의 업데이트 화면</title>
</head>
<body>
	<h2>변경 하시고자 하는 강의의 정보를 수정해주세요</h2>
	<form method="post" action="update_Lecture.do">
		강의번호 : 	<input type="text" name="lecture_no" value="${lecture.lecture_no}" readonly><br />
		강의명 : <input type="text" id="lecture_name" name="lecture_name" value="${lecture.lecture_name}"><br />
		강사명 : <input type="text" id="lecture_teacher" name="lecture_teacher" value="${lecture.lecture_teacher}"><br />
		1개월 기준 수강료 : <input type="text" id="price" name="price" value="${lecture.price}"><br />
		교재 가격 : <input type="text" id="text_price" name="text_price" value="${lecture.text_price}"><br />
		<input type="submit" value="수정하기">
	</form><br />
	<input type="button" onclick="location.href='go_Main_in_Lectrue'" value="메인 화면으로 이동하기">
	<input type="button" onclick="location.href='go_Lecture_List.do'" value="강의 목록으로 이동하기">
</body>
</html>