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

body{padding-left: 300px;padding-right: 300px;}
ul li a:hover, ul li a:focus {font-size:x-lage}
.board-bottom{
	padding-left:35%;
	padding-right:30%;
}
.board-frame{
	background-color:#343A40; 
	color:#FFFFFF;
}
.notice{
	border: 2px solid;
	font-weight:bold;
	background:#dddddd;
}
table{border: 1px solid black; background-color: #FFFFFF;}
#section{padding: 0px;}
.search{padding-left:48%;} 
.paging-section{padding-left:35%;padding-right:35%; font-size:medium;}
.page-active{font-size:large; color:#cd853f; }
li{padding:15px;}
a{color:#343A40;}



a.button {
    display: inline-block;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em  .55em;
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
</style>

<body class="sb-nav-fixed" style="background-color:#dddddd;">

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
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="padding-right:0px;"><i class="fas fa-user fa-lg"></i></a>
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
<br><br><br>
        <div id="section">


		<hr />
		
		<div id="section">
			<form role="form" method="get" action="${contextPath}/board/write" onsubmit="return false">
				<table class="table table-hover">
					<tr>
						<th class="board-frame">글번호</th>
						<th class="board-frame">제목</th>
						<th class="board-frame">작성자</th>
						<th class="board-frame">등록일</th>
						<th class="board-frame"align="left">조회수</th>
					</tr>
					<c:forEach items="${notice}" var="notice">
						<tr class="notice">
							<td align="left">공지사항</td>
							<td><a href="${contextPath}/board/readView?bno=${notice.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${notice.title}" /></a>
							<td>운영자</td>
							<td><fmt:formatDate value="${notice.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td align="left"><c:out value="${notice.hit }" /></td>
						</tr>
					</c:forEach>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td align="left"><c:out value="${list.bno}" /></td>
							<td><a href="${contextPath}/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out
										value="${list.title}" /></a></td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate value="${list.regdate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td align="left"><c:out value="${list.hit }" /></td>
						</tr>
					</c:forEach>
				</table>
				<!--  검색 관련 버튼들 -->
				<a class="button black" href="${contextPath}/board/list">첫 화면</a>
				<a class="button black" href="${contextPath}/board/writeView">글 쓰기</a>
					<span class="search">
					<select name="searchType" style="height:29px;">
						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="w"
							<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="tc"
							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					</select> <input type="text" name="keyword" id="keywordInput"value="${scri.keyword}" onkeypress="if(event.keyCode==13){search();}" />

					<button id="searchBtn" type="button" style="color: #d7d7d7;background: #333;">검색</button>
					</span>
					<script>
				      function search(){
				          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());      
				       }
				      $(function(){
				        $('#searchBtn').click(function() {
				          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput'
										)
																				.val());
															});
										});
					</script>




				<!-- 페이징 관련 버튼들 -->
				<div class="paging-section">
				
					<ul class="pagination"><!-- class="pagination pagination-sm" --> 
					<c:if test="${pageMaker.prev}">
						<!-- 이전 버튼의 생성 여부를 확인하여 버튼을 보여준다. -->

						<a class="paging-link" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">«</a>
					</c:if>
					<!-- 현재 페이지가 어디인지 알기 위해 추가 -->
					
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						
						<!-- 페이지의 시작 번호와 끝 번호를 이용해 페이지 버튼들을 뿌려준다. -->
						<li class="page-item">
						<c:choose>
						
							<c:when test="${idx eq scri.page }">
								<a class="page-active" href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							</c:when>
							<c:otherwise>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
							</c:otherwise>
						</c:choose>
						</li>
					</c:forEach>
					
					<li class="page-item">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<!-- 다음 버튼의 생성 여부를 확인하여 버튼을 보여준다. -->
						<a class="paging-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">»</a>
					</c:if>
					</li>
					</ul>
				</div>
			</form>
		</div>
		</div>
		

   </div>
        
<!--  푸터 -->
<div id="footer"><%@ include file="/WEB-INF/views/common/footer.jsp" %></div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/dist/js/scripts.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
<script src="${contextPath}/resources/dist/assets/demo/datatables-demo.js"></script>
  
   
   
</body>
</html>