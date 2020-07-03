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
<title>아이디 찾기</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	
	<c:choose>
		<c:when test="${result=='findidFailed'}">
 		<script>
   			window.onload=function(){
   				alert("찾는 아이디가 없습니다.");
   			}
 		</script>
		</c:when>
	</c:choose>  
	<script type="text/javascript">
		
	/* 빈칸 확인 및 값들넘겨주기 */
	function free_send(){
		var frmfindid = document.frmfindid;
		var free_lastName = frmfindid.free_lastName.value;
		var free_firstName = frmfindid.free_firstName.value;
		var free_hp = frmfindid.free_hp.value;
		var free_email1 = frmfindid.free_email1.value;
		var free_email2 = frmfindid.free_email2.value;
		
		
		if(free_lastName.length==0 || free_lastName==""){
			alert("성을 입력해주세요");
		}else if(free_firstName.length==0 || free_firstName==""){
				alert("이름을 입력해주세요");
		}else if(free_hp.length==0 || free_hp==""){
				alert("전화번호을 입력해주세요");
		}else if(free_email1.length==0 || free_email1==""){
				alert("이메일을 입력해주세요");
		}else if(free_email2.length==0 || free_email2==""){
				alert("이메일을 입력해주세요");
		}else{
			frmfindid.method = "post";
			frmfindid.action = "${contextPath}/free/findiddo.do";
			frmfindid.submit();
		}
		
	}
	
  	/* 이메일 콤보박스 선택별 효과 */		
	function changeMail(){
		var f = document.frmfindid;
		if(f.selectEmail.value==""){
			f.free_email1.value="";
			f.free_email2.value="";
			f.free_email2.readOnly=true;
			f.free_email1.focus();
			return;
		}
		if(f.selectEmail.value=="direct"){
			f.free_email2.value="";
			f.free_email2.readOnly=false;
			f.free_email1.focus();
			
			return;
		}
			f.free_email2.value=f.selectEmail.value;
			f.free_email2.readOnly=true;
			
		}
</script>

</head>
<style>
	table {margin: auto; border: 1px solid black; border-collapse: collapse;}
</style>
<body>
	<form name="frmfindid">
	<h1 align="center">아이디 찾기 창</h1>
	<table  style='align:center'>
	   <tr>
	      <td width="200"><p align="right">성</td>
	      <td width="400"><input type="text" name="free_lastName"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" name="free_firstName"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화번호</td>
	       <td width="400"><p><input type="text" name="free_hp" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p>
	       <nobr>
	       <input type="text" name="free_email1">
	       @
	       <input type="text" name="free_email2" readonly>
	       <select name="selectEmail" onChange="changeMail();" style="width:100px;height:24px;" required>
		       	<option value="" selected>선택하세요</option>
		       	<option value="naver.com" >naver.com</option>
		       	<option value="gmail.com" >gmail.com</option>
		       	<option value="yahoo.co.kr" >yahoo.co.kr</option>
		       	<option value="direct" >직접입력</option>
	       </select> 
	       </nobr>
	       </td>
	    </tr>


	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="button" value="찾아보기" onclick="free_send()"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>
</html>