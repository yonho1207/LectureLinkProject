<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script src="js/star.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 1단계 : 템플릿 플러그인 -->
<script type="text/javascript" src="https://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>

<!-- 2단계 : 탬플릿 구조 만들기 -->
<script type="text/x-jquery-tmpl" id="itemTemplate">

	<li data-num="{{= cmt_no}}" class="cmt_item"> 
		
	별점 : {{if rating==1}}
			<img src="img/score_one.jpg" width="80" height="20">
		 {{/if}}

		 {{if rating==2}}
			<img src="img/score_two.jpg" width="80" height="20">
		 {{/if}}

		{{if rating==3}}
			<img src="img/score_three.jpg" width="80" height="20">
		{{/if}}

		{{if rating==4}}
			<img src="img/score_four.jpg" width="80" height="20">
		{{/if}}

		{{if rating==5}}
			<img src="img/score_five.jpg" width="80" height="20">
		{{/if}}	

 		글번호 :{{= cmt_no}} 
		멤버넘버  : {{= member_no}} 
		강의번호 :{{= lecture_no}} 
		작성자 : {{= id}}
		내용: {{= cmt_con}}
		등록일자 : {{= cmt_date}}

		{{if chk == true}}
			<input type="button" class="delete_btn" value="삭제">
		{{/if}}	
	</li>	
	<hr>	
</script>

<script type="text/javascript">

function addNewItem(cmt_no,member_no,id,cmt_con,rating,cmt_date,lecture_no,chk,groupStartNumber,groupEndNumber,selectPageNumber) {
	
	var li_data = {
			
			"cmt_no":cmt_no,
			"member_no":member_no,
			"lecture_no" : lecture_no,
			"id":id,
			"cmt_con":cmt_con,
			"rating" : rating,
			"cmt_date":cmt_date,
			"chk" : chk,
			"groupStartNumber": groupStartNumber,
			"groupEndNumber" : groupEndNumber,
			"selectPageNumber" : selectPageNumber
	};	
	
	var new_li = $("#itemTemplate").tmpl(li_data);
	
	$("#cmt_list").prepend(new_li);
}

	$(function(){
		$.get("cmt_list",{}, function(data){
		
			$(data).find("cmt").each(function(){
			
				var cmt_no =$(this).find("cmt_no").text();
				var member_no =$(this).find("member_no").text();
				var lecture_no = $(this).find("lecture_no").text();
				var id = $(this).find("id").text();
				var cmt_con = $(this).find("cmt_con").text();
				var rating = $(this).find("rating").text();
				var cmt_date = $(this).find("cmt_date").text();
				var chk = false;
				var groupStartNumber = $(this).find("groupStartNumber").text();
				var groupEndNumber = $(this).find("groupEndNumber").text();
				var selectPageNumber = $(this).find("selectPageNumber").text();
			
			if(member_no == "${members_info.member_no}"){
				chk = true;
			}
			
			addNewItem(cmt_no,member_no,id,cmt_con,rating,cmt_date,lecture_no,chk,groupStartNumber,groupEndNumber,selectPageNumber);
	});
		
	}).fail(function(){
		alert("댓글 목록을 불러오는데 실패했습니다. 잠시후에 다시 시도해 주세요.");
	});
		
	$("#cmt_form").submit(function(){
		var star1 = $('#p1');
		
		if($(':radio[name="star-input"]:checked').length < 1){
		    
			alert('별점을 선택해주세요');                        
			star1.focus();
		    event.preventDefault();
		}

		if(!$("#cmt_con").val()){
		
			alert("내용을 입력해주세요.");
			return false;
		
		} 
	
	$.post("cmt_insert",$(this).serialize(),function(xml){
		
		var result=$(xml).find("result").text();
		
		if (result) {
			
			var cmt_no =$(xml).find("cmt_no").text();
			var member_no =$(xml).find("member_no").text();
			var lecture_no = $(xml).find("lecture_no").text();
			var id = $(xml).find("id").text();
			var cmt_con = $(xml).find("cmt_con").text();
			var rating = $(xml).find("rating").text();
			var datetime = $(xml).find("cmt_date").text();
			var groupStartNumber = $(xml).find("groupStartNumber").text();
			var groupEndNumber = $(xml).find("groupEndNumber").text();
			var selectPageNumber = $(xml).find("selectPageNumber").text();
			var chk = false;
			
			if(id == "${members_info.member_no}"){
				chk = true;
			}
			
			addNewItem(cmt_no,member_no,id,cmt_con,rating,cmt_date,lecture_no,chk,groupStartNumber,groupEndNumber,selectPageNumber);
    						
			$("#cmt_con").val("");
				
		}else{
			
				
		}
	}).fail(function(){
		
	});
	//return false;

});	
	$(document).on('click','.delete_btn',function(){
	
		if(confirm("정말 댓글을 삭제하시겠습니까")){
		
			var num = $(this).parent("li").attr("data-num");
			var target= $(this).parents(".cmt_item");
			target.next().remove();
			target.remove();
	
			$.post("cmt_delete",{"cmt_no":num},function(xml){
			
			}).fail(function(){
				alert("삭제 실패");
			});
		}
	});		
});
</script>

