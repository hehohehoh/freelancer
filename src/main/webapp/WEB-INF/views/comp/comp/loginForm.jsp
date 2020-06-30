<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<c:set var="result" value="${param.result }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 로그인창</title>
	<c:choose>
   		<c:when test="${result=='loginFailed'}">
     		<script>
       			window.onload=function(){
       				alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
       			}
     		</script>
   		</c:when>
	</c:choose>  
	
	<script>
        function popupid(){
            var url = "${contextPath}/comp/findid.do";
            var name = "popup test";
            var option = "width = 700, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
        
        function popuppw(){
            var url = "${contextPath}/comp/findpw.do";
            var name = "popup test2";
            var option = "width = 700, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
        }
    </script>
	
</head>
<body>
	<h1>로그인 창</h1>
	<form name="compLogin" method="post"  action="${contextPath}/comp/login.do">
		아이디: <input type="text" name="comp_id" value="" size="20" id="comp_id">
		비밀번호: <input type="password" name="comp_pw" value="" size="20">
		<input type="submit" value="로그인" style="height:50px; width:50px;"/>
	</form>
	 <a href="${contextPath}/comp/compForm.do">회원가입하기</a>
   <a href="javascript:popupid()">아이디 찾기</a>
   <a href="javascript:popuppw()">비밀번호 찾기</a>
</body>
</html>