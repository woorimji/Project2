<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 정보</title>
</head>
<body>
    <h1>나의 정보</h1>
    <c:if test="${empty sessionScope.YakajaVO}">
        <p>로그인이 되어 있지 않습니다.</p>
    </c:if>
<c:if test="${empty sessionScope.YakajaVO}">
    <p>로그인이 되어 있지 않습니다.</p>
</c:if>
<c:if test="${not empty sessionScope.YakajaVO}">
    <p>환영합니다!, ${sessionScope.id}!</p>
    <p>내정보:</p>
    <table>
        <tr>
            <td>ID:</td>
            <td>${sessionScope.YakajaVO.mem_id}</td>
        </tr>
        <tr>
            <td>이메일:</td>
            <td>${sessionScope.YakajaVO.memEmail}</td>
        </tr>
        <tr>
            <td>이름:</td>
            <td>${sessionScope.YakajaVO.memName}</td>
        </tr>
        <tr>
            <td>전화번호:</td>
            <td>${sessionScope.YakajaVO.memTel}</td>
        </tr>
    </table>
			<form action="myupdate.jsp">
            <input type="submit" value="내정보수정">
        </form>
        
            <form action="deleteForm.do" method="post">
            <input type="hidden" name="MEM_ID" value="${sessionScope.YakajaVO.mem_id}">
            <input type="submit" value="회원 삭제">
        </form>
    </c:if>
</body>
</html>