<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>

<title>Insert title here</title>
</head>

<style>
.user_information {
    background: #f5f5f5;
    width: 100%;
    margin-top: 43px;
    position: relative;
}
.user_information .inner {
    min-height: 167px;
    box-sizing: border-box;
    padding: 50px 0 50px 150px;
}
.inner {
    position: relative;
    margin: 0px 200px;
}
.user_information img {
    display: block;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    position: absolute;
    top: 30px;
    left: 30px;
}
.user_information>.inner>strong {
    display: inline-block;
    font-size: 22px;
    color: #3b3b3b;
    font-family: Microsoft YaHei,'NST';
}
.user_information .follow {
    display: inline-block;
    color: #979797;
    font-size: 16px;
    font-family: Microsoft YaHei,'NSL';
    white-space: nowrap;
    word-break: keep-all;
}
.user_information .dsc {
    width: 500px;
    font-size: 13px;
    color: #676767;
    margin: 7px 0 0 2px;
}
.user_information .btn_area {
    position: absolute;
    right: 0;
    bottom: 20px;
}
.data-tab {
    width: 100%;
    height: 60px;
    border-top: 1px solid #e8e9e9;
    border-bottom: 1px solid #e8e9e9;
    margin-bottom: 55px;
}
ol, ul {
    list-style: none;
}
.tab-list { 
	padding-inline-start: 0px;
	overflow: hidden;
	margin-block-end: 0px;
	margin-bottom: -1px;
}
.tab-list li {
	float: left; 
	width: 33%; 
	text-align: center; 
	margin-right: -1px;
}
.tab-list li a {
	text-decoration: none; 
	display: block; 
	padding: 10px 0px; 
	font-size: 15px; 
	color: #666; 
	font-weight: 700;
}
.tab-list li.active a {
	color: #3b3b3b; 
	border-bottom: 3px solid #ff6d00;
}
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
.lst_recipe {
    width: 1040px;
    position: relative;
    left: -16px;
    overflow: hidden;
    margin-bottom: 56px;
}
.lst_recipe>li {
    width: 244px;
    height: 390px;
    margin: 0 0 16px 16px;
    position: relative;
    border: 1px solid #e1e1e1;
    box-sizing: border-box;
    float: left;
    background-color: #fff;
    margin: 0 0 16px 16px;
}
.lst_recipe li .call_recipe {
    display: block;
    margin: 4px;
    position: relative;
}
.lst_recipe li .call_recipe img {
    width: 234px;
    height: 234px;
    display: block;
}
.lst_recipe li .author {
    text-align: center;
    width: 100%;
    z-index: 5;
    display: block;
    margin-top: -40px;
    position: relative;
}
.lst_recipe li .author img {
    width: 61px;
    height: 61px;
    border-radius: 50%;
    overflow: hidden;
    display: block;
    margin: 0 auto 5px;
}
.lst_recipe li p {
    text-align: center;
    font-size: 15px;
    font-family: Microsoft YaHei,'NSB';
    line-height: 19px;
    letter-spacing: -0.025em;
    padding: 2px 20px 0;
}
.lst_recipe li p strong {
    display: block;
    overflow: hidden;
    margin-top: 5px;
    word-break: keep-all;
    white-space: nowrap;
    text-overflow: ellipsis;
}
li.btn_add a {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    display: block;
    background: #e36113 url(/assets/_img/mypage/add_my_recipe-81ca769….png) center 118px no-repeat;
    color: #ffaa77;
    font-size: 24px;
    text-align: center;
    padding-top: 110px;
    text-decoration: none;
}
.no-content {
    font-size: 15px;
    padding-top: 170px;
    text-align: center
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

<div id="content">
	<div class="user_information">
		<div class="inner">
			<img src="<%=request.getContextPath()%>/uploadFile/${member.profile}">
			<strong>${member.name}</strong>
			<span>팔로워 ${followerCount}명</span>
			<p class="dsc">
				<br><br>
				<strong>${member.selfIntroduction}</strong>
				<br>
			</p>
			<div class="btn_area">
				<c:if test="${loginNum==member.memNum}">
				<button onclick="javascript:window:location='<%=request.getContextPath()%>/member/modifyForm?memNum=${member.memNum}'">
				프로필 수정
				</button>
				</c:if>
				<c:if test="${loginNum!=member.memNum}">
					<c:if test="${checkFollow==0}">
					<button onclick="javascript:window:location='<%=request.getContextPath()%>/member/follow?memNum=${member.memNum}'">팔로우</button>
					</c:if>
				</c:if>
				<c:if test="${loginNum!=member.memNum}">
					<c:if test="${checkFollow==1}">
					팔로우중<br>
					<button onclick="javascript:window:location='<%=request.getContextPath()%>/member/unFollow?memNum=${member.memNum}'">언팔로우</button>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="data-tab">
		<div class="inner">
		<ul class = "tab-list">
			<li class = "active" onclick = "openTitle('myRecipe')"><a href = "#">마이레시피</a></li>
			<li onclick = "openTitle('scrap')"><a href = "#">스크랩</a></li>
			<li onclick = "openTitle('follow')"><a href = "#">팔로우(${followCount})</a></li>
		</ul>
		</div>
	</div>
	
	<div class="title" id = "myRecipe" style="margin: 0px 200px;">
		<ul class="lst_recipe">
			<c:if test="${loginNum==member.memNum}">
			<li class="btn_add">
				<a href="<%=request.getContextPath()%>/rcp/writeForm"><h1 style="margin: 0px;">+</h1><br>나의 레시피 추가하기</a>
			</li>
			</c:if>
			
			<c:if test="${rcpCount==0}">
			<li class="no-recipes">
				<div class="no-content">
				아직 등록하신 레시피가 없습니다.
				</div>
			</li>
			</c:if>
			
			<c:if test="${rcpCount!=0}">
			<c:forEach var="rcpList" items="${rcpList}">
			<li>
				<a href="" class="call_recipe">
					<img src="<%=request.getContextPath()%>/uploadRcpFile/${rcpList.thumbnail}">
				</a>
				<span class="author">
					<a href="">
						<img src="<%=request.getContextPath()%>/uploadFile/${rcpList.profile}">
					</a>
				</span>
				<p>
					<a href=""><strong>${rcpList.title}</strong><p>${rcpList.subtitle}</p></a>
				</p>
			</li>
			</c:forEach>
			</c:if>		
		</ul>
	</div>
	
	<div class="title" id = "scrap" style = "display:none; margin: 0px 200px;">
		<h1 style="text-align: center;color: #b7b7b7;font-size: 20px;padding-top: 100px">아직 스크랩하신 레시피가 없습니다.</h1>
	</div>
	
	<div class="title" id = "follow" style = "display:none; margin: 0px 200px;">
		<c:if test="${followCount==0 }">
			<h1 style="text-align: center;color: #b7b7b7;font-size: 20px;padding-top: 100px">아직 팔로우 하신 유저가 없습니다.</h1>
		</c:if>
		<ul class="itemcard-list">			
			<c:if test="${followCount != 0 }">
				<c:forEach var="followList" items="${followList}">
					<li class="itemcard-list-item">
						<div class="item">
						<a href="<%=request.getContextPath()%>/member/mypage?memNum=${followList.memNum}">
							<div>
								<img src="<%=request.getContextPath()%>/uploadFile/${followList.profile}">
							</div>
							<div>
								<div>${followList.name}</div>
							</div>
						</a>
						</div>
					</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	
	
</div>

<script>
var tabBtn = $(".data-tab > .inner > ul > li"); 

tabBtn.click(function(e) {
    e.preventDefault();
    var target = $(this); 
    var index = target.index(); 
    tabBtn.removeClass("active");   
    target.addClass("active");   
		    
}); 

function openTitle(titleName) {
	   var i;
	   var x = document.getElementsByClassName("title");
	   for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none";  
	   }
	   document.getElementById(titleName).style.display = "block";
}

</script>

</body>
</html>