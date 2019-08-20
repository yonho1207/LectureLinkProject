<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
${members_info}
	<h1>회원정보</h1>
			
				회원번호${members_info.member_no}<br />
				아이디${members_info.id}<br />
				비밀번호${members_info.password}<br />
				성${members_info.lastname}<br />
				이름${members_info.firstname}<br />
				성${members_info.gender}<br />
				전화번호${members_info.phone}<br />
				생일${members_info.birth}<br />
				이메일${members_info.email}<br />
				질문${members_info.question}<br />
				답${members_info.answer}<br />
			
			<button type="button" class="form-control" onclick="location.href='/LectureLinkProject/go_profile_update.do'" >수정하기</button>
			
</body>
</html>