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
	<!-- 아이디중복체크 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	function comp_send(){
		var frmComp = document.frmComp;
		var comp_id = frmComp.comp_id.value;
		var comp_pw = frmComp.comp_pw.value;
		var comp_pw_re = frmComp.comp_pw_re.value;
		var comp_mname = frmComp.comp_mname.value;
		var comp_mhp = frmComp.comp_mhp.value;
		var comp_memail1 = frmComp.comp_memail1.value;
		var comp_memail2 = frmComp.comp_memail2.value;
		var comp_bnum = frmComp.comp_bnum.value;
		var comp_name = frmComp.comp_name.value;
		
		if(comp_id.length==0 || comp_id==""){
			alert("ID를 입력해주세요");
		}else if(comp_id.length < 6 || comp_id.length > 12){
			alert("ID를 6~12자리로 입력해주세요");
		}else if(comp_pw.length==0 || comp_pw==""){
			alert("비밀번호를 입력해주세요");
		}else if(comp_pw_re.length==0 || comp_pw_re==""){
			alert("비밀번호 확인을 입력해주세요");
		}else if(comp_pw.length < 8 || comp_pw.length > 16){
			alert("비밀번호를 8~16자리로 입력해주세요");
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
		}else if(comp_name.length==0 || comp_name==""){
			alert("기업 이름을 입력해주세요");
		}else{
			frmComp.method = "post";
			frmComp.action = "${contextPath}/comp/addCompany.do";
			frmComp.submit();
		}
	}
	
	
	function checkId(){
	    var comp_id = ($('#comp_id').val)();
	    $.ajax({
	        url:'${contextPath}/comp/overlap.do',
	        type:'post',
	        data:{comp_id:comp_id},
	        success:function(data){
	        	if($.trim(data)==0){
	        		if(comp_id==""){
	        			$('#chkMsg').html(" ");
	        		}else if(comp_id.length < 6 || comp_id.length > 12){
	        			$('#chkMsg').html("6~12자리로 입력해주세요");
	        			$('#chkMsg').css("color","black");
	        		}else{
	                	$('#chkMsg').html("사용가능한 ID입니다.");
	                	$('#chkMsg').css("color","green");
	        		}
	            }else{
	                $('#chkMsg').html("ID가 중복되었습니다");
	                $('#chkMsg').css("color","red");
	            }
	        },
	        error:function(){
	        	alert("에러입니다");	
	        }
	     });
	};
	

	function checkPwd(){
		var f1 = document.forms[0];
		var pw1 = f1.comp_pw.value;
		var pw2 = f1.comp_pw_re.value;
		if(pw2==""){
			document.getElementById('checkPwd').innerHTML = " ";
		}else if(pw2.length < 8 || pw2.length > 16){
			document.getElementById('checkPwd').style.color ="black";
			document.getElementById('checkPwd').innerHTML = "8~16자리로 입력해주세요";
		}else if(pw1!=pw2){
			document.getElementById('checkPwd').style.color = "red";
			document.getElementById('checkPwd').innerHTML = "동일한 비밀번호를 입력하세요.";
		}else{
			document.getElementById('checkPwd').style.color ="green";
			document.getElementById('checkPwd').innerHTML = "비밀번호가  동일합니다.";
		}
	}
  
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
<style>
   table {margin: auto; border: 1px solid black; border-collapse: collapse;}
</style>
</head>
<body>
	<form name="frmComp">
	<h1 align="center">기업 정보 등록창</h1>
	<table>
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="comp_id" id="comp_id" oninput="checkId()" onKeyup="this.value=this.value.replace(/[!-/]|[^\a-z\0-9]/gi,'');"/>
		  <br><span id="chkMsg" style="font-size:70%;"></span>
		  </td> 
	   </tr>
	    <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input type="password" name="comp_pw"></td>
	    </tr>
	    <tr>
	      <td width="200"><p align="right">비밀번호 확인</td>
	      <td width="400"><input type="password" name="comp_pw_re" onkeyup="checkPwd()" />
	      <br><span id="checkPwd" style="font-size:70%;"></span></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">담당자이름</td>
	       <td width="400"><p><input type="text" name="comp_mname"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">담당자핸드폰번호</td>
	       <td width="400"><p><input type="text" name="comp_mhp" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
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
	       <td width="200"><p align="right">사업자코드</td>
	       <td width="400"><p><input type="text" name="comp_bnum" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> ("-"제외 숫자만 입력하시오)</td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">회사 이름</td>
	       <td width="400"><p><input type="text" name="comp_name"></td>
	    </tr>

	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="button" value="가입하기" onclick="comp_send()"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>
</html>