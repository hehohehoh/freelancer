<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>게시판</title>
</head>
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
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'accept='image/gif,image/jpeg,image/png'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
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
				<form name="writeForm" method="post" action="${contextPath}/board/write" enctype="multipart/form-data">
					<table>
						<tbody>
							<c:if test="${free.free_id != null}">
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk" value="${free.free_id }" readonly/>
								</td>
							<tr>
							<tr>
								<td id="fileIndex">
								</td>
							</tr>
							<tr>
								<td>						
									<button class="write_btn" >작성</button>
									<button class="fileAdd_btn" type="button">파일추가</button>
									
								</td>
	
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
	</body>
</html>