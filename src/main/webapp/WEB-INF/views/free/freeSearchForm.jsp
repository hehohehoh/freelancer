<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프리랜서 검색</title>
	<style type="text/css">
      li {list-style: none; float: left; padding: 6px;}
      #sp_btn{display:none;}
      #more_btn_div{display:none;}
      #up_btn_div{display:none;}
    </style>
	
	<c:if test="${fn:length(freeList) >=10}">
		<script>
			window.onload=function(){
				document.getElementById("more_btn_div").style.display = "block";
				document.getElementById("up_btn_div").style.display = "block";
			}
		</script>
	</c:if>
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
	function buttn(){
		var signform = document.signform;
		var free_addr = signform.free_addr.value;
		var selectlan = signform.selectlan.value
		
		if(selectlan.length == 0 || selectlan.length ==""){
			alert("사용언어를 선택해주세요");
		}else if(free_addr.length==0 || free_addr==""){
			alert("지역을 선택해주세요");
		}else{
			signform.method = "post";
			signform.action = "${contextPath}/free/freeSearch.do";
			signform.submit();
		}
	}
	
	

	var selectLang0 = new Array("","JSP","PHP","NET","ASP","JavaScript","Ajax","Jquery","NodeJS","Vue.js","React.js","Angular.js","Ruby");
	var selectLang1 = new Array("","Java","C#","C++","Kotlin","C","PowerBuilder","Delphi","MFC","Python");
	var selectLang2 = new Array("","어셈블리","임베디드","펌웨어","HMI","MMI","PLC");
	var selectLang3 = new Array("","모바일개발","안드로이드","AOTLIN","Objective-C","Swift");
	var selectLang4 = new Array("","Oracle","MS-SQL","MYSQL","DBA","DB2","데이터마이닝","OLAP","MongoDB","PostgreSQL");
	var selectLang5 = new Array("","네트워크","서버","보안관리","정보보안","OS","AIX");
	var selectLang6 = new Array("","Javascript","CSS","Sass","HTML","Sketch","플래쉬");
	var selectLang7 = new Array("","빅데이터","사물인터넷","인공지능","자연어처리","하둡","Perl","python","R","TensorFlow");

	function categoryChange(e) {	//select태그(대분류)의 onchange="categoryChange(this)" 함수가 실행
		   
	      var temp;
	      temp = document.signform.selectlan;	// 폼(signform) 안에 select태그(selectlan(소분류))를 temp라는 변수에 저장
	      var target = document.getElementById("free_skill");	//아이디가 free_skill인 select태그를 target이라는 변수에 저장
	    
	      if(e.value == "WEB") var d = selectLang0;			// select태그(대분류)의 옵션이 선택되었을 때 d라는 변수에 위에 정의 되어있는 배열중에서 이름이 같은 배열이 저장 된다.
	      else if(e.value == "APP") var d = selectLang1;	// 
	      else if(e.value == "SYS") var d = selectLang2;
	      else if(e.value == "MOB") var d = selectLang3;
	      else if(e.value == "DBA") var d = selectLang4;
	      else if(e.value == "INF") var d = selectLang5;
	      else if(e.value == "PUB") var d = selectLang6;
	      else if(e.value == "BAI") var d = selectLang7;
	    
	     target.options.length = 0;	// select태그(소분류)의 길이를 0으로 맞춰준다. 0으로 맞춰주지 않으면 select태그의 option 값이 다른 배열의 값이 나올수가 있다.
	    
	     for (var x in d) {		// d은 위에 보다시피 배열이다. var x라는 변수에 d안에 첫번째 인덱스 값이 들어가고 밑에가 다 실행되면 그때 다음 인덱스 값이 x라는 변수에 담긴다.
	       var opt = document.createElement("option");	// select태그에 option을 생성하고 opt라는 변수에 저장시킨다.
	       opt.value = d[x];		// 예를들어 우리는 select태그(대분류)를 WEB을 눌렀다 치고 인덱스 두번째 값이 들어간다고 치면 두번째 인덱스 값이 1이므로 d[1]일 것이다.
	       							// 그러면 d[1]은 "Jsp"이니깐 방금 만들었던 option에 value값에 넣어주는 것이다. 
	       opt.innerHTML = opt.value;	//option의 value값을 우리가 눈에 보일 수 있도록 innerHTML을 이용하여 추가해준다.
	       target.appendChild(opt);		//두번째 옵션이 만들어졌으니깐 이것을 select태그(소분류) 옵션에다가 어팬드 시켜준다.
	     }
	     
	     temp.options[0].selected=true;		//select태그(소분류) 옵션중에서 하나를 선택했을때 그 값이 선택 됐다고 알려주는 것이다.
	}

	//사용언어 어팬드
	var i = 0
	var lan = new Array(i);
	
	function Change(){
		var f = document.forms[0];
		var value = f.selectlan.value;
		if(i<5 && value != ""){
			if(lan.indexOf(value) == -1){
				$("#text").append("<li class='lila'>"+value+"</li>");
				lan[i] = value;
				
				i++;
				f.lan.value = lan
				
				document.getElementById("sp_btn").style.display = "block"; //전체 삭제 버튼 생기기
			}
		}
	}
	
	
	//전체 삭제
	$(function() {
			$('input#btn').on("click", function() {
			
			$( ".lila" ).remove();
			
			lan = [];
			i=0;
			
			document.getElementById("sp_btn").style.display = "none"; //버튼 사라지기
		});
	});
	
	
	
	function changeAddr(){
		var f = document.forms[0];
		f.free_addr.value=f.free_address.value;
	}
	</script>
