<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!-- 자바기본문 쓰기 -->

<!DOCTYPE html >
<html>
<head>
<meta charset=utf-8>
<title>Q&A게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<h3>Q&A게시판</h3>

	<div class="container">
	<table class="table">
		<tr>	
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일시</td>
	
		<tr>	
			
			<c:forEach var="qna" items="${qnaList}">
				<tr>
					<td><a href="qna_detail?qna_no=${qna.qna_no}">${qna.qna_title}</a></td>
					<td>${qna.id}</td>
					<td>${qna.visited}</td>
					<td>${qna.qna_date}</td>
				</tr>
			</c:forEach>

			</table>	
		</div>	
		
	<table class="">
		<c:if test="${members_info != null}">
			<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/qna_inputform'" >글쓰기</button>
			<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/go_cmt'" >Cmt</button>		
		</c:if>
	</table>
	
	<!-- 페이지 처리부분 -->
			<c:if test="${pageGroupResult.beforePage}">
				<a href="qna_req_list?reqPage=${pageGroupResult.groupStartNumber-1}">◀</a>
			</c:if>
				
			<c:forEach var ="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>
				
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
						<span id="sel"><a href="qna_req_list?reqPage=${index}">${index}</a></span>
					</c:when>
					
					<c:otherwise>
						<a href="qna_req_list?reqPage=${index}">${index}</a>
					</c:otherwise>
					
				</c:choose>	
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage}">
				<a href="qna_req_list?reqPage=${pageGroupResult.groupEndNumber+1}">▶</a>
			</c:if>
			<%@ include file ="/companyLogo.jsp" %>
</body>
</html>