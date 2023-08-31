<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	
	function cancelPay(order_number){
		
		console.log("order_number : " + order_number)
		var member_num = document.getElementById("member_num").value;
		console.log("member_number : " + member_num)
		
		var IMP = window.IMP;
		IMP.init("imp73121012");
		
		$.ajax({
			url : "payment_cancel.do",
			type : "post",
			headers : {"Content-Type" : "application/json"},
			// contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : JSON.stringify({
				order_number : order_number
			}),
			dataType : "json"
		}).done(function(data){
			
			console.log(data);
			
			if (data.result === "success") {
    			var msg = '환불이 완료되었습니다.';
				alert(msg);
				window.location = "orderChk.do?member_num=" + member_num;
			} else {
    			var msg = '환불과정에서 문제가 발생했습니다.';
    			alert(msg);
    			window.location = "orderChk.do?member_num=" + member_num;
    		}
		}).fail(function(jqXHR, textStatus, errorThrown) {
		    console.error("AJAX 요청 실패:", textStatus, errorThrown);
		    var msg = 'AJAX 요청 중 오류가 발생했습니다.';
		    alert(msg);
		    window.location = "orderChk.do?member_num=" + member_num;
		});
		
	}

</script>

<style>
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

.btn2 {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 0px;
	margin-right: 4px;
}

table {
	
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table th {
	
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #efefef;
}

.box {
	width: 10%;
	padding: 10px;
}

table td {

	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
} 
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
</style>
<div align=center>
    <h2 id=title>주문 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th width="10%">주문 번호</th>
<!--                 <th>유저 번호</th> -->
                <th width="10%">주문 정보</th>
                <th width="5%">가격</th>
                <th width="10%">주문 타입</th>
                <th width="10%">주문 포인트</th>
                <th width="30%">주문 컨텐츠</th>
                <th width="15%">주문 시간</th>
                <th width="10%">주문 취소</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td>${order.order_number}</td>
                    <td>${order.member_num}</td>
                    <td>${order.order_info}</td>
                    <td>${order.order_price}</td>
                    <td>${order.order_type}</td>
                    <td>${order.order_point}</td>
                    <td>${order.order_content}</td>
                    <td>${order.order_time}</td>
                    <td><input type="button" onclick="cancelPay('${order.order_number}')" class="btn btn-primary" value="취소/환불"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<input type="hidden" name="member_num" id="member_num" value="${sessionScope.memberVO.member_num }">

<%@ include file="/WEB-INF/views/bottom.jsp"%> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/top.jsp"%>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	
	function cancelPay(order_number){
		
		console.log("order_number : " + order_number)
		var member_num = document.getElementById("member_num").value;
		console.log("member_number : " + member_num)
		
		var IMP = window.IMP;
		IMP.init("imp73121012");
		
		$.ajax({
			url : "payment_cancel.do",
			type : "post",
			headers : {"Content-Type" : "application/json"},
			// contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			data : JSON.stringify({
				order_number : order_number
			}),
			dataType : "json"
		}).done(function(data){
			
			console.log(data);
			
			if (data.result === "success") {
    			var msg = '환불이 완료되었습니다.';
				alert(msg);
				window.location = "orderChk.do?member_num=" + member_num;
			} else {
    			var msg = '환불과정에서 문제가 발생했습니다.';
    			alert(msg);
    			window.location = "orderChk.do?member_num=" + member_num;
    		}
		}).fail(function(jqXHR, textStatus, errorThrown) {
		    console.error("AJAX 요청 실패:", textStatus, errorThrown);
		    var msg = 'AJAX 요청 중 오류가 발생했습니다.';
		    alert(msg);
		    window.location = "orderChk.do?member_num=" + member_num;
		});
		
	}

</script>

<script>
	function confirmPay(order_number, order_point){
		
		var conf = confirm("구매를 확정하시겠습니까? (확정 후에는 환불이 불가능하며 포인트가 적립됩니다)");
		var member_num = document.getElementById("member_num").value;
		console.log("member_num : " + member_num)
		console.log("order_number : " + order_number)
		console.log("order_point : " + order_point)
		
		if(conf){
			$.ajax({
				url : "confirm_pay.do",
				method : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					order_number : order_number,
					member_num : member_num,
					order_point : order_point
				}),
				dataType : "json"
			}).done(function(data){				
				console.log(data);
				if (data.result === "success") {
	    			var msg = '구매가 확정되었습니다.';
					alert(msg);
					window.location = "orderChk.do?member_num=" + member_num;
				} else {
	    			var msg = '문제가 발생했습니다.';
	    			alert(msg);
	    			window.location = "orderChk.do?member_num=" + member_num;
	    		}
			}).fail(function(jqXHR, textStatus, errorThrown) {
			    console.error("AJAX 요청 실패:", textStatus, errorThrown);
			    var msg = 'AJAX 요청 중 오류가 발생했습니다.';
			    alert(msg);
			    window.location = "orderChk.do?member_num=" + member_num;
			});
		} else{
			return;
		}
	}
</script>

<style>
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

.btn2 {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 0px;
	margin-right: 4px;
}

table {
	
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table th {
	
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #efefef;
}

.box {
	width: 10%;
	padding: 10px;
}

table td {

	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
} 
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
</style>
<div align=center>
    <h2 id=title>주문 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th width="10%">주문 번호</th>
                <th width="7%">주문 정보</th>
                <th width="7%">가격</th>
                <th width="6%">주문 타입</th>
                <th width="10%">적립 예정 포인트</th>
                <th width="30%">주문 컨텐츠</th>
                <th width="15%">주문 시간</th>
                <th width="15%">주문 취소/구매확정</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${orderList}" var="order">
                <tr>
                    <td>${order.order_number}</td>
                    <td>${order.order_info}</td>
                    <td>${order.order_price}</td>
                    <td>${order.order_type}</td>
                    <td>${order.order_point}</td>
                    <td>${order.order_content}</td>
                    <td>${order.order_time}</td>
                    <td>
                    	<c:if test="${order.confirm_pay == 1}">
                    		<input type="button" class="btn btn-primary" value="구매확정" disabled>
                    		<input type="button" class="btn btn-primary" value="취소/환불" disabled>
                    	</c:if>
                    	<c:if test="${order.confirm_pay == 0}">
                    		<input type="button" class="btn btn-primary" value="구매확정" onclick="confirmPay('${order.order_number}', ${order.order_point})">
                    		<input type="button" onclick="cancelPay('${order.order_number}')" class="btn btn-primary" value="취소/환불">
                    	</c:if>
                    </td>	
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<input type="hidden" name="member_num" id="member_num" value="${sessionScope.memberVO.member_num}">

<%@ include file="/WEB-INF/views/bottom.jsp"%>