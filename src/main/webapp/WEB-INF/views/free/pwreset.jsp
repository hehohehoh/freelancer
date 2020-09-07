<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>비밀번호 재설정 완료창</title>
<script>
function MovePage() {
   //window.opener.top.location.href="login.do"
   opener.document.getElementById("free_id").value = document.getElementById("id").value
   // window.close();
   window.open("about:blank","_self").close();
}
</script>
</head>
<style>
   table {margin: auto; text-align: center;vertical-align: middle;  }
   .title{
      font-size: 30px;
      font-weight: bold;
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
  top:45%;
  left:30%;
  width:370px;
  height:100px;
  margin:-50px 0 0 -50px;
}
</style>
<body>
<div class="layer">
   <form>
      <input type="hidden" value="${id}" id="id"/>
      <table>   
         <tr>
               <TD class="title"><a class="id">${id}</a>님의 비밀번호가 <br> 재설정이 완료되었습니다.<br><Br><Br></TD>      
         </tr>
         <tr>
            <TD><input type="button" class="btn btn1" value="로그인 하러 가기" onclick="MovePage()"></TD>
         </tr>
      </table>
   </form>
   </div>
</body>
</html>
