<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<form action="findpw.do" method="post" id="form">
		<label for="MEM_ID">아이디</label>
		<input type="text" id="MEM_ID" name="MEM_ID"><br>
		<label for="MEM_NAME">이름</label>
		<input type="text" id="MEM_NAME" name="MEM_NAME"><br><br>
					
		
		<button type="submit" id="btnLogin">비밀번호찾기</button>
		<button type="reset" id="btnCancel">취소</button>
	</form>
	
<script>
	
window.onload = function() {
	
}
</body>
</html>
</script>