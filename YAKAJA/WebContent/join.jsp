<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<!-- <script type="text/javascript">
window.onload = function() {
	//로그인 버튼 클릭 시 form submit
	document.getElementById('btnJoin').onclick = function() {
		document.getElementById('form').submit();
	}
	
	//취소 버튼 누르면 뒤로가기
	document.getElementById('btnCancel').onclick = function() {
		history.go(-1);
	}
}
</script> -->
 
</head>
<body>
 
<h3>회원가입</h3>
<hr>
<form action="join.do" method="post" id="form">
	<label for="MEM_ID">아이디</label>
	<input type="text" id="MEM_ID" name="MEM_ID" /> <br>
	<label for="MEM_PW">패스워드</label>
	<input type="text" id="MEM_PW" name="MEM_PW" /> <br>
	<label for="MEM_EMAIL">이메일</label>
	<input type="text" id="MEM_EMAIL" name="MEM_EMAIL" /> <br>
	<label for="MEM_NAME">이름</label>
	<input type="text" id="MEM_NAME" name="MEM_NAME" /> <br>
	<label for="MEM_TEL">전화번호</label>
	<input type="text" id="MEM_TEL" name="MEM_TEL" /> <br>
	<label for="MEM_ADMIN">관리자 가입입니까?</label>
	<input type="radio" id="MEM_ADMIN" name="MEM_ADMIN" value="1" /> 
	<label for="MEM_ADMIN">예</label>
	<input type="radio" id="MEM_ADMIN" name="MEM_ADMIN" value="0" /> 
	<label for="MEM_ADMIN">아니오</label>
	<br>
	
	<input type="submit" id="btnJoin" value = "가입">
	<input type="reset" id="btnCancel" value = "취소"	>
</form>
 
</body>
</html>