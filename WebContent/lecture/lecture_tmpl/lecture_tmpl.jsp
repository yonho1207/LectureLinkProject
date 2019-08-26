<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<?xml version="1.0" encoding="utf-8" ?>
<lecture_List>
	<c:forEach var="lecture_List" items="${Selected_Lecture_List_For_Paging}">
	<item>
		<lecture_no>${lecture_List.lecture_no}</lecture_no>
		<lecture_name>${lecture_List.lecture_name}</lecture_name>
		<lecture_teacher>${lecture_List.lecture_teacher}</lecture_teacher>
		<price>${lecture_List.price}</price>
		<book_price>${lecture_List.book_price}</book_price><br />
		<description>${lecture_List.description}</description>
	</item>
	</c:forEach>
</lecture_List>