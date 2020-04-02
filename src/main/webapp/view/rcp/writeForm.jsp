<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<title>Insert title here</title>
</head>

<style>
.recipe_regi {
	width: 1240px;
    max-width: none !important;
    margin-right: auto;
    margin-left: auto;
}
.inner{
	position: relative;
    margin: 0px 400px;
}
.regi_center {
    border: 1px solid #e6e7e8;
    background: #fff;
    margin: 0;
    padding: 0;
    min-width: 1200px; 
}
.regi_title {
    background: #f8f8f8;
    border-bottom: 1px solid #e6e7e8;
    padding: 14px 18px;
    font-size: 20px;
    font-weight: bold;
    position: relative;
}
.cont_box {
    padding-left: 60px !important;
    padding: 26px 30px;
    border-bottom: 10px solid #f1f1f2;
    margin: 0 -1px;
}
.mainPhoto {
    width: 250px;
    float: right;
    margin-right: 60px;
}
.cont_line {
    width: 800px;
    padding: 8px 0 0 0;
}
.cont_tit {
    width: 140px;
    display: inline-block;
    font-size: 20px;
    font-weight: normal;
    vertical-align: top;
    padding: 0 0 0 2px;
    margin: 0 0 22px 0;
    line-height: 50px;
}
.cont_line input {
    display: inline-block;
}
.cont_box input {
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    padding-left: 15px;
    height: 50px;
    vertical-align: middle;
    margin-top: 5px;
}
.btnAdd, .addStep, .delStep{
    border: none;
    background: none;
    margin: 10px 0 0 0;
    padding: 0;
    font-size: 16px;
    color: #444;
}
.btnAdd span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}
.delStep span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}
.addStep span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}
.ingred_name {
    width: 550px;
}
.ingred_qnt {
    width: 200px;
}
#rcp, .stepFile {
	display: none;
}
#rcpImg {
	cursor:pointer;
	 width: 250px;
    height: 250px;
}
#stepImg {
	cursor:pointer;
	 width: 160px;
    height: 160px;
}
.step {
    display: inline-block;
    margin: 6px 0;
}
.cont_tit2 {
    width: 120px;
    display: inline-block;
    font-size: 30px;
    font-weight: normal;
    vertical-align: top;
    color: #74b243;
    margin: 0px;
}
.step_cont {
    display: inline-block;
    vertical-align: middle;
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    line-height: 25px;
    height: 160px;
    width: 430px;
    resize: none;
}
.step img {
    border: 3px solid #e1e1e1;
    display: inline-block;
    vertical-align: middle;
}
.cont_box select {
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    padding: 8px 2px;
    margin: 0 2px 0 0;
    border-radius: 4px;
    height: 50px;
}
.btn_area {
    position: relative;
    margin: 30px 0px 30px;
    text-align: center;    
}
.btn_area .btn_orange {
    background: #e36113;
    color: #fff;
    font-family: Microsoft YaHei,'NSL';
    display: inline-block;
    width: 167px;
    height: 52px;
    border-radius: 5px;
    border: 1px solid #e1e1e1;
    font-size: 16px;
}
.division{
	width: 100%;
    height: 40px;
    line-height: 40px;
    background-color: #ccc;
    color: black;
    border-radius: 5px;
}
.cateName{
	border: 1px solid #e1e1e1;
    border-radius: 5px;
    color: #3e3e3e;
    background: #fff;
    font-size: 14px;
    font-family: Microsoft YaHei,'NS';
    display: inline-block;
    box-sizing: border-box;
    margin: 0 0 5px 0;
    padding: 6px 13px;
}
</style>

