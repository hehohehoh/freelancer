<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <c:set var="comp_id" value="${company.comp_id}"/>
   <c:set var="comp_name" value="${company.comp_name}"/>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <c:if test="${close == 'close'}">
      <script>
         window.onload=function(){
            window.open("about:blank","_self").close();
            alert("메세지를 전송하였습니다.");
            opener.document.getElementById('resume').style.display = 'block';
         }
      </script>
   </c:if>
       <link rel="stylesheet" href="${contextPath}/resources/css/message.css">
</head>
<style>
.msgBtn{
	border:0;outline:0;font-weight: bold;background:#343A40;color:#eeeeee;border-radius:5px;font-size:1.2em;
}
</style>
<body>
<section>
        <div id="main_content">
            <div id="message_box">
                <h3 id="write_title" style="font-size:40px">쪽지 보내기</h3>
  
                <!-- message_insert.php를 통해 DB의 message테이블에 저장 : 송신id는 get방식으로 -->
               <form id="msgForm" method="post" action="${contextPath}/free/InsertMsg.do">
                        <div id="write_msg">
                            <ul>
                                <li>
                                    <span class="col1">보내는 사람 : </span>
                                    <span class="col2"><input type="text" name="comp_id" value="${comp_id}" readonly></span>
                                </li>
                                <li>
                                    <span class="col1">제목 : </span>
                                    <span class="col2"><input type="text" name="msg_title" style="width:100"></span>
                                </li>
                                <li id="textarea">
                                    <span class="col1">내용 : </span>
                                    <span class="col2"><textarea name="msg_content" form="msgForm" rows="20" cols="60" autofocus required wrap="hard" placeholder="보낼 내용을 입력해주세요"></textarea></span>
                                </li>                                
                            </ul>
                            <!-- 서밋버튼 -->
                               <div style="text-align:center;padding-right:22%"><input class="msgBtn" type="submit" value="전 송" style="width:100px;height:40px;"></div>
                        </div>
                        <input type="hidden" name="free_id" value="${free_id}" >
                  <input type="hidden" name="comp_name" value="${comp_name}" >
                </form>
            </div>
 
        </div>
 
    </section>
</body>
</html>