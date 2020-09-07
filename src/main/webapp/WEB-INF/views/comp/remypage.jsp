<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="addCareer" value="${param.addCareer}" />
<c:set var="addProject" value="${param.addProject}" />
<!DOCTYPE html>
<html lang="en">
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
   #commitBtn{display:none;}
   
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
</style>

   
   <c:if test="${info == 'info' && addCareer != 'add' && addProject != 'add'}">
      <script>
          window.onload = function(){
             document.career.style.display = 'none';
             document.invalue.style.display = 'none';
             
             document.project.style.display = 'none';
             document.invalues.style.display = 'none';
             
             var btn = document.getElementById("subbut");
             var btn2 = document.getElementById("subbut2");
             var btn3 = document.getElementById("subbut3");
             btn.style.backgroundColor = '#343a40';
             btn.style.color = 'white';
             btn2.style.backgroundColor = 'white';
             btn2.style.color = '#343a40';
             btn3.style.backgroundColor = 'white';
             btn3.style.color = '#343a40';
             
          }
       </script>
   </c:if>
   <c:if test="${addProject == 'add' && addCareer != 'add'}">
      <script>
          window.onload = function(){
             var form = document.project;
             form.style.display = 'block';
             document.invalues.style.display = 'block';
             document.info.style.display = 'none';
             document.career.style.display = 'none';
             document.invalue.style.display = 'none';
             
             var btn = document.getElementById("subbut");
             var btn2 = document.getElementById("subbut2");
             var btn3 = document.getElementById("subbut3");
             btn.style.backgroundColor = 'white';
             btn.style.color = '#343a40';
             btn2.style.backgroundColor = '#343a40';
             btn2.style.color = 'white';
             btn3.style.backgroundColor = 'white';
             btn3.style.color = '#343a40';
             
             document.getElementById("cmitpro").style.display = "none";
             var len = form.lastprojnum.value;
                console.log(len);
                for(i=1; i <= len ; i++){
                   var str = "bttn" + String(i);
                   console.log(str);
                   document.getElementById(str).style.display = "none";
                }
               document.getElementById("canclepro").style.display = "none";
             
         }
      </script>
   </c:if>
   <c:if test="${addCareer == 'add'&& addProject != 'add'}">
      <script>
          window.onload = function(){
             var form = document.career;
             form.style.display = 'block';
             document.invalue.style.display = 'block';
             document.info.style.display = 'none';
             document.project.style.display = 'none';
             document.invalues.style.display = 'none';
             
             var btn = document.getElementById("subbut");
             var btn2 = document.getElementById("subbut2");
             var btn3 = document.getElementById("subbut3");
             btn.style.backgroundColor = 'white';
             btn.style.color = '#343a40';
             btn2.style.backgroundColor = 'white';
             btn2.style.color = '#343a40';
             btn3.style.backgroundColor = '#343a40';
             btn3.style.color = 'white';
             
             document.getElementById("cmit").style.display = "none";
             var len = form.lastcnum.value;
                console.log(len);
                for(i=1; i <= len ; i++){
                   var str = "btn" + String(i);
                   console.log(str);
                   document.getElementById(str).style.display = "none";
                }
               document.getElementById("cancle").style.display = "none";
             
         }
      </script>
   </c:if>
   


