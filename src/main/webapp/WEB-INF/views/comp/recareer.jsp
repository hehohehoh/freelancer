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
<title>마이페이지</title>
<style>
#comp_cnum{
   border-color: darkgrey;
   border-style: solid;
   border-width: 1px;
   background-color: rgb(240, 240, 240);
   color: rgb(109, 109, 109);
   padding: 2px 0px;
}
.all_space{
   margin-left:27%;
}
.inputbox{
   text-align:left;
   width:70%;
   font-size:1em;
   border: 1px solid black;
   background-color:#FFFFFF;
}
.change1{
   text-align:left;
   width:60%;
   font-size:1em;
   border:none;
   background-color:#DDDDDD;
}
.change2{
   text-align:left;
   width:60%;
   font-size:1em;
   border:none;
   background-color:#DDDDDD;
}
.change3{
   text-align:left;
   width:60%;
   font-size:1em;
   border:none;
   background-color:#DDDDDD;
}
.change4{
   text-align:left;
   width:60%;
   font-size:1em;
   border:none;
   background-color:#DDDDDD;
}
.but1{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
    margin-left:70%;
    
}
.but2{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
    margin-left:70%;
}
.but3{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
    margin-left:45%;
}
.but4{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
    margin-left:63%;
}
.but5{
   background-color: #343A40;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 10%;
    color: white;
}
.mainname{
   font-weight: 600;
}
 </style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

   function career_send(){
      var frmComp = document.invalue;
   
      var comp_pname = frmComp.comp_pname.value;
      var comp_pwork = frmComp.comp_pwork.value;
      var comp_startdate = frmComp.comp_startdate.value;
      var comp_finishdate = frmComp.comp_finishdate.value;
      
       if(comp_pname.length==0 || comp_pname==""){
         alert("프로젝트 이름을 입력해주세요");
      }else if(comp_pwork.length==0 || comp_pwork==""){
         alert("프로젝트 내용을 입력해주세요");
      }else if(comp_startdate.length==0 || comp_startdate==""){
         alert("프로젝트 시작날짜를 입력해주세요");
      }else if(comp_finishdate.length==0 || comp_finishdate==""){
         alert("프로젝트 종료날짜를 입력해주세요");
      }else{
         frmComp.method = "post";
         frmComp.action = "${contextPath}/comp/careerin.do";
         frmComp.submit();
         document.getElementById("cmit").style.display = "none";
         alert("추가 완료되었습니다");
      }
   }
   
   
   function recareer_send(data){
       
      var frmComp = document.career;
      
      var comp_cnum = 'comp_cnum'+String(data);
      var comp_pname = 'comp_pname'+String(data);
      var comp_pwork = 'comp_pwork'+String(data);
      var comp_startdate = 'comp_startdate'+String(data);
      var comp_finishdate = 'comp_finishdate'+String(data);
      
      var cnum = document.getElementById(comp_cnum).value;
      console.log(cnum);
      var pname = document.getElementById(comp_pname).value;
      var pwork = document.getElementById(comp_pwork).value;
      var startdate = document.getElementById(comp_startdate).value;
      var finishdate = document.getElementById(comp_finishdate).value;
      
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
         frmComp.action = "${contextPath}/comp/careerre.do";
         frmComp.submit();
         alert("수정 완료되었습니다.");
      }
      
   }
   
   function comp_able(data){
      
      var form = document.career;
      var str = 'button' + String(data);
      var str2 = 'btn' + String(data);
      
      var ch = 'change' + String(data);
      
      var a1 = 'comp_pname'+String(data);
      var a2 = 'comp_pwork'+String(data);
      var a3 = 'comp_startdate'+String(data);
      var a4 = 'comp_finishdate'+String(data);
      
      var area1 = document.getElementById(a1);
      var area2 = document.getElementById(a2);
      var area3 = document.getElementById(a3);
      var area4 = document.getElementById(a4);
      
      /* document.getElementById("btn").style.display = "block"; */
      
      var button = document.getElementById(str).value;
      console.log(button);
      
      var form = document.career;
      var cnum = form.lastcnum.value;
      
      $('.change'+data).attr('disabled',false);
      for(i=1; i<cnum+1; i++){
         $("#button"+i).css("display","none");}
      document.getElementById(str2).style.display = "inline";
      area1.style.backgroundColor='#FFFFFF';
      area2.style.backgroundColor='#FFFFFF';
      area3.style.backgroundColor='#FFFFFF';
      area4.style.backgroundColor='#FFFFFF';
         
         
         
   
   }
   
   function add_textbox(){
      
      var form = document.career;
      var cnum = form.lastcnum.value;
      var cnum = Number(cnum) + 1;
      
      document.getElementById("t_space").innerHTML +=
         "Hysteresis Number : <input type='number' class='inputbox' id='comp_cnum' style='width:44%;' name='comp_cnum' value='"+cnum+"' readonly><br>";
      document.getElementById("t_space").innerHTML +=
         "<br>Title : <input type='text' class='inputbox' id='comp_pname' name='comp_pname' style='width:60%;' placeholder='회사 이력에 추가할 프로젝트 이름'><br>";
      document.getElementById("t_space").innerHTML +=
         "Content <br> <textarea id='comp_pwork' class='inputbox' name='comp_pwork' form='invalue1' placeholder='회사 이력에 추가할 프로젝트 내용' style='border-radius: 8px;'rows='10' cols='50' autofocus required wrap='hard'></textarea><br>";
      document.getElementById("t_space").innerHTML +=
         "Start Date : <input type='date' class='inputbox' id='comp_startdate' name='comp_startdate' style='width:20%;'>";
      document.getElementById("t_space").innerHTML +=
         "&nbsp;&nbsp;&nbsp;&nbsp;Finish Date : <input type='date' class='inputbox' id='comp_finishdate' name='comp_finishdate' style='width:20%;'><br><br>";
      
      form.lastcnum.value = cnum;
      
      document.getElementById("add").style.display = "none";
      document.getElementById("cmit").style.display = "inline";
      document.getElementById("cancle").style.display = "inline";
   }

   function del_textbox(){
      
      var form = document.career;
      var cnum = form.lastcnum.value;
      var cnum = Number(cnum) - 1;
      
      document.getElementById("all_space").removeChild(t_space);
      
      var div = document.createElement('div');
      div.id="t_space";
      parent.document.getElementById("all_space").appendChild(div);
      
      form.lastcnum.value = cnum;
      
      document.getElementById("add").style.display = "inline";
      document.getElementById("cmit").style.display = "none";
      document.getElementById("cancle").style.display = "none";
   }
