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
<html lang="en">
<head>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" /> 
<title>기업 메인페이지</title>
		<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
        <link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
	<style type="text/css">
      li {list-style: none; float: left; padding: 6px;}
      #btn{display:none;}
      #more_btn_div{display:none;}
      #up_btn_div{display:none;}
      
      .basefont{ 
   		font-family: "titlefont","serif";
   		}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }
      
      .zzim {
    		color:gray
    	}
    	.zzim1:hover{
    		color:#FF6699
    	}
    	
    	.sear {
    		color:gray;
    		padding-right:20px;
    	}
    	.sear1:hover{
    		color:blue;
    	}
    	
    	
    	table.tblCss {
    	border-collapse: collapse;
	    line-height: 1.5;
    	}
    	
    	table.tblCss thead th {
	    padding: 10px;
	    font-weight: bold;
	    font-size:20px;
	    vertical-align: top;
	    color: #369;
	    border-bottom: 3px solid #036;
		}
		
		table.tblCss tbody th {
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    border-bottom: 1px solid #ccc;
	    background: #f3f6f7;
		}
		
		table.tblCss td {
	    padding: 10px;
	    vertical-align: top;
	    background-color:#eeeeee;
	    border-bottom: 1px solid #ccc;
		}
		
		.tdtd:hover{
			background-color:#ffffff;
		}
		
		.searchbtn{
			height:40px;
			border:0;
			outline:0;
			font-weight: bold;
			background-color:#343A40;
			color:#eeeeee;
			border-radius:5px;
		}
		
		.searchbtn1:hover{
			color:black;
		}
	
    </style>
	
	<c:if test="${fn:length(freeList) >=10}">
		<script>
			window.onload=function(){
				document.getElementById("more_btn_div").style.display = "block";
				document.getElementById("up_btn_div").style.display = "block";
			}
		</script>
	</c:if>
	
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
		var f = document.signform;
		var value = f.selectlan.value;
		if(i<5 && value != ""){
			if(lan.indexOf(value) == -1){
				$("#text").append("<li class='lila'>"+value+"</li>");
				lan[i] = value;
				
				i++;
				f.lan.value = lan
				
				document.getElementById("btn").style.display = "block"; //전체 삭제 버튼 생기기
			}
		}
	}
	
	
	//전체 삭제
	$(function() {
			$('input#btn').on("click", function() {
			
			$( ".lila" ).remove();
			
			lan = [];
			i=0;
			
			document.getElementById("btn").style.display = "none"; //버튼 사라지기
		});
	});
	
	
	
	function changeAddr(){
		var f = document.signform;
		f.free_addr.value=f.free_address.value;
	}
	</script>
</head>
<body class="sb-nav-fixed" style="background-color:#dddddd;">
    
	<div id="wrapper">
	
	<!-- 해더 -->
		<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="height:10%">
            <a class="navbar-brand" href="${contextPath}/comp/compMain.do"><img src="${contextPath}/resources/img/logo.png" style="width:100%;heigth:50%"></a>
            <!-- Navbar-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                	<span style="color:#dddddd;">${company.comp_mname}</span> <span style="color:white">님</span> 
                 	 <span style="font-size:20px;color:#cccccc;padding-left:20px">Freelancer Search&nbsp;</span><a href="${contextPath}/free/freeSearchForm.do" ><span class="sear sear1"><i class="fas fa-search fa-lg"></i></span></a>
                    <div class="input-group-append">
                        <span style="font-size:20px;color:#cccccc">List&nbsp;</span><a href="${contextPath}/free/zzimlist.do" ><span class="zzim zzim1"><i class="fa fa-heart fa-lg"></i></span></a>
                    </div>
                </div>
            </form>
            
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-lg"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="${contextPath}/comp/mypagepw.do">My Page</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${contextPath}/logout.do">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        
        <!-- 바디 -->
        <div id="section">
	<br><br><br>
	<h1 style="text-align:center;font-size:60px"><a class="basefont">Freelancer Search</a></h1><hr>
