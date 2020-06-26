<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<c:set var="result" value="${param.result}" />
<html>
<head>
	<meta charset="UTF-8">
	<title>메인 페이지</title>
	
	<c:choose>
   		<c:when test="${result=='addcomp'}">
     		<script>
       			window.onload=function(){
         			alert("회원가입 승인처리가 24시간 이내로 처리 됩니다!!");
       			}
     		</script>
   		</c:when>
	</c:choose>  
</head>
<body>
	<h3>메인 페이지</h3>
	<a href="${contextPath}/free/login.do">프리랜서</a>
	<br>
	<hr>
	<a href="${contextPath}/comp/loginForm.do">기업</a>	
</body>
</html>