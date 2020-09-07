<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<style>
	.basefont{ 
   font-family: "titlefont","serif";
	}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }
   
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
    font-weight: bold;
    text-align:center;
    font-size:20px;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
	}
	
	table.tblCss tbody th {
    padding: 10px;
    text-align:center;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    width:250px;
    height:50px;
	}
	
	table.tblCss td {
    padding: 10px;
    vertical-align: top;
    background-color:#eeeeee;
    border-bottom: 1px solid #ccc;
    width:500px;
	}
	
	.tdtd:hover{
		background-color:#ffffff;
	}
	
	.tdtdtd:hover{
		background-color:#ffffff;
	}
	
	.tdtdtd1:hover{
		background-color:#ffffff;
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
   <h2 style="text-align:center;font-size:60px;"><a class="basefont">Message</a></h2><hr>
   <br>
   <table class="tblCss" style="margin:auto">
   	<thead>
      <tr>
         <th style="font-size:30px;">Company</th>
         <th colspan="2" style="font-size:30px;">Title</th>
      </tr>
      </thead>
      <tbody>
      <c:choose>
         <c:when test="${empty msg}">
            <tr>
               <td align="center" colspan="3" style="font-weight: bold;">메세지가 없습니다.</td>
            </tr>
         </c:when>
         <c:otherwise>
            <c:forEach var="m" items="${msg}" >
            <tr>
               <th onClick="location.href='${contextPath}/free/msgDetail.do?comp_id=${m.comp_id}&free_id=${free.free_id}&msg_num=${m.msg_num}'" style="cursor:pointer;">${m.comp_name}</th>
               <td class="tdtd"  onClick="location.href='${contextPath}/free/msgDetail.do?comp_id=${m.comp_id}&free_id=${free.free_id}&msg_num=${m.msg_num}'" style="cursor:pointer;">${m.msg_title}</td>
               <td class="tdtdtd" onClick="location.href='${contextPath}/free/removeMsg.do?comp_id=${m.comp_id}&free_id=${free.free_id}&msg_num=${m.msg_num}'" style="text-align:center;width:50px;cursor:pointer;">
               <i class="fa fa-times" style="color:gray" ></i>
               </td>
            </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
      <tr>
      </tr>
      </tbody>
   </table>
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