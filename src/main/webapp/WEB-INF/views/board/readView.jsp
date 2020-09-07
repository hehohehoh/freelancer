<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>게시판</title>
<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
li {list-style: none;float: left;padding: 6px;}
A:link {text-decoration: none;color: #646464;}
.download{color:blue;background-color: #FFFFFF;}
.msg {color:gray;padding-right:20px;}
.msg1:hover{color:#cccccc;}
.sear {color:gray;padding-right:20px;}
.sear1:hover{color:#cccccc;}
button{background:black; color:white;}
</style>
</head>





<script type="text/javascript">


		$(document).ready(function(){
			
			
			var formObj = $("form[name='readForm']")		
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/board/updateView");
 				formObj.attr("method", "get");
 				formObj.submit();				
			})		
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				
				if(deleteYN == true){
				formObj.attr("action", "${contextPath}/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				
				}
			})		
			// 취소
			$(".list_btn").on("click", function(){
				location.href = "${contextPath}/board/list?page=${scri.page}"
				+"&perPageNum=${scri.perPageNum}"
				+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "${contextPath}/board/replyWrite");
				formObj.submit();
			});
		})
		
		//다운받기위해 파일 이름을 눌렀을때 FILE_NO에 value를 주입 후, board/fileDown 실행 (화면은 넘어가지 않는다.)
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "${contextPath}/board/fileDown");
			formObj.submit();		
		}
	</script>

<body class="sb-nav-fixed" style="background-color:#dddddd">
    <div id="wrapper">
    	<!-- 해더 -->
        <c:choose>
    	<c:when test="${free.free_id == 'admin'}">
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
    	</c:when>
    	
		<c:otherwise>
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
        </c:otherwise>
        </c:choose>
   
   <!-- 바디 부분은 여기에 !! -->
   <br><br><br>
        <div id="section">
			<div id="root">
				<hr />

				<div>
					<%@include file="nav.jsp"%>
				</div>
				<hr />

				<section id="container">
					<form name="readForm" role="form" method="post">
						<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
							type="hidden" id="page" name="page" value="${scri.page}">
						<input type="hidden" id="perPageNum" name="perPageNum"
							value="${scri.perPageNum}"> <input type="hidden"
							id="searchType" name="searchType" value="${scri.searchType}">
						<input type="hidden" id="keyword" name="keyword"
							value="${scri.keyword}"> <input type="hidden"
							id="FILE_NO" name="FILE_NO" value="">
					</form>
					<!-- FILE_NO는 비워둠(파일 다운로드시에만 사용하기 때문)-->
					<!--list에서 가져온 scri값을 보관하기 위해 form태그안에 hidden으로 input태그사용  -->
					<div style="margin-left:25%;">
						<p>
						<label for="title" style="font-weight:600;">제목</label><br>
							<input type="text" id="title" name="title" value="${read.title}" readonly="readonly" style="border: 1px solid #343A40; border-radius: 6px; height:35px; width:740px;"/>
						</p>
					</div>

					<div style="margin-left:25%;">
						<label for="content" style="font-weight:600;">내용</label><br>
						<textarea id="content" name="content" readonly="readonly" rows="20" cols="100" style="border: 1px solid #343A40; border-radius: 6px; height:300px; width:740px;" autofocus required><c:out
								value="${read.content}" /></textarea>

						<!-- file의 SOTRED_FILE_NAME에서 "."다음 부분을 추출  ${status.last}:.다음(마지막)이면 토큰으로 사용 -->
						<!-- 추출한 토큰으로 when절 실행 -->
						<div>
							<c:forEach var="file" items="${file}" varStatus="status">
								<!--  -->
								<c:forTokens var="token" items="${file.STORED_FILE_NAME }"
									delims="." varStatus="status">
									<c:if test="${status.last }">
										<c:choose>
											<c:when
												test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }">
												<img
													src="${contextPath}/resources/boardFile/${file.STORED_FILE_NAME}"
													width="200px" alt="no image" />
											</c:when>
										</c:choose>
									</c:if>
								</c:forTokens>
							</c:forEach>
						</div>

						<br>
						<label for="writer" style="font-weight:600;">작성자</label>&nbsp;
							<input type="text" id="writer" name="writer" value="${read.writer}" readonly="readonly" style="border:none; background-color:#DDDDDD;"/>
					</div>
					<div style="margin-left:25%;">
						<label for="regdate">작성날짜</label>
						<fmt:formatDate value="${read.regdate}"
							pattern="yyyy-MM-dd HH:mm:ss" />
					</div>


					<span style="margin-left:25%;">파일 목록</span>
					<div class="form-group" style="margin-left:25%;">
						<c:forEach var="file" items="${file}" >
							<!-- KB로 표시하기위해 -->
							
						<td class="dowmnload"> 	<a href="#" style="color:blue" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}KB)</td><br>
						</c:forEach>
					</div>
					<c:if
						test="${read.writer == free.free_id || free.free_id == 'admin'}">

						<div style="margin-left:25%">
							<button type="submit" class="update_btn">수정</button>
							<button type="submit" class="delete_btn">삭제</button>
						</div>
					</c:if>
				</section>
				<hr />
			</div>
			<div class="container" >
				<label for="content"></label>
				<form name="replyInsertForm">
					<div class="input-group" style="margin-left:10%; width:900px;">
						<input type="hidden" name="bno" value="${read.bno }" /> <input
							type="hidden" name="writer" value="${free.free_id}" /> <input
							type="text" class="form-control" id="replyContent" name="content" placeholder="내용을 입력하세요." style="border:solid"> <span class="input-group-btn">
							&nbsp;&nbsp;<button class="btn btn-default" type="button" name="replyInsertBtn" style="background:black;color:white;">등록</button>
						</span>
					</div>
				</form>
			</div>
			<br>
			<br>
			<div class="container">
				<div class="replyList"style="background:#dddddd"></div>
			</div>
			<div align="center">
				<%@ include file="reply.jsp"%>
			</div>
			
		
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