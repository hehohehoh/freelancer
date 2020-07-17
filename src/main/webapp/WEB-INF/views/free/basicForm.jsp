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
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
		function free_send(){
			
			var frmFree = document.frmFree;
			var free_id = frmFree.free_id.value;
			var free_pw = frmFree.free_pw.value;
			var free_pw_re = frmFree.free_pw_re.value;
			var free_firstName = frmFree.free_firstName.value;
			var free_lastName = frmFree.free_lastName.value;
			var free_hp = frmFree.free_hp.value;
			var free_bir = frmFree.free_bir.value;
			var free_gender = frmFree.free_gender.value;
			var free_addr = frmFree.free_addr.value;
			var free_email1 = frmFree.free_email1.value;
			var free_email2 = frmFree.free_email2.value;
			var free_career = frmFree.free_career.value;
			var free_level = frmFree.free_level.value;

			
			
			if(free_id == ""){
				alert("ID를 입력해주세요.");
				frmFree.free_id.focus();
			}else if(free_pw == ""){
				alert("비밀번호를 입력해주세요.");
				frmFree.free_pw.focus();
			}else if(free_pw_re == ""){
				alert("비밀번호 확인을 입력해주세요.");
				frmFree.free_pw_re.focus();
			}else if(free_lastName == ""){
				alert("성을 입력해주세요.");
				frmFree.free_firstName.focus();
			}else if(free_firstName == ""){
				alert("이름을 입력해주세요.");
				frmFree.free_lastName.focus();
			}else if(free_hp == ""){
				alert("핸드폰 번호를 입력해주세요.");
				frmFree.free_hp.focus();
			}else if(free_bir == ""){
				alert("생일을 입력해주세요.");
				frmFree.free_bir.focus();
			}else if(free_gender == "none"){
				alert("성별을 입력해주세요.");
				frmFree.free_gender.focus();
			}	else if(free_addr == ""){
				alert("주소를 입력해주세요.");
				frmFree.free_addr.focus();
			}else if(free_email1 == "" || free_email2 == ""){
				alert("이메일을 입력해주세요.");
				frmFree.free_email1.focus();
			}else if(free_career == ""){
				alert("경력갯수을 입력해주세요.");
				frmFree.free_career.focus();
			}else if(free_level == ""){
				alert("수준을 입력해주세요.");
				frmFree.free_level.focus();
			}else{
				frmFree.method="post";
				frmFree.action="${contextPath}/free/addFree.do";
				frmFree.submit();
			}
			
		
		}
	
		function checkId(){
			var free_id = ($('#free_id').val)();
			$.ajax({
				url:'${contextPath}/free/overlap.do',
				type:'post',
				data:{free_id:free_id},
				success:function(data){
					if($.trim(data) == 0){
						if(free_id == ""){
							$('#chkMsg').html(" ");
						}else if(free_id.length < 6 || free_id.length > 12){
							$('#chkMsg').html("6~12자리로 입력해주세요.");
							$('#chkMsg').css("color", "black");
						}else{
							$('#chkMsg').html("사용가능한 ID입니다.");
							$('#chkMsg').css("color", "green");
						}
					}else{
						$('#chkMsg').html("ID가 중복되었습니다.");
						$('#chkMsg').css("color", "red");
					}
				},
				error:function(){
					alert("에러입니다.");
				}
				
			});
		};
		
		function Pwd(){
			var f1 = document.forms[0];
			var pw1 = f1.free_pw.value;
			if(pw1==""){
				document.getElementById('Pwd').innerHTML = " ";
			}else if(pw1.length < 8 || pw1.length > 16){
				document.getElementById('Pwd').style.color ="black";
				document.getElementById('Pwd').innerHTML = "8~16자리로 입력해주세요";
			}else{
				document.getElementById('Pwd').innerHTML = " ";
			}
		}
		
		function checkPwd(){
			var f1 = document.forms[0];
			var pw1 = f1.free_pw.value;
			var pw2 = f1.free_pw_re.value;
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
		
		function changeMail(){
			var f = document.frmFree;
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
				f.free_career.focus();
				
			}
		
	</script>
	
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
	<form name="frmFree">
	<h1  class="text_center">프리랜서 등록 창</h1>
	<table>
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="free_id" id="free_id" oninput="checkId()" />
	      	<br><span id="chkMsg"></span>
	       </td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input type="password" name="free_pw" onkeyup="Pwd()">
	      <br><span id="Pwd" style="font-size:70%;"></span>
	      </td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호 확인</td>
	      <td width="400"><input type="password" name="free_pw_re" onkeyup="checkPwd()" />
	      <br><span id="checkPwd" style="font-size:70%;"></span></td>
	   </tr>
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
	      <td width="200"><p align="right">경력갯수</td>
	      <td width="400"><p><input type="number" maxlength="2"  name="free_career"></td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">수준</td>
	       <td>
	       <select name="free_level"> 
	       		<option value="초급">초급</option>
	       		<option value="중급">중급</option>
	       		<option value="고급">고급</option>
	    	</select>
	    </tr>
	    <tr>
	    	<td width="200"><p align="right">희망 월 급여</td>
	    	<td width="400"><input type="text" name="free_pay" value="협의 후 결정" /></td>
	    </tr>
	   
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="button" value="가입하기" onclick="free_send()"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>
</html>