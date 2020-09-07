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


<title>글 쓰기</title>

<link rel="stylesheet" href="${contextPath}/resources/comm/cssFile.css" />
<style type="text/css">
li {list-style: none;float: left;padding: 6px;}
.msg {color:gray;padding-right:20px;}
.msg1:hover{color:#cccccc;}
.sear {color:gray;padding-right:20px;}
.sear1:hover{color:#cccccc;}

a.button {
    display: inline-block;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em .55em;
    -webkit-border-radius: .5em; 
    -moz-border-radius: .5em;
    border-radius: .5em;
}
a.button:hover {
    text-decoration: none;
}
a.button:active {
    position: relative;
    top: 1px;
}
.black {
    color: #d7d7d7;
    border: solid 1px #333;
    background: #333;
    background: -webkit-gradient(linear, left top, left bottom, from(#666), to(#000));
    background: -moz-linear-gradient(top, #666, #000);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#666666', endColorstr='#000000');
}
button{background:black; color:white;}
</style>


<script type="text/javascript">
	
	
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");			
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/board/write");
				formObj.attr("method", "post");
				formObj.submit();	
			});
			fn_addFile();
		})
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++) {
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
					alert($(".chk").eq(i).attr("title"));
					return true;
				}		
			}
		}
		//fn_addFile이란 이름을 가진 버튼을 누르면 작동하는 함수로  새로운 <input type="file">버튼과 바로 밑의 fileDelBtn 함수를 실행하는  삭제 버튼을 생성
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
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
        
        
	<div id="wrapper">


		<div id="section">

			<div id="root">
				<header>
					<h1>새글 작성</h1>
				</header>
				<hr/>
			<a class="button black" href="${contextPath}/board/list">목록보기</a>
			<hr/>
				<section id="container">
					<form name="writeForm" method="post"
						action="${contextPath}/board/write" enctype="multipart/form-data">
						<table style="margin-left:27%;">
							<tbody>
								<c:if test="${free.free_id != null}">
									<tr>
										<td><label for="title" style="font-weight:600;" >제목</label><br>
											<input type="text" id="title" name="title" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요." style="border: 1px solid #343A40; border-radius: 6px; height:30px; width:740px;"/></td>
									</tr>
									<tr>
										<td><label for="content" style="font-weight:600;" >내용</label><br>
											<textarea id="content" name="content" class="chk" placeholder="내용을 입력하세요." style="border: 1px solid #343A40; border-radius: 6px; height:300px; width:740px;" title="내용을 입력하세요." rows="20" cols="100" autofocus required ></textarea></td>
									</tr>
									<tr>
										<td><label for="writer" style="font-weight:600;" >작성자</label>
											<input type="text" id="writer" name="writer" class="chk" style="border:none; background-color:#DDDDDD;" value="${free.free_id }" readonly /></td>
									<tr>
									<tr>
										<td id="fileIndex"></td>
									</tr>
									
									<tr>
										<td><button class="fileAdd_btn" type="button">파일추가</button></td>
									</tr>
									<tr>
										<td><br><button class="write_btn" style="margin-left:45%;">작성</button></td>
									</tr>
								</c:if>
								<c:if test="${free.free_id == null}">
									<p>로그인 후에 작성하실 수 있습니다.
								</c:if>
							</tbody>
						</table>
					</form>
				</section>
				<hr />
			</div>
		</div>
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