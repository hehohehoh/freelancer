<%@ page language="java" 
       contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" 
       isELIgnored="false" %>
       
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="freeID" value="${param.free_id}"/>
<c:set var="freeStop" value="${param.free_stop}"/>
<% request.setCharacterEncoding("UTF-8"); %>    

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
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
   <title>회원 정보 출력창</title>
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
   h1 {text-align:center;}
   .basefont{ 
   font-family: "titlefont","serif";
}
   @font-face{
      font-family: 'titlefont';
      src:url("${contextPath}/resources/font/base.TTF");
   }
</style>
   
   <c:if test="${freeID != 'admin' && freeID != null && freeStop == 0}">
      <script>
         window.onload = function() {
            alert("${freeID}를 정지하셨습니다.");
         }
      </script>
   </c:if>
   
   <c:if test="${freeID != 'admin' && freeID != null && freeStop == 1}">
      <script>
         window.onload = function() {
            alert("${freeID}의 정지가 해제되었습니다.");
         }
      </script>
   </c:if>   
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
                           <td align="center" colspan="9" class="title"><a class="basefont">Freelancer Member Info</a></td>
                           <td></td>
                        </tr>
                        <tr>
                     	<td colspan="7">
                     		<form name="frm" method="post" action="${contextPath}/admin/searchFree.do">
                     			<input type="text" name="free_id" size="30" placeholder="프리랜서 ID를 입력해주세요"/>
                     			<input type="submit" value="search" style="height:30px;border:0;outline:0;font-weight: bold;background:#343A40;color:#eeeeee;border-radius:5px;">
                     		</form>
                     	</td>
                     </tr>
                        <tr align="center"style="background-color: #343a40;  color: #dddddd;border: 1px solid #000000">
                           <td style="border-right: 1px solid #ffffff"><b>아이디</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>성</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>이름</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>전화번호</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>생년월일</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>성별</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>이메일</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>탈퇴/정지여부</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>검색가능여부</b></td>
                           <td style="border-right: 1px solid #ffffff"><b>가입일자</b></td>
                           <td><b>회원정지</b></td>
                        </tr>
                        <c:choose>
                           <c:when test="${empty freelancersList}" >
                              <tr>
                                 <td colspan="11" style="background-color: #ffffff"><b>등록된 회원이 없습니다.</b></td>
                              </tr>
                           </c:when>
                           <c:otherwise>
                              <c:forEach var="free" items="${freelancersList}" >     
                                 <tr align="center" style="background-color: #ffffff">
                                    <td>${free.free_id}</td>
                                    <td>${free.free_lastName}</td>
                                    <td>${free.free_firstName}</td>
                                    <td>${free.free_hp}</td>
                                    <td><fmt:formatDate value="${free.free_bir}" pattern="YYYY/MM/dd" /></td>
                                    <td>${free.free_gender}</td>
                                    <td>${free.free_email}</td>
                                    <td>${free.free_stop}</td>
                                    <td>${free.free_state}</td>
                                    <td><fmt:formatDate value="${free.free_joinDate}" pattern="YYYY/MM/dd HH:mm:ss" /></td>
                                    <td>
                                       <form method="post" action="${contextPath}/admin/freeStop.do">
                                          <input type="hidden" name="free_id" value="${free.free_id}">
                                          <input type="hidden" name="free_stop" value="${free.free_stop}">
                                          <c:if test="${free.free_stop == 0 }" >
                                             <input type="submit" style="border-radius:7px;" value="회원정지">
                                          </c:if>
                                          <c:if test="${free.free_stop == 1 }" >
                                             <input type="submit" style="border-radius:7px;" value="정지취소">
                                          </c:if>
                                       </form>
                                    </td>
                                 </tr>
                              </c:forEach> 
                           </c:otherwise>
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