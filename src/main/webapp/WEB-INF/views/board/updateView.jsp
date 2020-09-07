<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html lang="en">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<link href="${contextPath}/resources/dist/css/styles.css" rel="stylesheet" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>


<title>게시판</title>
<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<style type="text/css">
li {list-style: none;float: left;padding: 6px;}
.msg {color:gray;padding-right:20px;}
.msg1:hover{color:#cccccc;}
.sear {color:gray;padding-right:20px;}
.sear1:hover{color:#cccccc;}
button{background:black; color:white;}
</style>

	
<script type="text/javascript">
		$(document).ready(function(){		
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click", "#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "${contextPath}/board/readView?bno=${update.bno}"
						+ "&page=${scri.page}"
						+ "&perPageNum=${scri.perPageNum}"
						+ "&searchType=${scri.searchType}"
						+ "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/board/update")
				formObj.attr("method", "post");
				formObj.submit();				
			})	
		})
		function fn_valiChk(){
			var updateForm = $("form[name='updateform'].chk").length;
			for(var i=0; i<updateForm; i++) {
				if($(".chk").eq(i).val() =="" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));			
				return true;
				}
			}
			
		}
		function fn_addFile() { //<input type="file">을 생성하는 버튼 및 그 생성된 파일 삽입칸을 삭제하는 버튼 생성 
			var fileIndex = 1;
			
		
			$(".fileAdd_btn").on("click", function(){
				//작동시 fileIndex(파일 부분)에 삽입칸을 생성한다.
				$("#fileIndex").append("<div><input type='file' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			
			//파일 삭제(fileDelBtn)버튼을 누르면 기능함(파일 삽입칸 삭제)
			$(document).on("click", "#fileDelBtn", function(){
				$(this).parent().remove();
			});
		}
		
		var fileNoArry = new Array();
		var fileNameArry = new Array();
		function fn_del(value, name){
			
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
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
				<header>
					<h1>글 수정</h1>
				</header>
				<hr />

				<div>
					<%@include file="nav.jsp"%>
				</div>
				<hr />

				<section id="container">
					<form name="updateForm" role="form" method="post"
						action="${contextPath}/board/update" enctype="multipart/form-data">
						<input type="hidden" name="bno" value="${update.bno}"
							readonly="readonly" /> <input type="hidden" id="page" name="page"
							value="${scri.page}" /> <input type="hidden" id="perPageNum"
							name="perPageNum" value="${scri.perPageNum}" /> <input
							type="hidden" id="searchType" name="searchType"
							value="${scri.searchType}" /> <input type="hidden" id="keyword"
							name="keyword" value="${scri.keyword}" /> <input type="hidden"
							id="fileNoDel" name="fileNoDel[]" value="" />
						<!-- 없을 수도 있으니 밸류 널값 처리 -->
						<input type="hidden" id="fileNameDel" name="fileNameDel[]"
							value="" />
						<!-- 없을 수도 있으니 밸류 널값 처리 -->




						<table style="margin-left:27%;">
							<tbody>
								<tr>
									<td><label for="title" style="font-weight:600;">제목</label><br>
										<input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요." style="border: 1px solid #343A40; border-radius: 6px; height:30px; width:740px;"/></td>
								</tr>
								<tr>
									<td><label for="content" style="font-weight:600;">내용</label><br>
										<textarea id="content" name="content" rows="30" cols="100" style="border: 1px solid #343A40; border-radius: 6px; height:300px; width:740px;" autofocus required><c:out value="${update.content}"/></textarea></td>
								</tr>
								<tr>
									<td><label for="writer" style="font-weight:600;">작성자</label>&nbsp;
										<input type="text" id="writer" name="writer" value="${update.writer}" style="border:none; background-color:#DDDDDD;" readonly="readonly" /></td>
								</tr>
								<tr>
									<td><label for="regdate">작성날짜</label> <fmt:formatDate
											value="${update.regdate}" pattern="yyyy-MM-dd" /></td>
								</tr>
								<tr>
									<td id="fileIndex"><c:forEach var="file" items="${file}"
											varStatus="var">
											<div>
												<input type="hidden" id="FILE_NO"
													name="FILE_NO_${var.index}" value="${file.FILE_NO }">
												<input type="hidden" id="FILE_NAME" name="FILE_NAME"
													value="FILE_NO_${var.index}"> <a href="#"
													id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}KB)
												<button id="fileDel"
													onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');"type="button">삭제</button><br>
												<br>
											</div>
										</c:forEach></td>
								</tr>
							</tbody>
						</table>
						<div style="margin-left:27%;">
						<button type="button" class="fileAdd_btn">파일추가</button>
						<div style="margin-left:27%;"><br>
							<button type="submit" class="update_btn">저장</button>
							<button type="submit" class="cancel_btn">취소</button>
						</div>
							
						</div>
					</form>
				</section>
				<hr />
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