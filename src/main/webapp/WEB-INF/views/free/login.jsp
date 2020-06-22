<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
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
	<h1>로그인 창</h1>
	<form >
	아이디: <input type="text" name="id" />
	비밀번호: <input type="password" name="pw" />
	</form>
	<a href="${contextPath}/free/form.do">회원가입하기</a>
	<a href="${contextPath}/free/listFreelancers.do">프리랜서 목록 보기</a>
	
</body>
</html>