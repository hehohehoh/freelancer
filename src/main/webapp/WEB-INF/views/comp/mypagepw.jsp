<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<c:choose>
		<c:when test="${result=='Failed'}">
 		<script>
   			alert("비밀번호가 틀립니다.");
 		</script>
		</c:when>
</c:choose>  

</head>
<body>
<form name="mypage" method="post"  action="${contextPath}/comp/pwcheck.do">
	<h1>마이페이지</h1>
	비밀번호 : <input type="password" name="pwcheck">
	<input type="submit" value="확인">
</form>

</body>
</html>