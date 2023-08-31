<%-- 






<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- payment.jsp -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
table {
	border-collapse: collapse;
}

td, th {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}

#toc-content {
	display: none;
}
</style>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		console.log("Function executed on page load!");

		var table = document.getElementById("order_table");
		var total_price = 0;
		var total_point = 0;
		var h4 = document.getElementById("total");

		if (table) {
			for (var i = 1; i < table.rows.length; i++) {
				var price = parseInt(table.rows[i].cells[1].textContent);
				var point = parseInt(table.rows[i].cells[2].textContent);
				var inputElement = table.rows[i].cells[3]
						.querySelector("input[name='number']");
				var qty = parseInt(inputElement.value);

				total_price += price * qty;
				total_point += point * qty;
			}
		}

		h4.innerText = total_price + "원(" + total_point + " 적립예정)";
	});

	// 수량 변경 시 호출되는 함수
	function changeTotal(param) {

		console.log("param의 값");
		console.log(param);

		var table = document.getElementById("order_table");
		var h4 = document.getElementById("total");
		var usePoint = document.getElementById("usePoint").value;
		var member_point = parseInt(document.getElementById("member_point").value);

		if (usePoint === "") {
			usePoint = 0; // 기본값을 0으로 설정
		} else {
			usePoint = parseInt(usePoint);
			if (usePoint > member_point) {
				alert("보유하고 있는 포인트보다 값이 큽니다");
				usePoint = 0;
				document.getElementById("usePoint").value = usePoint;
			} else if (usePoint < 0) {
				alert("0보다 적은 포인트를 입력할 수 없습니다");
				usePoint = 0;
				document.getElementById("usePoint").value = usePoint;
			}
		}

		console.log("수량 변경 함수 실행");

		var total_price = 0;
		var total_point = 0;
		var isbn = "";
		var max_qty = 0;
		var target_qty = 0;

		for (var i = 1; i < table.rows.length; i++) {
			var price = parseInt(table.rows[i].cells[1].textContent);
			var point = parseInt(table.rows[i].cells[2].textContent);
			var inputElement = table.rows[i].cells[3]
					.querySelector("input[name='number']");
			var qty = parseInt(inputElement.value);

			if (isNaN(qty) || qty === 0) {
				alert("최소 1권의 수량을 입력하셔야 합니다");
				inputElement.value = '1'; // 입력값을 1로 변경
				qty = 1;
			}

			if (inputElement.id === param) {
				isbn = table.rows[i].cells[4].textContent;
				target_qty = qty;
			}

			total_price += price * qty;
			total_point += point * qty;
		}

		$.ajax({
			url : "qry_check.do",
			method : "POST",
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				book_isbn : isbn
			})
		}).done(function(rp) {
			console.log(rp);
			max_qty = rp.max_qty;
			if (target_qty > max_qty) {
				alert("재고가 부족합니다! (최대 구매 가능 수량 : " + max_qty + ")");
				var max = document.getElementById(param);
				max.value = max_qty;
				changeTotal(param);
			}
		}); // <-- 중괄호 추가

		total_price -= usePoint;
		h4.innerText = total_price + "원(" + total_point + " 적립예정)";
	}
</script>

