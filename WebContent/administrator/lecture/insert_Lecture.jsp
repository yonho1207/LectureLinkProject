<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새로운 강의 넣기</title>
</head>
<body>
	<h2>새로 작성하고자 하는 강의의 정보를 입력해주세요</h2>
	<form method="post" action="insert_Lecture.do">
		강의명 : <input type="text" id="lecture_name" name="lecture_name"><br />
		강사명 : <input type="text" id="lecture_teacher" name="lecture_teacher"><br />
		1개월 기준 수강료 : <input type="text" id="price" name="price"><br />
		교재 가격 : <input type="text" id="text_price" name="text_price"><br />
		<input type="submit">
	</form>
</body>
</html>