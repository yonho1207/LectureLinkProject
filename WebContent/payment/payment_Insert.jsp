<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 정보 입력 화면 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script> 

</head>
<body>


	
		강의 번호 : <input type="text" readonly><br />
		강의 제목 : <input type="text" readonly><br />
		구매자 ID : <input type="text" readonly><br />
		구매 일자: <input type="date" id="expDate" readonly/><br />
		가격: 	<select name="select_Price">
				<option value="1month" > 1개월</option>
				<option value="6month" > 6개월</option>
				</select><br />
				<input type="submit" value="확인 화면으로 이동하기">

	<script>
	document.getElementById('expDate').value = new Date().toISOString().substring(0, 10);
	</script>

</body>
</html>