<script>
	var IMP = window.IMP;
	IMP.init("imp73121012");

	function requestPay() {
		// IMP.request_pay(param, callback) 결제창 호출

		var table = document.getElementById("order_table");
		var total_price = 0;
		var total_point = 0;
		var jsonData = {};
		var jsonData2 = {};

		for (var i = 1; i < table.rows.length; i++) {

			var bookName = table.rows[i].cells[0].textContent;
			var price = parseInt(table.rows[i].cells[1].textContent);
			var point = parseInt(table.rows[i].cells[2].textContent);
			var inputElement = table.rows[i].cells[3]
					.querySelector("input[name='number']");
			var qty = parseInt(inputElement.value);
			var book_isbn_list = table.rows[i].cells[4].textContent;
			console.log(qty);

			total_price += price * qty;
			total_point += point * qty;

			jsonData[bookName] = qty;
			jsonData2[book_isbn_list] = qty;

		}

		console.log(jsonData);
		console.log(jsonData2);

		var usePoint = document.getElementById("usePoint").value;

		if (usePoint === "") {
			usePoint = 0; // 기본값을 0으로 설정
		} else {
			usePoint = parseInt(usePoint);
			total_price -= usePoint;
		}

		var saving_point = total_point - usePoint;

		var member_name = document.getElementById("member_name").value;
		var met = document.getElementById("met").value; // 결제수단
		var member_email = document.getElementById("member_email").value;
		var member_address = document.getElementById("member_address").value;
		var member_tel = document.getElementById("member_tel").value;
		var radioButtons = document.getElementsByName("order_info");
		var member_num = document.getElementById("member_num").value;

		var book_isbn = document.getElementById('book_isbn').value;
		var book_qry = parseInt(document.getElementById('book_qry').value);
		var order_info = null;

		for (var i = 0; i < radioButtons.length; i++) {
			if (radioButtons[i].checked) {
				order_info = radioButtons[i].value;
				console.log("선택된 값: " + order_info);
				break;
			}
		}

		if (order_info === null) {
			alert("배송을 선택해주세요");
			return;
		}

		// var order_info = selectedValue;

		IMP.request_pay({ // param
			pg : "INIpayTest",
			pay_method : met, // 결제방식
			merchant_uid : "KG" + new Date().getTime(), // 주문번호
			name : "Li-book-lary",
			amount : 100, // 결제금액 -- 100원으로 통일
			buyer_addr : member_address,
			buyer_email : member_email,
			buyer_name : member_name,
			buyer_tel : member_tel

		}, function(rsp) { // callback
			console.log("rsp : " + rsp);
			if (rsp.success) {
				// 결제 성공 시 : 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청
				// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				$.ajax({
					url : "payment_insert.do",
					method : "POST",
					headers : {
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						order_number : rsp.merchant_uid, // 주문번호
						member_num : member_num, // 회원번호
						order_info : order_info,// 배송방식
						order_price : total_price, // 총 금액
						order_point : total_point, // 총 누적포인트
						order_content : jsonData,
						listBasket : jsonData2,
						saving_point : saving_point
					// 적립포인트 - 사용포인트
					}),
					dataType : "json"
				}).done(function(data) {
					console.log(data);
					// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					// 가맹점 서버 결제 API 성공시 로직
					if (data.result === "success") {
						var msg = '결제가 완료되었습니다.';
						alert(msg);
						window.location = "index.do";
					} else { //
						var msg = '결제과정에서 문제가 발생했습니다.';
						alert(msg);
						window.location = "index.do";
					}
				})
			} else {
				// 결제 실패 시 로직
				alert("결제에 실패하였습니다." + "\n" + "에러내용 : " + rsp.error_msg);
			}
		});
	}
</script>

<br>
<br>
<div align="center">
	<h3 class="text-custom">주문 상품</h3>
</div>

<div align="center">

	<table id="order_table">
		<tr>
			<th>이름</th>
			<th>가격</th>
			<th>포인트</th>
			<th>수량</th>
			<th id="toc-content">isbn</th>
		</tr>
		<c:if test="${empty listBasket}">
			<tr>
				<td>${bookVO.book_name}</td>
				<td>${bookVO.book_price}</td>
				<td>${bookVO.book_point}</td>
				<td><input type="number" id="0" name="number" min="1" max="500"
					step="1" value="1" onchange="changeTotal('0')"></td>
				<td id="toc-content">${bookVO.book_isbn}</td>
			</tr>
		</c:if>
		<c:if test="${not empty listBasket}">
			<c:forEach var="imsi" items="${listBasket}" varStatus="status">
				<tr>
					<td>${imsi.book_name}</td>
					<td>${imsi.book_price}</td>
					<td>${imsi.book_point}</td>
					<td><input type="number" id="${status.index + 1}"
						name="number" min="1" max="500" step="1"
						value="${imsi.basket_qry}"
						onchange="changeTotal('${status.index + 1}')"></td>
					<td id="toc-content">${imsi.book_isbn}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<br>
	<hr>

	<div align="center">
		<h4 class="text-custom">배송선택</h4>
		<br> <input type="radio" name="order_info" value="일반택배">
		일반택배 <input type="radio" name="order_info" value="편의점택배">
		인터넷택배
	</div>

	<hr>
	<br>

	<div>
		사용 포인트 : <input type="text" name="usePoint" id="usePoint" size="25"
			placeholder="사용할 포인트를 입력하세요." value="0" onchange="changeTotal()">
	</div>
	<div>사용가능 포인트 : ${sessionScope.memberVO.member_point}</div>
