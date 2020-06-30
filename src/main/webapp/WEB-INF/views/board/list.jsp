<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<title>게시판</title>
	<style type="text/css">
		li {list-style: none; float: left; padding: 6px;}
	</style>
</head>
<body>
	<div id="root">
		<header>
			<h1>${free_id }으로 로그인 되었습니다</h1>
		</header>
		<hr />

		<div>
			<%@include file="nav.jsp" %>
		</div>
		<hr />

		<section id="container">
			<form role="form" method="get" action="${contextPath}/board/write">
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>

							<td><c:out value="${list.bno}" /></td>
							<td><a href="${contextPath}/board/readView?bno=${list.bno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
							</td>
							<td><c:out value="${list.writer}" /></td>
							<td><fmt:formatDate value="${list.regdate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
				
	<!--  검색 관련 버튼들 -->
<div class="search">
    <select name="searchType">
      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
  
  
  
  
  	<!-- 페이징 관련 버튼들 -->
	<div>
		<ul>
			 <c:if test="${pageMaker.prev}">	
			 	<!-- 이전 버튼의 생성 여부를 확인하여 버튼을 보여준다. -->
			 	
			 	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			 </c:if> <!-- 현재 페이지가 어디인지 알기 위해 추가 -->
			
			 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx" >
			 		<!-- 페이지의 시작 번호와 끝 번호를 이용해 페이지 버튼들을 뿌려준다. -->
			 		
			 		
			 	<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
			 </c:forEach>
			
			 <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			 		<!-- 다음 버튼의 생성 여부를 확인하여 버튼을 보여준다. -->
			 		
				    	<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				    </c:if> 
				  </ul>
				</div>			
			</form>
		</section>
		<hr />
	</div>
</body>
</html>