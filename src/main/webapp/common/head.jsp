<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
#header {
    position: relative;
    padding-bottom: 3px;
    z-index: 50;
}
.bar_gnb {
    background-color: rgba(255,255,255,0.9);
    border-bottom: 1px solid #d1d3d4;
    padding: 6px 0 0;
    height: 60px;
}
.bar_gnb .inner {
    overflow: hidden;
}
.inner {
    position: relative;
    margin: 0px 200px;
}

.bar_top {
    background-color: #ff6d00;
    width: 100%;
    top: 0;
    height: 46px;
}
.box_search {
    float: left;
    position: relative;
}

.account_area {
    float: right;
}
a{
	text-decoration: none;
}
a:link{
	color:black;
}
a:visited{
	color:black;
}
</style>

<body>

<header id="header">	
	<div class="bar_top">
		<div class="inner">
			<form class="box_search">
				<input type="text" name="name" placeholder="음식명으로 검색해주세요" autocomplete="off">
				<button type="submit">검색</button>
			</form>
			
			<div class="account_area">
				<c:if test="${! empty authUser}">
					${authUser.name }님, 안녕하세요.
					<a href="${pageContext.request.contextPath}/member/mypage?memNum=${memNum}">[마이페이지]</a>
					<a href="${pageContext.request.contextPath}/member/logout">[로그아웃하기]</a>
				</c:if>	
					<c:if test="${empty authUser}">
					<a href="${pageContext.request.contextPath}/member/join">[회원가입하기]</a>
					<a href="${pageContext.request.contextPath}/member/login">[로그인하기]</a>
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="bar_gnb">
		<div class="inner">
			<h1 class="logo">
				<a href="<%=request.getContextPath()%>/main">메인</a>
			</h1>
		</div>
	</div>
</header>

</body>
</html>