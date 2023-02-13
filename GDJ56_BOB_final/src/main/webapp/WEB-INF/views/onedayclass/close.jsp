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
		alert("${msg}");
		opener.parent.location.reload();
		window.close();
	</script>
</body>
</html>