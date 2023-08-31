<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
 table {
	width:500px;
	border-collapse: separate;
	border-spacing: 1px;
	text-align: center;
	line-height: 1.5;
	
	margin: 20px 10px;
}

table th {
	
}
.index{
	text-align:center;
	
	vertical-align:center;
}
.btnCell{
	text-align:left;
	width:10%;
}
.ajaxCell{
	height:45px;
}
table td {
	
	padding: 10px;
	
}
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;}
</style>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>
    var isCategoryValid = false;

    function fn_categoryChk() {
        var categoryName = $("#CATEGORY_NAME").val();

        // 카테고리 이름은 반드시 입력되어야 합니다.
        if (categoryName === '') {
            $("#categoryResult").html('카테고리 이름을 입력해주세요.');
            $("#categoryResult").css('color', 'red');
            isCategoryValid = false;
            return;
        }

        // Ajax 요청 수행 및 중복 여부 확인
        $.ajax({
            url: "categoryChk.do",
            type: "POST",
            data: { category_name: categoryName },
            success: function (result) {
                if (result === "fail") { // 사용불가능, 중복
                    $("#categoryResult").html('사용 불가능 합니다');
                    $("#categoryResult").css('color', 'red');
                    isCategoryValid = false;
                } else { // 사용가능
                    $("#categoryResult").html('사용 가능 합니다');
                    $("#categoryResult").css('color', 'green');
                    isCategoryValid = true;
                }
            }
        });
    }

    function checkCategory() {
        if (!isCategoryValid) {
            alert("카테고리 이름을 입력하고 중복 검사를 완료해주세요.");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }

    // 페이지 로드 시 실행되는 함수
    $(document).ready(function() {
        // result 변수에 서버에서 받아온 등록 성공 여부 값이 들어있다고 가정합니다.
        var result = "${result}";

        // result 변수에 값이 있을 경우 등록 결과에 따라 알림창을 띄웁니다.
        if (result === "success") {
            alert("성공했습니다!");
            window.location.href = "/libook/index.do";
        } else if (result === "fail") {
            alert("실패했습니다!");
            window.location.href = "/addCategory.do";
        }
    });
</script>

<body>
	<br><br><br>
	<div align=center>
	    <h2 style="text-align: center;" id="title">카테고리 추가</h2>
	    <hr>
	    <form action="addCategory.do" method="post" id="form" onsubmit="return checkCategory();">
	    	<table >
	    		<tr>
	    			<td>
	    				카테고리명
	    			</td>
	    			<td>
	    				<input type="text" id="CATEGORY_NAME" name="category_name" />
	    			</td>
	    			<td>
	    				<button class="categoryChk" type="button" id="categoryChk" onclick="fn_categoryChk()" value="N">중복확인</button>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan=3 class=ajaxCell>
	    				<div id="categoryResult"></div>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan=3>
	    				<input type="submit" id="btnJoin" value="카테고리 등록" class="btn btn-primary form-control">
	        			<input type="reset" id="btnCancel" value="취소" class="btn btn-primary form-control">
	        		</td>
	    		</tr>
	        </table>
	    </form>
	</div>
</body>

<%@ include file="/WEB-INF/views/bottom.jsp"%>
