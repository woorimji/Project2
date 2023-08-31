<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���� ����</title>
</head>
<body>
    <h1>���� ���� ����</h1>
    <c:if test="${empty sessionScope.YakajaVO}">
        <p>�α��� �Ǿ� ���� �ʽ��ϴ�.</p>
    </c:if>
    <c:if test="${not empty sessionScope.YakajaVO}">
        <p>ȯ���մϴ�, ${sessionScope.YakajaVO.mem_id}!</p>
        <p>������ �����ϼ���:</p>
        <form action="update.do" method="post">
            <input type="hidden" name="MEM_ID" value="${YakajaVO.mem_id}" />
            <input type="hidden" name="MEM_ADMIN" value="${YakajaVO.memAdmin}" />
            <label for="MEM_PW">��й�ȣ:</label>
            <input type="password" name="MEM_PW" value="${YakajaVO.memPw}" required /><br>
            <label for="MEM_EMAIL">�̸���:</label>
            <input type="email" name="MEM_EMAIL" value="${YakajaVO.memEmail}" required /><br>
            <label for="MEM_NAME">�̸�:</label>
            <input type="text" name="MEM_NAME" value="${YakajaVO.memName}" required /><br>
            <label for="MEM_TEL">��ȭ��ȣ:</label>
            <input type="tel" name="MEM_TEL" value="${YakajaVO.memTel}" required /><br>
            <input type="submit" value="������Ʈ�ϱ�" />
        </form>
    </c:if>
</body>
</html>