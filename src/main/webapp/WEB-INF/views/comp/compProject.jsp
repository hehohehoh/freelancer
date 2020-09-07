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
<title>Insert title here</title>
<style>
#proj_num{
  border-color: darkgrey;
  border-style: solid;
  border-width: 1px;
  background-color: rgb(240, 240, 240);
  color: rgb(109, 109, 109);
  padding: 2px 0px;
} 
.nullw{
   font-size:x-large;
   font-weight:600;
}
.chg1{
   text-align:left;
   font-size:1em;
   border:none;
   background-color:#DDDDDD;
}
.chg2{
   text-align:left;
   font-size:1em;
   border:none;
   background-color:#DDDDDD;
}
.inputname{
   font-weight: 600;
}
.butn{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 8%;
    color: white;
    margin-left:65%;
    
}
.bttn{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
    margin-left:70%;
}
.delbtn{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 6%;
    color: white;
}
.addpro{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
    margin-left:45%;
}
.inputpbox{
   text-align:left;
   width:70%;
   font-size:1em;
   border: 1px solid black;
   background-color:#FFFFFF;
}
.canclepro{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 6%;
    color: white;
    margin-left:64%;
}
.cmitpro{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 8%;
    color: white;
}
 </style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

   function project_send(){
      var frmComp = document.invalues;
      var proj_name = frmComp.proj_name.value;
      var proj_work = frmComp.proj_work.value;
      var proj_startdate = frmComp.proj_startdate.value;
      var proj_finishdate = frmComp.proj_finishdate.value;
       if(proj_name.length==0 || proj_name==""){
         alert("프로젝트 이름을 입력해주세요");
      }else if(proj_work.length==0 || proj_work==""){
         alert("프로젝트 내용을 입력해주세요");
      }else if(proj_startdate.length==0 || proj_startdate==""){
         alert("프로젝트 시작날짜를 입력해주세요");
      }else if(proj_finishdate.length==0 || proj_finishdate==""){
         alert("프로젝트 종료날짜를 입력해주세요");
      }else{
         frmComp.method = "post";
         frmComp.action = "${contextPath}/comp/projectin.do";
         frmComp.submit();
         document.getElementById("cmitpro").style.display = "none";
         alert("추가 완료되었습니다");
      }
   }
   
   
   function proj_send(data){
       
      var frmComp = document.project;
      
      var proj_num = 'proj_num'+String(data);
      var proj_name = 'proj_name'+String(data);
      var proj_work = 'proj_work'+String(data);
      var proj_startdate = 'proj_startdate'+String(data);
      var proj_finishdate = 'proj_finishdate'+String(data);
      
      var pnum = document.getElementById(proj_num).value;
      var pname = document.getElementById(proj_name).value;
      var pwork = document.getElementById(proj_work).value;
      var startdate = document.getElementById(proj_startdate).value;
      var finishdate = document.getElementById(proj_finishdate).value;
      
      if(pname.length==0 || pname==""){
         alert("프로젝트 이름을 입력해주세요");
      }else if(pwork.length==0 || pwork==""){
         alert("프로젝트 내용을 입력해주세요");
      }else if(startdate.length==0 || startdate==""){
         alert("프로젝트 시작날짜를 입력해주세요");
      }else if(finishdate.length==0 || finishdate==""){
         alert("프로젝트 종료날짜를 입력해주세요");
      }else{
         frmComp.method = "post";
         frmComp.action = "${contextPath}/comp/projecter.do";
         frmComp.submit();
         alert("수정 완료되었습니다.");
      }
      
   }
   
   function proj_able(data){
      
      var form = document.project;
      var str = 'butn' + String(data);
      var str2 = 'bttn' + String(data);
      var ch = 'chg' + String(data);
      
      var pa1 = 'proj_name'+String(data);
      var pa2 = 'proj_work'+String(data);
      var pa3 = 'proj_startdate'+String(data);
      var pa4 = 'proj_finishdate'+String(data);
      
      var parea1 = document.getElementById(pa1);
      var parea2 = document.getElementById(pa2);
      var parea3 = document.getElementById(pa3);
      var parea4 = document.getElementById(pa4);
      
      var button = document.getElementById(str).value;
      
      var form = document.project;
      var num = form.lastprojnum.value;
      
      $('.chg'+data).attr('disabled',false);
      for(i=1; i<num+1; i++){
         $("#butn"+i).css("display","none");
         $("#delbtn"+i).css("display","none");
      }
      document.getElementById(str2).style.display = "inline";
      parea1.style.backgroundColor='#FFFFFF';
      parea2.style.backgroundColor='#FFFFFF';
      parea3.style.backgroundColor='#FFFFFF';
      parea4.style.backgroundColor='#FFFFFF';
   
   }
   
   function add_text(){
      
      var form = document.project;
      var pnum = form.lastprojnum.value;
      var pnum = Number(pnum) + 1;
      
      document.getElementById("text_space").innerHTML +=
         "<input type='hidden' id='proj_num' name='proj_num' value='"+pnum+"'><br>";
      document.getElementById("text_space").innerHTML +=
         "<br>Project Name : <input type='text' class='inputpbox' id='proj_name' placeholder='진행중인 프로젝트 이름' name='proj_name' style='width:60%;'><br>";
      document.getElementById("text_space").innerHTML +=
         "Project Content <br> <textarea id='proj_work' class='inputpbox' name='proj_work' placeholder='진행중인 프로젝트 내용' style='border-radius: 15px;' form='invalues1' rows='10' cols='50' autofocus required wrap='hard'></textarea><br>";
      document.getElementById("text_space").innerHTML +=
         "Start Date : <input type='date' class='inputpbox' id='proj_startdate' name='proj_startdate' style='width:26%;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
      document.getElementById("text_space").innerHTML +=
         "Finish Date : <input type='date' class='inputpbox' id='proj_finishdate' name='proj_finishdate' style='width:26%;'><br><br>";
      
      form.lastprojnum.value = pnum;
      
      document.getElementById("addpro").style.display = "none";
      document.getElementById("cmitpro").style.display = "inline";
      document.getElementById("canclepro").style.display = "inline";
   }

   function del_text(){
      
      var form = document.project;
      var pnum = form.lastprojnum.value;
      var pnum = Number(pnum) - 1;
      
      document.getElementById("alltext_space").removeChild(text_space);
      
      var div = document.createElement('div');
      div.id="text_space";
      parent.document.getElementById("alltext_space").appendChild(div);
      
      form.lastprojnum.value = pnum;
      
      document.getElementById("addpro").style.display = "inline";
      document.getElementById("cmitpro").style.display = "none";
      document.getElementById("canclepro").style.display = "none";
   }
   
   function proj_del(data){
      var frmComp = document.project;
      var comp_id = frmComp.comp_id.value;
      location.href="${contextPath}/comp/delproject.do?proj_num="+data+"&comp_id="+comp_id;
       alert("프로젝트가 삭제되었습니다.");
      
   }
