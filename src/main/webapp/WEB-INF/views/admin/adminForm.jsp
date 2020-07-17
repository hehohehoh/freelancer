<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<a href="${contextPath}/admin/compAppro.do">기업 가입 승인</a><br><br>
	<a href="${contextPath}/admin/listFreelancers.do">기업 회원 관리</a><br><br>
	<a href="${contextPath }/admin/listFreelancers.do">프리랜서 회원 관리</a><br><br>
	
	
</body>
</html>