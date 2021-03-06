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
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 장치의 넓이와 일치, 일반적인 비율 1.0 -->
<title>Freelancer Login</title>
<link rel="stylesheet" href="${contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<c:if test="${result == 'fail' }">
      <script>
         window.onload = function() {
            alert("아이디나 비밀번호가 틀립니다.다시 로그인 하세요!");
         }
      </script>
</c:if>

<c:if test="${freeID != null}">
      <script>
         window.onload = function() {
            alert("${freeID}는 사용할 수 없는 ID입니다.");
         }
      </script>
</c:if>

<c:if test="${status == 'finish' }">
      <script>
         window.onload = function() {
            alert("회원가입이 완료되었습니다. 로그인 후 서비스를 이용해주세요!");
         }
      </script>
</c:if>

   <script>
        function popupid(){
            var url = "${contextPath}/free/findid.do";
            var name = "popup test";
            var option = "width = 700%, height = 500%, top = 100%, left = 200%, location = no"
            window.open(url, name, option);
        }
        
        function popuppw(){
            var url = "${contextPath}/free/findpw.do";
            var name = "popup test2";
            var option = "width = 700%, height = 500%, top = 100%, left = 200%, location = no"
            window.open(url, name, option);
        }
   </script>
</head>

<style>
body{
   background-image: url(${contextPath}/resources/images/free.png);
   background-repeat: no-repeat;
   background-size: 760px 1000px;
   background-color: #DDDDDD;
}
.form-signin{
   text-align: right;
}
.container{
   text-align: center;
   position: absolute; 
   top: 250px;
   left: 565px;
   bottom: 600px;
}
.form-signin-heading{
   font-family: 'Raleway', Arial, sans-serif;
   color: black;
   font-size: 3rem;
     font-weight: bold;
}
.sr-only{
   font-family: 'Raleway', Arial, sans-serif;
   color: black;
   font-size: 1rem;
}
.form-signin {
     width: 100%;
    max-width: 370px;
     padding: 15px;
     margin: auto;
}
.form-signin .form-control {
     position: relative;
     box-sizing: border-box;
     height: auto;
     padding: 10px;
     font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
.find{
   font-size: small;
}
.footer{
   padding-left: 775px;
   padding-top: 1650px;
   position: fixed;
}

</style>

<body>
<div id="wrapper">
   <div id="section">
  <div class="container">
   <form class="form-signin" name="compLogin" method="post" action="${contextPath}/free/login.do">
      <h2 class="form-signin-heading">Please Sign in</h2>
      <label for="inputID" class="sr-only">ID : </label>
      <input type="text" class="form-control" name="free_id" placeholder="ID" required autofocus id="free_id"><br>
      <label for="inputPassword" class="sr-only">Password : </label>
      <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="free_pw">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <div class="input-field col s12">
          <p class="margin center medium-small sign-up">Aren't you a member? <a href="${contextPath}/free/basicForm.do">Sign up</a></p>
          <span class="find"><a href="javascript:popupid()">아이디 찾기</a> / <a href="javascript:popuppw()">비밀번호찾기</a></span>
        </div>
   </form>
</div>
   </div>
   <div id="footer" class="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
</div>
   
</body>
</html>