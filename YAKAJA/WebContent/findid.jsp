<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<form action="findid.do" method="post" id="form">
		<label for="MEM_NAME">이름</label>
		<input type="text" id="MEM_NAME" name="MEM_NAME"><br>
		<label for="MEM_EMAIL">이메일</label>
		<input type="text" id="MEM_EMAIL" name="MEM_EMAIL"><br><br>
					
		
		<button type="submit" id="btnLogin">아이디찾기</button>
		<button type="reset" id="btnCancel">취소</button>
	</form>
	
		<script>
	
window.onload = function() {
	

	
	//취소 버튼 누르면 뒤로가기
	document.getElementById('btnCancel').onclick = function() {
		history.go(-1);
	}
	
/* 	var msg="${msg}";
	var memName = "${requestScope.mv.memName}"; // mv에서 memName 가져오기
	var memId = "${requestScope.mv.memId}"; // mv에서 memId 가져오기
	
		
	if (msg === "findid-success") {
		alert(memName + "님의 아이디는 " + memId + "입니다.");
	}			
		
		if (msg==="findid-fail"){
			
			alert("아이디 찾기 실패");
			
			
		} */
	 
	
	
}
	
</script>


</body>
</html>