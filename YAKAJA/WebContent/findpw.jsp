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
		<label for="MEM_ID">���̵�</label>
		<input type="text" id="MEM_ID" name="MEM_ID"><br>
		<label for="MEM_NAME">�̸�</label>
		<input type="text" id="MEM_NAME" name="MEM_NAME"><br><br>
					
		
		<button type="submit" id="btnLogin">��й�ȣã��</button>
		<button type="reset" id="btnCancel">���</button>
	</form>
	
<script>
	
window.onload = function() {
	
}
</body>
</html>
</script>