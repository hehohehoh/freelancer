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
<title>기업 회원가입</title>
<script type="text/javascript">
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
		return;
	}
	f.comp_memail2.value=f.selectEmail.value;
	f.comp_memail2.readOnly=true;
	f.comp_memail1.focus();
}

function inNumber(){
	  if(event.keyCode<48 || event.keyCode>57){
	     event.returnValue=false;
	  }
}

</script>
</head>
<body>
	<form action="${contextPath}/comp/addCompany.do" method="post">
	<h1 align="center">기업 정보 등록창</h1>
	<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="comp_id"></td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input type="password" name="comp_pw"></td>
	    </tr>
	    <tr>
	      <td width="200"><p align="right">비밀번호 확인</td>
	      <td width="400"><input type="password" name="comp_pw"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">담당자이름</td>
	       <td width="400"><p><input type="text" name="comp_mname"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">담당자핸드폰번호</td>
	       <td width="400"><p><input type="text" name="comp_mhp"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">담당자 이메일</td>
	       <td width="400"><p>
	       <nobr>
	       <input name="comp_memail1" type="text">
	       @
	       <input name="comp_memail2" type="text" readonly="readonly">
		   <select name="selectEmail" onChange="changeMail();" style="width:100px;height:24px;" required>
	       		<option value="" selected>선택하세요</option>
	       		<option value="naver.com">naver.com</option>
	       		<option value="gmail.com">gmail.com</option>
	       		<option value="yahoo.co.kr">yahoo.co.kr</option>
	       		<option value="direct">직접입력</option>
	       </select>
	       </nobr>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">사업자번호</td>
	       <td width="400"><p><input type="text" name="comp_bnum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> ("-"제외 숫자만 입력하시오)</td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">회사 이름</td>
	       <td width="400"><p><input type="text" name="comp_name"></td>
	    </tr>

	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="가입하기"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>
</html>