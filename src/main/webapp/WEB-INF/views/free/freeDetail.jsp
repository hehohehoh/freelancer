<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="f" value="${free}" />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center"><h3>프리랜서 정보</h3></div>
	<table border="1" style="margin:auto;">
		<tr>
			<td align="center">
					<c:choose>
	        		<c:when test="${f.free_picture == 'no file' || f.free_picture == null}" >
	          			<c:choose>
	            			<c:when test="${f.free_gender == 0 }">
	              				<img src="${contextPath}/resources/profile/img3.jpg" style="width:100px;height:100px"/>
	              			</c:when>
	              		<c:otherwise>
	              			<img src="${contextPath}/resources/profile/img2.jpg" style="width:100px;height:100px"/>
	              		</c:otherwise>
	          			</c:choose>
	          		</c:when>
	          	<c:otherwise>
	          			<c:set var="fileName" value="${f.free_picture}" />
									<c:set var="fileNameArr" value="${fn:split(fileName,'\\\\')}" />
	
									<img src="${contextPath }/resources/profile/${f.free_id}/${f.free_picture}" style="width:100px;height:100px"/>
	          		</c:otherwise>
	       	</c:choose>	
	       		<br>
	       		${f.free_lastName}** <br>
	       		<c:set var="year" value="${year}" />
						<c:set var="bir" value="${f.free_bir}" />
						<c:set var="birYear" value="${year - (fn:substring(bir,0,4)) + 1}" />
						나이: ${birYear} 세 
				<br>
			</td>
			<td>
				사용언어: 
				<c:forEach var="s" items="${skillList}" > 
						${s} 
				</c:forEach>
				<br><br>
				등급: ${f.free_level} <br><br>
				
				주소: ${f.free_addr} <br><br>
				
				희망연봉: 
				<c:choose>
					<c:when test="${f.free_pay == null || f.free_pay==0}">
						(협의 후 결정)
					</c:when>
					<c:otherwise>
						${f.free_pay}
					</c:otherwise>
				</c:choose>
				<br>
				</td>
			</tr>
	</table>
	<br><br>
	<c:if test="${f.free_file != null}">
	<div style="text-align: center"><h4>이력서(경력기술서)</h4>
		${f.free_id }님의 파일 : <a href="${contextPath }/free/fileDown.do">${f.free_file }</a>
	</div>
	</c:if>
	<br><br><br>
	<div style="text-align: center"><h4>프로젝트</h4></div>
	<br>
	<c:choose>
		<c:when test="${empty careerList}">
			<div style="text-align: center"><h5>프로젝트가 없습니다</h5></div>
		</c:when>
		<c:otherwise>
			<c:forEach var='p' items="${careerList}">
				<table border="1" style="margin:auto;">
					<tr align="center">
						<td>프로젝트이름</td>
						<td>담당업무</td>
						<td>회사 이름</td>
						<td>프로잭트 시작 날짜</td>
						<td>프로잭트 끝 날짜</td>
					</tr>
					<tr>
						<td>${p.free_pname}</td>
						<td>${p.free_pwork}</td>
						<td>${p.free_company}</td>
						<td>${p.free_startdate}</td>
						<td>${p.free_finishdate}</td>
					</tr>
				</table>
				<br><br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>