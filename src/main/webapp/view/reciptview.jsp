<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
</head>
<style>ddd
i {
	font-size: 30px;
}

a{
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>

<body>
	<form name="select_ingredient" method="post" action="${pageContext.request.contextPath}/shopping/addcart" >
	<!-- 임의로 만든 페이지 이 부분 지영언니꺼로 교체-->
	<input type="hidden" name="rcpNum" value="${recipt.rcpNum }">
	<input type="hidden" name="productName" value="${sale.productname }">
	<input type="hidden" name="price" value="${sale.price }">
	<table>
		<thead>
		<tr>
			<td>${recipt.rcpNum }. ${recipt.title }  </td>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>오늘의 요리</td>
			<td>${recipt.foodName }</td>
		</tr>
		<tr>
			<td>재료</td>
		</tr>
		<c:forEach var="ingredient" items="${ingredients}">
		<tr>
			<td>${ingredient}</td>
		</tr>
		</c:forEach>
		<tr>
			<td>해시태그</td>
			<td>${recipt.hashTag }</td>
		</tr>
		<tr>
			<td>가   격</td>
			<td>${sale.price } 원</td>
		</tr>
		</tbody>
		</table>
		<input type="button" value="-" onclick="qty('-')"/>
		<input type="text" id="qty_value" name="amount" value="0"/>
		<input type="button" onclick="qty('+')" value="+"/>
		<span id="total"></span>
		<input type="submit"><i class="material-icons" style="font-size: 30px;">add_shopping_cart</i>장바구니담기
	</form>
</body>
<script type="text/javascript">
function qty(mark){
	
	var num = document.getElementById('qty_value').value;
	if(mark == '+'){
		if(num < ${sale.stock})
			num++;
		else 
			alert("수량이 없습니다.")
	}
	if(mark == '-'){
		if(num > 1)
			num--;
		else if(num<= 1)
			alert("1개 이상부터 구매할 수 있습니다.")
	}
	
	document.getElementById('total').innerHTML=(num * ${sale.price})+" 원";
	document.getElementById('qty_value').value=num;
	
}

</script>

</html>