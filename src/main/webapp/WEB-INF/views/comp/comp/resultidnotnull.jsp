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
<title>아이디찾기 결과창1</title>
<script>
function MovePage() {
	//window.opener.top.location.href="login.do"
	opener.document.getElementById("comp_id").value = document.getElementById("id").value
	window.open("about:blank","_self").close();
}
</script>
</head>
<body>
	<form>
		<input type="hidden" value="${id}" id="id"/>
		<table>	
			<tr>
   				<TD>찾으시는 아이디는 ${id}입니다.</TD>		
			</tr>
			<tr>
				<TD><a href="javascript:MovePage();">로그인하러 가기</a></TD>
			</tr>
		</table>
	</form>
</body>
</html>