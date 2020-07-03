<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<title>Insert title here</title>
<c:if test="${result== 'fail' }">
		<script>
			window.onload = function() {
				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
			}
		</script>
</c:if>
<script>
        function popupid(){
            var url = "${contextPath}/free/findid.do";
            var name = "popup test";
            var option = "width = 700, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function popuppw(){
            var url = "${contextPath}/free/findpw.do";
            var name = "popup test2";
            var option = "width = 700, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
</script>
</head>
<body>
	<c:choose>
	<c:when test="${empty free_id }">
		<h1>로그인 창</h1>
	</c:when>
	<c:otherwise>
		<h3>${free_id }님의 회원가입이 완료되었습니다.</h3>
		<h3>로그인 후 이후 서비스를 이용해주세요</h3>
	</c:otherwise>
	</c:choose>
	
	<form method="post" action="${contextPath }/free/login.do">
	아이디: <input type="text" name="free_id" id="free_id" /><br>
	비밀번호: <input type="password" name="free_pw" />
	<input type="submit" value="로그인" />
	</form>
	<br>
	<a href="${contextPath}/free/form.do">회원가입하기</a>
	<a href="javascript:popupid()">아이디 찾기</a>
    	<a href="javascript:popuppw()">비밀번호 찾기</a>
	<a href="${contextPath}/free/listFreelancers.do">프리랜서 목록 보기</a>
	
</body>
</html>
