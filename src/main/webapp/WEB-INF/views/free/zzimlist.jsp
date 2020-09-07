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
   <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link href="${contextPath}/resources/comm/cssFile.css" rel="stylesheet" />
<link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/dist/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>
   <title>찜리스트</title>
</head>
<style>

	.basefont{ 
   font-family: "titlefont","serif";
	}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }
   
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
   th, td {
       border-bottom: 1px solid #000000;
       padding: 10px;
    }
   body{background-color: #dddddd;}
   .title{
      font-size: 40px;
   }
   table.zzimlist {
   		margin:auto;
       border-collapse: collapse;
       text-align: left;
       line-height: 1.5;
   }
   table.zzimlist thead th {
       padding: 10px;
       font-weight: bold;
       vertical-align: top;
       color: #369;
       border-bottom: 3px solid #036;
   }
   table.zzimlist tbody th {
       padding: 10px;
       font-weight: bold;
       border-bottom: 1px solid #ccc;
       background: #f3f6f7;
   }
   table.zzimlist td {
       padding: 10px;
       font-size:1.2em;
       border-bottom: 1px solid #ccc;
   }
</style>
<body class="sb-nav-fixed" style="background-color:#dddddd">
<div id="wrapper">
    
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
        <div id="section">
         <div id="layoutSidenav_content" style="background-color:#DDDDDD">
               <!-- body -->
                <h1 style="text-align:center;font-size:60px"><a class="basefont">Zzim</a></h1><hr>
             <div class="container-fluid"><br>
             <c:choose>
                       <c:when test="${empty freeList}">
                          
                             <div style="text-align:center;font-size:30px;font-weight:600">찜한 프리랜서가 없습니다.</div>
                             
                          
                       </c:when>
                       <c:otherwise>
                    <table class="zzimlist">
                   <thead>
                        <tr>
                          <th width="200" style="font-size:30px;">Freelancer</th>
                          <th width="550" style="font-size:30px;">Information</th>
                          <th width="50" style="font-size:30px;">Delete</th>
                      </tr>
                   </thead>
                   <tbody>
                      
                           <c:forEach var="f" items="${freeList}" >
                           <tr style="background-color: #EEEEEE">
                              <td align="center" onClick="location.href='${contextPath}/free/freeDetail.do?free_id=${f.free_id}'" style="border-right: 1px solid #ffffff;cursor:pointer;">
                                    <c:choose>
                                      <c:when test="${f.free_picture == 'no file' || f.free_picture == null}" >
                                          <c:choose>
                                             <c:when test="${f.free_gender == 0 }">
                                               <img src="${contextPath}/resources/profile/img3.jpg" style="width:150px;height:150px"/>
                                            </c:when>
                                            <c:otherwise>
                                               <img src="${contextPath}/resources/profile/img2.jpg" style="width:150px;height:150px"/>
                                            </c:otherwise>
                                          </c:choose>
                                     </c:when>
                                     <c:otherwise>
                                         <img src="${contextPath }/resources/profile/${f.free_id}/${f.free_picture}" style="width:150px;height:150px"/>
                                     </c:otherwise>
                                  </c:choose>
                              </td>
                              <td onClick="location.href='${contextPath}/free/freeDetail.do?free_id=${f.free_id}'" style="border-right: 1px solid #ffffff;cursor:pointer;">
                                    <c:set var="year" value="${year}" />
                                   <c:set var="bir" value="${f.free_bir}" />
                                    <c:set var="birYear" value="${year - (fn:substring(bir,0,4)) + 1}" />
                                    <c:set var="address" value="${f.free_addr}" />
                                    <c:set var="addr" value="${(fn:substring(address,0,3))}" />
                                    ${f.free_lastName}**  <br>
                                   나이: ${birYear} 세 
                                    <br>
                                   등급: ${f.free_level} <br>
                                    주소: ${addr} <br>
                                    사용언어:
                                    <c:forEach var="s" items="${freeLanList}" > 
                                       <c:if test="${f.free_id == s.free_id}">
                                          ${s.free_skill} 
                                       </c:if>
                                    </c:forEach>
                              </td>
                              <td  align="center" onClick="location.href='${contextPath}/free/removezzim.do?free_id=${f.free_id}&comp_id=${company.comp_id }'" style="cursor:pointer;">
                                    <i class="fas fa-times fa-2x" style="color:#A6A6A6;"></i>
                              </td>
                           </tr>
                       </c:forEach>
                       
                      </tbody>
                  </table>
                  </c:otherwise>
                    </c:choose>
            </div>
                
            </div>
     </div>
        <div id="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
        
        </div>
    </body>
</html>