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
<title>아이디찾기 결과창1</title>
<script>
function MovePage() {
   //window.opener.top.location.href="login.do"
   opener.document.getElementById("comp_id").value = document.getElementById("id").value
   window.open("about:blank","_self").close();
}
</script>
</head>
<style>
   table {text-align: center; width: 300px; height: 200px;  }
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
      .btn1:hover {
         background-color: #4169E1;
         color: white;
      }
      .layer{
           position:absolute;
           top:40%;
           left:35%;
          margin:-50px 0 0 -50px;
      }
</style>
<body>
<div class="layer">
   <form>
      <input type="hidden" value="${id}" id="id"/>
      <table  id="tbl">   
         <tr>
               <TD class="title">찾으시는 아이디는<br> <a class="id">${id}</a>입니다.<br><Br><Br></TD>      
         </tr>
         <tr>
            <TD><input type="button" class="btn btn1" value="로그인 하러 가기" onclick="MovePage()"></td>
         </tr>
      </table>
   </form>
</div>
</body>
</html>