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
<title>기업 로그인창</title>
</head>
<body>
	<h1>로그인 창</h1>
	<form>
	아이디: <input type="text" name="id" />
	비밀번호: <input type="password" name="pw" />
	</form>
	<a href="${contextPath}/comp/compForm.do">회원가입하기</a>
	<a href="${contextPath}/comp/findid.do">아이디 찾기</a>
</body>
</html>
