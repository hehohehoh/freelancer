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
	<title>회원가입</title>
	
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                document.getElementById("free_addr").value = addr;
	                
	            }
	        }).open();
	        
    	
    	}
	</script>
</head>
<style>
	table {margin: auto; border: 1px solid black; border-collapse: collapse;}
</style>
<body>
	<form method="post" action="${contextPath}/free/addFree.do">
	<h1  class="text_center">프리랜서 등록 창</h1>
	<table>
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="free_id"></td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input type="password" name="free_pw"></td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">성</td>
	      <td width="400"><input type="text" name="free_firstName"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p><input type="text" name="free_lastName"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">전화번호</td>
	       <td width="400"><p><input type="text" name="free_hp"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">생년월일</td>
	       <td width="400"><p><input type="date" maxlength="8"  name="free_bir"></td>
	    </tr>
	
	 
	    <tr>
	       <td width="200"><p align="right">성별</td>
	       <td><select name="free_gender"> 
	       		<option value="none">성별</option>
	       		<option value="0">남자</option>
	       		<option value="1">여자</option>
	    		</select>
	    </tr>
	 
	    <tr>
	       <td width="200"><p align="right">주소</td>
	       <td width="400"><p>
			<input type="text" id="free_addr" name="free_addr" placeholder="주소" size="40">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색하기"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p><input type="text" name="free_email"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">경력갯수</td>
	       <td width="400"><p><input type="number" maxlength="2"  name="free_career"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">수준</td>
	       <td><select name="free_level"> 
	       		<option value="초급">초급</option>
	       		<option value="중급">중급</option>
	       		<option value="고급">고급</option>
	    		</select>
	    </tr>
	    

	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="가입하기"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>
</html>