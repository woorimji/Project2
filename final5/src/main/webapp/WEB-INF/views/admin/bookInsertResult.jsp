<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<body>
    <h3>도서등록 결과</h3>
    <hr>
    <%-- 결과 메시지를 JavaScript 함수로 전달 --%>
    <script>
        function showMessage(result) {
            if (result === "Success") {
                alert("성공했습니다!");
                window.location.href = "/libook/index.do"; 
            } else if (result === "Failed") {
                alert("실패했습니다!");
                window.location.href = "/addBook.do";
            }
        }
    </script>
    
    <script>
    function showMessage(result) {
        if (result === "Success") {
            // 등록 성공 시 알림창 띄우기
            alert("성공했습니다!");
            window.location.href = "/libook/index.do";
        } else if (result === "Failed") {
            // 등록 실패 시 알림창 띄우기
            alert("실패했습니다!");
            window.location.href = "/addCategory.do";
        }
    }
</script>
    <%-- 결과 메시지 출력 --%>
    <script>showMessage("${result}");</script>
</body>
<%@ include file="/WEB-INF/views/bottom.jsp"%>