</head>
<body>
		<c:if test="${isLogOn == true  && company!= null}">
         <h3>환영합니다. ${company.comp_mname}님!</h3>
         <a href="${contextPath}/comp/logout.do" style="font-size:110%">로그아웃</a>
    </c:if>
    <br><br>
	  <h1>프리랜서 키워드 검색창</h1>

<form name="signform">
		
	  사용언어: <br>
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
     
     <select id="free_skill" name="selectlan" onchange="Change(document.signform.selectlan.options.selectedIndex);">
       <option selected value="">-사용언어선택-</option>
         <option value=""></option>
     </select>
     <input type="hidden" name="lan">
      
	<br>
	<ul id="text"></ul><span id="sp_btn"><input type="button" value="전체삭제" id="btn"></span><br><br>
	
	등급:
	<br>
        <input type="radio" name="free_level" value="고급"> 고급<br>
        <input type="radio" name="free_level" value="중급"> 중급<br>
        <input type="radio" name="free_level" value="초급"> 초급<br>
        <input type="radio" name="free_level" value="무관" checked> 무관<br>
	<br><br>
	
	지역:
	<input name="free_addr" type="text" readonly="readonly" size="5">
	<select name="free_address" onChange="changeAddr();">
      <option value="">-지역선택-</option>
      <option value="무관">무관</option>
      <option value="서울">서울</option>
      <option value="부산">부산</option>
      <option value="대구">대구</option>
      <option value="인천">인천</option>
      <option value="광주">광주</option>
      <option value="대전">대전</option>
      <option value="울산">울산</option>
      <option value="세종">세종</option>
      <option value="경기">경기</option>
      <option value="강원">강원</option>
      <option value="충북">충북</option>
      <option value="충남">충남</option>
      <option value="전북">전북</option>
      <option value="전남">전남</option>
      <option value="경북">경북</option>
      <option value="경남">경남</option>
      <option value="제주">제주</option>
    </select>
    <br><br>
	
	<input type="hidden" name="startCount" value="1">
	<input type="button" value="프리랜서 검색" onclick="buttn()" />
</form>	
	
	
<br><br><br>



