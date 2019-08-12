<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="true"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">

<title>댓글 게시판</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 1단계 : 템플릿 플러그인 -->
<script type="text/javascript" src="https://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>

<!-- 2단계 : 탬플릿 구조 만들기 -->
<script type="text/x-jquery-tmpl" id="itemTemplate">

	<li data-num="${cmt_no}" class="cmt_item"> 
		 글번호 : ${cmt_no} 멤버아이디  : ${member_no} 작성자 : ${id} 내용:  ${com_con}, ${rating}, ${datetime}
		<input type="button" class="delete_btn" value="삭제">
	</li>			
	<hr>	
</script>

<script type="text/javascript">
function addNewItem(cmt_no,member_no,id,com_con,rating,cmt_date) {
	
	var li_data = {
			
			"cmt_no":cmt_no,
			"member_no":member_no,
			"id":id,
			"com_con":com_con,
			"rating" : rating,
			"cmt_date":cmt_date
	};	
	
	var new_li = $("#itemTemplate").tmpl(li_data);
	
	$("#cmt_list").prepend(new_li);
}

$(function(){
	$.get("cmt_list",{}, function(data){
		
		$(data).find("cmt").each(function(){
			
			var cmt_no =$(this).find("cmt_no").text();
			var member_no =$(this).find("member_no").text();
			var id = $(this).find("id").text();
			var com_con = $(this).find("com_con").text();
			var rating = $(this).find("rating").text();
			var datetime = $(this).find("datetime").text();
			
			addNewItem(cmt_no,member_no,id,com_con,rating,cmt_date);
	});
		
}).fail(function(){
	alert("댓글 목록을 불러오는데 실패했습니다. 잠시후에 다시 시도해 주세요.");
});
		
$("#cmt_form").submit(function(){
	
	if(!$("#cmt_con").val()){
		alert("내용을 입력해주세요.");
		return false;
	}	

	$.post("cmt_insert",$(this).serialize(),function(xml){
		
		var result=$(xml).find("result").text();
		
		if (result) {
			
			var cmt_no =$(xml).find("cmt_no").text();
			var member_no =$(xml).find("member_no").text();
			var id = $(xml).find("id").text();
			var com_con = $(xml).find("com_con").text();
			var rating = $(xml).find("rating").text();
			var datetime = $(xml).find("datetime").text();
			
			addNewItem(cmt_no,member_no,id,com_con,rating,cmt_date);
    						
			$("#id").val("");
			$("#com_con").val("");
			
		}

	}).fail(function(){
		
	});

	return false;
});	
$(document).on('click','.delete_btn',function(){
	
	if(confirm("정말 댓글을 삭제하시겠습니까")){
		
		var num = $(this).parent("li").attr("data-num");
		var target= $(this).parents(".cmt_item");
		target.next().remove();
		target.remove();
		
		$.post("cmt_delete",{"cmt_con":cmt_con},function(xml){
			
		}).fail(function(){
			alert("삭제 실패");
		});
	}
});		
	
});
</script>

</head>
<body>
	<h2>인터넷 강의 게시판</h2>
	<hr>
	<div class="container">
	<form id="cmt_form">
		<input type="hidden" name = "member_no" value="${members_info.member_no}">
		 <input type="text" class="form-control" id="member_no"  value="${members_info.member_no}" disabled="disabled" >
		
		id<input type="text" name="id" id="id" />
		코멘트<input type="text" name="cmt_con" id="cmt_con" />
		<button type="submit"  class="btn btn-primary">저장하기</button>
	</form>
	</div>
	
	<ul id="cmt_list">
	<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
	</ul>
</body>
</html>