<body>
<div class="ricipe_regi">
<div class="inner">
<form method="post" enctype="multipart/form-data" name="writeForm" action="<%=request.getContextPath()%>/rcp/writePro" onSubmit="return check()">
<div class="regi_center">
	<div class="regi_title">레시피 등록</div>
	<div class="cont_box">	
		<div class="mainPhoto">
			<img id="rcpImg" src="<%=request.getContextPath()%>/images/mainPhoto.gif" onclick="document.getElementById('rcp').click();">
			<input type='file' id="rcp" name="thumbNail" value="" onchange="readyImg(this)">
		</div>
		<div class="cont_line">
			<p class="cont_tit">레시피 제목</p>
			<input type="text" name="title" autocomplete="off" style="width:610px;">
		</div>
		<div class="cont_line">
			<p class="cont_tit">한줄소개</p>
			<input type="text" name="subtitle" autocomplete="off" style="width:610px;">
		</div>
		<div class="cont_line">
			<p class="cont_tit">음식명</p>
			<input type="text" name="foodname" autocomplete="off" style="width:610px;">
		</div>	
		<div class="cont_line">
			<p class="cont_tit">조리시간</p>
			<input type="text" name="cookingtime" autocomplete="off"> 
		</div>	
	</div>
		
	<div class="cont_box">
		<p class="cont_tit">재료정보</p>
		<table id="ingred_table" class="table">		
		<tbody id="ingred_tbody">
			<tr>
				<td> <input type="text" name="ingredient1" class="ingred_name" placeholder="재료명" autocomplete="off">  </td>
				<td> <input type="number" name="quantity1" class="ingred_qnt" placeholder="수량" autocomplete="off" onkeypress="return event.charCode >= 48 && event.charCode <= 57">  </td>
				<td></td>
			</tr>
		</tbody>
		</table>
		<div style="padding:0 0 20px 350px; width:800px;">
			<button type="button" class="btnAdd" style="cursor:pointer;">
				<span><b>+</b></span>추가
			</button>
		</div>		
	</div>
	
	<div class="cont_box">
		<p class="cont_tit">요리순서</p><br>
		<div class="sort_step">
		<div class="step">
			<p class="cont_tit2">Step1</p>
			<div style="display:inline-block">
				<textarea name="content1" class="step_cont"></textarea>
			</div>
			<div style="display:inline-block">				
				<img id="stepImg" src="<%=request.getContextPath()%>/images/rcpStep.gif" onclick="document.getElementsByClassName('stepFile')[0].click();">
				<input type='file' class="stepFile" name="rcpFile1" onchange="readyStepImg(this)">
				<input type="hidden" name="step1" value="1">				
			</div>			
		</div>		
		</div>
		<div style="padding:0 0 20px 350px; width:800px;">
			<button type="button" class="addStep" style="cursor:pointer;">
				<span><b>+</b></span>추가
			</button>
			<button type="button" class="delStep" style="cursor:pointer;">
				<span><b>-</b></span>삭제
			</button>
		</div>		
	</div>
	
	<div class="cont_box">
		<div class="cont_line">
			<p class="cont_tit">해시태그</p>
			<textarea name="hashtag" class="step_cont"></textarea>
		</div>
		<div class="cont_line">
			<p class="cont_tit">카테고리</p>
			<div class="category">
				<div>
				<p class="division">상황별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=1}">
				<c:if test="${category.cateNum<=7}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:if>
				</c:forEach>
				</div>
								
				<div>
				<p class="division">나라별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=8}">
				<c:if test="${category.cateNum<=15}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:if>
				</c:forEach>
				</div>
				
				<div>
				<p class="division">재료별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=16}">
				<c:if test="${category.cateNum<=37}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:if>
				</c:forEach>
				</div>
				
				<div>
				<p class="division">조리법별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=38}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:forEach>
				</div>
			
			</div>	
		</div>
		
	</div>	
	
	<div class="btn_area">
		<button type="submit" class="btn_orange">등록완료</button>
	</div>
	
</div>
</form>
</div>
</div>

</body>

<script>
	
	var j=1;
	$('.btnAdd').click(function() {
		j++;
		var rowItem = "<tr>"
			rowItem += "<td> <input type='text' class='ingred_name' name='ingredient"+j+"' placeholder='재료명'> </td>"
			rowItem += "<td> <input type='number' class='ingred_qnt' name='quantity"+j+"' placeholder='수량' onkeypress='return event.charCode >= 48 && event.charCode <= 57'> </td>"
			rowItem += "<td> <button type='button' class='btn btn-danger' style='cursor:pointer;'> <i class='fa fa-minus'></i> </button> </td>"
			rowItem += "</tr>"
		$('#ingred_table').append(rowItem)
	});	
	
	$('#ingred_table').on("click", "button", function() {
	    $(this).closest("tr").remove()
	});
	
	function readyImg(value){
    	if(value.files && value.files[0]){
    		var reader = new FileReader();
    		reader.onload = function (e){
    			$('#rcpImg').attr('src',e.target.result);
    		}
    		reader.readAsDataURL(value.files[0]);
    	}
	}
	
	var i=1;
	$('.addStep').click(function() {		
		var step="<div class='step'>"
		step+="<p class='cont_tit2'>Step"+(++i)
		step+="</p> <div style='display:inline-block'><textarea name='content"+i+"' class='step_cont'></textarea></div>"
		step+=" <div style='display:inline-block'>"				
		step+=" <img id='stepImg' src='<%=request.getContextPath()%>/images/rcpStep.gif' onclick=\"document.getElementsByClassName('stepFile')["+(i-1)+"].click();\">"
		step+=" <input type='file' class='stepFile' name='rcpFile"+i+"' onchange='readyStepImg(this)'>"
		step+='<input type="hidden" name="step'+i+'" value="'+i+'">'
		step+="</div>"		
				
		$('.sort_step').append(step)		
	});	
	
	$('.delStep').click(function() {
	    $('.step:last').remove()
	    i--;
	});
	
	function readyStepImg(value){
    	if(value.files && value.files[0]){
    		var reader = new FileReader();
    		reader.onload = function (e){
    			$(value).prev('#stepImg').attr('src',e.target.result);
    		}
    		reader.readAsDataURL(value.files[0]);
    	}
	}	

</script>

</html>