<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<%
   request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title>
<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
   
   <style>
      table {margin: auto; }
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
       #modBtn2{display:none;}
    
    .subbut{
       font-size: 1.5em;
        background-color: #343A40;
        border: 1px solid #343A40;
        border-radius: 15px;
        width: 24%;
        color: white;
        font-weight: bold;
      }
      .subbut2{
          font-size: 1.5em;
           background-color: #FFFFFF;
           border: 1px solid #343A40;
           border-radius: 15px;
           width: 24%;
           color: black;
           font-weight: bold;
      }
      .subbut3{
          font-size: 1.5em;
           background-color: #FFFFFF;
           border: 1px solid #343A40;
           border-radius: 15px;
           width: 24%;
           color: black;
           font-weight: bold;
      }
      .subbut4{
          font-size: 1.5em;
           background-color: #FFFFFF;
           border: 1px solid #343A40;
           border-radius: 15px;
           width: 24%;
           color: black;
           font-weight: bold;
      }
      
    
   </style>
   
   <style>
       .msg {
          color:gray;
          padding-right:20px
       }
       .msg1:hover{
          color:#cccccc
       }
       
       .sear {
          color:gray;
          padding-right:20px;
       }
       .sear1:hover{
          color:#cccccc;
       }
       
       .ch{
               font-size:1em;
               border:none;
               background-color:#DDDDDD;   
            }
            
            .chan{
               font-size:1em;
               border:none;
               background-color:#DDDDDD;   
            }
            
            .lab{
               font-size:1.2em;
               font-weight:600;
            }
            
            .myInfo{
               margin-left:30%;
               margin-right:30%;
            }
            
            .btn1{
               background-color: #DDDDDD;
               border: 1px solid #343A40;
                border-radius: 15px;
                width: 30%;
                color: black;
                margin-left:35%;
                
            }
            .btn100{
               background-color: #DDDDDD;
               border: 1px solid #343A40;
                border-radius: 15px;
                width: 30%;
                color: black;
                margin-left:5%;
                
            }
            .btn1:hover{
               background-color: #343A40;
               color: white;
            }
            .btn100:hover{
               background-color: #343A40;
               color: white;
            }
            .btn2{
               background-color: #343A40;
               border: 1px solid #343A40;
                border-radius: 15px;
                width: 30%;
                color: white;
                margin-left:35%;
            }
            .btn2:hover{
               background-color: #DDDDDD;
               color: black;
            }
            .btn3{
               background-color: #DDDDDD;
               border: 1px solid #343A40;
                border-radius: 15px;
                width: 48%;
                color: black;
                
            }
            .btn3:hover{
               background-color: #990000;
               color: #FFFFFF;
            }
            
            table.type1 {
                border-collapse: collapse;
                text-align: left;
                line-height: 1.5;
                width: 800px;
            
            }
            table.type1 thead th {
                padding: 10px;
                font-weight: bold;
                vertical-align: top;
                color: #369;
                border-bottom: 3px solid #036;
            }
            table.type1 tbody th {
                width: 150px;
                padding: 10px;
                font-weight: bold;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
                background: #f3f6f7;
            }
            table.type1 td {
                width: 350px;
                padding: 10px;
                vertical-align: top;
                border-bottom: 1px solid #ccc;
            }
    </style>

   <c:choose>
      <c:when test="${free.free_state == 0 }">
         <script>
            window.onload = function() {
               document.getElementById("yesStop").style.display = 'none';
            }
         </script>
      </c:when>
      <c:when test="${free.free_state == 1 }">
         <script>
          window.onload = function() {
             document.getElementById("noStop").style.display = 'none';
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
      var j = 0
      var lan = new Array(j);
      
      function addSkill(){
         var f = document.frmInfo4;
         var value = f.selectlan.value;
         if(j<10 && value != ""){
            if(lan.indexOf(value) == -1){
               $("#text").append("<li class='lila'>\#"+value+"</li>");   // 밑에 ul tag에 append
               lan[j] = value;   // 선택한 소분류 value를 리스트에 담기
               j++;   
               f.lan.value = lan;
               
               document.getElementById("sp_btn").style.display = "inline"; //전체 삭제 버튼 생기기
            }
         }
      }
      
      
      //전체 삭제 input 중에 id가 btn인거 클릭하면 초기화
      $(function() {
            $('input#sp_btn').on("click", function() {
            
            $( ".lila" ).remove();
            
            lan = [];
            j=0;
            
            document.getElementById("sp_btn").style.display = "none"; //버튼 사라지기
         });
      });

   
      function updateDetail(){         
        var form = $('#frmInfo')[0]; 
         var formData = new FormData(form);
         
         $.ajax({
            url: '${contextPath}/free/updateInfo.do',
            enctype: 'multipart/form-data',
            type: 'post',
            processData: false,
           contentType: false,
            data: formData,
            success: function(res){
               alert("파일 입력이 완료되었습니다.");
               history.go(0);
            },
            error: function(){
               alert("ERROR");
            }
            
         });
      }
     
      function basic(){
         var p = document.getElementById('subbut');
         var p2 = document.getElementById('subbut2');
         var p3 = document.getElementById('subbut3');
         var p4 = document.getElementById('subbut4');
         
         p.style.backgroundColor='#343A40';
         p.style.color='#FFFFFF';
         p2.style.backgroundColor='#FFFFFF';
         p2.style.color='#343A40';
         p3.style.backgroundColor='#FFFFFF';
         p3.style.color='#343A40';
         p4.style.backgroundColor='#FFFFFF';
         p4.style.color='#343A40';
         
         document.myInfo.style.display='block';
         document.frmInfo.style.display='none';
         document.frmInfo2.style.display='none';
         document.frmInfo22.style.display='none';
         document.frmInfo4.style.display='none';
         document.frmInfo44.style.display='none';
         
      }
      
      function picture(){
         var p = document.getElementById('subbut');
         var p2 = document.getElementById('subbut2');
         var p3 = document.getElementById('subbut3');
         var p4 = document.getElementById('subbut4');
         
         p.style.backgroundColor='#FFFFFF';
         p.style.color='#343A40';
         p2.style.backgroundColor='#343A40';
         p2.style.color='#FFFFFF';
         p3.style.backgroundColor='#FFFFFF';
         p3.style.color='#343A40';
         p4.style.backgroundColor='#FFFFFF';
         p4.style.color='#343A40';
         
         document.myInfo.style.display='none';
         document.frmInfo.style.display='block';
         document.frmInfo2.style.display='none';
         document.frmInfo22.style.display='none';
         document.frmInfo4.style.display='none';
         document.frmInfo44.style.display='none';
      }
      
      
      function career(){
         var p = document.getElementById('subbut');
         var p2 = document.getElementById('subbut2');
         var p3 = document.getElementById('subbut3');
         var p4 = document.getElementById('subbut4');
         
         p.style.backgroundColor='#FFFFFF';
         p.style.color='#343A40';
         p2.style.backgroundColor='#FFFFFF';
         p2.style.color='#343A40';
         p3.style.backgroundColor='#343A40';
         p3.style.color='#FFFFFF';
         p4.style.backgroundColor='#FFFFFF';
         p4.style.color='#343A40';
         
         document.myInfo.style.display='none';
         document.frmInfo.style.display='none';
         document.frmInfo4.style.display='none';
         document.frmInfo44.style.display='none';
         
         var career_cnt = "<c:out value='${career_cnt}' />";
         if(career_cnt == 0){
            document.frmInfo2.style.display='block';
            document.frmInfo22.style.display='none';
         }else{
            document.frmInfo2.style.display='none';
            document.frmInfo22.style.display='block';
         }
         
      }
      
      function skill(){
         lan = [];
         j=0;
         console.log(lan);
         var p = document.getElementById('subbut');
         var p2 = document.getElementById('subbut2');
         var p3 = document.getElementById('subbut3');
         var p4 = document.getElementById('subbut4');
         
         p.style.backgroundColor='#FFFFFF';
         p.style.color='#343A40';
         p2.style.backgroundColor='#FFFFFF';
         p2.style.color='#343A40';
         p3.style.backgroundColor='#FFFFFF';
         p3.style.color='#343A40';
         p4.style.backgroundColor='#343A40';
         p4.style.color='#FFFFFF';
         
         document.myInfo.style.display='none';
         document.frmInfo.style.display='none';
         document.frmInfo2.style.display='none';
         document.frmInfo22.style.display='none';
         
         var career_cnt = "<c:out value='${skill_cnt}' />";
         if(career_cnt == 0){
            document.frmInfo4.style.display='block';
            document.frmInfo44.style.display='none';
         }else{
            document.frmInfo4.style.display='none';
            document.frmInfo44.style.display='block';
         }
         
      }
      
      
      function modMyInfo(){
         
         $('.ch').attr('disabled', false);

         document.getElementById("modBtn1").style.display = 'none';
         document.getElementById("modBtn2").style.display = 'block';

         var f = document.myInfo;
         f.addrBtn.disabled = false;
         f.free_hp.style.backgroundColor='#EEEEEE';
         f.free_email.style.backgroundColor='#EEEEEE';
         f.free_pay.style.backgroundColor='#EEEEEE';
         f.free_level.style.backgroundColor='#EEEEEE';
         f.free_addr.style.backgroundColor='#EEEEEE';
      }
      
      
      function modMyInfo2(){
         var frm = document.myInfo;
         
         frm.free_id.disabled=false;
         frm.method = "post";
         frm.action = "${contextPath}/free/modFreeInfo.do";
         frm.submit();
         
         frm.free_id.disabled=true;
         frm.addrBtn.disabled=true;
         $('.ch').attr('disabled', true);
         document.getElementById("modBtn2").style.display = 'none';
         document.getElementById("modBtn1").style.display = 'block';
         alert('정보가 수정되었습니다.');
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
                        document.getElementById("yesStop").style.display = 'inline';
                        document.getElementById("noStop").style.display = 'none';
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
                        document.getElementById("noStop").style.display = 'inline';
                        document.getElementById("yesStop").style.display = 'none';
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
         var free_id = document.myInfo.free_id.value;
         alert(free_id);
         if(confirm('회원탈퇴 시 개인정보 및 모든 데이터는 삭제됩니다.\n정말 탈퇴 하시겠습니까?')){ 
            location.href="${contextPath}/free/drop/"+free_id;
         }else{
            location.href="${contextPath}/free/remypage.do";
         }
            
      }
      
      
      function modCareer1(data){
         
         var f = document.getElementById("frmInfo22");
         var str1 = 'butt' + String(data);
         var str2 = 'bbtn' + String(data);
         
         var cnum = "<c:out value='${fn:length(carList) }' />";
         
           $('.change'+data).attr('disabled',false);
           
            for(var i=1; i<cnum+1; i++){
               $("#butt"+String(i)).css("display","none");
               document.getElementById(str2).style.display = "inline";
               
              }
            
            $('.foldcar').css("display", "none");
      }
      
      
      function modCareer2(cnt){
         
         var f = document.getElementById("frmInfo22");
         
         $.ajax({
            url:'${contextPath}/free/modCareer.do',
            type:'post',
            data:$('#frmInfo22').serialize(),
            dataType: 'json',
            success: function(res){
               
               if($.trim(res) == 1){
                  alert('수정이 완료되었습니다.');
                  
                  var str1 = 'butt' + String(cnt);
                 var str2 = 'bbtn' + String(cnt);
                   
                 var cnum = "<c:out value='${fn:length(carList) }' />";
                   
                  $('.change'+cnt).attr('disabled',true);
                     
                      for(var i=1; i<cnum+1; i++){
                         $("#butt"+String(i)).css("display","inline");
                         document.getElementById(str2).style.display = "none";
                         
                        }
                      
                   $('.foldcar').css("display", "inline");
                  }
               
               },
            error: function(){
                 alert("에러입니다");
              }
               
         });
      }
      
      
      function addCareer(){
         var f = document.frmInfo2;
         f.submit();
         alert('경력이 입력되었습니다.');
      }
      
      function addCareer1(){
        j=0;
         var f = document.getElementById("frmInfo22");
         var nextCnum = $('#add_space tr').length + 1;
         
         var content = "";
         
         content += "<tr>"
         content += "<td><input class='change" + nextCnum + "'type='date' name='free_startdate' /> <input class='change" + nextCnum + "' type='hidden' name='free_cnum' value=" + nextCnum + " /></td>";
         content += "<td><input class='change" + nextCnum + "'type='date' name='free_finishdate' /></td>";
         content += "<td><input class='change" + nextCnum + "'type='text' name='free_pname' /></td>";
         content += "<td><input class='change" + nextCnum + "'type='text' size='40' name='free_pwork' /></td>";
         content += "<td><input class='change" + nextCnum + "'type='text' name='free_company' /></td>";
         content += "<td><input type='button' id='butt" + nextCnum + "' name='butt" + nextCnum +"' onclick='modCareer1(" + nextCnum + ")' value='수정' /></td>";
         content += "<td><input type='button' id='bbtn" + nextCnum + "' name='bbtn" + nextCnum +"' onclick='modCareer2(" + nextCnum + ")' value='수정 완료' style='display:none'/></td></tr>";
          
         $("#add_space").append(content);     
               
               
         $('.foldcar').css("display", "none");
         
         
         for(var i=1; i<=nextCnum; i++){
            $("#butt"+String(i)).attr('disabled', true);
         }
         document.getElementById("add2").style.display = "inline";
      }
      
      
      
      function addCareer2(){
         j = 0;
         $.ajax({
            url:'${contextPath}/free/insertCareer.do',
            type:'post',
            data:$('#frmInfo22').serialize(),
            success: function(){
                  
               alert('경력이 추가되었습니다.');
               
              var f = document.getElementById("frmInfo22");
              var nextCnum = $('#add_space tr').length;
               
             
                 $('.foldcar').css("display", "inline");   // 밑에 접기랑 경력 추가 버튼 나오는거
             
              for(var i=1; i<=nextCnum; i++){
                    $("#butt"+String(i)).attr('disabled', false);   // 각 줄별로 경력 수정버튼 disabled 해제
                 }
                 
              nextCnum = String(nextCnum);
              $('.change'+nextCnum).attr('disabled',true);   // 입력한 input 폼 disabled로 바꾸기
              document.getElementById("add2").style.display = "none";   // 경력추가 완료 버튼 사라지는거
               
            },
            error: function(){
                  alert("에러입니다");
            }
            
         });
         
      }
      
      
      function delSkill(ski, cnt){
         
         var free_id = document.frmInfo44.free_id.value;
         
         $.ajax({
            url:'${contextPath}/free/delSkill.do',
            type:'post',
            data:{free_skill:ski, free_id:free_id},
            success:function(){
               var tr = 'tr' + String(cnt);
               var target = document.getElementById(tr);
               target.remove();
            },
            error: function(request, status, error){
               alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }
         });
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
<body class="sb-nav-fixed" style="background-color:#dddddd">
<div id="wrapper">
<!-- 해더 -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="height:10%">
            <a class="navbar-brand" href="${contextPath}/free/freeMain.do"><img src="${contextPath}/resources/img/logo.png" style="width:100%;heigth:50%"></a>
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                   <span style="color:#dddddd;">${free.free_lastName}${free.free_firstName}</span> <span style="color:white">님</span> 
                     <span style="font-size:20px;color:#cccccc;padding-left:20px">Board&nbsp;</span><a href="${contextPath}/board/list" ><span class="sear sear1"><i class="fas fa-clipboard-list fa-lg"></i></span></a>
                    <div class="input-group-append">
                        <span style="font-size:20px;color:#cccccc">Message&nbsp;&nbsp;</span>
                       <c:choose>
                     <c:when test="${checkNum == 0 || empty checkNum}">
                        <a href="${contextPath}/free/message.do?free_id=${free.free_id}"><span class="msg msg1"><i class="fa fa-envelope fa-lg"></i></span></a>
                     </c:when>
                     <c:when test="${not empty checkNum}">
                        <a href="${contextPath}/free/message.do?free_id=${free.free_id}"><span style="color:red;padding-right:20px;font-size:1.2em;font-weight:700"><i class="fa fa-envelope fa-lg"></i>&nbsp;&nbsp;${checkNum}</span></a>
                     </c:when>
                  </c:choose>
                    </div>
                </div>
            </form>
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-lg"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="${contextPath}/free/goMypage.do">My Page</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${contextPath}/logout.do">Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
   
   <br><br><br>     
   <div id="section">
   
  
   
   <span style="margin-left: auto; margin-right: auto;">
      <input type="button" value="Info" id="subbut" class="subbut" onclick="basic()" />
      <input type="button" value="Picture&Resume" id="subbut2" class="subbut2" onclick="picture()" />
      <input type="button" value="Career" id="subbut3" class="subbut3" onclick="career()" />
      <input type="button" value="SkillSet" id="subbut4" class="subbut4" onclick="skill()" />
   </span>
   <hr></hr>
   
   <div style="float:right;">
      <input type="button" class="btn3" id="noStop" onclick="stopService();" value="정지하기" />
     <input type="button" class="btn3" id="yesStop" onclick="startService();" value="정지해제" />
      <input type="button" class="btn3" onclick="withdraw();" value="탈퇴하기" />
   </div>
      
   <form name="myInfo" id="myInfo" class="myInfo">
      
      <br><br>
      <p>
      <label class="lab">ID</label>
      <input class="chan" id="free_id" name="free_id" type="text" value="${free.free_id}" style="position:relative; left:51%;" disabled>
      </p><hr><br>
      <p>
         <label class="lab">Freelancer HP</label>
         <input class="ch" type="text" name="free_hp" value="${free.free_hp }" style="position:relative; left:34%;" disabled onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
      </p><hr><br>
      <p>
         <label class="lab">Freelancer Email</label>
         <input class="ch" type="text" name="free_email" value="${free.free_email }" style="position:relative; left:30%;" disabled/>
      </p><hr><br>
      <p>
         <label class="lab">Desired Salary</label>
         <input type="text" class="ch" name="free_pay" value="${free.free_pay}" style="position:relative; left:32%;" disabled />
      </p><hr><br>
      <p>
         <label class="lab">Skill Level</label>
         <select name="free_level" class="ch" style="position:relative; left:39%;" disabled> 
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
      </p><hr><br>
      <p>
         <label class="lab">Address</label>
         <input type="text" name="free_addr" id="free_addr" class="ch" value="${free.free_addr}" size="30" style="position:relative; left:41%;" disabled />
        <input type="button" name="addrBtn" class="btn1" onclick="sample6_execDaumPostcode()" value="주소 검색하기" style="position:relative; left:41%; margin:0" disabled>
      </p><hr><br>
      <p>
         <input type="button" class="btn1" id="modBtn1" name="b0" onclick="modMyInfo();" value="정보 수정하기"/>
        <input type="button" class="btn2" id="modBtn2" name="b00" onclick="modMyInfo2();" value="정보 수정" />
      </p>
   </form>
   
     
   
   <form name="frmInfo" id="frmInfo" encType="multipart/form-data" style="margin-left:40%;">
   <br>
   <c:if test="${free.free_picture == null }" >
   
      <c:if test="${free.free_gender == 0 }">
        <div class="select_img">
            <img src="${contextPath }/resources/profile/img3.jpg" width="200" />
        </div>
      </c:if>
      <c:if test="${free.free_gender == 1 }">
         <div class="select_img">
         <img src="${contextPath }/resources/profile/img2.jpg" width="200" />
         </div>
      </c:if>
      <br>
      <label class="lab">사진 등록 </label>
      <input type="file" name="free_pic" id="free_pic" />
         <script>
         
           $("#free_pic").change(function(){
            if(this.files && this.files[0]) {
             var reader = new FileReader();
             reader.onload = function(data) {
                 $(".select_img img").attr("src", data.target.result).width(200);        
                }
             reader.readAsDataURL(this.files[0]);
             document.getElementById("fileBtn").disabled = false;
            }
           });
          </script>
   </c:if>
   
   <c:if test="${free.free_picture != null }">
         <label class="lab">현재 사진 </label>
      <div class="select_img">
         <img src="${contextPath }/resources/profile/${free.free_id}/${free.free_picture }" width="200" />
         </div>
         <br>
         <label class="lab">사진 수정</label>
      <input type="file" name="free_pic" id="free_pic" />
            <script>
            
              $("#free_pic").change(function(){
               if(this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function(data) {
                    $(".select_img img").attr("src", data.target.result).width(200);   
                   }
                reader.readAsDataURL(this.files[0]);
                document.getElementById("fileBtn").disabled = false;
               }
              });
             </script>
   </c:if>
   <br>
   
   <label class="lab">이력서</label>
   <c:if test="${free.free_file != null }" >
     <label class="lab">현재 파일 : <a href="${contextPath}/free/fileDown.do">${free.free_file}</a></label>
       <br>
       <label class="lab">파일 수정 <input type="file" name="free_file" value="이력서 업로드" id="free_file"/></label>
       <script>
          $("#free_file").change(function(){
             if(this.files && this.files[0]){
             document.getElementById("fileBtn").disabled = false;
             }
          })
       </script>
   </c:if>
   
   <c:if test="${free.free_file == null }" >
       <label class="lab">파일 업로드 <input type="file" id="free_file" name="free_file" value="이력서 업로드" /></label>
       <script>
          $("#free_file").change(function(){
             if(this.files && this.files[0]){
             document.getElementById("fileBtn").disabled = false;
             }
          })
       </script>
   </c:if><br><br><br><br>
 
    <input type="button" style="width:240px" class="btn100" id="fileBtn" name="b1" onclick="updateDetail();" value="파일 업로드" disabled/>
    
   </form>
   
   <br><br>
   <form:form name="frmInfo2" id="frmInfo2" modelAttribute="carList" action="${contextPath}/free/addCareer.do">
   <br><br>
   <table class="type1">
      <thead>
      <tr>
         <th>시작일</th>
         <th>종료일</th>
         <th>프로젝트명</th>
         <th>주요 업무</th>
         <th>회사 이름</th>
       </tr>
      </thead>
      <c:forEach var="no" begin="1" end="${career_num}">
      <input type="hidden" name="carList[${no-1}].free_id" value="${free.free_id }" />
      <input type="hidden" name="carList[${no-1 }].free_cnum" value="${no }" />
      <tbody>
      <tr>
         <td><input type="date" name="carList[${no-1 }].free_startdate" /></td>
         <td><input type="date" name="carList[${no-1 }].free_finishdate" /></td>
         <td><input type="text" name="carList[${no-1 }].free_pname" /></td>
         <td><input type="text" size="40" name="carList[${no-1 }].free_pwork" /></td>
         <td><input type="text" name="carList[${no-1 }].free_company" /></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="5"><p align="center">
            <input type="button" class="btn1" style="margin:0; width:240px" id="b2" name="b2" value="경력 사항 추가" onclick="addCareer()"/>
         </td>
      </tr>
      </tbody>
   </table>
   </form:form>
   
   
    <form name="frmInfo22" id="frmInfo22" >
    
    <input type="hidden" name="free_id" value="${free.free_id }" />
    <input type="hidden" name="lastcnum" value="${career_cnt }" disabled/>
      
   <table id="cartable" class="type1">
      <thead>
      <tr>
         <th>시작일</th>
         <th>종료일</th>
         <th>프로젝트명</th>
         <th>주요 업무</th>
         <th>회사 이름</th>
         <th colspan="2">수정</th>
      </tr>
      </thead>
      <tbody id="add_space">
      <c:forEach var="career" items="${carList}" varStatus="status">
      <tr>
         <td><input class="change${status.count }" type="date" id="free_startdate" name="free_startdate" value="${career.free_startdate }" disabled/>
            <input class="change${status.count }" type="hidden" id="free_cnum" name="free_cnum" value="${status.count }" disabled/>
         </td>
         <td><input class="change${status.count }" type="date" id="free_finishdate" name="free_finishdate" value="${career.free_finishdate }" disabled/></td>
         <td><input class="change${status.count }" type="text" id="free_pname" name="free_pname" value="${career.free_pname }" disabled/></td>
         <td><input class="change${status.count }" size="40" type="text" id="free_pwork" name="free_pwork" value="${career.free_pwork }" disabled/></td>
         <td><input class="change${status.count }" type="text" id="free_company" name="free_company" value="${career.free_company }" disabled/></td>
         <td><input type="button" id="butt${status.count }" name="butt${status.count }" onclick="modCareer1(${status.count})" value="수정" /></td>
         <td><input type="button" id="bbtn${status.count }" name="bbtn${status.count }" onclick="modCareer2(${status.count})" value="수정완료" style="display:none;" /></td>
      </tr>
      </c:forEach>
     </tbody>
     <tbody>
      <tr>
         <td colspan="7"><p align="center">
            <input class="foldcar" class="btn2" type="button" onclick="addCareer1()" value="경력 추가" />
            <input type="button" id="add2" onclick="addCareer2()" value="추가 완료" style="display:none;"/>
         </td>
      </tr>
     </tbody>
   </table>
   </form>
   
   <div style="text-align:center;">
   <form name="frmInfo4" id="frmInfo4" method="POST" action="${contextPath}/free/addSkill.do">
   <input type="hidden" name="free_id" value="${free.free_id }" />
   <br><br>
      <select name="bigSelectLang" onchange="categoryChange(this)" style="width:15%;height:15%;border-radius:8px;outline:0;text-align:center;">
       <option>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--분야선택--</option>
       <option value="WEB">웹</option>
       <option value="APP">응용</option>
       <option value="SYS">시스탬</option>
       <option value="MOB">모바일</option>
       <option value="DBA">DBA</option>
       <option value="PUB">Publishing</option>
       <option value="BAI">빅데이터/AI</option>
      </select>
      
    <select id="free_skill" name="selectlan" onchange="addSkill(document.frmInfo4.selectlan.options.selectedIndex);" style="width:15%;height:15%;border-radius: 8px;outline:0;text-align:center;">
       <option selected value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-사용언어선택-</option>
       <option value=""></option>
    </select>
     
      <input type="hidden" name="lan">
        <br>
         <div style="padding-left:40%; padding-right:30%;font-size:1.6em;font-weight:600;"><ul id="text" ></ul></div>
         
         <br><br><br><br><br>
         
         <input id="sp_btn" class="btn1" style="margin:0; width:120px" type="button" value="전체삭제"  />
         <input type="button" class="btn1" style="margin:0; width:240px" id="b4" name="b4" value="기술 정보 입력" onclick="addSkillList()" /> 
         
   </form>
   </div>
   
   <br>
   <form name="frmInfo44" id="frmInfo44" style="margin-left:5%;">
   <input type="hidden" name="free_id" value="${free.free_id }" />
      <table class="type1" style="width:500px">
         <thead>
         <tr>
            <th style="font-size:1.4em;">보유 기술</th>
            <th style="font-size:1.4em;">삭제</th>
         </tr>
        </thead>
         <c:forEach var="skil" items="${skill}" varStatus="status">
         <tbody>
            <tr id="tr${status.count }">
            <td><input type="text" name="free_skill${status.count }" value="${skil}" disabled/></td>
            <td><input type="button" class="btn2" style="margin:0; width:80px" onclick="delSkill('${skil}', ${status.count })" value="삭제" /></td>
            </tr>      
         </c:forEach>
         <tr>
            <td colspan="2"><p align="center">
            <input type="button" class="btn2" style="margin:0; width:80px" onclick="addbtn()" value="추가" />
            </td>
         </tr>
         </tbody>
      </table>
   </form>
   <br>
   <br>

   </div>
   <!--  푸터 -->
        <div id="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
        
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/dist/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>
</body>
<script>
   
   function addSkillList(){
      
      var f = document.frmInfo4;
      f.submit();
      alert('기술 정보가 입력되었습니다.');
   }

   function addbtn(){
      document.frmInfo44.style.display = 'none';
      document.frmInfo4.style.display = 'block';
    document.getElementById("btn4").style.display = 'none';      
   }
</script>
</html>