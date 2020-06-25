<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과창1</title>
</head>
<body>
	<form>
		<table>
			<tr>
   				<TD>아이디: </TD>
   				<TD>${id}</TD>
			</tr>
			<tr>
   				<TD><a href="${contextPath}/main.do">메인으로</a></TD>
				<TD><A href="${contextPath}/comp/login.do">로그인하러 가기</A></TD>
			</tr>
		</table>
	</form>
</body>
</html>