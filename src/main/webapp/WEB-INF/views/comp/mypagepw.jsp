<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="result" value="${param.result}" /> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<c:choose>
      <c:when test="${result=='Failed'}">
       <script>
            alert("비밀번호가 틀립니다.");
       </script>
      </c:when>
</c:choose>  

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
       .subbut{
             margin-left:46%;
             background-color: #343A40;
             border: 1px solid #343A40;
            border-radius: 10px;
             width: 8%;
             color: white;
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

   <div id="section">
   <br><br><br><br>
   
   <form name="mypage" method="post"  action="${contextPath}/comp/pwcheck.do">
      <hr style="height:2px">
      <br><br><p style="color:#003399; text-align:center; font-size:1.9em; font-weight:bold;">회원 비밀번호 확인</p>
      <hr style="height: 5px; background-color: #343A40; width:50%;">
      <p style="color:#555555; font-weight:bold; text-align:left; padding-left:25%; font-size:1.1em;">비밀번호를 한번 더 입력해주세요.</p>
      <p style="text-align:left; padding-left:25%;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 한번 더 확인합니다.</p><br>
         <div style= "padding-left:40%;">
               <input type="password" class="form-control" id="password" name="pwcheck" placeholder="비밀번호" maxlength="16" style="width:35%;">
           </div>
           <br><br><input type="submit" value="확인" class="subbut">
           <br><br>
        <hr style="height:2px">
   </form>
   </div>
   
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