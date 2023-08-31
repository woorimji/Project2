<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 정보 수정</title>
</head>
<body>
    <h1>나의 정보 수정</h1>
    <c:if test="${empty sessionScope.YakajaVO}">
        <p>로그인 되어 있지 않습니다.</p>
    </c:if>
    <c:if test="${not empty sessionScope.YakajaVO}">
        <p>환영합니다, ${sessionScope.YakajaVO.mem_id}!</p>
        <p>정보를 수정하세요:</p>
        <form action="update.do" method="post">
            <input type="hidden" name="MEM_ID" value="${YakajaVO.mem_id}" />
            <input type="hidden" name="MEM_ADMIN" value="${YakajaVO.memAdmin}" />
            <label for="MEM_PW">비밀번호:</label>
            <input type="password" name="MEM_PW" value="${YakajaVO.memPw}" required /><br>
            <label for="MEM_EMAIL">이메일:</label>
            <input type="email" name="MEM_EMAIL" value="${YakajaVO.memEmail}" required /><br>
            <label for="MEM_NAME">이름:</label>
            <input type="text" name="MEM_NAME" value="${YakajaVO.memName}" required /><br>
            <label for="MEM_TEL">전화번호:</label>
            <input type="tel" name="MEM_TEL" value="${YakajaVO.memTel}" required /><br>
            <input type="submit" value="업데이트하기" />
        </form>
    </c:if>
</body>
</html>