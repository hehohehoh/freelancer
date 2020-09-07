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
   <!-- 아이디중복    체크 -->
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
   
   <script type="text/javascript">
   
   /* 빈칸 확인 및 값들넘겨주기 */
   function comp_send(){
      var frmComp = document.frmComp;
      var comp_id = frmComp.comp_id.value;
      var comp_mname = frmComp.comp_mname.value;
      var comp_mhp = frmComp.comp_mhp.value;
      var comp_memail1 = frmComp.comp_memail1.value;
      var comp_memail2 = frmComp.comp_memail2.value;
      var comp_bnum = frmComp.comp_bnum.value;
      
      if(comp_id.length==0 || comp_id==""){
         alert("ID를 입력해주세요");
      }else if(comp_mname.length==0 || comp_mname==""){
         alert("담당자 이름을 입력해주세요");
      }else if(comp_mhp.length==0 || comp_mhp==""){
         alert("담당자 핸드폰 번호를 입력해주세요");
      }else if(comp_memail1.length==0 || comp_memail1==""){
         alert("담당자 이메일를 입력해주세요");
      }else if(comp_memail2.length==0 || comp_memail2==""){
         alert("담당자 이메일를 입력해주세요");
      }else if(comp_bnum.length==0 || comp_bnum==""){
         alert("사업자번호를 입력해주세요");
      }else{
         frmComp.method = "post";
         frmComp.action = "${contextPath}/comp/findpwdo.do";
         frmComp.submit();
      }
      
   }

     /* 이메일 콤보박스 선택별 효과 */
   function changeMail(){
      var f = document.forms[0];
      if(f.selectEmail.value==""){
         f.comp_memail1.value="";
         f.comp_memail2.value="";
         f.comp_memail2.readOnly=true;
         f.comp_memail1.focus();
      return;
      }
      if(f.selectEmail.value=="direct"){
         f.comp_memail2.value="";
         f.comp_memail2.readOnly=false;
         f.comp_memail1.focus();
         f.comp_memail2.placeholder="직접입력";
         
      return;
      }
         f.comp_memail2.value=f.selectEmail.value;
         f.comp_memail2.readOnly=true;
         f.comp_memail1.focus();
         
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
</head>
<body>
   <form name="frmComp">
   <h1 class="title" align="center">Find password</h1>
   <table>
      <tr>
         <td width="400">아이디</td>
      </tr>
       <tr>
         <td width="400"><input type="text" name="comp_id" id="comp_id" style='width:100%;background-color:white;border:0;outline:0;'/> <hr>
        </td> 
      </tr>
       <tr>
          <td width="400">담당자이름</td>
       </tr>
       <tr>
          <td width="400"><input type="text" name="comp_mname"style='width:100%;background-color:white;border:0;outline:0;'><hr></td>
       </tr>
       <tr>
          <td width="400">담당자핸드폰번호</td>
       </tr>
       <tr>
          <td width="400"><input type="text" name="comp_mhp" style='width:100%;background-color:white;border:0;outline:0;'onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="&quot; - &quot;없이 입력"><hr></td>
       </tr>
       <tr>
          <td width="400">담당자 이메일</td>
       </tr>
       <tr>
          <td width="400">
          <nobr>
          <input name="comp_memail1" type="text"style='background-color:white;border:0;outline:0;'>
          @
          <input name="comp_memail2" type="text" readonly="readonly"style='background-color:white;border:0;outline:0; placeholder:선택하세요'>
         <select name="selectEmail" onChange="changeMail();" style="height:24px;border-radius: 8px;" required>
                <option value="" selected>선택하세요</option>
                <option value="naver.com">naver.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="yahoo.co.kr">yahoo.co.kr</option>
                <option value="direct">직접입력</option>
          </select>
          </nobr>
          <hr>
       </tr>
       <tr>
          <td width="400">사업자코드</td>
       </tr>
       <tr>
          <td width="400"><input type="text" name="comp_bnum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"style='width:100%;background-color:white;border:0;outline:0;' placeholder="&quot; - &quot;없이 입력"><hr></td>
       </tr>
       <tr>
          <td width="400"><input type="button" value="비밀번호 찾기" class="btn btn1" onclick="comp_send()"></td>
       </tr>
   </table>
   </form>
</body>
</html>