<style type="text/css">
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:100px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>



<style type="text/css">
.pagination{
    position:absolute;
    top:0; left:0; bottom:0; right:0;
    height:10%; 
    margin:10% auto;
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
					<a class="dropdown-item" href="go_Member_Profile.do">회원 정보 조회 및 수정</a>
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
						
						<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
							관리자 메뉴
						</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">회원관리 페이지</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">강의등록 페이지</a>
					
						</div>
						</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">고객 센터 </a>
					</li>				
			</ul>
		</nav>
	<br>

	<h2>인터넷 강의 상세 게시판</h2>
	<hr>
	<div class="container mt-3">
  		<h2>JAVA 는 즐거워 강의</h2>
  		<p>alex cho 선생님의 JAVA 기초 강의</p>
  		<div class="media border p-3">
   		 <img src="img/java_logo_img.jpg" alt="이미지 실패" class="mr-3 mt-3 rounded-circle" style="width:160px;">
   		 <div class="media-body">
      <h4>alex cho <small><i></i></small></h4>
      <p>누구나 쉽게 시작할수 있는 JAVA 기초강의 모두함께 해봐요~</p>
      <p>당신도 프로그래머가 될수 있어요!</p>          
    </div>
  	</div>
	</div>
	
	<br >
	<div class="container">

	<form id="cmt_form" >
		
		 <input type="hidden" name = "member_no" value="${members_info.member_no}">
		 회원번호<input type="text"  name="member_no" id="member_no" value="${members_info.member_no}" disabled="disabled" />
		 
		강의 번호<input type="text" name="lecture_no" id="lecture_no" />
		
		<input type="hidden" name = "id" value="${members_info.id}">
		id<input type="text"  name="id" id="id" value="${members_info.id}" disabled="disabled" />
		
		코멘트 <input type="text"  name="cmt_con" id="cmt_con" />
		
	<span class="star-input" >
		<span class="input">
    		<input type="radio" name="star-input" value=1 id="p1">
    		<label for="p1">1</label>
    		<input type="radio" name="star-input" value=2 id="p2">
    		<label for="p2">2</label>
    		<input type="radio" name="star-input" value=3 id="p3">
    		<label for="p3">3</label>
    		<input type="radio" name="star-input" value=4 id="p4">
    		<label for="p4">4</label>
    		<input type="radio" name="star-input" value=5 id="p5">
    		<label for="p5">5</label>
  		</span>					
	</span>
		<br >
		<br >	
		<button type="submit"  class="btn btn-primary btn-block" row="50px">저장하기</button>
		${cmt_no}
	</form>
	</div>
	<br >
	<br >
	<ul id="cmt_list">
	<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
	</ul>
	<!-- 페이지 처리부분 -->
	<div class="container">
	<ul class="pagination" style="position: relative; left: 450px">
			<c:if test="${pageGroupResult.beforePage}">
				   <li class="page-item"><a class="page-link" href="cmt_Fom1?reqPage=${pageGroupResult.groupStartNumber-1}">Previous</a></li>
			</c:if>
			<c:forEach var ="index" begin="${pageGroupResult.groupStartNumber}" end="${pageGroupResult.groupEndNumber}">
				<c:choose>
				
					<c:when test="${pageGroupResult.selectPageNumber==index}"> 
						 <li class="page-item active"> <span id="sel"><a class="page-link" href="cmt_Fom1?reqPage=${index}">${index}</a></span></li>
					</c:when>
					
					<c:otherwise>
						  <li class="page-item"><a class="page-link" href="cmt_Fom1?reqPage=${index}">${index}</a></li>
					</c:otherwise>
					
				</c:choose>	
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage}">
				<li class="page-item"><a class="page-link" href="cmt_Fom1?reqPage=${pageGroupResult.groupEndNumber+1}">next</a></li>
			</c:if>
		</ul>	
	</div>
	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>