<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 정보 입력 화면 </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script> 
	<script type="text/javascript">
		
	</script>
</head>
<body>
		<h1>구매하실 강의를 선택해주세요</h1>

		<form method="post" action="payment_Process">
				<input type="hidden" name="member_no" value="${member.member_no}"><br />
		강의 번호 :<select name="select_Lecture_Pick" id="select_Lecture_Pick">
				 <c:forEach var="select_Lecture" items="${lecture_List_Serve}">
				 	<option value="${select_Lecture.lecture_no}">${select_Lecture.lecture_name}</option>
				 </c:forEach>
				 </select><br />
		구매자 ID : <input type="text" name="id" value="${member.id}" readonly><br />
		구매 일자: <input type="text" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
		예상 종료 일자 : <input type="text" name="period" id="period" value= "${one_Month_Later}" readonly/><br />
		가격: 	<select name="select_Price">
				<option value="75000" > 1개월</option>
				<option value="40500" > 6개월</option>
				</select><br />
				<input type="submit" value="구매 리스트에 추가하기">
				<input type="button" onclick="location.href='accept_Purchase'" value="결제 화면으로 이동하기">
		</form> 
				<input type="button" onclick="location.href='index.jsp'" value="메인 화면으로 이동하기">
		<h2>구매 선택하신 </h2>
		<table>
		<c:forEach var = "purchase_Basket" items="${purchase_Basket}">
			구매하신 강의명 :${purchase_Basket.lecture_name}
			가격 : ${purchase_Basket.price} 
			예상 만료 기간: ${purchase_Basket.period}<br />
		</c:forEach>
		</table>
		<form action="clear_Purchase_Basket">
			<input type="submit" value="장바구니 비우기">
		</form>
</body>
</html>