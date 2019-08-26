<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>customer_Information</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


</head>
<body>
  
 	<h1>性別</h1>
 	<p>単位：％</p>
		<div class="container" > 
		  <div class="progress" id="progress" style="font-size: large; height: 40px"> 
				여: <div class="progress-bar" style="width:${female_Rating}%">${female_Rating}</div>
		   </div>
		   <div class="progress" style="font-size: large; height: 40px">
				남: <div class="progress-bar bg-success" style="width:${male_Rating}%">${male_Rating}</div>
		   </div>
	  	</div>
	<h1>年代</h1>
	<p>単位：名</p>
		<div class="container" > 
			<c:forEach var="ageGroup" items="${ageGroup}">
			  	<div class="progress" id="progress" style="font-size: large; height: 40px"> 
					${ageGroup.ageGroup}代: <div class="progress-bar" style="width:${ageGroup.ageGroupCount}%">${ageGroup.ageGroupCount}</div>
				</div>
			</c:forEach>
		</div>

</body>
</html>