<form name="signform">
	<table style="margin:auto;">
		<tr>
			<td style="width:300px;">
				<span style="font-weight: bold;font-size:20px;">사용언어 </span><br>
			    <select name="bigSelectLang" onchange="categoryChange(this)" style="height:24px;border-radius: 8px;outline:0;">
			    	<option>--분야선택--</option>
			        <option value="WEB">웹</option>
			        <option value="APP">응용</option>
			        <option value="SYS">시스탬</option>
			        <option value="MOB">모바일</option>
			        <option value="DBA">DBA</option>
			        <option value="PUB">Publishing</option>
			        <option value="BAI">빅데이터/AI</option>
			    </select>
			     
			    <select id="free_skill" name="selectlan" onchange="Change(document.signform.selectlan.options.selectedIndex);" style="height:24px;border-radius: 8px;outline:0;">
			        <option selected value="">-사용언어선택-</option>
			        <option value=""></option>
			    </select>
			    <input type="hidden" name="lan">
			</td>
			<td style="width:300px;">
				<span style="font-weight: bold;font-size:20px;">등급</span><br>
		        <input type="radio" name="free_level" value="고급"> 고급
		        <input type="radio" name="free_level" value="중급"> 중급
		        <input type="radio" name="free_level" value="초급"> 초급
		        <input type="radio" name="free_level" value="무관" checked> 무관
        	</td>
        	<td style="width:200px;">
        		<span style="font-weight: bold;font-size:20px;">지역</span><br>
				<input name="free_addr" type="text" readonly="readonly" size="5">
				<select name="free_address" onChange="changeAddr();" style="height:24px;border-radius: 8px;outline:0;">
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
        	</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight: bold;background:gray;font-size:20px;color:white;">
				<ul id="text"></ul>
			</td>
			<td style="background:gray;">
				<input type="button" value="X" id="btn" style='padding-left:80%;font-size:20px;font-weight: bold;color:#eeeeee;background:gray;border:0;outline:0;'>
			</td>
			<td>
        		<input type="hidden" name="startCount" value="1">
				&nbsp;<input class="searchbtn searchbtn1" type="button" value="Search" onclick="buttn()" style="height:40px;border:0;outline:0;font-weight: bold;background:#343A40;color:#eeeeee;border-radius:5px;" />
        	</td>
		</tr>
	</table>
</form>	
	
	
<br>



<form id="searchTxtForm" name="searchTxtForm">

	<input type="hidden" name="startCount" value="0">
	<input type="hidden" name="lan" value="${lanList}">
	<input type="hidden" name="free_addr" value="${free_addr}">
	<input type="hidden" name="free_level" value="${free_level}">
	
<c:choose>
   	<c:when test="${free_level != null}">
		<table class="tblCss" id="tbl" style="margin:auto;">
			<thead>
			<tr>
				<th style="font-size:30px;">Freelancer</th>
				<th style="font-size:30px;">Information</th>
			</tr>
			</thead>
			<tbody id="tbd">
			
			<c:forEach var="f" items="${freeList}" >
				<tr>
					<th onClick="location.href='${contextPath}/free/freeDetail.do?free_id=${f.free_id}'" style="cursor:pointer;width:120px;">
						<c:choose>
		        	<c:when test="${f.free_picture == 'no file' || f.free_picture == null}" >
		          	<c:choose>
		            	<c:when test="${f.free_gender == 0 }">
		              	<img src="${contextPath}/resources/profile/img3.jpg" style="width:120px;height:120px"/>
		              </c:when>
		              <c:otherwise>
		              	<img src="${contextPath}/resources/profile/img2.jpg" style="width:120px;height:120px"/>
		              </c:otherwise>
		          	</c:choose>
		          </c:when>
		          <c:otherwise>
						<img src="${contextPath }/resources/profile/${f.free_id}/${f.free_picture}" style="width:120px;height:120px"/>
		          </c:otherwise>
		       </c:choose>	
					</th>
					<td class="tdtd" onClick="location.href='${contextPath}/free/freeDetail.do?free_id=${f.free_id}'" style="cursor:pointer;width:600px;">
					
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
	</c:when>
</c:choose>
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




	</div>
	<!-- footer -->
    <div id="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
        
</div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/dist/js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>

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
				var content = "";
					for(i=0; i<f.length; i++){
						
						content += "<tr>";
						content += "<th onClick=\"location.href='${contextPath}/free/freeDetail.do?free_id="+f[i].free_id+"'\" style='cursor:pointer;'>";
						if(f[i].free_picture == 'no file' || f[i].free_picture == null){
							if(f[i].free_gender==0){
								content += "<img src='${contextPath}/resources/profile/img3.jpg' style='width:120px;height:120px'/>";
							}else{
								content += "<img src='${contextPath}/resources/profile/img2.jpg' style='width:120px;height:120px'/>";
							}
						}else{
							content += "<img src='${contextPath }/resources/profile/"+f[i].free_id+"/"+f[i].free_picture+"' style='width:120px;height:120px'/>";
						}
						content += "</th>";
						content += "<td class='tdtd' onClick=\"location.href='${contextPath}/free/freeDetail.do?free_id="+f[i].free_id+"'\" style='cursor:pointer;'>";
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