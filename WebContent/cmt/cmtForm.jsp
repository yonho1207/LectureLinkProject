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
	
	<div class="container">
	<li data-num="{{= cmt_no}}" class="cmt_item"> 
	
レーティング :{{if rating==1}}
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

 		Q&A番号 :{{= cmt_no}}
		講義番号 :{{= lecture_no}} 
		作成者 : {{= id}}
		内容: {{= cmt_con}}
		日時 : {{= cmt_date}}

		{{if chk == true}}
			<input type="button" class="delete_btn" value="コメントを消す">
		{{/if}}	
	</li>	
	</div>
	<hr>	
</script>

<script type="text/javascript">

function addNewItem(cmt_no,member_no,id,cmt_con,rating,cmt_date,lecture_no,chk) {
	
	var li_data = {
			
			"cmt_no":cmt_no,
			"member_no":member_no,
			"lecture_no" : lecture_no,
			"id":id,
			"cmt_con":cmt_con,
			"rating" : rating,
			"cmt_date":cmt_date,
			"chk" : chk
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
			
			if(member_no == "${members_info.member_no}"){
				chk = true;
			}
			
			addNewItem(cmt_no,member_no,id,cmt_con,rating,cmt_date,lecture_no,chk);
	});
		
	}).fail(function(){
		alert("通信エラーが発生しました。しばらく時間をおいてから再度お試してください。");
	});
		
	$("#cmt_form").submit(function(){
		var star1 = $('#p1');
		
		if($(':radio[name="star-input"]:checked').length < 1){
		    
			alert('レーティングをチェックしてください。');                        
			star1.focus();
		    event.preventDefault();
		}

		if(!$("#cmt_con").val()){
		
			alert("内容を入力してください。");
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
			var chk = false;
			
			if(id == "${members_info.member_no}"){
				chk = true;
			}
			
			addNewItem(cmt_no,member_no,id,cmt_con,rating,cmt_date,lecture_no,chk);
    					
			$("#cmt_con").val("");
				
		}else{
			
				
		}
	}).fail(function(){
		
	});
	//return false;

});	
	$(document).on('click','.delete_btn',function(){
	
		if(confirm("本当に削除しますか？")){
		
			var num = $(this).parent("li").attr("data-num");
			var target= $(this).parents(".cmt_item");
			target.next().remove();
			target.remove();
			location.replace('index.jsp');
			$.post("cmt_delete",{"cmt_no":num},function(xml){
			
			}).fail(function(){
				alert("削除失敗");
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
#list_btn{background-color:black; color: white; }
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
						<a class="nav-link" href="go_Lecture_List?reqPage=1">講義リストへ  </a>
					</li>
				<li class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">マイページ</a>
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
						<a class="nav-link" href="go_account">会員登録<</a>
					</li>
				</c:when>
				<c:when test="${members_info!=null || admin!=null}">
					<li class="nav-item">
						<a class="nav-link" href="logout">ログアウト</a>
					</li>
				</c:when>
				</c:choose>
				<c:if test="${admin!=null}">
					<li class="nav-item">
						
						<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">管理者ページへ</a>
						<div class="dropdown-menu">
						<a class="dropdown-item" href="admin_memberList.admin">管理者ページへ</a>
						<a class="dropdown-item" href="go_Lecture_Insert.admin">講義登録ページへ</a>
					
						</div>
						</li>
				</c:if>
					<li class="nav-item">
						<a class="nav-link" href="go_Customer_Support">サポートセンター  </a>
					</li>				
			</ul>
		</nav>
	<br>

	<h2>講義詳細 ページ</h2>
	<hr>
	<div class="container mt-3">
  		<h2>講義詳細</h2>
  			
    	<h2>${lecture.lecture_name}</h2>
  		<div class="media border p-3">
   		 <img src="img/java_logo_img.jpg" alt="失敗" class="mr-3 mt-3 rounded-circle" style="width:160px;">
   		 <div class="media-body">
      先生：<h3><i>${lecture.lecture_teacher}</i></h3><br >
      <p>${lecture.description}</p>
	<p><h4>プライス:${lecture.price}</h4></p> 
	<p>
	<h4>
		<c:choose>
		<c:when test="${avg2>=0.0 && 2.0>avg2}">
			平均レーティング :<img src="img/score_one.jpg" width="200" height="50">
		</c:when>		
		<c:when test="${avg2>=2.0 && 3.0>avg2}">
			平均レーティング :<img src="img/score_two.jpg" width="200" height="50">
		</c:when>	
		<c:when test="${avg2>=3.0 && 4.0>avg2}">
			平均レーティング :<img src="img/score_three.jpg" width="200" height="50">
		</c:when>	
		<c:when test="${avg2>=4.0 && 5.0>avg2}">
			平均レーティング :<img src="img/score_four.jpg" width="200" height="50">
		</c:when>	
		<c:otherwise>
			平均レーティング :<img src="img/score_five.jpg" width="200" height="50">
		</c:otherwise>
		</c:choose>	
		(${avg2})
	</h4>
	</p>   
    </div>
  	</div>
	</div>
	<br >

	<c:if test="${admin==null && members_info!=null}">
	<div class="container">
	<form id="cmt_form" >
		 <input type="hidden" name = "member_no" value="${members_info.member_no}">
		 会員番号：<input type="text"  name="member_no" id="member_no" value="${members_info.member_no}" disabled="disabled" />
		 
		  <input type="hidden" name = "lecture_no"  id="lecture_no" value="${lecture.lecture_no}"/>
		
		<input type="hidden" name = "id" value="${members_info.id}">
		id<input type="text"  name="id" id="id" value="${members_info.id}" disabled="disabled" />
		
		コメント： <input type="text"  name="cmt_con" id="cmt_con" />
		
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
		<button type="submit"  class="btn btn-primary btn-block" row="50px">セーブする</button>
	</form>
	</div>
	</c:if>
	
	<br >
	<br >
	
	<div class="container">
	<h2>最新　 コメント</h2>
	</div>
	<hr >
	<ul id="cmt_list">
	<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
	</ul>


	<div class="container">
	<button data-toggle="collapse"  id="list_btn" data-target="#lecture_no_cmt" class="form-control">コメントmore</button>
	<div id="lecture_no_cmt" class="collapse">
		
	<c:forEach var="cmtlists" items="${cmtlists}">
		<hr>
		<c:if test="${cmtlists.rating==1}">
			レーティング :<img src="img/score_one.jpg" width="80" height="20">
		</c:if>		
		<c:if test="${cmtlists.rating==2}">
			レーティング :<img src="img/score_two.jpg" width="80" height="20">
		</c:if>	
		<c:if test="${cmtlists.rating==3}">
			レーティング :<img src="img/score_three.jpg" width="80" height="20">
		</c:if>	
		<c:if test="${cmtlists.rating==4}">
			レーティング :<img src="img/score_four.jpg" width="80" height="20">
		</c:if>	
		<c:if test="${cmtlists.rating==5}">
			レーティング :<img src="img/score_five.jpg" width="80" height="20">
		</c:if>	
		
		 作成者:${cmtlists.id} 
		内容 :${cmtlists.cmt_con} 
		日時:${cmtlists.cmt_date}
		<c:if test="${members_info.id == cmtlists.id}">
		<a type="button" class="btn" href="cmt_delete?cmt_no=${cmtlists.cmt_no}">コメントを消す</a>	
		</c:if>
		<br >
	</c:forEach>
	
	</div>
	</div>

	<%@ include file ="/companyLogo.jsp" %>
</body>
</html>