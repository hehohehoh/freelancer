<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<html>
	<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	 	<title>게시판</title>
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
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "${contextPath}/board/replyUpdateView?bno=${read.bno}"
											+ "&page=${scri.page}"
											+ "&perPageNum=${scri.perPageNum}"
											+ "&searchType=${scri.searchType}"
											+ "&keyword=${scri.keyword}"
											+ "&rno="+$(this).attr("data-rno");								
			});
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
			location.href = "${contextPath}/board/replyDeleteView?bno=${read.bno}"
											+ "&page=${scri.page}"
											+ "&perPageNum=${scri.perPageNum}"
											+ "&searchType=${scri.searchType}"
											+ "&keyword=${scri.keyword}"
											+ "&rno="+$(this).attr("data-rno");	
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
	
	<body>
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
		<div>
			<%@include file="nav.jsp" %>
		</div>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					 <input type="hidden" id="page" name="page" value="${scri.page}"> 
					 <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					 <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">					
					 <input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>												<!-- FILE_NO는 비워둠(파일 다운로드시에만 사용하기 때문)-->
				<!--list에서 가져온 scri값을 보관하기 위해 form태그안에 hidden으로 input태그사용  -->
				
				
				
				
											
					
						
										<div>
                        <label for="title">제목</label>
                        <input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
                     </div>
                     
                     <div>
                        <label for="content">내용<br></label>
                        <textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
                                       
                  <!-- file의 SOTRED_FILE_NAME에서 "."다음 부분을 추출  ${status.last}:.다음(마지막)이면 토큰으로 사용 -->   
                  <!-- 추출한 토큰으로 when절 실행 -->
                     <div>
                        <c:forEach var="file" items="${file}" varStatus="status"> <!--  -->
                        <c:forTokens var="token" items="${file.STORED_FILE_NAME }" delims="." varStatus="status"  >
                        <c:if test="${status.last }">       
                           <c:choose>    
                              <c:when test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' }"> 
                                 <img src="${contextPath}/resources/boardFile/${file.STORED_FILE_NAME}" width="200px" alt="no image" /> 
                              </c:when> 
                           </c:choose> 
                        </c:if>
                        </c:forTokens> 
                        </c:forEach>
                     </div>

                        <br><label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
                     </div>
                     <div>
                        <label for="regdate">작성날짜</label>
                        <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />               
                     </div>
               
                     
                  <span>파일 목록</span >   
                  <div class="form-group" >
                     <c:forEach  var="file" items="${file}">                                                      <!-- KB로 표시하기위해 -->
                        <a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}KB)<br>
                     </c:forEach>
                  </div>  
					
			
				
				
				<c:if test="${read.writer == free.free_id}">
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
				</div>
				</c:if>
				
				<!--  댓글 -->
				<div id="reply"> <!-- 댓글을 불러와 읽는 코드 -->
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p>
								작성자 : ${replyList.writer}<br />
								작성 날짜 : <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
								
								<p>${replyList.content}</p>
								
								<c:if test="${replyList.writer == free.free_id}">
								<div>
									<button type="button" class="replyUpdateBtn" data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn" data-rno="${replyList.rno}">삭제</button>
								</div>
								</c:if>
							</li>
						</c:forEach>
					</ol> 
				</div>
				<form name="replyForm" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}">
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}">
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
					
					<div>
						<label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" value="${free.free_id }" readonly/>
						<label for="content">댓글 내용</label><input type="text" id="content" name="content" />
						<button type="button" class="replyWriteBtn">작성</button>
					
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>