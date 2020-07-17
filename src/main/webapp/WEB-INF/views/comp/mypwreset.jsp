<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 비밀변경</title>
<script>

function check(){
		var form = document.mypw;
		
		var mypw = form.my_pw.value;
		var repw = form.re_pw.value;
		
		if(repw==""){
			document.getElementById('check').innerHTML = " ";
		}else if(repw.length < 8 || repw.length > 16){
			document.getElementById('check').style.color ="black";
			document.getElementById('check').innerHTML = "8~16자리로 입력해주세요";
		}else if(mypw==repw){
			document.getElementById('check').style.color = "red";
			document.getElementById('check').innerHTML = "동일한 비밀번호입니다. 새로운 비밀번호를 입력하시오.";
		}else{
			document.getElementById('check').style.color ="green";
			document.getElementById('check').innerHTML = "비밀번호가  적합합니다.";
		}
}

function checkPwd(){
	
	var form = document.mypw;

	var repw = form.re_pw.value;
	var rerepw = form.rere_pw.value;
	
	if(rerepw==""){
		document.getElementById('checkPwd').innerHTML = " ";
	}else if(rerepw.length < 8 || rerepw.length > 16){
		document.getElementById('checkPwd').style.color ="black";
		document.getElementById('checkPwd').innerHTML = "8~16자리로 입력해주세요";
	}else if(repw!=rerepw){
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "비밀번호가 다릅니다. 다시입력해주세요.";
	}else{
		document.getElementById('checkPwd').style.color ="green";
		document.getElementById('checkPwd').innerHTML = "비밀번호가  동일합니다.";
	}
}
</script>

</head>
<body>
<form name="mypw" method="post"  action="${contextPath}/comp/mypwreset.do">
		현재 비밀번호 : <input type="password" id="my_pw" name="my_pw" /><br>
		변경 비밀번호 : <input type="password" id="re_pw" name="re_pw" onkeyup="check()" /> <span id="check" style="font-size:70%;"></span> <br>
		변경 비밀번호 확인 : <input type="password" id="rere_pw" name="rere_pw" onkeyup="checkPwd()" /> <span id="checkPwd" style="font-size:70%;"></span> <br>
		<input type="submit" value="확인" />
</form>
</body>
</html>