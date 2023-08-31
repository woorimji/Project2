<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
  
 
</head>
<body>
	<h3>로그인</h3>
	<hr>	
	
	<form action="login_ok.do" method="post" id="form">
		<label for="MEM_ID">아이디</label>
		<input type="text" id="MEM_ID" name="MEM_ID"><br>
		<label for="MEM_PW">비밀번호</label>
		<input type="text" id="MEM_PW" name="MEM_PW"><br><br>
					
		
		<button type="submit" id="btnLogin">로그인</button>
		<button type="reset" id="btnCancel">취소</button>
	</form>
	
	<script>
	
window.onload = function() {
	

	
	//취소 버튼 누르면 뒤로가기
	document.getElementById('btnCancel').onclick = function() {
		history.go(-1);
	}
	
/* 	var msg="${msg}";

	
	if(msg){
		
		if(msg=="login-success"){
			
			alert("로그인 성공");
			location.href="index.jsp";	
		}else if(msg=="login-fail"){
			
			alert("로그인 실패");
			
			
		}
		
	} */
	
}
	</script>
	
</body>
</html>