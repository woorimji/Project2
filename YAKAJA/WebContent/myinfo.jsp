<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
    <h1>���� ����</h1>
    <c:if test="${empty sessionScope.YakajaVO}">
        <p>�α����� �Ǿ� ���� �ʽ��ϴ�.</p>
    </c:if>
<c:if test="${empty sessionScope.YakajaVO}">
    <p>�α����� �Ǿ� ���� �ʽ��ϴ�.</p>
</c:if>
<c:if test="${not empty sessionScope.YakajaVO}">
    <p>ȯ���մϴ�!, ${sessionScope.id}!</p>
    <p>������:</p>
    <table>
        <tr>
            <td>ID:</td>
            <td>${sessionScope.YakajaVO.mem_id}</td>
        </tr>
        <tr>
            <td>�̸���:</td>
            <td>${sessionScope.YakajaVO.memEmail}</td>
        </tr>
        <tr>
            <td>�̸�:</td>
            <td>${sessionScope.YakajaVO.memName}</td>
        </tr>
        <tr>
            <td>��ȭ��ȣ:</td>
            <td>${sessionScope.YakajaVO.memTel}</td>
        </tr>
    </table>
			<form action="myupdate.jsp">
            <input type="submit" value="����������">
        </form>
        
            <form action="deleteForm.do" method="post">
            <input type="hidden" name="MEM_ID" value="${sessionScope.YakajaVO.mem_id}">
            <input type="submit" value="ȸ�� ����">
        </form>
    </c:if>
</body>
</html>