<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version="1.0" encoding="utf-8" ?>
<lecture_List>
	<c:forEach var="lecture_List" items="${lecture_List}">
	<item>
		<lecture_no>${lecture_List.lecture_no}</lecture_no>
		<lecture_name>${lecture_List.lecture_name}</lecture_name>
		<lecture_teacher>${lecture_List.lecture_teacher}</lecture_teacher>
		<price>${lecture_List.price}</price>
		<text_price>${lecture_List.text_price}</text_price><br />
	</item>
	</c:forEach>
</lecture_List>