<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" 
		 isELIgnored="false" %>
		 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="freeID" value="${param.free_id}"/>
<c:set var="freeStop" value="${param.free_stop}"/>
<% request.setCharacterEncoding("UTF-8"); %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 출력창</title>
	<style>
		table {margin: auto; border: 1px solid black; border-collapse: collapse;}
		h1 {text-align:center;}
	</style>
	
	<c:if test="${freeID != 'admin' && freeID != null && freeStop == 0}">
		<script>
			window.onload = function() {
				alert("${freeID}를 정지하셨습니다.");
			}
		</script>
	</c:if>
	
	<c:if test="${freeID != 'admin' && freeID != null && freeStop == 1}">
		<script>
			window.onload = function() {
				alert("${freeID}의 정지가 해제되었습니다.");
			}
		</script>
	</c:if>	
</head>
<body>
<h1 align="center">프리랜서 회원 관리</h1>
	<table border="1">
		<tr align="center">
			<td><b>아이디</b></td>
			<td><b>성</b></td>
			<td><b>이름</b></td>
			<td><b>전화번호</b></td>
			<td><b>생년월일</b></td>
			<td><b>성별</b></td>
			<td><b>이메일</b></td>
			<td><b>탈퇴/정지여부</b></td>
			<td><b>검색가능여부</b></td>
			<td><b>가입일자</b></td>
			<td><b>회원정지</b></td>
		</tr>
		<c:choose>
			<c:when test="${freelancersList == null}" >
				<tr>
					<td colspan="9"><b>등록된 회원이 없습니다.</b></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="free" items="${freelancersList}" >     
					<tr align="center">
						<td>${free.free_id}</td>
						<td>${free.free_firstName}</td>
						<td>${free.free_lastName}</td>
						<td>${free.free_hp}</td>
						<td><fmt:formatDate value="${free.free_bir}" pattern="YYYY/MM/dd" /></td>
						<td>${free.free_gender}</td>
						<td>${free.free_email}</td>
						<td>${free.free_stop}</td>
						<td>${free.free_state}</td>
						<td><fmt:formatDate value="${free.free_joinDate}" pattern="YYYY/MM/dd HH:mm:ss" /></td>
						<td>
							<form method="post" action="${contextPath}/admin/freeStop.do">
								<input type="hidden" name="free_id" value="${free.free_id}">
								<input type="hidden" name="free_stop" value="${free.free_stop}">
								<c:if test="${free.free_stop == 0 }" >
									<input type="submit" value="회원정지">
								</c:if>
								<c:if test="${free.free_stop == 1 }" >
									<input type="submit" value="정지취소">
								</c:if>
							</form>
						</td>
					</tr>
				</c:forEach> 
			</c:otherwise>
		</c:choose>  
	</table>
	
</body>
</html>
