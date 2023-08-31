<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;}
</style>
</head>
<body>
<div align="center">
<h2 id="title">비밀번호 찾기</h2>
<form action="sendPwEmail.do" method="post">
<table>
	<tr><td>아이디</td><td><input type="text" name="member_id" class="form-control"></td><td rowspan="2"></td></tr>
	<tr><td>이메일</td><td><input type="email" name="member_email" class="form-control"></td></tr>
	<tr>
		<td colspan=2><input type="submit" value="이메일로 보내기" class="btn btn-primary form-control"></td>
	</tr>
	<tr>
	<td colspan=2><a href="javascript:history.back();" class="btn btn-primary form-control">뒤로가기</a></td></tr>
</table>
</form>
</div>
<BR><BR><BR><BR><BR><BR>
</body>
</html>
<%@ include file="/WEB-INF/views/bottom.jsp"%>