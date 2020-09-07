<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head><style>
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



</style></head>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


		&nbsp;&nbsp;&nbsp;<a class="button black" href="${contextPath}/board/list">게시글 목록</a>
		&nbsp;&nbsp;<a class="button black" href="${contextPath}/board/writeView">새글 쓰기</a>	
