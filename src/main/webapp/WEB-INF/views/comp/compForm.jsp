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
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>기업 회원가입</title>
	
	<!-- 아이디중복체크 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	function checkId(){
	    var comp_id = ($('#comp_id').val)();
	    $.ajax({
	        url:'${contextPath}/comp/overlap.do',
	        type:'post',
	        data:{comp_id:comp_id},
	        success:function(data){
	            if($.trim(data)==0){
	                $('#chkMsg').html("사용가능한 ID입니다.");
	            }else{
	                $('#chkMsg').html("ID가 중복되었습니다");
	            }
	        },
	        error:function(){
	        	alert("에러입니다");	
	        }
	     });
	};
	</script>
	
	<script>
		function button1_click() {
          		var pw1 = document.getElementById("comp_pw");
          		var pw2 = document.getElementById("comp_pw_re");
           		var divs = $("#pw");
          		if(pw1.value==pw2.value){
        		  divs.html("<p style='color:green;'>값이 일치</p>");
               	
           		 }else{
              		divs.html("<p style='color:red;'>값이 일치하지않습니다.</p>");
            	}
        }
  </script>
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
	      <td width="400"><input type="text" name="comp_id" id="comp_id" oninput="checkId()" />
		<br><span id = "chkMsg"></span>
		</td> 
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input type="password" id="comp_pw" name="comp_pw" onchange="button1_click();"></td>
	    </tr>
	    <tr>
	      <td width="200"><p align="right">비밀번호 확인</td>
	      <td width="400"><input type="password"  id="comp_pw_re" name="comp_pw_re" onchange="button1_click();"><div id = "pw"></div></td>
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
