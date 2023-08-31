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
<!-- 		아이디:<input type="text" name="id"><br/>
		비밀번호:<input type="password" name="pw"><br/> -->
		<input type="submit" value="로그인하러가기"><br/>
		
			
		<button type="button" id="btnJoin">회원가입</button>
		<script type="text/javascript">
  		document.getElementById('btnJoin').onclick = function() {
    	window.location.href = "join.jsp";
    	}
	</script>
	<br>
	<br>
	
	<tr>
      <td colspan="2">
        <a href="findid.jsp">아이디찾기</a>  /  <a href="findpw.jsp">비밀번호찾기</a>
      </td>
    </tr>
	
	
	</form>

</body>
</html>