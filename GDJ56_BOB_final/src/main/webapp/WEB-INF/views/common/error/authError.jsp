<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 메시지</title>
</head>
<body>
	<script>
		alert("잘못된 접근입니다.");
		location.replace("${pageContext.request.contextPath}");
	</script>
</body>
</html>