</script>   
</head>
<body>


<form name="career" id="careers" action = "${contextPath}/comp/careerre.do" method="post">


   
   <c:if test="${career != null}" >
      <c:forEach var="career" items="${career}" varStatus="buNum">
     <div class="all${buNum.count}" style="margin-left:27%;">
        <p>
        <label class="mainname">Hysteresis Number&nbsp;${buNum.count} </label>
           <input class="change${buNum.count}" id="comp_cnum${buNum.count}" name="comp_cnum" type="hidden" value="${buNum.count}" disabled>
        </p>   
        <hr style="margin-right:27%;" />
        
        
        <p>
        <label class="mainname">Title</label>&nbsp;&nbsp;&nbsp;
           <input class="change${buNum.count}" id="comp_pname${buNum.count}" name="comp_pname" type="text" value="${career.comp_pname}" disabled>
        </p>
        
        <p>
        <label class="mainname">Content</label><br>
            <textarea class="change${buNum.count}" id="comp_pwork${buNum.count}" name="comp_pwork" form="careers" rows="10" cols="50" autofocus required wrap="hard" style="width:70%; border: 1px solid black;
             border-radius : 8px; background-color:#EEEEEE;" disabled>${career.comp_pwork}</textarea>
        </p>
     
         <p>
         <label class="mainname">Start Date&nbsp;&nbsp;</label>
            <input class="change${buNum.count}" id="comp_startdate${buNum.count}" name="comp_startdate" type="date" value="${career.comp_startdate}" style="width:20%;" disabled> <br>
         <label class="mainname">Finish Date&nbsp;</label>     
            <input class="change${buNum.count}" id="comp_finishdate${buNum.count}" name="comp_finishdate" type="date" value="${career.comp_finishdate}" style="width:20%;" disabled>
          </p>
       </div>
       <br> <input class="but1" type="button" id="button${buNum.count}" name="button${buNum.count}" value="수정" onclick="comp_able(${buNum.count})" />
            <input class="but2 "type="button" id="btn${buNum.count}" name="btn${buNum.count}" value="수정완료" onclick="recareer_send(${buNum.count})">
      <br><hr><br>
      </c:forEach>
   </c:if>
   <input type="hidden" name="lastcnum" value="${fn:length(career)}">
</form>
<form name="invalue" id="invalue1" >
   <div class="all_space" id="all_space">
         <div class="t_space" id="t_space">
         </div>
   </div>
   <input class="but3" type="button" id="add" value="추가" onclick="add_textbox()">
   <input class="but4" type="button" id="cancle" value="취소" onclick="del_textbox()">
   <input class="but5" type="button" id="cmit" value="추가완료" onclick="career_send()"><br>
    
</form>

   
   
</body>
</html>