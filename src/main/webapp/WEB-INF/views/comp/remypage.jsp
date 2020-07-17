<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function comp_send(){
	
	var Comp = document.info;
	
	var comp_mname = Comp.comp_mname.value;
	var comp_mhp = Comp.comp_mhp.value;
	var comp_memail = Comp.comp_memail.value;
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	if(exptext.test(comp_memail)==false){
        alert("이메일형식이 올바르지 않습니다.");
        return false;
    }else if(comp_mname.length==0 || comp_mname==""){
		alert("담당자 이름을 입력해주세요");
	}else if(comp_mhp.length==0 || comp_mhp==""){
		alert("담당자 핸드폰 번호를 입력해주세요");
	}else if(comp_memail.length==0 || comp_memail==""){
		alert("담당자 이메일을 입력해주세요");
	}else{
		Comp.method = "post";
		Comp.action = "${contextPath}/comp/remypage.do";
		Comp.submit();
		$('.change').attr('disabled',true);
	}
}

function comp_able(){
	
	$('.change').attr('disabled',false);
	
}

function comp_disable(){
	
	$('.change').attr('disabled',true);
	
}

</script>
</head>
<body>

<form name="info">	
		<h1>마이페이지</h1>
		<h2>개인정보 입력창</h2>
		
		아이디 : <input id="comp_id" name="comp_id" type="text" value="${company.comp_id}" disabled> <br>
		담당자 이름 : <input class="change" id="comp_mname" name="comp_mname" type="text" value="${company.comp_mname}" disabled> <br>
		담당자 전화번호 : <input class="change" id="comp_mhp" name="comp_mhp" type="text" value="${company.comp_mhp}" disabled> <br>
		담당자 이메일 : <input class="change" type="email" id="comp_memail" name="comp_memail" value="${company.comp_memail}" disabled><br>
		사업자번호 : <input id="comp_bnum" name="comp_bnum" type="text" value="${company.comp_bnum}" disabled> <br>
		회사이름 : <input id="comp_name" name="comp_name" type="text" value="${company.comp_name}" disabled><br>	
		
		<input type="button" value="수정하기 " onclick = "comp_able()">
		<input type="button" value="수정완료" onclick="comp_send()"><br>
		
		<a href="${contextPath}/comp/recareer.do">기업이력 수정하기-></a>
		<a href="${contextPath}/comp/mypwreset.do">비밀번호 변경하기-></a>
</form>

</body>
</html>