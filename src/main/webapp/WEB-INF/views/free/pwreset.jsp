<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>비밀번호 재설정 완료창</title>
<script>
function MovePage() {
	//window.opener.top.location.href="login.do"
	opener.document.getElementById("free_id").value = document.getElementById("id").value
	window.close();
}
</script>
</head>
<body>
	<form>
		<input type="hidden" value="${id}" id="id"/>
		<table>	
			<tr>
   				<TD>${id}님의 비밀번호가 재설정이 완료되었습니다.</TD>		
			</tr>
			<tr>
				<TD><a href="javascript:MovePage();">로그인하러 가기</a></TD>
			</tr>
		</table>
	</form>
</body>
</html>