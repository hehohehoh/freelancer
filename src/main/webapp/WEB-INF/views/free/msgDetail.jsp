<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="c" value="${company}"/>
<c:set var="m" value="${msg}"/>


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
</head>
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
        
        <div id="section">
        <br><br><br>
        <h2 style="text-align:center;font-size:60px;"><a class="basefont">Message Detail</a></h2><hr>

   <table class="tblCss" style="margin:auto">
	  <thead>
      <tr>
         <th>Message Title</th>
      </tr>
      </thead>
      <tbody>
      <tr>
         <td style="height:50px;width:800px;">${m[0].msg_title}</td>
      </tr>
      </tbody>
   </table>
   <table class="tblCss" style="margin:auto">
      <thead>
      <tr>
         <th>Message Content</th>
      </tr>
      <thead>
      <tbody>
      <tr>
      	 <td style="height:50px;width:800px">${m[0].msg_content}</td>
      </tr>
      </tbody>
   </table>
   <br><br><br>
   
   <table style="margin:auto">
      <tr><td style="height:30px;width:800px;color:white;" align="center" bgcolor="#369">회사 이름</td></tr>
      <tr><td style="height:50px;width:800px" align="center" bgcolor="#eeeeee"><h4>${c[0].comp_name}</h4></td></tr>
      
      <tr><td style="height:30px;width:800px;color:white;" align="center" bgcolor="#369">담당자 이름</td></tr>
      <tr><td style="height:50px;width:800px" align="center" bgcolor="#eeeeee"><h4>${c[0].comp_mname}</h4></td></tr>
      
      <tr><td style="height:30px;width:800px;color:white;" align="center" bgcolor="#369">담당자 전화번호</td></tr>
      <tr><td style="height:50px;width:800px" align="center" bgcolor="#eeeeee"><h4>${c[0].comp_mhp}</h4></td></tr>
      
      <tr><td style="height:30px;width:800px;color:white;" align="center" bgcolor="#369">담당자 이메일</td></tr>
      <tr><td style="height:50px;width:800px" align="center" bgcolor="#eeeeee"><h4>${c[0].comp_memail}</h4></td></tr>
   </table>
   <br><br><br><br><br>
   
   <c:if test="${not empty project}">
   	<h3 style="text-align:center;">Project Progress</h3>
      <br>
      <c:forEach var="pr" items="${project}" >
         <table class="tblCss" style="margin:auto">
         	<thead>
            <tr>
               <th style="height:30px;width:250px">Project Name</th>
               <th style="height:30px;width:550px" align="center">Project Content</th>
            </tr>
            </thead>
            <tbody>
            <tr>
               <td align="center" Rowspan="2" align="center" style="font-size:20px;border-right: 1px solid #036">${pr.proj_name}</td>
               <td style="height:30px;" align="center">
                  ${pr.proj_startdate} &nbsp; &nbsp; &nbsp; &nbsp;~&nbsp; &nbsp; &nbsp; &nbsp;${pr.proj_finishdate}
               </td>
            </tr>
            <tr>
               <td>${pr.proj_work}</td>
            </tr>
            </tbody>
         </table>
      </c:forEach>
   </c:if>
   
   <br><br><br><br><br>
   
   <div style="text-align: center"><h3>Career</h3></div><br>
   <c:if test="${not empty career}">
      <c:forEach var="cr" items="${career}" >
         <table class="tblCss" style="margin:auto">
         	<thead>
            <tr>
               <th style="height:30px;width:250px">Title</th>
               <th style="height:30px;width:550px" align="center">Content</th>
            </tr>
            </thead>
            <tbody>
            <tr>
               <td align="center" rowspan="2"><h4>${cr.comp_pname}</h4></td>
               <td style="height:30px;" align="center">
                  ${cr.comp_startdate} &nbsp; &nbsp; &nbsp; &nbsp;~&nbsp; &nbsp; &nbsp; &nbsp;${cr.comp_finishdate}
               </td>
            </tr>
            <tr>
               <td>${cr.comp_pwork}</td>
            </tr>
            </tbody>
         </table>
      </c:forEach>
   </c:if>
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