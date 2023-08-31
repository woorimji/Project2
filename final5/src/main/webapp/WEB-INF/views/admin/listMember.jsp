<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title style="text-align: center; font-weight: bold;">멤버리스트</title>
   
    <style>
        table {
            margin: 0 auto; /* 가로 중앙 정렬 */
            border-collapse: collapse; /* 테이블 셀 경계 병합 */
            width: 80%; /* 테이블 폭 지정 */
        }

        th, td {
            padding: 20px; /* 셀 내부 여백 설정 */
            text-align: center; /* 셀 텍스트 가운데 정렬 */
            border: 1px solid black; /* 셀 경계선 스타일 지정 */
        }

        th {
            background-color: #f2f2f2; /* 헤더 배경색 설정 */
        }

        td {
            color: black; /* 카테고리 이름 파란색 설정 */
            cursor: pointer; /* 포인터 커서로 변경하여 클릭 가능하도록 설정 */
        }

        h1 {
            font-size: 40px; /* 폰트 크기 32px로 변경 */
            text-align: center; /* 헤딩 가운데 정렬 */
            font-weight: bold; /* 폰트 굵기 설정 */
        }
        #title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
    </style>
</head>
<body>
    <h2 style="text-align: center;" id="title">전체 회원 조회</h2>
    <br>
    <table>
        <thead>
            <tr>
                <th>멤버 번호</th>
                <th>멤버 아이디</th>
                <th>멤버 비밀번호</th>
                <th>멤버 이름</th>
                <th>멤버 이메일</th>
                <th>멤버 전화번호</th>
                <th>멤버 주소</th>
                <th>멤버 포인트</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="imsi" items="${alist}">
                <tr>
                    <td>${imsi.member_num}</td>
                    <td>${imsi.member_id}</td>
                    <td>${imsi.member_pw}</td>
                    <td>${imsi.member_name}</td>
                    <td>${imsi.member_email}</td>
                    <td>${imsi.member_tel}</td>
                    <td>${imsi.member_address}</td>
                    <td>${imsi.member_point}</td>
<%--                     <!-- 클래스 "category" 추가 -->
                    <td class="category">${imsi.category_name}</td> --%>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>

</html>

<%@ include file="/WEB-INF/views/bottom.jsp"%>



