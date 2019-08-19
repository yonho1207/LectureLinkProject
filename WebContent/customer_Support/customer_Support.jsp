<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3e23d516a6.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style type="text/css">
  	#map{
  	 position: relative;
  	 left: 350px;
  	}
  	#customer_Support_Text{
  	  position: relative;
  	  left: 350px;
  	  height: 180px;
	  width: 55%;
	  background-color: #FFEFD5;
  	}
  	
  	#phone{
  		position: absolute;
  		top: 43px;
  		left: 15px;
  		height: 115px;
	  	width: 35%;
  		background-color: #FFFAFA;
  	}
  	
  	#businessHours{
  		position: absolute;
  		top: 43px;
  		right: 250px;
  		height: 115px;
	  	width: 33%;
  		background-color: #FFFAFA;		
  	}
  	
  	#contactMail{
  		position: absolute;
  		top: 43px;
  		right: 4px;
  		height: 115px;
	  	width: 28%;
  		background-color: #FFFAFA;		
  	}
  
  </style>
</head>
<body>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<a class="navbar-brand" href="goMain">Logo</a>
				<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="go_qna">문의 게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_notice">공지사항 게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_payment.do">결제 화면으로 </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_Lecture_List?reqPage=1">강의 목록보기 </a>
						</li>
					<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
					회원 정보 조회
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="go_Attending_Lecture.do">수강중인 강의 목록</a>
						<a class="dropdown-item" href="go_Attended_Lecture.do">수강했던 강의 목록</a>
						<a class="dropdown-item" href="#">회원 정보 조회 및 수정</a>
					</div>
				
					<c:choose>
					<c:when  test="${members_info==null && admin==null}">
						<li class="nav-item">
							<a class="nav-link" href="go_login">로그인</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="go_account">회원가입</a>
						</li>
					</c:when>
					<c:when test="${members_info!=null || admin!=null}">
						<li class="nav-item">
							<a class="nav-link" href="logout">로그아웃</a>
						</li>
					</c:when>
					</c:choose>
					<c:if test="${admin!=null && members_info==null}">
						<li class="nav-item">
						
							<a class="nav-link" href="go_admin.admin">관리자페이지로 이동</a>
						</li>
					</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>
				</ul>
			</nav>
		<br>
		
		<h1 align="center">항상 노력하는 xxx가 되겠습니다</h1>
		<h3 align="center">찾아오시는 길</h3>
		<div id="map" style="width:800px; height:300px" ></div>

		<script type="text/javascript" charset="utf-8" src="https://map.yahooapis.jp/js/V1/jsapi?appid=dj00aiZpPXU0YkRSdjNPeG0wRCZzPWNvbnN1bWVyc2VjcmV0Jng9ZTI-"></script>
			<script type="text/javascript">
			window.onload = function(){
			   var ymap = new Y.Map("map", {configure : {
			       doubleClickZoom : true,
			       scrollWheelZoom : true,
			       dragging : true,
			       enableOpenStreetMap: true
			   }});
			   var homeMarker = new Y.HomeControl();
			   var ScaleControl = new Y.ScaleControl();
			   var SliderZoomControlVertical = new Y.SliderZoomControlVertical();
			   ymap.addControl(homeMarker);
			   ymap.addControl(ScaleControl);
			   ymap.addControl(SliderZoomControlVertical); 
			   ymap.drawMap(new Y.LatLng(35.6823946,139.773155), 18, Y.LayerSetId.NORMAL);
			   
			}			 
			</script>
		
		<div id="customer_Support_Text" align="center">
			<p style="font-size:x-large;">고객님과 함께하는 서비스를 지향합니다</p>
			<div id="phone" align="center">
				<p style="font-size:xx-large;">전화 번호 : <br />
				123-4567</p> 
			</div>
			<div id="businessHours" align="center">
				<p style="font-size:xx-large;">
					주말,공휴일 제외<br />
					09:00 ~ 18:00</p>
			</div>
			<div id="contactMail" align="center">
				<p style="font-size: 20px">메일 주소: aa@aa.aa.com<br />
					라인 상담 : ID:GLB_Customer_Support<br />
					상담 시간 : 09:00~18:00</p>
			</div>
			
		</div>
		<%@ include file ="/companyLogo.jsp" %>
</body>
</html>