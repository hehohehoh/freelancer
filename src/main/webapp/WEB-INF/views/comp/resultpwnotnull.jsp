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
<title>비밀번호찾기 결과창1</title>
<script>



/* 빈칸 확인 및 값들넘겨주기 */
function pw_reset(){
	var comp_pw = pwreset.comp_pw.value;
	var comp_pw_re = pwreset.comp_pw_re.value;
	

	if(comp_pw.length==0 || comp_pw==""){
		alert("비밀번호를 입력해주세요");
	}else if(comp_pw_re.length==0 || comp_pw_re==""){
		alert("비밀번호 확인을 입력해주세요");
	}else if(comp_pw.length < 8 || comp_pw.length > 16){
		alert("비밀번호를 8~16자리로 입력해주세요");
	}else{
		pwreset.method = "post";
		pwreset.action = "${contextPath}/comp/pwreset.do";
		pwreset.submit();
	}
	
}

function Pwd(){
	var f1 = document.forms[0];
	var pw1 = f1.comp_pw.value;
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
	var pw1 = f1.comp_pw.value;
	var pw2 = f1.comp_pw_re.value;
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
   table {margin: auto; border: 1px solid black; border-collapse: collapse;}
</style>
</head>
<body>
	<form name="pwreset">
		<input type="hidden" value="${id}" id="comp_id" name="comp_id"/>
				<table>	
			<tr>
              <TD colspan="2"><p align="center">${id}님의 비밀번호 재설정</p></TD>		
			</tr>
			<tr>
	      		<td width="200"><p align="right">비밀번호</td>
	      		<td width="400"><input type="password" name="comp_pw" id="comp_pw" onkeyup="Pwd()">
	      		<br><span id="Pwd" style="font-size:70%;"></span>
	      		</td>
	    	</tr>
	    	<tr>
	      		<td width="200"><p align="right">비밀번호 확인</td>
	      		<td width="400">
	      			<input type="password" name="comp_pw_re" onkeyup="checkPwd()" />
	      			<br><span id="checkPwd" style="font-size:70%;"></span>
	      		</td>
	    	</tr>
			<tr>
				<td colspan="2"><p align="center"><input type="button" value="재설정하기" onclick="pw_reset()"></p></td>
			</tr>
		</table>
	</form>
</body>
</html>