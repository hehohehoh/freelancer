<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />



<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <style>
      table {margin: auto; border: 1px solid black; border-collapse: collapse;}
      #text_center{width: 800px; margin:auto 0; }
      .select_img img{margin: 20px 0;}
      li {list-style: none; float: left; padding: 6px;}
    #sp_btn{display:none;}
    
    #frmInfo{display:none;}
    #frmInfo2{display:none;}
    #frmInfo22{display:none;}
    #frmInfo3{display:none;}
    #frmInfo4{display:none;}
    #frmInfo44{display:none;}
    
    #b00{display:none;}
   </style>

   <c:choose>
      
      <c:when test = "${status == 'freeInfoFin' }">
         <script>
         window.onload = function() {
            alert("사진 입력이 완료되었습니다. ");
         }
         
         </script>
      </c:when>
      <c:when test = "${status == 'freeCareerFin' }">
         <script>
         window.onload = function() {
            alert("경력 사항 입력이 완료되었습니다. ");
         }
         
         
         </script>
      </c:when>
      <c:when test = "${status == 'freeFileFin' }">
         <script>
         window.onload = function() {
            alert("파일 첨부가 완료되었습니다. ");
         }
         
         </script>
      </c:when>
      <c:when test = "${status == 'freeSkillFin' }">
         <script>
         window.onload = function() {
            alert("보유 기술 입력이 완료되었습니다. ");
         }
         
         </script>
      </c:when>
      <c:when test = "${free.free_state == 0 }">
      	<script>
	      	window.onload = function() {
	      		document.getElementById("b01").style.display = 'none';
	      	}
      	</script>
      </c:when>
      <c:when test = "${free.free_state == 1 }">
      	<script>
      	 window.onload = function() {
      		 document.getElementById("b1").style.display = 'none';
      	 }
      	</script>
      </c:when>
   </c:choose>

   <script>
   
     var selectLang0 = new Array("","JSP","PHP","NET","ASP","JavaScript","Ajax","Jquery","NodeJS","Vue.js","React.js","Angular.js","Ruby");
     var selectLang1 = new Array("","Java","C#","C++","Kotlin","C","PowerBuilder","Delphi","MFC","Python");
     var selectLang2 = new Array("","어셈블리","임베디드","펌웨어","HMI","MMI","PLC");
     var selectLang3 = new Array("","모바일개발","안드로이드","AOTLIN","Objective-C","Swift");
     var selectLang4 = new Array("","Oracle","MS-SQL","MYSQL","DBA","DB2","데이터마이닝","OLAP","MongoDB","PostgreSQL");
     var selectLang5 = new Array("","네트워크","서버","보안관리","정보보안","OS","AIX");
     var selectLang6 = new Array("","Javascript","CSS","Sass","HTML","Sketch","플래쉬");
     var selectLang7 = new Array("","빅데이터","사물인터넷","인공지능","자연어처리","하둡","Perl","python","R","TensorFlow");

     //대분류를 골랐을때 소분류 나오게하기
     function categoryChange(e) {
               
        var temp;
        temp = document.frmInfo4.selectlan;
        var target = document.getElementById("free_skill");
       
        if(e.value == "WEB") var d = selectLang0;
         else if(e.value == "APP") var d = selectLang1;
         else if(e.value == "SYS") var d = selectLang2;
         else if(e.value == "MOB") var d = selectLang3;
         else if(e.value == "DBA") var d = selectLang4;
         else if(e.value == "INF") var d = selectLang5;
         else if(e.value == "PUB") var d = selectLang6;
         else if(e.value == "BAI") var d = selectLang7;
       
        target.options.length = 0;
       
        for (x in d) {
          var opt = document.createElement("option");
          opt.value = d[x];
          opt.innerHTML = opt.value;
          target.appendChild(opt);
        }
        
          temp.options[0].selected=true;
       }
     
   //사용언어 어팬드
      var i = 0
      var lan = new Array(i);
      
      function addSkill(){
         var f = document.frmInfo4;
         var value = f.selectlan.value;
         if(i<5 && value != ""){
            if(lan.indexOf(value) == -1){
               $("#text").append("<li class='lila'>\#"+value+"</li>");   // 밑에 ul tag에 append
               lan[i] = value;   // 선택한 소분류 value를 리스트에 담기
               i++;   
               f.lan.value = lan;
               
               document.getElementById("sp_btn").style.display = "block"; //전체 삭제 버튼 생기기
            }
         }
      }
      
      
      //전체 삭제 input 중에 id가 btn인거 클릭하면 초기화
      $(function() {
            $('input#btn').on("click", function() {
            
            $( ".lila" ).remove();
            
            lan = [];
            i=0;
            
            document.getElementById("sp_btn").style.display = "none"; //버튼 사라지기
         });
      });

   
      function updateDetail(){         
         var frmInfo = document.frmInfo;
         frmInfo.method="post";
         frmInfo.action="${contextPath}/free/updateInfo.do";
         frmInfo.submit();
      }
      
      function writeLater(){
         
         var frmInfo = document.frmInfo;
         frmInfo.style.display = 'none';
         document.getElementById("btn1").style.display = 'block';
         
      }
      
      function writeLater2(){
         var frm = document.frmInfo2;
         frm.style.display = 'none';
         document.getElementById("btn2").style.display = 'block';
      }
      
      function writeLater22(){
          var frm = document.getElementById("frmInfo22");
          frm.style.display = 'none';
          document.getElementById("btn2").style.display = 'block';
      }
      
      function writeLater3(){
         var frm = document.frmInfo3;
         frm.style.display = 'none';
         document.getElementById("btn3").style.display = 'block';
      }
      
      function writeLater4(){
         var frm = document.frmInfo4;
         frm.style.display = 'none';
         document.getElementById("btn4").style.display = 'block';
      }
      
      function writeLater44(){
          var frm = document.getElementById("frmInfo44");
          frm.style.display = 'none';
          document.getElementById("btn4").style.display = 'block';
       }
      
     
      
      function viewForm(){
         document.frmInfo.style.display = 'block';
         document.getElementById("btn1").style.display = 'none';
      }
      
      function viewForm2(){
         document.frmInfo2.style.display = 'block';
         document.getElementById("btn2").style.display = 'none';
      }
      
      function viewForm22(){
          document.getElementById("frmInfo22").style.display = 'block';
          document.getElementById("btn2").style.display = 'none';
       }
      
      function viewForm3(){
         document.frmInfo3.style.display = 'block';
         document.getElementById("btn3").style.display = 'none';
      }

      function viewForm4(){
         document.frmInfo4.style.display = 'block';
         document.getElementById("btn4").style.display = 'none';
      }
      
      function viewForm44(){
          document.getElementById("frmInfo44").style.display = 'block';
          document.getElementById("btn4").style.display = 'none';
       }
      
      
      
      function modMyInfo(){
    	  
    	  
    	  $('.ch').attr('disabled', false);
    	  $('.ch2').hide();
    	  document.getElementById("b00").style.display = 'block';
      }
      
      
      function modMyInfo2(){
    	  var frm = document.myInfo;
    	  
    	  frm.method = "post";
    	  frm.action = "${contextPath}/free/modFreeInfo.do";
    	  frm.submit();
    	  
    	  $('.ch').attr('disabled', true);
    	  $('.ch2').show();
    	  document.getElementById("b00").style.display = 'none';
    	  document.getElementById("b01").style.display = 'none';
    	  alert('정보가 수정되었습니다.');
    	  document.getElementById("myInfo").style.display = 'block';
      }
      
      function stopService(){
    	  var f = document.myInfo;
    	  var free_id = f.free_id.value;
    	  
    	  if(confirm('정지하면 기업으로부터 연락을 받을수 없습니다. 정지하시겠습니까?')){
    		 	
    		  $.ajax({
    		 		 type: 'post',
    		 		 url: '${contextPath}/free/stopFree.do',
    		 		 data: {free_id:free_id},
    		 		 success:function(data){
    		 			 if($.trim(data) == 1){
    		 				 alert('정지되었습니다.');
    		 				 document.getElementById("b1").style.display = 'none';
    		 				 document.getElementById("b01").style.display = 'inline';
    		 			 }else{
    		 				 alert('정지asdwr.');
    		 			 }
    		 		 },
    		 		 error:function(){
    		 			 alert("Error");
    		 		 }
    		 	 });
    		 	 
    	  }
      }
      
      function startService(){
    	  var f = document.myInfo;
    	  var free_id = f.free_id.value;
    	  
    	  if(confirm('정지를 해제하시겠습니까?')){
  		 	
    		  $.ajax({
    		 		 type: 'post',
    		 		 url: '${contextPath}/free/startFree.do',
    		 		 data: {free_id:free_id},
    		 		 success:function(data){
    		 			 if($.trim(data) == 1){
    		 				 alert('정지 해제되었습니다.');
    		 				 document.getElementById("b1").style.display = 'inline';
   		 				 	 document.getElementById("b01").style.display = 'none';
    		 			 }else{
    		 				 alert('정지asdwr.');
    		 			 }
    		 		 },
    		 		 error:function(){
    		 			 alert("Error");
    		 		 }
    		 	 });
    		 	 
    	  }
      }
      
      function withdraw(){
    	  var f = document.myInfo;
    	  
    	  if(confirm('정말 탈퇴하시겠습니까?')){
    	  	f.method="post";
    	  	f.action="${contextPath}/free/drop.do"
    	  	f.submit();
    	  }
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
<body>
   <h1 class="text_center">${free.free_id }님의 마이페이지</h1>
      
   <form name="myInfo" id="myInfo">
   <input type="hidden" id="free_id" name="free_id" value="${free.free_id }" />
   		<table>
   			<tr>
   				<td>이름</td>
   				<td>${free.free_lastName }${free.free_firstName }</td>
   			</tr>
   			<tr>
   				<td>핸드폰 번호</td>
   				<td><input type="text" class="ch" name="free_hp" value="${free.free_hp}" disabled onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /></td>
   			</tr>
   			<tr>
   				<td>Email</td>
   				<td><input type="email" class="ch" name="free_email" value="${free.free_email}" disabled /></td>
   			</tr>
   			<tr>
   				<td>희망 급여</td>
   				<td><input type="text" class="ch" name="free_pay" value="${free.free_pay}" disabled /></td>
   			</tr>
   			<tr>
   				<td>수준</td>
   				<td>
   					<select name="free_level" class="ch" disabled> 
   						<c:if test="${free.free_level == '초급'}">
 	  						<option value="${free.free_level}" selected>${free.free_level}</option>
   							<option value="중급">중급</option>
	       				<option value="고급">고급</option>
   						</c:if>
   						<c:if test="${free.free_level == '중급'}">
   							<option value="초급">초급</option>
   							<option value="${free.free_level}" selected>${free.free_level}</option>
	       				<option value="고급">고급</option>
   						</c:if>
   						<c:if test="${free.free_level == '고급'}">
   							<option value="초급">초급</option>
	       				<option value="중급">중급</option>
	       				<option value="${free.free_level}" selected>${free.free_level}</option>
   						</c:if>
	    			</select>
	    		</td>
   			</tr>
   			<tr>
   				<td>주소</td>
   				<td>
   					<input type="text" name="free_addr" id="free_addr" class="ch" value="${free.free_addr}" disabled />
   					<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색하기">
   				</td>
   			</tr>
   			<tr>
         <td colspan="2"><p align="center">
            <input type="button" class="ch2" id="b0" name="b0" onclick="modMyInfo();" value="정보 수정하기"/>
            <input type="button" id="b00" name="b00" onclick="modMyInfo2();" value="정보 수정" />
            <input type="button" class="ch2" id="b1" name="b1" onclick="stopService();" value="정지하기"/>
						<input type="button" class="ch2" id="b01" name="b01" onclick="startService();" value="정지해제"/>
            <input type="button" class="ch2" id="b02" name="b02" onclick="withdraw();" value="탈퇴하기"/>
         </td>
      </tr>
   		</table>
   </form>
   
   <div id="btn1" >
   
   	<c:if test="${free.free_picture == null }" >
   		<c:if test="${free.free_gender == 0 }">
   			<img src="${contextPath }/resources/profile/img3.jpg" width="200" />
   		</c:if>
   		<c:if test="${free.free_gender == 1 }">
   			<img src="${contextPath }/resources/profile/img2.jpg" width="200" />
   		</c:if>
   		<input type="button" value="사진 등록하기" onclick="viewForm();"/>
   	</c:if>
   	<c:if test="${free.free_picture != null }">
   		<img src="${contextPath }/resources/profile/${free.free_id}/${free.free_picture }" width="200" />
   		<input type="button" value="사진 변경하기" onclick="viewForm();" />
   	</c:if>
   </div>
   
   <form name="frmInfo" id="frmInfo" encType="multipart/form-data">
   <table>
      <tr>
         <td width="200"><p align="right">사진 등록</td>
         <td width="400"><input type="file" name="free_pic" id="free_pic" />
         <div class="select_img"><img src="" alt="사진X" >
            <script>
            
              $("#free_pic").change(function(){
               if(this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function(data) {
                    $(".select_img img").attr("src", data.target.result).width(200);        
                   }
                reader.readAsDataURL(this.files[0]);
               }
              });
             </script>
          </div>
          </td>
      </tr>
    
      <tr>
         <td colspan="2"><p align="center">
            <input type="button" onclick="writeLater();" value="나중에 입력하기" />
            <input type="button" id="b1" name="b1" onclick="updateDetail();" value="사진 업로드"/>
         </td>
      </tr>
      </table>
   </form>
   
   <br><br>
   
   <div id="btn2" >
   	<c:if test="${career_cnt == 0 }">
   		<input type="button" value="경력 사항 입력" onclick="viewForm2();"/>
   	</c:if>
   	<c:if test="${career_cnt != 0 }">
   		<input type="button" value="경력 사항 조회" onclick="viewForm22();"/>
   	</c:if>
   </div>
   
   <c:if test="${career_cnt == 0 }">
   <form:form name="frmInfo2" id="frmInfo2" modelAttribute="carList" action="${contextPath}/free/addCareer.do">
   <table>
   <caption>경력 사항 입력</caption>
      <tr>
         <td>No.</td>
         <td>시작일</td>
         <td>종료일</td>
         <td>프로젝트명</td>
         <td>주요 업무</td>
         <td>회사 이름</td>
      </tr>
      <c:forEach var="no" begin="1" end="${career_num }">
      <input type="hidden" name="carList[${no-1}].free_id" value="${free.free_id }" />
      <input type="hidden" name="carList[${no-1 }].free_cnum" value="${no }" />
      <tr>
         <td>${no }</td>
         <td><input type="date" name="carList[${no-1 }].free_startdate" /></td>
         <td><input type="date" name="carList[${no-1 }].free_finishdate" /></td>
         <td><input type="text" name="carList[${no-1 }].free_pname" /></td>
         <td><input type="text" name="carList[${no-1 }].free_pwork" /></td>
         <td><input type="text" name="carList[${no-1 }].free_company" /></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="6"><p align="center">
            <input type="button" onclick="writeLater2()" value="나중에 입력하기" />
            <input type="submit" id="b2" name="b2" value="경력 사항 추가"/>
         </td>
      </tr>
   </table>
   </form:form>
   </c:if>
   
   
   <c:if test="${career_cnt != 0 }">
   <div id="frmInfo22">
   <table>
   <caption>경력 사항</caption>
      <tr>
         <td>No.</td>
         <td>시작일</td>
         <td>종료일</td>
         <td>프로젝트명</td>
         <td>주요 업무</td>
         <td>회사 이름</td>
      </tr>
      <c:forEach var="career" items="${carList}" varStatus="status">
      <tr>
         <td>${status.count }</td>
         <td><c:out value="${career.free_startdate }" /></td>
         <td><c:out value="${career.free_finishdate }" /></td>
         <td><c:out value="${career.free_pname }" /></td>
         <td><c:out value="${career.free_pwork }" /></td>
         <td><c:out value="${career.free_company }" /></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="6"><p align="center">
            <input type="button" onclick="writeLater22()" value="접기" />
         </td>
      </tr>
   </table>
   </div>
   </c:if>
   
   <br><br>
   
   <div id="btn3" >
   	<c:if test="${free.free_file == null }" >
   		<input type="button" value="이력서 입력" onclick="viewForm3();"/>
   	</c:if>
		<c:if test="${free.free_file != null }" >
			현재 파일 : <a href="${contextPath}/free/fileDown.do">${free.free_file}</a>
    	<input type="button" value="이력서 변경" onclick="viewForm3();" />
   	</c:if>
   </div>
   
 
   
   
   <form name="frmInfo3" id="frmInfo3" method="post" encType="multipart/form-data" action="${contextPath}/free/addFreeFile.do">
      <table>
      <caption>이력서(경력 기술서) 입력</caption>
         <tr>
            <td width="200"><p align="right">이력서</td>
            <td width="400"><input type="file" name="free_file" /></td>
         </tr>
         <tr>
            <td colspan="2"><p align="center">
               <input type="button" onclick="writeLater3();" value="나중에 입력하기" />
               <input type="submit" id="b3" name="b3" value="이력서 추가"/>
            </td>
         </tr>         
      </table>
   </form>
   
   <br><br>
   
   <div id="btn4" >
   	<c:if test="${skill_cnt == 0 }">
   		<input type="button" value="보유 기술 입력" onclick="viewForm4();"/>
   	</c:if>
   	<c:if test="${skill_cnt != 0 }">
   		<input type="button" value="보유 기술 조회" onclick="viewForm44();"/>
   	</c:if>
   </div>
   
   <c:if test="${skill_cnt == 0 }">
   <form name="frmInfo4" id="frmInfo4" method="POST" action="${contextPath}/free/addSkill.do">
   <input type="hidden" name="free_id" value="${free.free_id }" />
   
   <table>
   <caption>보유 기술 입력</caption>
      <tr>
      	<td>
         <select name="bigSelectLang" onchange="categoryChange(this)">
        <option>--분야선택--</option>
        <option value="WEB">웹</option>
        <option value="APP">응용</option>
        <option value="SYS">시스탬</option>
        <option value="MOB">모바일</option>
        <option value="DBA">DBA</option>
        <option value="PUB">Publishing</option>
        <option value="BAI">빅데이터/AI</option>
      </select>
      
      <select id="free_skill" name="selectlan" onchange="addSkill(document.frmInfo4.selectlan.options.selectedIndex);">
        <option selected value="">-사용언어선택-</option>
        <option value=""></option>
      </select>
     
      <input type="hidden" name="lan">
        <br>
         <ul id="text"></ul>
         
         <span id="sp_btn"><input type="button" value="전체삭제" id="btn"></span>
            <br>
         <input type="button" onclick="writeLater4();" value="나중에 입력하기" />
         <input type="submit" id="b4" name="b4" value="기술 정보 입력" /> 
   		 </td> 
    </tr>
   </table>
   </form>
   </c:if>
   
   <c:if test="${skill_cnt != 0 }">
   <div id="frmInfo44">
   	<table>
   		<caption>보유 기술 조회</caption>
   		<tr>
   			<td>no</td>
   			<td>보유 기술</td>
   		</tr>
   		<c:forEach var="skill" items="${skill}" varStatus="status">
   		<tr>
   			<td>${status.count }</td>
   			<td>${skill}</td>
   		</tr>		
   		</c:forEach>
   		<tr>
         <td colspan="2"><p align="center">
            <input type="button" onclick="writeLater44()" value="접기" />
         </td>
      </tr>
   	</table>
   </div>
   </c:if>
   <br>
   <br>
   <a href="${contextPath }/free/logout.do"><button>로그아웃</button></a>
</body>
</html>