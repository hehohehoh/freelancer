<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
#comp_cnum{
  border-color: darkgrey;
  border-style: solid;
  border-width: 1px;
   background-color: rgb(240, 240, 240);
   color: rgb(109, 109, 109);
  padding: 2px 0px;
} 
 </style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

window.onload = function(){
	var form = document.career;
	var len = form.lastcnum.value;
	console.log(len);
	for(i=1; i <= len ; i++){
		var str = "btn" + String(i);
		console.log(str);
		document.getElementById(str).style.display = "none";
	}
	document.getElementById("cmit").style.display = "none";
}

function career_send(){
	var frmComp = document.invalue;

	var comp_pname = frmComp.comp_pname.value;
	var comp_pwork = frmComp.comp_pwork.value;
	var comp_startdate = frmComp.comp_startdate.value;
	var comp_finishdate = frmComp.comp_finishdate.value;
	
    if(comp_pname.length==0 || comp_pname==""){
		alert("프로젝트 이름을 입력해주세요");
	}else if(comp_pwork.length==0 || comp_pwork==""){
		alert("프로젝트 내용을 입력해주세요");
	}else if(comp_startdate.length==0 || comp_startdate==""){
		alert("프로젝트 시작날짜를 입력해주세요");
	}else if(comp_finishdate.length==0 || comp_finishdate==""){
		alert("프로젝트 종료날짜를 입력해주세요");
	}else{
		frmComp.method = "post";
		frmComp.action = "${contextPath}/comp/careerin.do";
		frmComp.submit();
		document.getElementById("cmit").style.display = "none";
	}
}


function recareer_send(){
	 
	var frmComp = document.career;

	frmComp.method = "post";
	frmComp.action = "${contextPath}/comp/careerre.do";
	frmComp.submit();
	
}

function comp_able(data){
	
	var form = document.career;
	var str = 'button' + String(data);
	var str2 = 'btn' + String(data);
	
	var ch = 'change' + String(data);
	
	
	
	/* document.getElementById("btn").style.display = "block"; */
	
	var button = document.getElementById(str).value;
	console.log(button);
	
	var form = document.career;
	var cnum = form.lastcnum.value;
	
	if(data==data){
		$('.change'+data).attr('disabled',false);
		for(i=1; i<cnum+1; i++){
			$("#button"+i).css("display","none");}
			document.getElementById(str2).style.display = "inline";
		
		
		
	}

}

function add_textbox(){
	
	var form = document.career;
	var cnum = form.lastcnum.value;
	var cnum = Number(cnum) + 1;
	
	document.getElementById("t_space").innerHTML +=
		"<br>프로젝트 번호 : <input type='number' id='comp_cnum' name='comp_cnum' value='"+cnum+"' readonly><br>";
	document.getElementById("t_space").innerHTML +=
		"<br>프로젝트 이름 : <input type='text' id='comp_pname' name='comp_pname' ><br>";
	document.getElementById("t_space").innerHTML +=
		"회사 이력 : <input type='text' id='comp_pwork' name='comp_pwork' ><br>";
	document.getElementById("t_space").innerHTML +=
		"시작 날짜 : <input type='date' id='comp_startdate' name='comp_startdate' >";
	document.getElementById("t_space").innerHTML +=
		" 종료 날짜 : <input type='date' id='comp_finishdate' name='comp_finishdate' ><br><br>";
	
	form.lastcnum.value = cnum;
	
	document.getElementById("add").style.display = "none";
	document.getElementById("cmit").style.display = "inline";
}

</script>	
</head>
<body>
<h1>마이페이지</h1>
<h2>회사이력 입력창</h2>

<form name="career" action = "${contextPath}/comp/careerre.do" method="post">

<c:choose>
	
	<c:when test="${career == null}" >
		<td colspan=6><b>회사 이력이 없습니다.</b>
	</c:when>
	
	<c:when test="${career != null}" >
		<c:forEach var="career" items="${career}" varStatus="buNum">
				프로젝트 번호 : <input class="change${buNum.count}" id="comp_cnum" name="comp_cnum" type="number" value="${career.comp_cnum}" readonly><br>
				프로젝트 이름 : <input class="change${buNum.count}" id="comp_pname" name="comp_pname" type="text" value="${career.comp_pname}" disabled><br>
				회사이력 : <input class="change${buNum.count}" id="comp_pwork" name="comp_pwork" type="text" value="${career.comp_pwork}" disabled> <br>
				시작 날짜 : <input class="change${buNum.count}" id="comp_startdate" name="comp_startdate" type="date" value="${career.comp_startdate}" disabled>
				종료 날짜 : <input class="change${buNum.count}" id="comp_finishdate" name="comp_finishdate" type="date" value="${career.comp_finishdate}" disabled>
				<input type="button" id="button${buNum.count}" name="button${buNum.count}" value="수정" onclick="comp_able(${buNum.count})" />
				<input type="button" id="btn${buNum.count}" name="btn${buNum.count}" value="수정완료" onclick="recareer_send()"><br><br>
		</c:forEach>
	</c:when> 
</c:choose>
	<input type="hidden" name="lastcnum" value="${fn:length(career)}">
</form>

<form name="invalue" >
	<div id="t_space">
		
	</div>
	<input type="button" id="add" value="추가" onclick="add_textbox()">
 	<input type="button" id="cmit" value="추가완료" onclick="career_send()"><br>
 	
</form>

	
	
</body>
</html>