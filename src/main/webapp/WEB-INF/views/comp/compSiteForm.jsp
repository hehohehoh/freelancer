<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 페이지</title>
</head>
<body>
	<h3>로그인 됐습니다!!</h3>
    <c:if test="${isLogOn == true  && company!= null}">
         <h3>환영합니다. ${company.comp_mname}님!</h3>
         <a href="${contextPath}/comp/logout.do" style="font-size:110%">로그아웃</a>
    </c:if>
 
</body>
</html>