<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="result" value="${param.result}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<c:choose>
      <c:when test="${result=='Failed1'}">
       <script>
            alert("현재 비밀번호가 다릅니다.");
       </script>
      </c:when>
      
      <c:when test="${result=='Failed2'}">
       <script>
            alert("현재 비밀번호와 변경할 비밀번호가 같습니다.");
       </script>
      </c:when>
      
      <c:when test="${result=='Failed3'}">
       <script>
            alert("변경 비밀번호와 변경 비밀번호 확인이 다릅니다.");
       </script>
      </c:when>
</c:choose> 

<script>

function check(){
      var form = document.mypw;
      
      var mypw = form.my_pw.value;
      var repw = form.re_pw.value;
      
      if(repw==""){
         document.getElementById('check').innerHTML = " ";
      }else if(repw.length < 8 || repw.length > 16){
         document.getElementById('check').style.color ="black";
         document.getElementById('check').innerHTML = "8~16자리로 입력해주세요";
      }else if(mypw==repw){
         document.getElementById('check').style.color = "red";
         document.getElementById('check').innerHTML = "동일한 비밀번호입니다. 새로운 비밀번호를 입력하시오.";
      }else{
         document.getElementById('check').style.color ="green";
         document.getElementById('check').innerHTML = "비밀번호가  적합합니다.";
      }
}

function checkPwd(){
   
   var form = document.mypw;

   var repw = form.re_pw.value;
   var rerepw = form.rere_pw.value;
   
   if(rerepw==""){
      document.getElementById('checkPwd').innerHTML = " ";
   }else if(rerepw.length < 8 || rerepw.length > 16){
      document.getElementById('checkPwd').style.color ="black";
      document.getElementById('checkPwd').innerHTML = "8~16자리로 입력해주세요";
   }else if(repw!=rerepw){
      document.getElementById('checkPwd').style.color = "red";
      document.getElementById('checkPwd').innerHTML = "비밀번호가 다릅니다. 다시입력해주세요.";
   }else{
      document.getElementById('checkPwd').style.color ="green";
      document.getElementById('checkPwd').innerHTML = "비밀번호가  동일합니다.";
   }
}

function send(){
   
   var form = document.mypw;

   var repw = form.re_pw.value;
   var rerepw = form.rere_pw.value;
   if(rerepw.length < 8 || rerepw.length > 16){
      alert("비밀번호를 8~16자리로 입력해주세요.");
   }else{
      form.method = "post";
      form.action = "${contextPath}/comp/mypwreset.do";
      form.submit();
       alert("비밀번호 변경이 완료되었습니다");
   }
   
   
}
</script>

</head>
<style>
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
 .fwrite{
    text-align:center;
    font-weight:600;
    font-size: x-large;
    color:#003399;
 }
 .swrite{
    text-align:center;
 }
 .form-control{
    margin-left:40%;
    width:25%;
 }
 .pwname{
    margin-left:32%;
    float: left; 
 }
 .subbb{
    margin-left:46%;
   background-color: #343A40;
   border: 1px solid #343A40;
   border-radius: 10px;
   width: 8%;
   color: white;
 }
 .spwrite{
    margin-left:43%;
 }
</style>
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
      <!-- 바디 부분은 여기에 !! -->
      <br><br><br>
        <div id="section">
        
   <form name="mypw">
    <hr>
    <br>
      <p class="fwrite">비밀번호를 변경해 주세요!</p>
      <hr style="height: 5px; background-color: #343A40; width:50%;">
      <P class="swrite">안전한 사용을 위하여, 기존 비밀번호를 변경해야 합니다.</P>
      <p class="swrite">아래에 새 비밀번호를 입력해 주세요.</p><br>
      <p>
      <label class="pwname">현재 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
       <input type="password" class="form-control" id="my_pw" name="my_pw" placeholder="현재 비밀번호"/>
    </p>
    <p>
    <label class="pwname">변경 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
       <input type="password" class="form-control" id="re_pw" name="re_pw" onkeyup="check()" placeholder="변경 비밀번호 8~16자 이내"/> <span class="spwrite" id="check" style="font-size:70%;"></span>
    </p>
    <p>
    <label class="pwname">변경 비밀번호 확인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
       <input type="password" class="form-control" id="rere_pw" name="rere_pw" onkeyup="checkPwd()" placeholder="변경 비밀번호 확인 8~16자 이내" /> <span class="spwrite" id="checkPwd" style="font-size:70%;"></span>
    </p><br>
    <input type="button" class="subbb" value="확인" onclick="send()"/>
    <hr>
   
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
</body>
</html>