<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버리스트</title>
    <style>
        /* 스타일은 여기에 작성합니다. */
        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
        }

        th, td {
            padding: 20px;
            text-align: center;
            border: 1px solid black;
        }

        th {
            background-color: #f2f2f2;
        }

        td {
            color: black;
            cursor: pointer;
        }

        h1 {
            font-size: 40px;
            text-align: center;
            font-weight: bold;
        }

        /* 삭제 버튼 스타일 */
        .deleteBtn {
            background-color: #ff4444;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
        }
        #title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
    </style>
</head>
<body>
    <h2 style="text-align: center;" id="title">회원 강제 탈퇴</h2>
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
                <th>삭제 버튼</th>
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
            <td>
                <!-- 삭제 버튼 추가 및 클릭 이벤트 부여 -->
                <button class="deleteBtn" data-member-num="${imsi.member_num}">삭제</button>
            </td>
        </tr>
    </c:forEach>
</tbody>
    </table>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
    // 삭제 버튼 클릭 이벤트 처리
    $(document).on("click", ".deleteBtn", function() {
        const member_num = $(this).data("member-num");
        
        console.log(member_num);
        
        deleteMember({ member_num: member_num });
    });

    // 회원 삭제 함수 (AJAX를 사용하여 서버로 데이터 전송)
    function deleteMember(data) {
    	console.log(data);
        if (confirm("해당 회원을 삭제하시겠습니까?")) {
            $.ajax({
                type: "POST",
                url: "deleteMember.do",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function(response) {
                    alert("회원이 삭제되었습니다.");
                    window.location.reload();
                },
                error: function(xhr, status, error) {
                    alert("회원 삭제에 실패하였습니다.");
                    console.error(error);
                }
            });
        }
    }
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
