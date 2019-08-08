<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html >
<html><head>
<meta charset=utf-8>
<title>Q&A Input Form</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Q&A 작성 게시판</h1>
	<div class="container">
	
	<form action="qna_insert">
    <div class="form-group">	
      <label for=id>작성자:</label>
      <input type="hidden" name = "id" value="${qna.id}"><br />
      <input type="text" class="form-control" id="id"  value="${qna.id}" disabled="disabled" >
    </div>
    
    <div class="form-group">
      <label for="qna_title">제목:</label>
      <input type="text" class="form-control" id="qna_title" >
    </div>
    
 	<div class="form-group">
  		<label for="qna_con">내용:</label>
  		<textarea class="form-control" rows="5" id="qna_con"></textarea>
	</div>
    
    <button type="submit"  class="btn btn-primary">글쓰기</button>
 	</form>
	</div>
	
</body>
</html>