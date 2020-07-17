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
<title>비밀번호찾기 결과창2</title>
<script>
function MovePage() {
	window.opener.top.location.href="compForm.do"
	window.open("about:blank","_self").close();
}
</script>
</head>
<body>
	<form>
		<table>
			<tr>
   				<TD colspan="2">찾는 비밀번호가 없습니다.</TD>
			</tr>
			<tr>
				<td><A href="${contextPath}/comp/findpw.do">다시 찾기</A></TD>
			</tr>
		</table>
	</form>
</body>
</html>