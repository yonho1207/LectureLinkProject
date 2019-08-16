<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<?xml version="1.0" encoding="utf-8" ?>
<cmtList>
	<c:forEach var="cmt" items="${cmtList}">
		<cmt>
			<cmt_no>${cmt.cmt_no}</cmt_no>
			<member_no>${cmt.member_no}</member_no>
			<lecture_no>${cmt.lecture_no}</lecture_no>
			<id>${cmt.id}</id>
			<cmt_con>${cmt.cmt_con}</cmt_con>
			<rating>${cmt.rating} </rating>
			<cmt_date>${cmt.cmt_date}</cmt_date>
		</cmt>
	</c:forEach>
	${pageGroupResult}
</cmtList>