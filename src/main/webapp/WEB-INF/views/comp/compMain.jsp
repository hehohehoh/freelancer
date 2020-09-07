<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>기업 메인</title>
      <link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
        <link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      
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
     .aaa{
        font-size:1.4em;
        font-weight:500;
     }
     .bbb{
        font-size:1.2em;
        font-weight:900;
        text-align:center;
        list-style: none;
        float:left;
        width:25%;
        border-left: 1px solid #343A40;
     }
     li:first-child {
        border-left: 0;
   }
     h2{
        color:#DD0000;
     }
     .number{
        font-weight:900;
     }
     .basefont{ 
   font-family: "titlefont","serif";
	}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }
     
</style>
<script>
   
$(function() {
     var count0 = count1 = count2 = count3 = 0;

     timeCounter();

     function timeCounter() {
        
      var totalFreeCnt ="<c:out value='${totalFreeCnt}'/>";
        
       id0 = setInterval(count0Fn, 0.1);

       function count0Fn() {
          count0 = count0 + 10;
         if (count0 > totalFreeCnt) {
           clearInterval(id0);
         } else {
           $(".number").eq(0).text(count0);
         }

       }

       var totalCompCnt ="<c:out value='${totalCompCnt}'/>";
       id1 = setInterval(count1Fn, 0.1);

       function count1Fn() {
    	   count1 = count1 + 10;
         if (count1 > totalCompCnt) {
           clearInterval(id1);
         } else {
           $(".number").eq(1).text(count1);
         }
       }
      
       var totalProjectCnt ="<c:out value='${totalProjectCnt}'/>";
       id2 = setInterval(count2Fn, 0.1);

       function count2Fn() {
          count2 = count2 + 10;
         if (count2 > totalProjectCnt) {
           clearInterval(id2);
         } else {
           $(".number").eq(2).text(count2);
         }
       }
       
       var curProjectCnt ="<c:out value='${curProjectCnt}'/>";
       id3 = setInterval(count3Fn, 0.1);
      console.log(curProjectCnt);
       function count3Fn() {
         count3++;
         if (count3 > curProjectCnt) {
           clearInterval(id3);
         } else {
           $(".number").eq(3).text(count3);
         }
       }
       
     }
   });
   
   google.charts.load('current', {'packages':['corechart'] }  );
   
   google.charts.setOnLoadCallback(drawChart);
   
   function drawChart() {
         
       var data = google.visualization.arrayToDataTable(
             ${str}
            );

       var options = {
             title: '프리랜서 가입자',
             titleTextStyle: { 
                fontSize:30
             },
             backgroundColor: '#dddddd',
             hAxis: {textStyle:{
                 bold:true
                }
             },
             vAxis: {ticks: [400,600,800,1000,1200,1400],
                textStyle:{
                     bold:true
                 }
             },
             curveType: 'function',
             legend: 'none'
             };

       var chart = new google.visualization.ColumnChart(document.getElementById('chart'));

       chart.draw(data, options);
     }
</script>
</head>
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
      <br><br>
        <ul>
        <li class="bbb">
           <p class="aaa"><a class="basefont">Freelancer Number</a></p>
          <h2 class="number"></h2>
        </li>
        <li class="bbb">
           <p class="aaa"><a class="basefont">Company Number</a></p>
          <h2 class="number"></h2>
        </li>
        <li class="bbb">
           <p class="aaa"><a class="basefont">To Freelancer Project</a></p>
          <h2 class="number"></h2>
        </li>
        <li class="bbb">
           <p class="aaa"><a class="basefont">Total Project</a></p>
          <h2 class="number"></h2>
        </li>
      </ul>
      <div id="chart" style="width:80%;height:500px;margin-top:10%;margin-left:10%;"></div>

   </div>
   </div>
        
   <!-- footer -->
   <div id="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
   
   <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${contextPath}/resources/dist/js/scripts.js"></script>
   <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
   <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
   <script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>
</body>
</html>