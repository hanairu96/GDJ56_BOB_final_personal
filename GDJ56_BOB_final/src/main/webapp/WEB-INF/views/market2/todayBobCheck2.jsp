<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script>console.log("${path }");</script>

<html>
<head>
<meta charset="UTF-8">
<title>체크한 상품 확인</title>
</head>
<body>


<%-- 	<c:forEach var="c" items="${chItems}">
		<c:out value="${c}"/>
	</c:forEach> --%>
	<c:forEach var="l" items="${list}">
		<c:out value="${l}"/>
	</c:forEach>

	
</body>
</html>