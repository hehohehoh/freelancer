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
<html lang="en">
<head>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/dist/assets/demo/chart-area-demo.js"></script>
        <script src="${contextPath}/resources/dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>
<title>기업 가입 승인 창</title>
<style>
   table {border-top: 1px solid #000000;  border-collapse: collapse; margin-bottom: 1rem; margin-left: auto; margin-right: auto;}
   th, td {
    border-bottom: 1px solid #000000;
    padding: 10px;
  }
   body{background-color: #dddddd;}
   .title{
      font-size: 40px;
   }
   .basefont{ 
   font-family: "titlefont","serif";
}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }
</style>
</head>
<body class="sb-nav-fixed">
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
            <div id="layoutSidenav_content" style="background-color:#DDDDDD">
               <!-- body -->
                <main>
                    <div class="container-fluid"><br><br>
                        <table>
                           <tr>
                              <td></td>
                              <td align="center" colspan="5" class="title"><a class="basefont">Company Join Check</a></td>
                              <td></td>
                           </tr>
                     <tr align="center" style="background-color: #343a40;  color: #dddddd;border: 1px solid #000000">
                        <td style="border-right: 1px solid #ffffff"><b>아이디</b></td>
                        <td style="border-right: 1px solid #ffffff"><b>담당자 이름</b></td>
                        <td style="border-right: 1px solid #ffffff"><b>담당자 이메일</b></td>
                        <td style="border-right: 1px solid #ffffff"><b>담당자 핸드폰번호</b></td>
                        <td style="border-right: 1px solid #ffffff"><b>회사 이름</b></td>
                        <td style="border-right: 1px solid #ffffff"><b>사업자코드</b></td>
                        <td><b>승인</b></td>
                     </tr>
                     <c:choose>
                        <c:when test="${compApproList == null}" >
                           <tr>
                              <td colspan=6 style="background-color: #ffffff"><b>등록된 회원이 없습니다.</b></td>
                           </tr>
                        </c:when>
                        <c:when test="${compApproList != null}" >
                           <c:forEach var="c" items="${compApproList}" >     
                              <tr align="center" style="background-color: #ffffff">
                                 <td>${c.comp_id}</td>
                                 <td>${c.comp_mname}</td>
                                 <td>${c.comp_mhp}</td>
                                 <td>${c.comp_memail}</td>
                                 <td>${c.comp_bnum}</td>
                                 <td>${c.comp_name}</td>
                                 <td>
                                    <form name="frm" method="post" action="${contextPath}/admin/appro.do">
                                       <input type="hidden" name="comp_id" value="${c.comp_id}" />
                                       <input type="submit" style="border-radius:7px;" value="승인"/>
                                    </form>
                                 </td>
                              </tr>
                           </c:forEach>
                        </c:when>
                     </c:choose>
                  </table>
                   </div>
               </main>
               <!-- footer -->
         </div>        
          </div>
            <div id="footer" class="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>
    </div>
</body>
</html>