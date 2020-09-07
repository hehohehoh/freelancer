<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        
   <style>
      table {margin: auto; border: 1px solid black; border-collapse: collapse;}
      #text_center{width: 800px; margin:auto 0; }
      .select_img img{margin: 20px 0;}
   </style>
   
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
    </style>

   <c:choose>
      <c:when test="${status == 'first' }">
         <script>
         window.onload = function() {
            alert("기본 정보 입력이 완료되었습니다. 상세정보를 입력해주세요");
         }
         </script>
      </c:when>
      <c:when test = "${status == 'second' }">
         <script>
         window.onload = function() {
            alert("상세 정보 입력이 완료되었습니다. 경력정보를 입력해주세요.");
         }
         </script>
      </c:when>
      <c:when test = "${status == 'third' }">
         <script>
         window.onload = function() {
            alert("경력 사항 입력이 완료되었습니다. 보유 기술을 입력해주세요.");
         }
         </script>
      </c:when>
   </c:choose>

   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script>

   
      function updateDetail(){
         var frmInfo = document.frmInfo;
         frmInfo.method="post";
         frmInfo.action="${contextPath}/free/updateInfo.do";
         frmInfo.submit();
      }
      
      function insertCareer(){
         
      }
      
   </script>
</head>
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
   <h1  class="text_center">${free_id }님의 추가 정보 등록창</h1>
   <form name="frmInfo" encType="multipart/form-data">
   <input type="hidden" name="free_id" value="${free_id }" />
   <input type="hidden" name="career_cnt" value="${career_cnt }" />
   <table>
   <caption>추가 정보 입력</caption>
   
      <tr>
        <td width="200"><p align="right">희망 월급(만원)</td>
       <td width="400"><input type="text" name="free_pay"/></td>
     </tr>
      <tr>
         <td width="200"><p align="right">사진 등록</td>
         <td width="400"><input type="file" name="free_pic" id="free_pic" />
         <div class="select_img"><img src="" alt="사진X" >
            <script>
              $("#free_pic").change(function(){
               if(this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function(data) {
                    $(".select_img img").attr("src", data.target.result).width(200);        
                   }
                reader.readAsDataURL(this.files[0]);
               }
              });
             </script>
             </div></td>
      </tr>
      <tr>
         <td width="200"><p align="right">자기소개</td>
         <td width="400"><input type="text" name="free_intro" placeholder="짧은 소개글을 적어주세용" /></td>
      </tr>
      <tr>
         <td colspan="2"><p align="center">
            <c:choose>
               <c:when test= "${status == 'first' }" >
                  <input type="button" onclick="updateDetail();" value="상세 정보 추가"/>
               </c:when>
               <c:otherwise>
                  <input type="button" value="상세 정보 추가" disabled/>
               </c:otherwise>
            </c:choose>
         </td>
      </tr>
      </table>
   </form>
   
   <br><br><br>
   
   <form:form modelAttribute="careerList" action="${contextPath}/free/addCareer.do">
   <table>
   <caption>경력 사항 입력</caption>
      <tr>
         <td>No.</td>
         <td>시작일</td>
         <td>종료일</td>
         <td>프로젝트명</td>
         <td>주요 업무</td>
         <td>회사 이름</td>
      </tr>
      <c:forEach var="no" begin="1" end="${career_cnt }">
      <input type="hidden" name="carList[${no-1}].free_id" value="${free_id }" />
      <input type="hidden" name="carList[${no-1 }].free_cnum" value="${no }" />
      <tr>
         <td>${no }</td>
         <td><input type="date" name="carList[${no-1 }].free_startdate" /></td>
         <td><input type="date" name="carList[${no-1 }].free_finishdate" /></td>
         <td><input type="text" name="carList[${no-1 }].free_pname" /></td>
         <td><input type="text" name="carList[${no-1 }].free_pwork" /></td>
         <td><input type="text" name="carList[${no-1 }].free_company" /></td>
      </tr>
      </c:forEach>
      <tr>
         <td colspan="6"><p align="center">
            <c:choose>
               <c:when test= "${status == 'second' }" >
                  <input type="submit" value="경력 사항 추가"/>
               </c:when>
               <c:otherwise>
                  <input type="button" value="경력 사항 추가" disabled/>
               </c:otherwise>
            </c:choose>
         </td>
      </tr>
   </table>
   </form:form>
   <br><br><br>
   
   <table>
   
   <caption>보유 기술 입력</caption>
      <tr>
         <td>대분류</td>
         <td>소분류</td>
      </tr>
   </table>
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