<form id="searchTxtForm" name="searchTxtForm">

	<input type="hidden" name="startCount" value="0">
	<input type="hidden" name="lan" value="${lanList}">
	<input type="hidden" name="free_addr" value="${free_addr}">
	<input type="hidden" name="free_level" value="${free_level}">
	

	<table id="tbl" border="1">
		<tbody id="tbd">
		<c:forEach var="f" items="${freeList}" >
			<tr>
				<td onClick="location.href='${contextPath}/free/freeDetail.do?free_id=${f.free_id}'" style="cursor:pointer;">
					<c:choose>
	        	<c:when test="${f.free_picture == 'no file' || f.free_picture == null}" >
	          	<c:choose>
	            	<c:when test="${f.free_gender == 0 }">
	              	<img src="${contextPath}/resources/profile/img3.jpg" style="width:100px;height:100px"/>
	              </c:when>
	              <c:otherwise>
	              	<img src="${contextPath}/resources/profile/img2.jpg" style="width:100px;height:100px"/>
	              </c:otherwise>
	          	</c:choose>
	          </c:when>
	          <c:otherwise>
	          	<c:set var="fileName" value="${f.free_picture}" />
							<c:set var="fileNameArr" value="${fn:split(fileName,'\\\\')}" />
	
							<img src="${contextPath }/resources/profile/${f.free_id}/${fileNameArr[10]}" style="width:100px;height:100px"/>
	          </c:otherwise>
	       </c:choose>	
				</td>
				<td onClick="location.href='${contextPath}/free/freeDetail.do?free_id=${f.free_id}'" style="cursor:pointer;">
				
					${f.free_lastName}** <br>
					<c:set var="year" value="${year}" />
					<c:set var="bir" value="${f.free_bir}" />
					<c:set var="birYear" value="${year - (fn:substring(bir,0,4)) + 1}" />
					나이: ${birYear} 세 
					<br>
					등급: ${f.free_level} <br>
					
					<c:set var="address" value="${f.free_addr}" />
					<c:set var="addr" value="${(fn:substring(address,0,3))}" />
					주소: ${addr} <br>
					
					사용언어:
					<c:forEach var="s" items="${freeLanList}" > 
						<c:if test="${f.free_id == s.free_id}">
							${s.free_skill} 
						</c:if>
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<br>
	<div id="more_btn_div" align="center">
	<hr>
		<a href="javascript:moreContent();">더보기(More)</a>
	<hr>
	</div>
	<div id="up_btn_div" align="center">
	<button type="button" onclick="goTop()">맨 위로 ↑</button>
	</div>
</form> 

<script>

	//더 보기
	function moreContent(){
		var frForm = document.searchTxtForm;
		var trLen = $('#tbl tr').length;
		frForm.startCount.value = trLen;
		lan = [];
		
		$.ajax({
			url:'${contextPath}/free/more.do',
			type:'post',
			data:$('#searchTxtForm').serialize(),
			dataType: 'json',
			success: function(data){
				var freeMap = data;
				var f = freeMap.freeList;
				var s = freeMap.freeLanList;
				var year = freeMap.year;
				var fCnt = freeMap.fCnt;
				console.log(freeMap);
				console.log(f);
				console.log(s);
				console.log(year);
				console.log(fCnt);
				
				var content = "";
					for(i=0; i<f.length; i++){
						
						content += "<tr>";
						content += "<td onClick=\"location.href='${contextPath}/free/freeDetail.do?free_id="+f[i].free_id+"'\" style='cursor:pointer;'>";
						if(f[i].free_picture == 'no file' || f[i].free_picture == null){
							if(f[i].free_gender==0){
								content += "<img src='${contextPath}/resources/profile/img3.jpg' style='width:100px;height:100px'/>";
							}else{
								content += "<img src='${contextPath}/resources/profile/img2.jpg' style='width:100px;height:100px'/>";
							}
						}else{
							var fileName = f[i].free_picture;
							var fileNameArr = fileName.split('\\');
							content += "<img src='${contextPath }/resources/profile/"+f[i].free_id+"/"+fileNameArr[10]+"' style='width:100px;height:100px'/>";
						}
						content += "</td>";
						content += "<td onClick=\"location.href='${contextPath}/free/freeDetail.do?free_id="+f[i].free_id+"'\" style='cursor:pointer;'>";
						content += f[i].free_lastName+"**<br>";
						var bir = f[i].free_bir;
						var birYear = year - (bir.substring(0,4)) +1;
						content += "나이: "+ birYear+" 세<br>";
						content += "등급: "+ f[i].free_level+"<br>";
						var address = f[i].free_addr;
						var addr = address.substring(0,3);
						content += "주소: "+ addr+"<br>";
						content += "사용언어: ";
						for(j=0; j<s.length; j++){
							if(f[i].free_id == s[j].free_id){
								content += s[j].free_skill+" ";
							}
						}
						content += "</td></tr>";
					}
				$("#tbd").append(content);
				if(fCnt < 10){
					document.getElementById("more_btn_div").style.display = "none";
				}
			},
			error: function(){
				alert("에러입니다");
			}
		});
	}
	
	//맨 위로
	function goTop(){
		document.documentElement.scrollTop = 0;
	}
	
	
</script>
	
</body>
</html>