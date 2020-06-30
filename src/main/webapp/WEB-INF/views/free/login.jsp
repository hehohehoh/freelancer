<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	${free.free_id}님의 로그인이 완료되었습니다.<br>
	<a href="">마이페이지</a><br>
	
	<form method="post" action="${contextPath }/board/list">
		<input type="hidden" name="free_id" value="${free.free_id }" />
		<input type="submit" value="게시판 보러가기" />
	</form>
</body>
</html>