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
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		table {margin: auto; border: 1px solid black; border-collapse: collapse;}
		#text_center{width: 800px; margin:auto 0; }
		.select_img img{margin: 20px 0;}
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
<body>
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
</body>
</html>