</div>
<br>
<hr>

<div align="center">
	<h3 class="text-custom">총 계산금액</h3>
	<h4 id="total"></h4>
</div>
<br>
<div align="center">
	결제수단 : <select id="met" name="met">
		<option value="card">신용카드</option>
		<option value="trans">실시간계좌이체</option>
		<option value="vbank">가상계좌</option>
		<option value="phone">휴대폰소액결제</option>
	</select><br>
	<br> <input type="button" value="결제하기" onclick="requestPay()"
		class="btn btn-primary"> <input type="button" value="취소"
		onclick="history.back()" class="btn btn-primary">
</div>

<input type="hidden" name="member_point" id="member_point"
	value="${sessionScope.memberVO.member_point}">
<input type="hidden" name="member_name" id="member_name"
	value="${sessionScope.memberVO.member_name}">
<input type="hidden" name="member_email" id="member_email"
	value="${sessionScope.memberVO.member_email}">
<input type="hidden" name="member_address" id="member_address"
	value="${sessionScope.memberVO.member_address}">
<input type="hidden" name="member_num" id="member_num"
	value="${sessionScope.memberVO.member_num}">
<input type="hidden" name="member_tel" id="member_tel"
	value="${sessionScope.memberVO.member_tel}">
<input type="hidden" name="book_isbn" id="book_isbn"
	value="${bookVO.book_isbn}">
<input type="hidden" name="book_qry" id="book_qry"
	value="${bookVO.book_qry}">


<%@ include file="/WEB-INF/views/bottom.jsp"%> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- payment.jsp -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
table {
	border-collapse: collapse;
}

td, th {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}

#toc-content {
	display: none;
}
</style>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		console.log("Function executed on page load!");

		var table = document.getElementById("order_table");
		var total_price = 0;
		var saving_point = 0;
		var h4 = document.getElementById("total");

		if (table) {
			for (var i = 1; i < table.rows.length; i++) {
				var price = parseInt(table.rows[i].cells[1].textContent);
				var point = parseInt(table.rows[i].cells[2].textContent);
				var inputElement = table.rows[i].cells[3]
						.querySelector("input[name='number']");
				var qty = parseInt(inputElement.value);

				total_price += price * qty;
				saving_point += point * qty;
			}
		}

		h4.innerText = total_price + "원(" + saving_point + " 적립예정)";
	});

	// 수량 변경 시 호출되는 함수
	function changeTotal(param) {

		console.log("param의 값");
		console.log(param);

		var table = document.getElementById("order_table");
		var h4 = document.getElementById("total");
		var usePoint = document.getElementById("usePoint").value;
		var member_point = parseInt(document.getElementById("member_point").value);

		if (usePoint === "") {
			usePoint = 0; // 기본값을 0으로 설정
		} else {
			usePoint = parseInt(usePoint);
			if (usePoint > member_point) {
				alert("보유하고 있는 포인트보다 값이 큽니다");
				usePoint = 0;
				document.getElementById("usePoint").value = usePoint;
			} else if (usePoint < 0) {
				alert("0보다 적은 포인트를 입력할 수 없습니다");
				usePoint = 0;
				document.getElementById("usePoint").value = usePoint;
			}
		}

		console.log("수량 변경 함수 실행");

		var total_price = 0;
		var total_point = 0;
		var isbn = "";
		var max_qty = 0;
		var target_qty = 0;

		for (var i = 1; i < table.rows.length; i++) {
			var price = parseInt(table.rows[i].cells[1].textContent);
			var point = parseInt(table.rows[i].cells[2].textContent);
			var inputElement = table.rows[i].cells[3]
					.querySelector("input[name='number']");
			var qty = parseInt(inputElement.value);

			if (isNaN(qty) || qty === 0) {
				alert("최소 1권의 수량을 입력하셔야 합니다");
				inputElement.value = '1'; // 입력값을 1로 변경
				qty = 1;
			}

			if (inputElement.id === param) {
				isbn = table.rows[i].cells[4].textContent;
				target_qty = qty;
			}

			total_price += price * qty;
			total_point += point * qty;
		}

		$.ajax({
			url : "qry_check.do",
			method : "POST",
			headers : {
				"Content-Type" : "application/json"
			},
			data : JSON.stringify({
				book_isbn : isbn
			})
		}).done(function(rp) {
			console.log(rp);
			max_qty = rp.max_qty;
			if (target_qty > max_qty) {
				alert("재고가 부족합니다! (최대 구매 가능 수량 : " + max_qty + ")");
				var max = document.getElementById(param);
				max.value = max_qty;
				changeTotal(param);
			}
		}); // <-- 중괄호 추가

		total_price -= usePoint;
		h4.innerText = total_price + "원(" + total_point + " 적립예정)";
	}