</script> 
</head>
<body>
   <form name="project" id="projects">
   <input type="hidden" name="comp_id" value="${company.comp_id}">
   

      <c:if test="${project != null}" >
         <c:forEach var="project" items="${project}" varStatus="bNum">
         <input class="chg${bNum.count}" id="proj_num${bNum.count}" name="proj_num" type="hidden" value="${bNum.count}" disabled>
        <div class="project${bNum.count}" style="margin-left:27%;"><br>
        <p>
        <label class="inputname">Project Name</label>&nbsp;&nbsp;&nbsp;
           <input class="chg${bNum.count}" id="proj_name${bNum.count}" name="proj_name" type="text" style="width:58%;" value="${project.proj_name}" disabled>
        </p>
        <p>
        <label class="inputname">Project Content</label><br>
           <textarea class="chg${bNum.count}" id="proj_work${bNum.count}" name="proj_work" style="width:70%; border: 1px solid black; border-radius : 8px; background-color:#EEEEEE;" form="projects" rows="10" cols="50" autofocus required wrap="hard" disabled>${project.proj_work}</textarea>
        </p>
        <p>
        <label class="inputname">Start Date&nbsp;&nbsp;</label>
           <input class="chg${bNum.count}" id="proj_startdate${bNum.count}" name="proj_startdate" type="date" value="${project.proj_startdate}" disabled><br>
        <label class="inputname">Finish Date&nbsp;</label>  
           <input class="chg${bNum.count}" id="proj_finishdate${bNum.count}" name="proj_finishdate" type="date" value="${project.proj_finishdate}" disabled>
        </p>
        </div>
               <input type="button" class="butn" id="butn${bNum.count}" name="butn${bNum.count}" value="수정" onclick="proj_able(${bNum.count})" />
              <input type="button" class="bttn" id="bttn${bNum.count}" name="bttn${bNum.count}" value="수정완료" onclick="proj_send(${bNum.count})">
               <input type="button" class="delbtn" id="delbtn${bNum.count}" name="delbtn${bNum.count}" value="삭제" onclick="proj_del(${project.proj_num})">
               <hr>
         </c:forEach>
      </c:if> 
   <input type="hidden" name="lastprojnum" id="lastprojnum" value="${fn:length(project)}">
</form>

<form name="invalues" id="invalues1" >
   <input type="hidden" name="comp_id" value="${company.comp_id}">
   <div id="alltext_space" style="margin-left:27%;">
         <div id="text_space">
         </div>
   </div>
   <input type="button" class="addpro" id="addpro" value="추가" onclick="add_text()">
   <input type="button" class="canclepro" id="canclepro" value="취소" onclick="del_text()">
   <input type="button" class="cmitpro" id="cmitpro" value="추가완료" onclick="project_send()"><br>
    
</form>
   
</body>
</html>