<%@ page language="java" 
		 contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" 
		 isELIgnored="false" %>
		 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
</head>
<body>
	<table>
		<tr align="center"   bgcolor="lightblue">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>성</b></td>
			<td><b>이름</b></td>
			<td><b>전화번호</b></td>
			<td><b>생년월일</b></td>
			<td><b>성별</b></td>
			<td><b>주소</b></td>
			<td><b>이메일</b></td>
			<td><b>가입일자</b></td>
			<td><b>사진</b></td>
			<td><b>경력개수</b></td>
			<td><b>현재상태</b></td>
			<td><b>탈퇴/정지여부</b></td>
			<td><b>희망급여</b></td>
			<td><b>등급</b></td>
			<td><b>간단자기소개</b></td>
			<td><b>이력서/포트폴리오</b></td>
		</tr>
		
		<c:forEach var="free" items="${freelancersList}" >     
		<tr align="center">
			<td>${free.free_id}</td>
			<td>${free.free_pw}</td>
			<td>${free.free_firstName}</td>
			<td>${free.free_lastName}</td>
			<td>${free.free_hp}</td>
			<td><fmt:formatDate value="${free.free_bir}" pattern="YYYY/MM/dd" /></td>
			<td>${free.free_gender}</td>
			<td>${free.free_addr}</td>
			<td>${free.free_email}</td>
			<td><fmt:formatDate value="${free.free_joinDate}" pattern="YYYY/MM/dd HH:mm:ss" /></td>
			<td>${free.free_picture}</td>
			<td>${free.free_career}</td>
			<td>${free.free_state}</td>
			<td>${free.free_stop}</td>
			<td>${free.free_pay}</td>
			<td>${free.free_level}</td>
			<td>${free.free_intro}</td>
			<td>${free.free_file}</td>
			

	
		<%-- 	<td>${member.id}</td>
			<td>${member.pwd}</td>
			<td>${member.name}</td>
			<td>${member.email}</td>
			<td>${member.joinDate}</td> --%>
			<td><a href="${contextPath}/free/removeFreelancer.do?id=${member.id }">삭제하기</a></td>
		</tr>
		</c:forEach>   
	</table>
	<h1><a href="${contextPath}/free/form.do">회원가입</a></h1>
	
</body>
</html>
