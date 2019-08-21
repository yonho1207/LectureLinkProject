	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>決済手段選択フォーム</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
						<li class="nav-item">
						
							<a class="nav-link" href="go_admin.admin">管理者ページへ</a>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">サポートセンター </a>
					</li>
				</ul>
			</nav>
		<br>
	

	<h1 style="position: relative; left: 400px">お買い上げになる講義は以下の通りです。</h1>
	<form method="get" action="payment_Confirm.do" style="position: relative; left: 400px">
		<c:if test="${!empty purchase_Basket}">
		<table>
			<c:forEach var = "purchase_Basket" items="${purchase_Basket}">
				お買い上げになった講義の名前：${purchase_Basket.lecture_name}
				値段： ${purchase_Basket.price} 
				満了日： ${purchase_Basket.period}<br />
			</c:forEach>
		</table>
	</c:if>
	<c:set var="total" value="0"/>
	<c:forEach var="price" items="${purchase_Basket}" varStatus="st" >
		
		<c:set var="total" value="${total+price.price}"/>
		
	</c:forEach>
		<h1>　総額：&#165 ${total}</h1> 
		
		<a href="account_Transfer.do" style="position: relative; left: 60px"><img src="img/payment/coins-stacks-and-banknotes.png">口座振替</a>
		<a href="credit_Card.do" style="position: relative; left: 60px"><img src="img/payment/credit-cards.png">クレジットカード</a> 
		<a href="cell_Phone_Bill.do" style="position: relative; left: 60px"><img src="img/payment/notification-with-dollar-sign.png">携帯電話</a>
		<a href="gift_Card_ETC.do" style="position: relative; left: 60px"><img src="img/payment/two-money-cards.png">ギフトカード</a><br />
		<a href="go_payment.do" style="position: relative; left: 60px"><img src="img/payment/shopping-cart.png">決済情報入力画面へ</a><br />
	</form> 
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>