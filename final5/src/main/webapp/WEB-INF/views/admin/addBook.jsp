<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
 table {
	
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table th {
	
}
.index{
	text-align:center;
	border-right:1px solid #ccc;
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
	width:25%;
	padding: 10px;
	border-bottom: 1px solid #ccc;
}
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 

.isbnChk {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 3px;
	margin-right: 0px;
}
.btn1 {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 3px;
	margin-right: 0px;
}
</style>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    
<script>
    var isIsbnValid = false;

    function fn_isbnChk() {
        var isbn = $("#BOOK_ISBN").val();
		console.log(isbn);
        // ISBN은 반드시 13자리여야 합니다.
        if (isbn.length !== 13) {
            $("#isbnResult").html('ISBN은 반드시 13자리여야 합니다.');
            $("#isbnResult").css('color', 'red');
            isIsbnValid = false;
            return;
        }

        // Ajax 요청 수행 및 중복 여부 확인
        $.ajax({
            url: "isbnChk.do",
            type: "POST",
            data: { book_isbn: isbn },
           
            success: function (result) {
            	console.log(result);
                if (result === "fail") { // 사용불가능, 중복
                    $("#isbnResult").html('사용 불가능 합니다');
                    $("#isbnResult").css('color', 'red');
                    isIsbnValid = false;
                } else { // 사용가능
                    $("#isbnResult").html('사용 가능 합니다');
                    $("#isbnResult").css('color', 'green');
                    isIsbnValid = true;
                }
            }
        });
    }


    function checkIsbn() {
        var isbn = $("#BOOK_ISBN").val();
        var bookName = $("#BOOK_NAME").val();
        var bookWriter = $("#BOOK_WRITER").val();
        var bookPrice = $("#BOOK_PRICE").val();
        var bookPub = $("#BOOK_PUB").val();
        var bookSub = $("#BOOK_SUB").val().trim(); // trim() 함수를 사용하여 앞뒤 공백을 제거합니다.
        var bookCategory = $("#BOOK_CATEGORY").val();
        var bookQry = $("#BOOK_QRY").val();
        var bookPoint = $("#BOOK_POINT").val();

        if (isbn.length !== 13 || !isIsbnValid) {
            alert("ISBN 번호를 입력하고 중복 검사를 완료해주세요. ISBN은 13자리여야 하고, 사용 가능한 번호여야 합니다.");
            return false; // Prevent form submission
        }
        
        // 모든 필드를 입력해야만 submit이 가능합니다.
        if (bookName === '' || bookWriter === '' || bookPrice === '' || bookPub === '' ||
            bookSub === '' || bookCategory === '' || bookQry === '' || bookPoint === '') {
            alert("이미지 파일을 제외한 모든 값을 입력해주세요.");
            return false; // Prevent form submission+
        }
        return true; // Allow form submission
    }
</script>

<script>
    function openCategoryFind() {
        // 새 창으로 categoryFind.do를 엽니다.
        
   
        window.open("/libook/categoryFind.do", "_blank");
    }

    // categoryFind.do에서 선택한 카테고리를 자동으로 입력하는 함수
    function autoFillCategory(category) {
    	
    	
        $("#BOOK_CATEGORY").val(category);
        
        


    }
</script>

<body>
	<div align=center>
    	<h2 style="text-align: center;" id="title">신간 등록</h2>
    	<hr>
  
    	<form action="join.do" method="post" id="form" enctype="multipart/form-data" onsubmit="return checkIsbn();">
	    	<table>
	    		<tr>
	    			<th class=index></th>
	    			<th></th>
	    			<th class=btnCell></th>
	    		</tr>
	    		<tr>
	    			<td rowspan=2 class=index>
	    				ISBN
	    			</td>
	    			<td>
	    				<input type="text" id="BOOK_ISBN" name="book_isbn" />
	    			</td>
	    			<td class=btnCell>
	    				<button class="isbnChk" type="button" id="isbnChk" onclick="fn_isbnChk()" value="N">중복확인</button>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan=2 class=ajaxCell>	
	    			<div id="isbnResult"></div>
	    			</td>
	    		<tr>
	    			<td class=index>
	    				도서명
	    			</td>
	    			<td colspan=2>
	    				<input type="text" id="BOOK_NAME" name="book_name" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				저자
	    			</td>
	    			<td colspan=2>
	    				<input type="text" id="BOOK_WRITER" name="book_writer"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				가격
	    			</td>
	    			<td colspan=3>
	    				<input type="number" id="BOOK_PRICE" name="book_price" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				출판사
	    			</td>
	    			<td colspan=2>
	    				<input type="text" id="BOOK_PUB" name="book_pub" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				책 소개
	    			</td>
	    			<td colspan=2>
	    				 <input type="text" id="BOOK_SUB" name="book_sub" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				카테고리
	    			</td>
	    			<td>
	    				<input type="text" id="BOOK_CATEGORY" name="book_category" />
	    			</td>
	    			<td>
	        			<button type="button" onclick="openCategoryFind()" class="btn1">카테고리 목록</button>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				이미지
	    			</td>
	    			<td colspan=2>
	    				<input type="file" id="BOOK_IMAGE" name="img_file" /> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				입고 수량
	    			</td>
	    			<td colspan=2>
	    				<input type="number" id="BOOK_QRY" name="book_qry" />
	    			</td>
	    		</tr>
	    		<tr>
	    			<td class=index>
	    				증정 포인트
	    			</td>
	    			<td colspan=2>
	    				<input type="number" id="BOOK_POINT" name="book_point" /> 
	    			</td>
	    		</tr>
	    		<tr>
	    			<td colspan=3 class=index style="border-right:none;">
	    			  	 <input type="submit" id="btnJoin" value="책 등록" class="btn btn-primary form-control">
	       				 <input type="reset" id="btnCancel" value="취소" class="btn btn-primary form-control">
	    			</td>
	    		</tr>
	    	</table>
   		</form>
    </div>
</body>

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
<%-- 결과 메시지 출력 --%>
<script>showMessage("${result}");</script>

<%@ include file="/WEB-INF/views/bottom.jsp"%>