<script>

   function basic1(){
      var property = document.getElementById('subbut');
      var property2 = document.getElementById('subbut2');
      var property3 = document.getElementById('subbut3');
      document.career.style.display = 'none';
      document.invalue.style.display = 'none';
      document.info.style.display = 'block';
      document.project.style.display = 'none';
      document.invalues.style.display = 'none';
      property.style.backgroundColor='#343A40';
      property.style.color='#FFFFFF';
      property2.style.backgroundColor='#FFFFFF';
      property2.style.color='#343A40';
      property3.style.backgroundColor='#FFFFFF';
      property3.style.color='#343A40';
   }
   
   function career1(){
      var form = document.career;
      var property = document.getElementById('subbut');
      var property2 = document.getElementById('subbut2');
      var property3 = document.getElementById('subbut3');
      form.style.display = 'block';
      document.invalue.style.display = 'block';
      document.info.style.display = 'none';
      document.project.style.display = 'none';
      document.invalues.style.display = 'none';
      property.style.backgroundColor='white';
      property.style.color='#343A40';
      property2.style.backgroundColor='white';
      property2.style.color='#343A40';
      property3.style.backgroundColor='#343A40';
      property3.style.color='white';
      
      var len = form.lastcnum.value;
         console.log(len);
         for(i=1; i <= len ; i++){
            var str = "btn" + String(i);
            console.log(str);
            document.getElementById(str).style.display = "none";
         }
      document.getElementById("cmit").style.display = "none";
      document.getElementById("cancle").style.display = "none";
      
   }
   
   function project1(){
      var form = document.project;
      var property = document.getElementById('subbut');
      var property2 = document.getElementById('subbut2');
      var property3 = document.getElementById('subbut3');
      form.style.display = 'block';
      document.invalues.style.display = 'block';
      document.info.style.display = 'none';
      document.career.style.display = 'none';
      document.invalue.style.display = 'none';
      property.style.backgroundColor='white';
      property.style.color='#343A40';
      property2.style.backgroundColor='#343A40';
      property2.style.color='#FFFFFF';
      property3.style.backgroundColor='white';
      property3.style.color='#343A40';
      
      
      document.getElementById("cmitpro").style.display = "none";
      var len = form.lastprojnum.value;
      
      for(i=1; i <= len ; i++){
         var str = "bttn" + String(i);
         document.getElementById(str).style.display = "none";
      }
      document.getElementById("canclepro").style.display = "none";
      
   }
   
   function comp_out(){
      
      var result = confirm("회원탈퇴 시 개인정보 및 모든 데이터는 삭제됩니다.\n정말 탈퇴 하시겠습니까?");
      if(result){
         alert("회원탈퇴가 완료됐습니다. 그 동안 이용해 주셔서 감사합니다. ");
         location.href="${contextPath}/comp/compout.do";
      }else{
         location.href="${contextPath}/comp/remypage.do";
      }
      
   }
   
   function comp_send(){
      
      var Comp = document.info;
      
      var comp_mname = Comp.comp_mname.value;
      var comp_mhp = Comp.comp_mhp.value;
      var comp_memail = Comp.comp_memail.value;
      var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
      
      if(exptext.test(comp_memail)==false){
           alert("이메일형식이 올바르지 않습니다.");
           return false;
       }else if(comp_mname.length==0 || comp_mname==""){
         alert("담당자 이름을 입력해주세요");
      }else if(comp_mhp.length==0 || comp_mhp==""){
         alert("담당자 핸드폰 번호를 입력해주세요");
      }else if(comp_memail.length==0 || comp_memail==""){
         alert("담당자 이메일을 입력해주세요");
      }else{
         Comp.method = "post";
         Comp.action = "${contextPath}/comp/remypage.do";
         Comp.submit();
         $('.change').attr('disabled',true);
         document.getElementById("commitBtn").style.display = 'none';
         document.getElementById("modBtn").style.display = 'inline';
         alert("수정이 완료되었습니다.");
      }
   }
   
   function comp_able2(){
      var mnamecolor = document.getElementById('comp_mname');
      var mhpcolor = document.getElementById('comp_mhp');
      var memailcolor = document.getElementById('comp_memail');
      $('.change').attr('disabled',false);
      document.getElementById("commitBtn").style.display = 'inline';
      document.getElementById("modBtn").style.display = 'none';
      mnamecolor.style.backgroundColor='#EEEEEE';
      mhpcolor.style.backgroundColor='#EEEEEE';
      memailcolor.style.backgroundColor='#EEEEEE';
   }
   
   function comp_disable(){
      
      $('.change').attr('disabled',true);
      
   }

