<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<title>회원정보수정</title>
</head>

<style>
img {
    width: 130px;
    height: 130px;
    border-radius: 50%;
}
#profile {
	display: none;
}
#profileImg {
	cursor:pointer;
}				
</style>

<script type="text/javascript">
    function readyImg(value){
    	if(value.files && value.files[0]){
    		var reader = new FileReader();
    		reader.onload = function (e){
    			$('#profileImg').attr('src',e.target.result);
    		}
    		reader.readAsDataURL(value.files[0]);
    	}
	}
    
    function check() {	
    	var userModify=eval("document.userModify");
    	
		if(!userModify.name.value){
			alert("닉네임을 입력하세요");
			userModify.name.focus();
			return false;
		}
	}
</script>

<body>

	<form method="post" enctype="multipart/form-data" name="userModify" action="<%=request.getContextPath()%>/member/modifyPro"	onSubmit="return check()">
		<input type="hidden" name="memNum" value="${member.memNum}">
		<input type="hidden" name="profile" value="${member.profile}">
		<table width="500" border="1" cellspacing="0" cellpadding="3" align="center">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>프로필 수정</b></font></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<img id="profileImg" src="<%=request.getContextPath()%>/uploadFile/${member.profile}"
						onclick="document.getElementById('profile').click();">				
					<br>
					<input type='file' id="profile" name="uploadfile" value="${member.profile}" onchange="readyImg(this)">  
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>${member.email}</td>
			</tr>
			<tr>
				<td>이름(닉네임)</td>
				<td><input type="text" name="name" size="15" maxlength="5" value="${member.name}" autocomplete="off"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" size="15" maxlength="12"></td>
			</tr>			
			<tr>
				<td>자기소개</td>
				<td><textarea name="selfIntroduction" rows="13" cols="40" style="resize: none;">${member.selfIntroduction}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="confirm" value="수정">
					<input type="reset" name="reset" value="취소" onclick="javascript:window.location='mypage?memNum=${member.memNum}'">
				</td>
			</tr>
		</table>
	</form>
	
</body>

</html>