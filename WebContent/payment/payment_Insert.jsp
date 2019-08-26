<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>決済情報入力フォーム</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">	
  <script type="text/javascript"> 
  </script>
  
  <style type="text/css">
  	#insert_Payment_Info{
  		position: relative;
  		left: 200px;
  		top: 55px;
  		margin : -20px;
  	}
  	#purchase_Basket{
  		position: relative;
  		top: -220px;
  		left: 200px;  	
  		margin : -20px;
  	}
  	#clear_Purchase_Basket{
  		position: relative;
  		left: 200px;  
  	
  	}
  	#payment_Date_Check{
  		position: relative;
        left: 900px;
        top : -10px;
        background-color: #e6ffe6;
        height: 200px;
	 	width: 15%;	
  	}
  
  </style>
  
</head>
<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<a class="navbar-brand" href="goMain">Logo</a>
				<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="go_qna">お問い合わせフォーム</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_notice">告知フォーム</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_payment.do">決済フォーム </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_Lecture_List?reqPage=1">講義リストへ </a>
						</li>
					<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					マイページ
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="go_Attending_Lecture.do">受講中の講義リストへ</a>
						<a class="dropdown-item" href="go_Attended_Lecture.do">受講済みの講義リスト</a>
						<a class="dropdown-item" href="go_Member_Profile.do">お客様の情報閲覧・修正</a>
					</div>
				
					<c:choose>
					<c:when  test="${members_info==null && admin==null}">
						<li class="nav-item">
							<a class="nav-link" href="go_login">ログイン</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_account">会員登録</a>
						</li>
					</c:when>
					<c:when test="${members_info!=null || admin!=null}">
						<li class="nav-item">
							<a class="nav-link" href="logout">ログアウト</a>
						</li>
					</c:when>
					</c:choose>
					<c:if test="${admin!=null && members_info==null}">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
							管理者メニュー
						</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">会員情報管理フォーム</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">講義情報管理フォーム</a>						
						</div>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">サポートセンター </a>
					</li>
				</ul>
			</nav>
		<br>
	

		

		<form method="get" action="payment_Process.do" id="insert_Payment_Info">
		<h1>お買い上げになる講義を選択してください。</h1>
		講義：<select name="select_Lecture_Pick" class="w3-select" id="select_Lecture_Pick" style="size: landscape;">
				 <c:forEach var="select_Lecture" items="${lecture_List_Serve}">
				 	<option value="${select_Lecture.lecture_no}">${select_Lecture.lecture_name} / 教科書の値段： ${select_Lecture.book_price}</option>
				 </c:forEach>
				 </select><br />
		お客様のID：<input type="text" class="w3-input" name="id" value="${members_info.id}" readonly><br />			
		お買い上げになる日時：<input type="text"  class="w3-input" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
		期間設定：<input type="number"  name="select_Price" id="select_Price" min="1" max="12" value="1">ヶ月<br /> 
				<h2>必ず期間の確認をお願い申し上げます。</h2><br /> 
				<span style="background-color: #e6ffe6;"><input type="checkbox" name="buy_Book" value="1">教科書もお買い上げになりますか？<br /></span>
				<img src="img/payment/add-to-cart.png"><input type="submit" value="カートに入れる" style="background-color:transparent;  border:0px transparent solid;">
				<a href="accept_Purchase.do" style="position: relative; left: 200px"><img src="img/payment/cash-register.png">決済手段選択フォームへ</a>	
		</form> 
				
	
		<form action="payment_Date_Check" id="payment_Date_Check" method="post"> 
			お買い上げになる日時：<input type="text" name ="payment_date" id="payment_date"  value= "${payment_date}" readonly/><br />
			期間設定：<input type="number" name="choose_Month" id="choose_Month" value="1" min="1" max="12">ヶ月<br />　
			予想される満了日： <input type="text" name="period" id="period" value="${next_Month}" readonly/><br />
						<img src="img/payment/icons8-calculator-100.png">
						<button onclick="check_Period_Button" id="check_Period_Button" style="background-color:transparent;  border:0px transparent solid;">計算する</button><br />
		</form>
		
		<table id="purchase_Basket">		
		<c:forEach var = "purchase_Basket" items="${purchase_Basket}" varStatus="status"> 
			<p style="font-size: large; position: relative; left: 200px">
			お買い上げになった講義の名前：${purchase_Basket.lecture_name}
			値段： &#165 ${purchase_Basket.price}</p>
			<p style="font-size: x-large; position: relative; left: 200px">予想される満了日： ${purchase_Basket.period}</p><br />
		</c:forEach>
		</table><br />
		<a href="clear_Purchase_Basket.do" style="position: relative; left: 200px"><img src="img/payment/clearBasket.png">カートを空ける</a>
		<a href="goMain" style="position: relative; left: 200px"><img src="img/payment/home-location.png">メインページへ</a>	
	
		<%@ include file ="/companyLogo.jsp" %>
		
</body>
</html>