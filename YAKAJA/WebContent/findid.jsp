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
		<label for="MEM_NAME">�̸�</label>
		<input type="text" id="MEM_NAME" name="MEM_NAME"><br>
		<label for="MEM_EMAIL">�̸���</label>
		<input type="text" id="MEM_EMAIL" name="MEM_EMAIL"><br><br>
					
		
		<button type="submit" id="btnLogin">���̵�ã��</button>
		<button type="reset" id="btnCancel">���</button>
	</form>
	
		<script>
	
window.onload = function() {
	

	
	//��� ��ư ������ �ڷΰ���
	document.getElementById('btnCancel').onclick = function() {
		history.go(-1);
	}
	
/* 	var msg="${msg}";
	var memName = "${requestScope.mv.memName}"; // mv���� memName ��������
	var memId = "${requestScope.mv.memId}"; // mv���� memId ��������
	
		
	if (msg === "findid-success") {
		alert(memName + "���� ���̵�� " + memId + "�Դϴ�.");
	}			
		
		if (msg==="findid-fail"){
			
			alert("���̵� ã�� ����");
			
			
		} */
	 
	
	
}
	
</script>


</body>
</html>