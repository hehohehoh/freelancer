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
<title>기업 가입 승인 창</title>
<style>
   table {margin: auto; border: 1px solid black; border-collapse: collapse;}
</style>
</head>
<body>
	<h1 align="center">기업 가입 승인 창</h1>
	   <table border="1">
			<tr align="center">
				<td><b>아이디</b></td>
				<td><b>담당자 이름</b></td>
				<td><b>담당자 이메일</b></td>
				<td><b>담당자 핸드폰번호</b></td>
				<td><b>회사 이름</b></td>
				<td><b>사업자코드</b></td>
				<td><b>승인</b></td>
			</tr>
			<c:choose>
				<c:when test="${compApproList == null}" >
					<tr>
						<td colspan=6><b>등록된 회원이 없습니다.</b></td>
					</tr>
				</c:when>
				<c:when test="${compApproList != null}" >
					<c:forEach var="c" items="${compApproList}" >     
						<tr align="center">
							<td>${c.comp_id}</td>
							<td>${c.comp_mname}</td>
							<td>${c.comp_mhp}</td>
							<td>${c.comp_memail}</td>
							<td>${c.comp_bnum}</td>
							<td>${c.comp_name}</td>
							<td>
								<form name="frm" method="post" action="${contextPath}/admin/appro.do">
									<input type="hidden" name="comp_id" value="${c.comp_id}" />
									<input type="submit" value="승인"/>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
</body>
</html>