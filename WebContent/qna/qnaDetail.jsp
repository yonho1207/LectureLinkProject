<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html><head>
<meta charset=utf-8>
<title>Q&A Detail Form</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Q&A 상세보기 게시판</h1>
	<br >
	<div class="container">
	
	<c:if test="${members_info.id == qna.id}">
	<form action="qna_update" method="post">
	<div class="form-group">	
      <label for=qna_no>글번호:</label>
      <input type="hidden" name = "qna_no" value="${qna.qna_no}"><br />
      <input type="text" class="form-control" id="qna_no"  value="${qna.qna_no}" disabled="disabled"/>
    </div>
	
    <div class="form-group">	
      <label for=id>작성자:</label>
      <input type="hidden" name = "id" value="${qna.id}"><br />
      <input type="text" class="form-control" id="id"  value="${qna.id}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="qna_title">제목:</label>
      <input type="text" class="form-control" name = "qna_title" id="qna_title" value="${qna.qna_title}"/>
    </div>
    
 	<div class="form-group">
  		<label for="qna_con">내용:</label>
  		<textarea class="form-control" rows="5" name = "qna_con" id="qna_con">${qna.qna_con}</textarea>
	</div>
	
	<div class="form-group">
  	<input type="submit"  class="btn btn-primary" value="수정">
  	</div>
  	
 	</form>
	
 	<a type="button"  class="btn btn-primary" href="qna_delete?qna_no=${qna.qna_no}">삭제</a>
 	</c:if>
 	
 	<c:if test="${members_info.id != qna.id}">
 	
 	<div class="form-group">	
      <label for=qna_no>글번호:</label>
      <input type="hidden" name = "qna_no" value="${qna.qna_no}"><br />
      <input type="text" class="form-control" id="qna_no"  value="${qna.qna_no}" disabled="disabled"/>
    </div>
	
    <div class="form-group">	
      <label for=id>작성자:</label>
      <input type="hidden" name = "id" value="${qna.id}"><br />
      <input type="text" class="form-control" id="id"  value="${qna.id}" disabled="disabled"/>
    </div>
    
    <div class="form-group">
      <label for="qna_title">제목:</label>
      <input type="hidden" name = "qna_no" value="${qna.qna_title}">
      <input type="text" class="form-control" name = "qna_title" id="qna_title" value="${qna.qna_title}" disabled="disabled"/>
    </div>
    
 	<div class="form-group">
  		<label for="qna_con">내용:</label>
  		<input type="hidden" name = "qna_no" value="${qna.qna_con}">
  		<textarea class="form-control" rows="5" name = "qna_con" id="qna_con" disabled="disabled">${qna.qna_con}</textarea>
	</div>
 	
 	</c:if>
	</div>
	<br >
	<button type="button" class="btn btn-primary" onclick="location.href='/LectureLinkProject/go_qna'">리스트 돌아가기</button>
	
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>