</script>

<script>
	var IMP = window.IMP;
	IMP.init("imp73121012");

	function requestPay() {
		// IMP.request_pay(param, callback) 결제창 호출

		var table = document.getElementById("order_table");
		var total_price = 0;
		var saving_point = 0;
		var jsonData = {};
		var jsonData2 = {};

		for (var i = 1; i < table.rows.length; i++) {

			var bookName = table.rows[i].cells[0].textContent;
			var price = parseInt(table.rows[i].cells[1].textContent);
			var point = parseInt(table.rows[i].cells[2].textContent);
			var inputElement = table.rows[i].cells[3]
					.querySelector("input[name='number']");
			var qty = parseInt(inputElement.value);
			var book_isbn_list = table.rows[i].cells[4].textContent;
			console.log(qty);

			total_price += price * qty;
			saving_point += point * qty;

			jsonData[bookName] = qty;
			jsonData2[book_isbn_list] = qty;

		}

		console.log(jsonData);
		console.log(jsonData2);

		var usePoint = document.getElementById("usePoint").value;

		if (usePoint === "") {
			usePoint = 0; // 기본값을 0으로 설정
		} else {
			usePoint = parseInt(usePoint);
			total_price -= usePoint;
		}

		var member_name = document.getElementById("member_name").value;
		var met = document.getElementById("met").value; // 결제수단
		var member_email = document.getElementById("member_email").value;
		var member_address = document.getElementById("member_address").value;
		var member_tel = document.getElementById("member_tel").value;
		var radioButtons = document.getElementsByName("order_info");
		var member_num = document.getElementById("member_num").value;

		var book_isbn = document.getElementById('book_isbn').value;
		var book_qry = parseInt(document.getElementById('book_qry').value);
		var order_info = null;

		for (var i = 0; i < radioButtons.length; i++) {
			if (radioButtons[i].checked) {
				order_info = radioButtons[i].value;
				console.log("선택된 값: " + order_info);
				break;
			}
		}

		if (order_info === null) {
			alert("배송을 선택해주세요");
			return;
		}

		// var order_info = selectedValue;

		IMP.request_pay({ // param
			pg : "INIpayTest",
			pay_method : met, // 결제방식
			merchant_uid : "KG" + new Date().getTime(), // 주문번호
			name : "Li-book-lary",
			amount : 100, // 결제금액 -- 100원으로 통일
			buyer_addr : member_address,
			buyer_email : member_email,
			buyer_name : member_name,
			buyer_tel : member_tel

		}, function(rsp) { // callback
			console.log("rsp : " + rsp);
			if (rsp.success) {
				// 결제 성공 시 : 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청
				// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				$.ajax({
					url : "payment_insert.do",
					method : "POST",
					headers : {
						"Content-Type" : "application/json"
					},
					data : JSON.stringify({
						order_number : rsp.merchant_uid, // 주문번호
						member_num : member_num, // 회원번호
						order_info : order_info,// 배송방식
						order_price : total_price, // 총 금액
						order_point : saving_point, // 총 누적포인트
						order_content : jsonData,
						listBasket : jsonData2,
						used_point : usePoint // 사용 포인트
					// 적립포인트 - 사용포인트
					}),
					dataType : "json"
				}).done(function(data) {
					console.log(data);
					// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					// 가맹점 서버 결제 API 성공시 로직
					if (data.result === "success") {
						var msg = '결제가 완료되었습니다.';
						alert(msg);
						window.location = "index.do";
					} else { //
						var msg = '결제과정에서 문제가 발생했습니다.';
						alert(msg);
						window.location = "index.do";
					}
				})
			} else {
				// 결제 실패 시 로직
				alert("결제에 실패하였습니다." + "\n" + "에러내용 : " + rsp.error_msg);
			}
		});
	}
