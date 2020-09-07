<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="f" value="${free}" />
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
        <title></title>
        <link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
        <link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script type="text/javascript">
      function MsgBtn(){
         var url = "${contextPath}/free/msgForm.do";
         var name = "popup";
         var option = "width = 800, height = 550, top = 100, left=200, location = no"
         window.open(url, name, option);
      }
  
      function zzimclick(){
             $.ajax({
                 url:'${contextPath}/free/zzimchange.do',
                 type:'post',
                 data:$('#DetailForm').serialize(),
                 success:function(data){
                 },
                 error:function(){
                    alert("찜을 실패했습니다.");   
                 }
              });
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
       
       table.tblCss {
       border-collapse: collapse;
       line-height: 1.5;
       }
       
       table.tblCss thead th {
       padding: 10px;
       vertical-align: top;
       font-weight: bold;
       font-size:20px;
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
       font-weight: bold;
       vertical-align: top;
       background-color:#eeeeee;
       border-bottom: 1px solid #ccc;
      }
      
      .tdtdtd{
      width:200px;
      }
      .basefont{ 
   font-family: "titlefont","serif";
}
@font-face{
   font-family: 'titlefont';
   src:url("${contextPath}/resources/font/base.TTF");
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
        <div id="section">
   <br><br><br>

   <form name="freeDetail" id="DetailForm">
   <input type="hidden" name="zzim" value="${zzim }">
    <input type="hidden" name="free_id" value="${f.free_id}">
    <input type="hidden" name="comp_id" value="${company.comp_id}">
   <h2 style="text-align:center;font-size:60px;"><a class="basefont">Freelancer Detail</a></h2><hr>
   <table class="tblCss" style="margin:auto;">
      <thead>
         <tr>
            <th style="font-size:30px;">Freelancer</th>
            <th colspan="2" style="font-size:30px;">Information</th>
         </tr>
      </thead>
      <tbody>
      <tr>
         <th align="center" style="width:200px">
               <c:choose>
                 <c:when test="${f.free_picture == 'no file' || f.free_picture == null}" >
                      <c:choose>
                        <c:when test="${f.free_gender == 0 }">
                             &nbsp;&nbsp;&nbsp;&nbsp;<img src="${contextPath}/resources/profile/img3.jpg" style="width:150px;height:120px"/>
                          </c:when>
                       <c:otherwise>
                          &nbsp;&nbsp;&nbsp;&nbsp;<img src="${contextPath}/resources/profile/img2.jpg" style="width:150px;height:120px"/>
                       </c:otherwise>
                      </c:choose>
                   </c:when>
                   <c:otherwise>
                  &nbsp;&nbsp;&nbsp;&nbsp;<img src="${contextPath }/resources/profile/${f.free_id}/${f.free_picture}" style="width:150px;height:120px"/>
                   </c:otherwise>
             </c:choose>   
                <br>
                <span style="font-size:1.2em">${f.free_lastName}** </span><br>
                <c:set var="year" value="${year}" />
                  <c:set var="bir" value="${f.free_bir}" />
                  <c:set var="birYear" value="${year - (fn:substring(bir,0,4)) + 1}" />
                  <span style="font-size:1.2em">나이: ${birYear} 세 </span>
            <br>
         </th>
         <td style="width:720px;">
            <span style="font-size:1.2em">사용언어: </span>
            <c:forEach var="s" items="${skillList}" > 
                  <span style="font-size:1.2em">#${s} &nbsp;</span>
            </c:forEach>
            <br><br>
            <span style="font-size:1.2em">등급: ${f.free_level} </span><br><br>
            
            <span style="font-size:1.2em">주소: ${f.free_addr} </span><br><br>
            
            <span style="font-size:1.2em">희망연봉: </span>
            <c:choose>
               <c:when test="${f.free_pay == null}">
                  <span style="font-size:1.2em">(협의 후 결정)</span>
               </c:when>
               <c:otherwise>
                  <span style="font-size:1.2em">${f.free_pay}</span>
               </c:otherwise>
            </c:choose>
            <br>
            </td>
            <td style="width:80px;">
                    <c:if test="${zzim ==0}">
                        <button onclick="zzimclick()" style='background:#eeeeee;border:0;outline:0;'><i class="fa fa-heart fa-2x" style="color:gray" ></i></button>
                  </c:if>
                  <c:if test="${zzim ==1}">
                        <button onclick="zzimclick()" style='background:#eeeeee;border:0;outline:0;'><i class="fa fa-heart fa-2x" style="color:#FF6699"></i></button>
                  </c:if>
               </td>
         </tr>
      </tbody>
   </table>
   <br><br><br>
   
   <c:if test="${not empty careerList}">
      <table class="tblCss" style="margin:auto;">
         <thead>
            <tr>
               <th style="padding:0px;font-size:18px;">Project Name</th>
               <th style="padding:0px;font-size:18px;">Position</th>
               <th style="padding:0px;font-size:18px;">Company</th>
               <th style="padding:0px;font-size:18px;text-align:center;">Start Date</th>
               <th style="padding:0px;font-size:18px;text-align:center;">Finish Date</th>
            </tr>
         </thead>
         <c:forEach var='p' items="${careerList}">
            <tbody>
               <tr style="height:70px">
                  <td class="tdtdtd" style="border-right: 1px solid #036">${p.free_pname}</td>
                  <td class="tdtdtd" style="border-right: 1px solid #036">${p.free_pwork}</td>
                  <td class="tdtdtd" style="border-right: 1px solid #036">${p.free_company}</td>
                  <td class="tdtdtd" style="text-align:center;border-right: 1px solid #036">${p.free_startdate}</td>
                  <td class="tdtdtd" style="text-align:center;">${p.free_finishdate}</td>
               </tr>
            </tbody>
         </c:forEach>
      </table>
   <br><br><br>
   </c:if>
   
   <c:if test="${f.free_file != null}">
   <div id="resume" style="display:none;text-align: center"><h4 style="font-weight: bold;font-size:20px;color: #369;">이력서(경력기술서)</h4>
      <span style="font-weight: bold;">${f.free_id }님의 이력서 파일 :</span> <a href="${contextPath }/free/fileDown.do?free_id=${f.free_id}&free_file=${f.free_file}">${f.free_file }</a>
   </div>
   </c:if>
   <br><br><br>
   
   </form>
   <div style="text-align: center"><input type="button" value="메세지 보내기" onclick="MsgBtn()" style="height:40px;border:0;outline:0;font-weight: bold;background:#343A40;color:#eeeeee;border-radius:5px;"></div>
   
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