<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- payment.jsp -->
<%@ include file="top.jsp"%>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	
	var IMP = window.IMP;
	IMP.init("imp73121012");
	
	function requestPay(){
		// IMP.request_pay(param, callback) 결제창 호출
		
		var bname = document.getElementById("bname").value;
        var met = document.getElementById("met").value;
        var email = document.getElementById("email").value;
        var hotel_name = document.getElementById("hotel_name").value;
        var room_num = document.getElementById("room_num").value;
        var room_price = document.getElementById("room_price").value;
        var tel = document.getElementById("tel").value;
        var reserv_in = document.getElementById("reserv_in").value;
        var reserv_out = document.getElementById("reserv_out").value;
        var mem_id = document.getElementById("mem_id").value;
        var hotel_id = document.getElementById("hotel_id").value;
		// console.log(bname, met, tel)
		
		IMP.request_pay({ // param
			pg : "INIpayTest",
			pay_method : met, // 결제방식
			merchant_uid : "KG" + new Date().getTime(), // 주문번호
			name : hotel_name + " " + room_num + "호",
			amount : room_price,
			buyer_email : email,
			buyer_name : bname,
			buyer_tel : tel
			
		}, function(rsp){ // callback
			console.log(rsp);
			if(rsp.success){
				// 결제 성공 시 : 결제 승인 또는 가상계좌 발급에 성공한 경우
				// jQuery로 HTTP 요청
				// [1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				$.ajax({
					url : "payment_create.do",
					method : "POST",
					headers : {"Content-Type" : "application/json"},
					data : JSON.stringify({
						imp_uid : rsp.imp_uid, // 결제고유번호
						merchant_uid : rsp.merchant_uid, // 주문번호
						room_num : room_num,
						hotel_id : hotel_id,
						room_price : room_price,
						reserv_in : reserv_in,
						reserv_out : reserv_out,
						mem_id : mem_id
					})
				}).done(function(data){
					// [2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
					// 가맹점 서버 결제 API 성공시 로직
					if (data.result === "success") {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\n결제 금액 : ' + rsp.paid_amount;
		    			//msg += '카드 승인번호 : ' + rsp.apply_num;
    					alert(msg);
    					window.location = "paymentComplete.do";
    				} else { //
		    			var msg = '결제과정에서 문제가 발생했습니다.';
		    			alert(msg);
		    			wondpw.location = "payment.do";    			
		    		}
						})
			} else{
				// 결제 실패 시 로직
				alert("결제에 실패하였습니다." + "\n" + 
						"에러내용 : " + rsp.error_msg);
			}
		});
	}
	
</script>

    <!-- Contact Start -->
<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Reservation</h6>
                <h1 class="mb-5">예약 내역 확인</h1>
        </div>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
		      <form action="" method="get">
		        <table class="table table-bordered">
		          <tr>   
					<td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-user text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">이름</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="bname" name="bname" value="${param.bname}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		           	<td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-envelope-open text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">이메일</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="email" name="email" value="${param.email}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		           	<td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fas fa-hotel text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">호텔명</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="hotel_name" name="hotel_name" value="${param.hotel_name}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		            <td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-bed text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">호수</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="room_num" name="room_num" value="${param.room_num}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		            <td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-won-sign text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">금액</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="room_price" name="room_price" value="${param.room_price}" readonly class="form-control mb-0"></td>
		          </tr>
		          <tr>
		            <td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-phone-alt text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">휴대폰</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="tel" name="tel" value="${param.tel}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		            <td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-calendar text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">체크인</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="reserv_in" name="reserv_in" value="${param.reserv_in}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		            <td>
					  <div class="d-flex align-items-center">
					    <span class="d-flex align-items-center justify-content-center bg-primary" style="width: 50px; height: 50px;">
					      <i class="fa fa-calendar text-white" style="font-size: 30px;"></i>
					    </span>
					    <span style="margin-left: 10px;">
					      <h5 class="text-primary d-flex align-items-center" style="margin: 0;">
					        <span style="flex-grow: 1;">체크아웃</span>
					      </h5>
					    </span>
					  </div>
					</td>
		            <td><input type="text" id="reserv_out" name="reserv_out" value="${param.reserv_out}" readonly class="form-control"></td>
		          </tr>
		          <tr>
		            <td class="text-primary"><h5 class="text-primary" align="center">결제수단</h5></td>
		            <td>
		              <select id="met" name="met" class="form-select">
		                <option value="card">신용카드</option>
		                <option value="trans">실시간계좌이체</option>
		                <option value="vbank">가상계좌</option>
		                <option value="phone">휴대폰소액결제</option>
		              </select>
		            </td>
		          </tr>
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="button" value="결제하기" onclick="requestPay()" class="btn btn-primary">
		            	<input type="button" value="뒤로가기" onclick="history.back()" class="btn btn-primary">
		            	<input type="hidden" id="mem_id" name="mem_id" value="${param.mem_id}">
		            	<input type="hidden" id="hotel_id" name="hotel_id" value="${param.hotel_id}">
		            </td>
		          </tr>
		        </table>
		      </form>
		    </div>
		  </div>
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>