</script>

<br>
<br>
<div align="center">
	<h3 class="text-custom">주문 상품</h3>
</div>

<div align="center">

	<table id="order_table">
		<tr>
			<th>이름</th>
			<th>가격</th>
			<th>포인트</th>
			<th>수량</th>
			<th id="toc-content">isbn</th>
		</tr>
		<c:if test="${empty listBasket}">
			<tr>
				<td>${bookVO.book_name}</td>
				<td>${bookVO.book_price}</td>
				<td>${bookVO.book_point}</td>
				<td><input type="number" id="0" name="number" min="1" max="500"
					step="1" value="1" onchange="changeTotal('0')"></td>
				<td id="toc-content">${bookVO.book_isbn}</td>
			</tr>
		</c:if>
		<c:if test="${not empty listBasket}">
			<c:forEach var="imsi" items="${listBasket}" varStatus="status">
				<tr>
					<td>${imsi.book_name}</td>
					<td>${imsi.book_price}</td>
					<td>${imsi.book_point}</td>
					<td><input type="number" id="${status.index + 1}"
						name="number" min="1" max="500" step="1"
						value="${imsi.basket_qry}"
						onchange="changeTotal('${status.index + 1}')"></td>
					<td id="toc-content">${imsi.book_isbn}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<br>
	<hr>

	<div align="center">
		<h4 class="text-custom">배송선택</h4>
		<br> <input type="radio" name="order_info" value="일반택배">
		일반택배 <input type="radio" name="order_info" value="편의점택배">
		인터넷택배
	</div>

	<hr>
	<br>

	<div>
		사용 포인트 : <input type="text" name="usePoint" id="usePoint" size="25"
			placeholder="사용할 포인트를 입력하세요." value="0" onchange="changeTotal()">
	</div>
	<div>사용가능 포인트 : ${sessionScope.memberVO.member_point}</div>
</div>
<br>
<hr>

<div align="center">
	<h3 class="text-custom">총 계산금액</h3>
	<h4 id="total"></h4>
</div>
<br>
<div align="center">
	결제수단 : <select id="met" name="met">
		<option value="card">신용카드</option>
		<option value="trans">실시간계좌이체</option>
		<option value="vbank">가상계좌</option>
		<option value="phone">휴대폰소액결제</option>
	</select><br>
	<br> <input type="button" value="결제하기" onclick="requestPay()"
		class="btn btn-primary"> <input type="button" value="취소"
		onclick="history.back()" class="btn btn-primary">
</div>

<input type="hidden" name="member_point" id="member_point"
	value="${sessionScope.memberVO.member_point}">
<input type="hidden" name="member_name" id="member_name"
	value="${sessionScope.memberVO.member_name}">
<input type="hidden" name="member_email" id="member_email"
	value="${sessionScope.memberVO.member_email}">
<input type="hidden" name="member_address" id="member_address"
	value="${sessionScope.memberVO.member_address}">
<input type="hidden" name="member_num" id="member_num"
	value="${sessionScope.memberVO.member_num}">
<input type="hidden" name="member_tel" id="member_tel"
	value="${sessionScope.memberVO.member_tel}">
<input type="hidden" name="book_isbn" id="book_isbn"
	value="${bookVO.book_isbn}">
<input type="hidden" name="book_qry" id="book_qry"
	value="${bookVO.book_qry}">


<%@ include file="/WEB-INF/views/bottom.jsp"%>
