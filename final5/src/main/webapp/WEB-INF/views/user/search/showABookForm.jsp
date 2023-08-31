<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<%-- <link href="${pageContext.request.contextPath}/resources/css/searchedFormCss.css" rel="stylesheet"> --%>
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

</style>
<BR>


<div style="margin-left:30px;">
	<button onclick="history.back()" style="border:0; background-color:white;" >
		<img src="resources/img/icon/icon_exit.png" id="icon" style="width:30px;"> 
	</button>
</div>
<div align=center>
	
	

	<c:forEach var="blist" items="${blist }">

		<span style="color:black; font-size:35;">${blist.book_name }</span>
		<span style="color:grey; font-size:18">
		${blist.book_writer } / ${blist.book_pub }
		</span>
		<table cellpadding="20" >
			<tr>
				<td width=458px><img src="resources/img/book/${blist.book_img}.jpg" style="max-width:458px;">
				</td>
				<td style="text-align:right;">남은수량: ${blist.book_qry }<BR><BR> 가격: ${blist.book_price }<BR><BR>
					<input type="button" class=btn1 value="바로구매" onclick="location.href='goPaymentDirect.do?book_isbn=${blist.book_isbn}&member_num=${sessionScope.memberVO.member_num }'">
					<%-- "location.href='goPayment.do?book_isbn=${blist.book_isbn}&book_name=${blist.book_name}&book_price=${blist.book_price}&book_point=${blist.book_point}'" --%><BR><BR> <input
					type="button" class=btn1 value="장바구니추가" onclick="location.href='addBasket.do?book_isbn=${blist.book_isbn}&member_num=${sessionScope.memberVO.member_num}'">
				</td>
			</tr>
			<tr style=" font-weight:bold; font-size:18px;">
				<td>줄거리</td>
			</tr>
			<tr style="font-size:15px; border-bottom: 1px solid #444444;  border-collapse: collapse;">
				<td>${blist.book_sub }
				</td>
			</tr>
			<tr style=" font-weight:bold; font-size:18px;">
				<td>상세정보</td>
			</tr>
			<tr style="font-size:15px; border-bottom: 1px solid #444444;  border-collapse: collapse;">
				<td>
				ISBN: ${blist.book_isbn }<BR> 
				분류: ${blist.book_category }<BR>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid #444444; border-collapse: collapse; font-weight:bold; font-size:18px; font-color:black; text-align:right; margin:auto;">
				<td>교환/반품/품절 안내</td><td> <a href="listBoard.do">환불문의</a></td>
				
			</tr>
			<tr style="font-weight:bold; font-size:18px; font-color:black;">
				<td>반품/교환가능 기간</td>
			</tr>
			<tr  style="font-size:15px;" >
				<td colspan="2" ><pre>
변심반품의 경우 수령 후 7일 이내,
상품의 결함 및 계약내용과 다를 경우 문제점 발견 후 30일 이내
					</pre>
				</td>
			</tr>
			<tr style="font-weight:bold; font-size:18px; font-color:black;">
				<td>반품/교환비용</td>
			</tr>
			<tr  style="font-size:15px;" >
				<td colspan="2" ><pre>
변심 혹은 구매착오로 인한 반품/교환은 반송료 고객 부담
					</pre>
				</td>
			</tr>
			<tr style="font-weight:bold; font-size:18px; font-color:black;">
				<td>반품/교환 불가 사유</td>
			</tr>
			<tr  style="font-size:15px;" >
				<td colspan="2" ><pre>
1) 소비자의 책임 있는 사유로 상품 등이 손실 또는 훼손된 경우
(단지 확인을 위한 포장 훼손은 제외)
2) 소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우
예) 화장품, 식품, 가전제품(악세서리 포함) 등
3) 복제가 가능한 상품 등의 포장을 훼손한 경우
예) 음반/DVD/비디오, 소프트웨어, 만화책, 잡지, 영상 화보집
4) 소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우 ((1)해외주문도서)
5) 디지털 컨텐츠인 eBook, 오디오북 등을 1회 이상 다운로드를 받았을 경우
6) 시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우
7) 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우
					</pre>
				</td>
			</tr>
			<tr style="font-weight:bold; font-size:18px; font-color:black;">
				<td>소비자 피해보상 환불 지연에 따른 배상</td>
			</tr>
			<tr  style="font-size:15px;" >
				<td colspan="2" ><pre>
1) 상품의 불량에 의한 교환, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은 소비자분쟁 해결 기준 (공정거래위원회 고시)에 준하여 처리됨
2) 대금 환불 및 환불지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리함
					</pre>
				</td>
			</tr>
		</table>
	</c:forEach>
</div>

<%@ include file="/WEB-INF/views/bottom.jsp"%>
