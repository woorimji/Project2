<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title style="text-align: center; font-weight: bold;">전체 주문 목록</title>
    <br>
    <style>
        /* 스타일 설정 생략 */
    </style>
</head>
<body>
    <h1>전체 주문 목록</h1>
    <br>
    <table>
        <thead>
            <tr>
                <th>주문 번호</th>
                <th>멤버 번호</th>
                <th>배송 방법</th>
                <th>가격</th>
                <th>배송 상태</th>
                <th>주문 포인트</th>
                <th>주문 정보</th>
            </tr>
        </thead>
        <tbody>
            <!-- forEach 태그를 이용하여 주문 목록을 반복하면서 행을 생성합니다. -->
            <c:forEach var="imsi" items="${olist}">
                <tr>
                    <td>${imsi.order_number}</td>
                    <td>${imsi.member_num}</td>
                    <td>${imsi.order_info}</td>
                    <td>${imsi.order_price}</td>
                    <td>${imsi.order_type}</td>
                    <td>${imsi.order_point}</td>
                    <td>${imsi.order_content}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

<%@ include file="/WEB-INF/views/bottom.jsp"%>
