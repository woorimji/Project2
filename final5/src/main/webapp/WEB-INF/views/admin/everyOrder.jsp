<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전체 주문 목록</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 0px; 
        }
        h1 {
            font-weight: bold;
            margin-bottom: 20px; 
        }
        table {
            border-collapse: collapse;
            width: 80%; 
            margin: 0 auto; 
        }
        th, td {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: center;
            font-size: 14px; 
        }
        th {
            background-color: #f2f2f2;
        }
        select {
            width: 100px;
        }
        button {
            margin-top: 5px;
            width: 60px;
            height: 25px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        #title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
    </style>
    <script>
        function confirmOrderChange(form) {
            // Display a confirmation dialog
            var confirmMessage = "정말로 수정하시겠습니까?";
            if (confirm(confirmMessage)) {
                // If the user clicks "OK" in the confirmation dialog, submit the form
                form.submit();
                alert("수정되었습니다");
            } else {
                // If the user clicks "Cancel" in the confirmation dialog, do nothing
                alert("취소되었습니다");
                return false;
            }
        }
    </script>
</head>
<body>

    <h2 style="text-align: center;" id="title">전체 배송 조회</h2>
    <table>
        <thead>
            <tr>
                <th>주문 번호</th>
                <th>멤버 번호</th>
                <th>택배</th>
                <th>금액</th>
                <th>주문 내용</th>
                <th>주문 포인트</th>
                <th>배송 현황</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="imsi" items="${olist}">
                <tr>
                    <td>${imsi.order_number}</td>
                    <td>${imsi.member_num}</td>
                    <td>${imsi.order_info}</td>
                    <td>${imsi.order_price}</td>
                    <td>${imsi.order_content}</td>
                    <td>${imsi.order_point}</td>
                    <td>
                        <form method="post" action="orderChange.do" onsubmit="return confirmOrderChange(this);">
                            <input type="hidden" name="order_number" value="${imsi.order_number}" />
                            <select name="order_type">
                                <option value="배송전" ${imsi.order_type == '배송전' ? 'selected' : ''}>배송전</option>
                                <option value="배송중" ${imsi.order_type == '배송중' ? 'selected' : ''}>배송중</option>
                                <option value="배송완료" ${imsi.order_type == '배송완료' ? 'selected' : ''}>배송완료</option>
                            </select>
                            <button type="submit">수정</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

<%@ include file="/WEB-INF/views/bottom.jsp"%>
