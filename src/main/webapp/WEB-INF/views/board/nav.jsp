<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div>
	<div>
		<a href="${contextPath}/main.do">메인 홈으로 가기</a>	
		<a href="${contextPath}/board/list">목록</a>
		<a href="${contextPath}/board/writeView">글 작성</a>	

	</div>
</div>