<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    margin: 0px 200px;
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
.btnAdd{
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
.ingred_name {
    width: 550px;
}
.ingred_qnt {
    width: 200px;
}
</style>

<body>
<div class="ricipe_regi">
<div class="inner">
<div class="regi_center">
	<div class="regi_title">레시피 등록</div>
	<div class="cont_box">
		<div class="mainPhoto">
			<img src="<%=request.getContextPath()%>/images/mainPhoto.gif">
		</div>
		<div class="cont_line">
			<p class="cont_tit">레시피 제목</p>
			<input type="text" name="title" style="width:610px;">
		</div>
		<div class="cont_line">
			<p class="cont_tit">한줄소개</p>
			<input type="text" name="subtitle" style="width:610px;">
		</div>
		<div class="cont_line">
			<p class="cont_tit">음식명</p>
			<input type="text" name="foodName" style="width:610px;">
		</div>		
	</div>
	
	<div class="cont_box">
		<p class="cont_tit">재료정보</p>
			<table id="ingred_table" class="table">		
			<tbody id="ingred_tbody">
				<tr>
					<td> <input type="text" class="ingred_name" placeholder="재료명">  </td>
					<td> <input type="number" class="ingred_qnt" placeholder="수량" onkeypress="return event.charCode >= 48 && event.charCode <= 57">  </td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div style="padding:0 0 20px 350px; width:800px;">
			<button type="button" class="btnAdd" >
				<span><b>+</b></span>추가
			</button>
		</div>		
	</div>
</div>
</div>
</div>

</body>

<script>
	var rowItem = "<tr>"
	rowItem += "<td> <input type='text' class='ingred_name' placeholder='재료명'> </td>"
	rowItem += "<td> <input type='number' class='ingred_qnt' placeholder='수량' onkeypress='return event.charCode >= 48 && event.charCode <= 57'> </td>"
	rowItem += "<td> <button type='button' class='btn btn-danger'> <i class='fa fa-minus'></i> </button> </td>"
	rowItem += "</tr>"
	
	$('.btnAdd').click(function() {
		$('#ingred_table').append(rowItem)
	});	
	
	$('#ingred_table').on("click", "button", function() {
	    $(this).closest("tr").remove()
	});
	
	$('#ingred_tbody tr').each(function () {
		var cellItem = $(this).find(":input")
		var itemObj = new Object()
		itemObj.title = cellItem.eq(0).val()
		itemObj.count = cellItem.eq(1).val()
		itemObj.info = cellItem.eq(2).val()
		itemObj.name = cellItem.eq(3).val()
	})
</script>

</html>