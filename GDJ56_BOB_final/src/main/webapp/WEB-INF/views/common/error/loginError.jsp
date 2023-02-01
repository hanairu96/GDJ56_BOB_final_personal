<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메시지</title>
</head>
<body>
	<script>
		alert("<%=exception.getMessage() %>");
		location.replace("${pageContext.request.contextPath}/member/loginpage");
	</script>
</body>
</html>