<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${check==1}">
		<meta http-equiv="Refresh" content="0;url=mypage?memNum=${memNum}">
	</c:if>
	<c:if test="${check==0}">
		<script>
			alert("먼저 로그인해 주세요.");
			document.location.href="<%=request.getContextPath()%>/member/login"
		</script>
	</c:if>
	
</body>
</html>