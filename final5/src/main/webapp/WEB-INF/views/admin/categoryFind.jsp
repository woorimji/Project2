<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title style="text-align: center; font-weight: bold;">Category List</title>
    <br>
    <style>
        table {
            margin: 0 auto; /* 가로 중앙 정렬 */
            border-collapse: collapse; /* 테이블 셀 경계 병합 */
            width: 38%; /* 테이블 폭 지정 */
        }

        th, td {
            padding: 10px; /* 셀 내부 여백 설정 */
            text-align: center; /* 셀 텍스트 가운데 정렬 */
            border: 1px solid black; /* 셀 경계선 스타일 지정 */
        }

        th {
            background-color: #f2f2f2; /* 헤더 배경색 설정 */
        }

        td {
            color: blue; /* 카테고리 이름 파란색 설정 */
            cursor: pointer; /* 포인터 커서로 변경하여 클릭 가능하도록 설정 */
        }

        h1 {
            font-size: 40px; /* 폰트 크기 32px로 변경 */
            text-align: center; /* 헤딩 가운데 정렬 */
            font-weight: bold; /* 폰트 굵기 설정 */
        }
    </style>
</head>
<body>
    <h1>카테고리 목록</h1>
    <br>
    <table>
        <thead>
            <tr>
                <th>카테고리 코드</th>
                <th>카테고리 이름</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="imsi" items="${alist}">
                <tr>
                    <td>${imsi.category_code}</td>
                    <!-- 클래스 "category" 추가 -->
                    <td class="category">${imsi.category_name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
<script>
    // 카테고리 이름 클릭 시 부모 창의 자동 입력 함수를 호출합니다.
    $(document).ready(function() {
        $("td.category").click(function() {
            var categoryName = $(this).text().trim();
            // 부모 창의 autoFillCategory 함수 호출
            window.opener.autoFillCategory(categoryName);
            window.close(); // 카테고리 선택이 끝났으므로 창을 닫습니다.
        });
    });
</script>
</html>

<%@ include file="/WEB-INF/views/bottom.jsp"%>



