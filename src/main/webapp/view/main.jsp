<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
.itemcard-list {
	display: table;
	width: auto;
	min-width: 100%;
	margin-left: -26px;
	overflow: auto;
	margin-bottom: -85px;
}

.itemcard-list-item {
	position: relative;
	width: 80px;
	padding-right: 26px;
	box-sizing: border-box;
	margin-bottom: 30px;
	float: none;
	vertical-align: top;
	display: inline-block;
	word-break: break-all;
}
.item img {
    display: block;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    top: 30px;
    left: 30px;
}
.inner {
    position: relative;
    margin: 0px 200px;
}
</style>

<body>

	<div class="inner">
		<ul class="itemcard-list">
			<c:if test="${count==0 }">
				<h1 style="font-size: 100px">등록된 물품이 없습니다.</h1>
			</c:if>
			<c:if test="${count != 0 }">

				<c:forEach var="li" items="${li}">

					<li class="itemcard-list-item">
						<div class="item">
						<a href="<%=request.getContextPath()%>/member/mypage?memNum=${li.memNum}">
							<div>
								<img src="<%=request.getContextPath()%>/uploadFile/${li.profile}">
							</div>
							<div>
								<div>${li.name}</div>
							</div>
						</a>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>

</body>
</html>