<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>��й�ȣ ã��</h1>
	<form action="search_pwd" method="post">
	<input type="text" name="id" id="id" placeholder="���̵� �Է����ּ���"/><br />
	<input type="text" name="email" id="email" placeholder="�̸����� �Է����ּ���"/><br />
	����<select name="question">
				<option value="���� ģ�� ģ���� �̸���?">���� ģ�� ģ���� �̸���?</option>
				<option value="�ʵ��б� �������� �̸���?">�ʵ��б� �������� �̸���?</option>
				<option value="����� ������?">����� ������?</option>
		</select><br />
	<input type="text" name="answer" id="answer" placeholder="������ ���� ���� �Է����ּ���"/><br />
	<input type="submit" value="����"/><br />
	</form>
	${message}
</body>
</html>