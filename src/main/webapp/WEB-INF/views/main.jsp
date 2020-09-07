<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<c:set var="result" value="${param.result}" />
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 장치의 넓이와 일치, 일반적인 비율 1.0 -->
   <title>Main</title>
   <link rel="stylesheet" href="css/bootstrap.css"> 
   
   <c:choose>
         <c:when test="${result=='addcomp'}">
           <script>
                window.onload=function(){
                  alert("회원가입 승인처리가 24시간 이내로 처리 됩니다!!");
                }
           </script>
         </c:when>
   </c:choose>  
</head>
<style>
.basefont{ 
   font-family: "titlefont","serif";
}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }

body{
   background-color: black;
   padding-top: 100px;
}
.jumbotron {
   font-family: 'Raleway', Arial, sans-serif;
   background-color: black;
   text-shadow: white 0.2ms 0.2ms 0.2ms;
   color: white;
}
*,
*::before,
*::after {
   box-sizing: border-box;
}


.container {
   display: flex;
   align-items: center;
   justify-content: center;
   min-height: 10vh;
   background-color: black;
}

.text-center {
   font-family: 'Roboto', serif;
   -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
   position: relative;
   display: block;
   color: white;
   margin: 0;
   font-size: 4rem;
   line-height: 1;
   transform: translateY(6rem);
   animation: up 500ms linear forwards;
   z-index: 1;
   text-shadow: 0px 1px 1px rgba(255,255,255,1);
   
   &::before,
   &::after {
      position: absolute;
      content: '';
      width: 0px;
      height: 1px;
      left: 0;
      background-color: rgba(0,0,0,0.2);
      z-index: -1;
   }
   
   &::before {
      top: 1.4rem;
      animation: draw 500ms linear 1s forwards;
   }
   
   &::after {
      bottom: 0.4rem;
      animation: draw 500ms linear 1s forwards;
   }
   
}

.title-container {
   font-size: 0;
   position: relative;
   overflow: hidden;
   padding-bottom: 0.4rem;
}

@keyframes up {
   
   100% {
      transform: translateY(0);
   }
   
}

@keyframes draw {
   
   100% {
      width: 100%;
   }
   
}
/*@import url(https://fonts.googleapis.com/css?family=Raleway:500,900);*/
figure.snip1432 {
  float: left;
  font-family: 'Raleway', Arial, sans-serif; /*글자 폰트*/
  color: #fff;
  position: relative; 
  overflow: hidden;
  margin: 35px;
  min-width: 45%;
  max-width: 45%;
  width: 120%;
  background: #000000;
  color: #ffffff;
  text-align: center;
}
figure.snip1432 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.6s ease;
  transition: all 0.6s ease;
}
figure.snip1432 img {
  opacity: 0.8;
  width: 100%;
  vertical-align: top;
  -webkit-transition: opacity 0.35s;
  transition: opacity 0.35s;
}
figure.snip1432 figcaption {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
figure.snip1432 figcaption > div {
  height: 50%;
  overflow: hidden;
  width: 100%;
  position: relative;
}
figure.snip1432 h2,
figure.snip1432 h3 {
  margin: 0;
  position: absolute;
  left: 0;
  padding: 0 30px;
  text-transform: uppercase;
}
figure.snip1432 h2 {
  font-size: 3em;
  font-weight: 1000;
  top: 0;
}
figure.snip1432 h3 {
  font-size: 2em;
  bottom: 0;
  font-weight: 500;
}
figure.snip1432 h3:nth-of-type(2) {
  opacity: 0;
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
}
figure.snip1432 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
}
figure.snip1432:hover img,
figure.snip1432.hover img {
  opacity: 0.3;
  -webkit-filter: grayscale(100%);
  filter: grayscale(100%);
}
figure.snip1432:hover figcaption h3:first-of-type,
figure.snip1432.hover figcaption h3:first-of-type {
  -webkit-transform: translateY(150%);
  transform: translateY(150%);
  opacity: 0;
}
figure.snip1432:hover figcaption h3:nth-of-type(2),
figure.snip1432.hover figcaption h3:nth-of-type(2) {
  opacity: 1;
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}
</style>
<body>
<div class="jumbotron">
<div class="container">
   <div class="title-container">
      <h1 class="text-center"><a class="basefont">Welcome to the freelance home page</a></h1>
   </div>
</div>

<figure class="snip1432">
  <img src="${contextPath}/resources/images/freelancer.jpeg" alt="sample36" />
  <figcaption>
    <div>
      <h3>Are you a freelancer?</h3>
      <h3>Go freelancer Page--></h3>
    </div>
    <div>
      <h2>Freelancer</h2>
    </div>
  </figcaption>
  <a href="${contextPath}/free/loginForm.do"></a>
</figure>

<figure class="snip1432">
   <img src="${contextPath}/resources/images/company.jpeg" alt="sample45" />
     <figcaption>
     <div>
      <h3>Are you a company?</h3>
      <h3>Go company Page--></h3>
    </div>
    <div>
      <h2>Company</h2>
    </div>
</figcaption>
  <a href="${contextPath}/comp/loginForm.do"></a>
</figure>
</div>
</body>
</html>