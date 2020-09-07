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
   <title>비밀번호 찾기</title>
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <c:choose>
      <c:when test="${result=='findpwFailed'}">
       <script>
            window.onload=function(){
               alert("정보에 맞는 계정이 없습니다.");
            }
       </script>
      </c:when>
   </c:choose>  
   <script>
   
      function find_pw(){
         
         var frmFree = document.frmFree;
         var free_id = frmFree.free_id.value;
         var free_firstName = frmFree.free_firstName.value;
         var free_lastName = frmFree.free_lastName.value;
         var free_hp = frmFree.free_hp.value;
         var free_email1 = frmFree.free_email1.value;
         var free_email2 = frmFree.free_email2.value;
         
         if(free_id == ""){
            alert("ID를 입력해주세요.");
            frmFree.free_id.focus();
         }else if(free_lastName == ""){
            alert("성을 입력해주세요.");
            frmFree.free_firstName.focus();
         }else if(free_firstName == ""){
            alert("이름을 입력해주세요.");
            frmFree.free_lastName.focus();
         }else if(free_hp == ""){
            alert("핸드폰 번호를 입력해주세요.");
            frmFree.free_hp.focus();
         }else if(free_email1 == "" || free_email2 == ""){
            alert("이메일을 입력해주세요.");
            frmFree.free_email1.focus();
         }else{
            frmFree.method="post";
            frmFree.action="${contextPath}/free/findpwdo.do";
            frmFree.submit();
         }
      
      
      }

      
      function changeMail(){
         var f = document.frmFree;
         if(f.selectEmail.value==""){
            f.free_email1.value="";
            f.free_email2.value="";
            f.free_email2.readOnly=true;
            f.free_email1.focus();
            return;
         }
         if(f.selectEmail.value=="direct"){
            f.free_email2.value="";
            f.free_email2.readOnly=false;
            f.free_email1.focus();
            f.free_email2.placeholder="직접입력";
            
            return;
         }
            f.free_email2.value=f.selectEmail.value;
            f.free_email2.readOnly=true;
            f.free_career.focus();
            
         }
      
   </script>

</head>
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
</style>
<body>
   <form name="frmFree">
   <h1  class="title" align="center" >Find password</h1>
   <table>
      <tr>
         <td width="400">아이디</td>
      </tr>
      <tr>
         <td width="400"><input type="text" name="free_id" id="free_id" style='width:100%;background-color:white;border:0;outline:0;'/><hr></td>
      </tr>
      <tr>
         <td width="400">성</td>
      </tr>
      <tr>
         <td width="400"><input type="text" name="free_lastName"style='width:100%;background-color:white;border:0;outline:0;'><hr></td>
       </tr>
       <tr>
          <td width="400">이름</td>
      </tr>
      <tr>
          <td width="400"><input type="text" name="free_firstName"style='width:100%;background-color:white;border:0;outline:0;'><hr></td>
       </tr>
       <tr>
          <td width="400">전화번호</td>
       </tr>
       <tr>
          <td width="400"><input type="text" name="free_hp" placeholder="&quot; - &quot;없이 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style='width:100%;background-color:white;border:0;outline:0;'><hr></td>
       </tr>
       <tr>
          <td width="400">이메일</td>
       </tr>
       <tr>
          <td width="400">
          <nobr>
          <input type="text" name="free_email1" style='background-color:white;border:0;outline:0;'> 
          @
          <input type="text" name="free_email2" readonly style='background-color:white;border:0;outline:0;' placeholder='선택하세요'>
          <select name="selectEmail" onChange="changeMail();" style="width:100px;height:24px;border-radius: 8px;" required>
                <option value="" selected>선택하세요</option>
                <option value="naver.com" >naver.com</option>
                <option value="gmail.com" >gmail.com</option>
                <option value="yahoo.co.kr" >yahoo.co.kr</option>
                <option value="direct" >직접입력</option>
          </select> 
          </nobr><hr>
          </td>
       </tr>
       <tr>
          <td width="400"><input type="button" value="비밀번호 찾기" class="btn btn1" onclick="find_pw()"></td>
       </tr>
   </table>
   </form>
</body>
</html>