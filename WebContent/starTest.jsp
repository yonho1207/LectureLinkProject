<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
.starRating,
.starRating span{ display:inline-block; height:14px; height:14px; background:transparent url(icoFiveStar.gif) no-repeat; overflow:hidden;}
.starRating{ width:79px; vertical-align:middle;}
.starRating span{ font-size:0; line-height:0; vertical-align:top; text-indent:-100px; *text-indent:0; background-position:0 -14px;}



</style>

</head>
<body>


<link rel="stylesheet" type="text/css" href="starRating.css"/>

<h1>Star Rating</h1>
<!-- <p><span class="starRating"><span style="width:10%">1점</span></span></p>
<p><span class="starRating"><span style="width:20%">2점</span></span></p>
<p><span class="starRating"><span style="width:30%">3점</span></span></p>
<p><span class="starRating"><span style="width:40%">4점</span></span></p>
<p><span class="starRating"><span style="width:50%">5점</span></span></p>
<p><span class="starRating"><span style="width:60%">6점</span></span></p>
<p><span class="starRating"><span style="width:70%">7점</span></span></p>
<p><span class="starRating"><span style="width:80%">8점</span></span></p>
<p><span class="starRating"><span style="width:90%">9점</span></span></p> -->
<p><span class="starRating"><span style="width:100%">10점</span></span></p>
<button type="button" onclick="$('link').attr('href','');">CSS(X)</button>
<button type="button" onclick="$('link').attr('href','starRating.css');">CSS(O)</button>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>



</body>
</html>