</script>
<style>
.subbut{
    font-size: 1.5em;
     background-color: #343A40;
     border: 1px solid #343A40;
     border-radius: 15px;
     width: 33%;
     color: white;
     font-weight: bold;
}
.subbut2{
    font-size: 1.5em;
     background-color: #FFFFFF;
     border: 1px solid #343A40;
     border-radius: 15px;
     width: 33%;
     color: black;
     font-weight: bold;
}
.subbut3{
    font-size: 1.5em;
     background-color: #FFFFFF;
     border: 1px solid #343A40;
     border-radius: 15px;
     width: 33%;
     color: black;
     font-weight: bold;
}
.btn1{
   background-color: #DDDDDD;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 30%;
    color: black;
    margin-left:35%;
    
}
.btn1:hover{
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
    width: 8%;
    color: black;
    margin-left:35%;
}
.btn3:hover{
   background-color: #990000;
   color: #FFFFFF;
}
.btn4{
   background-color: #DDDDDD;
   border: 1px solid #343A40;
    border-radius: 15px;
    width: 30%;
    color: black;
    margin-left:35%;
}
.btn4:hover{
   background-color: #343A40;
   color: white;
}
subbut:visited{
    background-color: black;
     color: white;
}
.myinfo{
   margin-left:30%;
   margin-right:30%;
}
.change{
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
</style>
</head>
<body>
   <body class="sb-nav-fixed" style="background-color:#dddddd">
    <div id="wrapper">
       <!-- 해더 -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="height:10%">
            <a class="navbar-brand" href="${contextPath}/comp/compMain.do"><img src="${contextPath}/resources/img/logo.png" style="width:100%;heigth:50%"></a>
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
   <br><br><br> 
    <!-- 바디 부분은 여기에 !! -->
        <div id="section">
        
       
        
        
   <span><input type="button" value="Info" id="subbut" class="subbut" onclick="basic1()"/>
   <input type="button" value="Project" id="subbut2" class="subbut2" onclick="project1()" />
   <input type="button" value="Career" id="subbut3" class="subbut3" onclick="career1()"/></span>
   <hr></hr>
   
   <input type="button" class="btn3" value="회원탈퇴" onclick="comp_out()" style="float:right;"><br>
   <form class="myinfo" name="info">
   
      <br><br>   
      <p>
      <label class="lab">ID</label>
      <input class="chan" id="comp_id" name="comp_id" type="text" value="${company.comp_id}" style="position:relative; left:53%;" disabled>
      </p><hr><br>
      <p>
      <label class="lab">Manager Name</label>
      <input class="change" id="comp_mname" name="comp_mname" type="text" value="${company.comp_mname}" style="position:relative; left:34%;" disabled>
      </p><hr><br>
      <p>
      <label class="lab">Manager HP</label>
      <input class="change" id="comp_mhp" name="comp_mhp" type="text" value="${company.comp_mhp}" style="position:relative; left:39%;" disabled>
      </p><hr><br>
      <p>
      <label class="lab">Manager Mail</label>
      <input class="change" type="email" id="comp_memail" name="comp_memail" value="${company.comp_memail}" style="position:relative; left:37%;" disabled>
      </p><hr><br>
      <p>
      <label class="lab">Business License Number</label>
      <input class="chan" id="comp_bnum" name="comp_bnum" type="text" value="${company.comp_bnum}" style="position:relative; left:21%;" disabled>
      </p><hr><br>
      <p>
      <label class="lab">Comp Name</label>
      <input class="chan" id="comp_name" name="comp_name" type="text" value="${company.comp_name}" style="position:relative; left:39%;" disabled>
      </p><hr><br>
        
         <input type="button" class="btn1" id="modBtn" value="수정하기 " onclick = "comp_able2()">
         <input type="button" class="btn2" id="commitBtn" value="수정완료" onclick="comp_send()"><br>
         <br><button type="button" class="btn4" onclick="location.href='${contextPath}/comp/mypwreset.do' ">비밀번호 변경</button><br><br><br>
         
      </form>
   
      <jsp:include page="recareer.jsp"></jsp:include>
      <jsp:include page="compProject.jsp"></jsp:include>
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
</html>