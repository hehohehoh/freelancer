<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<title>Insert title here</title>
	<link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
    <link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/dist/js/scripts.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
    <script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
body{
	background-color: #dddddd;
       }
</style>
<script>

   google.charts.load('current', {'packages':['corechart'] }  );
   
   google.charts.setOnLoadCallback(drawChart);
   google.charts.setOnLoadCallback(drawChart2);
   google.charts.setOnLoadCallback(drawChart3);
   
   function drawChart() {
      
        var data = google.visualization.arrayToDataTable(
              ${str}
             );

        var options = {
              title: '프리랜서 정보',
              titleTextStyle: { 
                  fontSize:30
               },
              pieSliceTextStyle: {fontSize:30},
              backgroundColor: '#dddddd',
              };

        var chart = new google.visualization.PieChart(document.getElementById('chartFree'));

        chart.draw(data, options);
      }
   
   function drawChart2() {
         
       var data = google.visualization.arrayToDataTable(
             ${str2}
            );

       var options = {
             title: '기업 정보',
             titleTextStyle: { 
                 fontSize:30
              },
             pieSliceTextStyle: {fontSize:30},
             backgroundColor: '#dddddd',
             };

       var chart = new google.visualization.PieChart(document.getElementById('chartComp'));

       chart.draw(data, options);
     }
   
   function drawChart3() {
         
       var data = google.visualization.arrayToDataTable(
             ${str3}
            );

       var options = {
             title: '월별 가입자 정보',
             titleTextStyle: { 
                 fontSize:25,
              },
             backgroundColor: '#dddddd',
             fontSize: '12',
                   fontName: '굴림체',
                   hAxis: {textStyle:{
                       bold:true
                   }
                    },      
                   vAxis: {textStyle:{
                       bold:true
                   }
                     },
                  legend: { position: 'right',
                	  textStyle:{
                          bold:true
                         }  
                  },
                isStacked: 'percent'
         };

       var chart = new google.visualization.ColumnChart(document.getElementById('chartLast'));

       chart.draw(data, options);
     }
</script>
</head>
<body>
	<div id="wrapper">
    
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="height:10%;">
            <a class="navbar-brand" href="${contextPath }/admin/adminForm.do"><img src="${contextPath}/resources/img/logo.png" width="100%" height="50%"/></a>
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
            	<li>
                  <a class="nav-link" href="${contextPath }/board/list" role="button" style="font-size:25px;">
                     Board
                  </a>
               </li>  
               <li>
                  <a class="nav-link" href="${contextPath }/admin/listFreelancers.do" role="button" style="font-size:25px;">
                     freelancer
                  </a>
               </li>   
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" style="font-size:25px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       company
                    </a>
                    
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="${contextPath}/admin/listCompanys.do">기업 회원관리</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="${contextPath}/admin/compAppro.do">기업 가입승인</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                        <a class="nav-link" href="${contextPath}/logout.do" style="font-size:25px;">Logout</a>
                </li>
            </ul>
            </form>
        </nav>
        <div id="section">
            

    <div id="chartFree" style="width: 50%; height: 500px;float:left"></div>

	<div id="chartComp" style="width: 50%; height: 500px;float:right"></div>
    
    <div id="chartLast" style="margin-top:30%;"></div>
    
    
    </div>
         <div id="footer" class="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
</div>

</body>
</html>