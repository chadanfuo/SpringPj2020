<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.inner {
    position: relative;
    margin: 0px 200px;
}
.box_write {
    background-color: #f7f7f7;
    width: 700px;
    height: 95px;
    box-sizing: border-box;
    padding: 13px 18px;
    border: 1px solid #e6e6e6;
}
.sec_comment .box_write textarea {
    width: 535px;
    height: 71px;
    box-sizing: border-box;
    border: 1px solid #e6e6e6;
    resize: none;
    float: left;
    color: #c7c7c7;
    font-size: 16px;
    font-family: Microsoft YaHei,'NSL';
    text-align: center;
    padding-top: 20px;
    color: #313131;
    overflow: auto;
}
.sec_comment .box_write button {
    display: block;
    width: 123px;
    height: 71px;
    background-color: #ff6d00;
    border: none;
    color: #fff;
    font-size: 17px;
    font-family: Microsoft YaHei,'NSL';
    float: right;
}
ol, ul {
    list-style: none;
    padding: 0px;
}
.lst_comment>li {
    position: relative;
    width: 620px;
    border-bottom: 1px solid #e6e6e6;
    padding: 20px 0 20px 84px;
    clear: left;
    min-height: 64px;
}
.sec_comment .lst_comment li img {
    position: absolute;
    top: 20px;
    left: 0;
    width: 64px;
    height: 64px;
    border-radius: 50%;
    overflow: hidden;
}
.sec_comment .lst_comment li strong {
    color: #839705;
    font-family: Microsoft YaHei,'NSL';
    font-size: 15px;
    overflow: hidden;
    margin-right: 13px;
    clear: left;
}
.sec_comment .lst_comment li time {
    color: #c1c1c1;
    font-size: 13px;
    font-family: Microsoft YaHei,'NSL';
}
.sec_comment .lst_comment li p {
    color: #6d6e71;
    font-size: 13px;
    font-family: Microsoft YaHei, "NS";
    margin-top: 5px;
    line-height: 1.5;
}
</style>
<body>

<div class="inner">
<div class="view_recipe">
	
	<section class="sec_detail">
		<img src="<%=request.getContextPath()%>/uploadFile/test.jpg" style="width: 600px">
		<h2>영양정보<span style="font-size: 13px">(하루 적정 섭취량, 1인분 기준)</span></h2>
		<h2>태그정보</h2>
		<h2>레시피</h2>
	</section>
	
	<section class="sec_comment">
		<h2>한줄댓글</h2>
		<form class="box_write">
			<textarea placeholder="한 줄 댓글을 남겨주세요." name="comment"></textarea>
			<button type="submit">댓글남기기</button>
		</form>
		
		<ul class="lst_comment">
			<li>
				<div class="img-cover">
					<img src="<%=request.getContextPath()%>/uploadFile/profile.png">
				</div>
				<strong>Test</strong>
				<time>2015.02.02</time>
				<p>Good</p>
			</li>
		</ul>
	</section>
</div>
</div>

</body>
</html>