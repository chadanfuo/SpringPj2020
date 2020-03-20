<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/member/login" method="post">
<c:if test="${errors.idOrPwNotMatch }">
아이디와 암호가 일치하지 않습니다.
</c:if>
<p>
	아이디:<br/><input type="text" name="email" value="${param.email}" autocomplete="off">
	<c:if test="${errors.email }">ID를 입력하세요</c:if>
</p>
<p>
	암호:<br/><input type="password" name="passwd">
	<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
</p>
<input type="submit" value="로그인">
<a href="${pageContext.request.contextPath}/member/join">[회원가입하기]</a>
<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
</form>
</body>
</html>