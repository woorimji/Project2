<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="login_ok.jsp" method="post">
<!-- 		���̵�:<input type="text" name="id"><br/>
		��й�ȣ:<input type="password" name="pw"><br/> -->
		<input type="submit" value="�α����Ϸ�����"><br/>
		
			
		<button type="button" id="btnJoin">ȸ������</button>
		<script type="text/javascript">
  		document.getElementById('btnJoin').onclick = function() {
    	window.location.href = "join.jsp";
    	}
	</script>
	<br>
	<br>
	
	<tr>
      <td colspan="2">
        <a href="findid.jsp">���̵�ã��</a>  /  <a href="findpw.jsp">��й�ȣã��</a>
      </td>
    </tr>
	
	
	</form>

</body>
</html>