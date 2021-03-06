<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 결과창1</title>
<script>
/* 빈칸 확인 및 값들넘겨주기 */
function pw_reset(){
   var free_pw = pwreset.free_pw.value;
   var free_pw_re = pwreset.free_pw_re.value;
   
   if(free_pw.length==0 || free_pw==""){
      alert("비밀번호를 입력해주세요");
   }else if(free_pw_re.length==0 || free_pw_re==""){
      alert("비밀번호 확인을 입력해주세요");
   }else if(free_pw.length < 8 || free_pw.length > 16){
      alert("비밀번호를 8~16자리로 입력해주세요");
   }else{
      pwreset.method = "post";
      pwreset.action = "${contextPath}/free/pwreset.do";
      pwreset.submit();
   }
   
}

function Pwd(){
   var f1 = document.forms[0];
   var pw1 = f1.free_pw.value;
   if(pw1==""){
      document.getElementById('Pwd').innerHTML = " ";
   }else if(pw1.length < 8 || pw1.length > 16){
      document.getElementById('Pwd').style.color ="black";
      document.getElementById('Pwd').innerHTML = "8~16자리로 입력해주세요";
   }else{
      document.getElementById('Pwd').innerHTML = " ";
   }
}

/* 비밀번호 조건확인 및 일치확인  */
function checkPwd(){
   var f1 = document.forms[0];
   var pw1 = f1.free_pw.value;
   var pw2 = f1.free_pw_re.value;
   if(pw2==""){
      document.getElementById('checkPwd').innerHTML = " ";
   }else if(pw1!=pw2){
      document.getElementById('checkPwd').style.color = "red";
      document.getElementById('checkPwd').innerHTML = "동일한 비밀번호를 입력하세요.";
   }else{
      document.getElementById('checkPwd').style.color ="green";
      document.getElementById('checkPwd').innerHTML = "비밀번호가  동일합니다.";
   }
}
</script>
<style>
   table {margin: auto;}
   .title{
      font-size: 50px;
      font-family: "titlefont","serif";
   }
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/ROCK.TTF");
   }
   .id{
      font-weight: bold;
      color: red;
   }
   .btn {
         background-color: #000066;
         padding: 15px 30px;
         margin: 2px;
         border: none;
         text-align: center;
         text-decoration: none;
         font-size: 16px;
         width:100%;
             color: white;
         display: inline-block;
         cursor: pointer;
         -webkit-transition-duration: 0.4s;
         transition-duration: 0.4s;
         border-radius: 8px;
      }
      .btn1:hover{
         background-color: #4169E1;
         color: white;
      }
      .layer{
           position:absolute;
           top:10%;
           left:25%;
          width:400px;
          height:400px;
          margin:-30px 0 0 -30px;
      }
</style>
</head>
<body>
<div class="layer">
   <form name="pwreset">
      <input type="hidden" value="${id}" id="free_id" name="free_id"/>
            <table>   
         <tr>
              <TD><h1 class="title" align="center"><a class="id">${id}</a>님의 <br>비밀번호 재설정</h1></TD>      
         </tr>
         <tr>
               <td width="400">비밀번호</td>
            </tr>
         <tr>
               <td width="400"><input type="password" name="free_pw" id="free_pw" onkeyup="Pwd()"style='width:100%;background-color:white;border:0;outline:0;'>
               <br><span id="Pwd" style="font-size:70%;"></span><hr>
               </td>
          </tr>
          <tr>
               <td width="400">비밀번호 확인</td>
            </tr>
         <tr>
               <td width="400">
                  <input type="password" name="free_pw_re" onkeyup="checkPwd()" style='width:100%;background-color:white;border:0;outline:0;'/>
                  <br><span id="checkPwd" style="font-size:70%;"></span><hr>
               </td>
          </tr>
         <tr>
            <td><p align="center"><input type="button"  class="btn btn1" value="재설정하기" onclick="pw_reset()"></p></td>
         </tr>
      </table>
   </form>
   </div>
</body>
</html>