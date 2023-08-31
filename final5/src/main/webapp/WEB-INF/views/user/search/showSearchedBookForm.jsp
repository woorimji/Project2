<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <link rel="stylesheet" href="resources/css/searchedFormCss.css" /> -->
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

.mainTopContainer {
	
	font-color: black; 
	height: 5vh;
	display: flex;
	flex-direction: row;
	flex-flow: row nowrap;
	justify-content: space-around;
}

</style>
<BR>
<BR>
<BR>
<div id="searchFormWrapper">

	<div style="margin-left: 50px">
		<a href="index.do"> <img src="resources/img/icon/icon_home.png"
			id="icon" style="width: 30px;"></a> <span
			style="font-size: 18px; color: black"></span>
	</div>

	<div id=searchFormMain align=center>
		[<span id="toc-toggle" onclick="openCloseToc()">카테고리</span>]
		<ul id="toc-content">
			<c:forEach var="clist" items="${clist}">
				<li style="display: inline-block;"><a
					href="searchBookCategory.do?book_category=${clist.category_name }">${clist.category_name }</a></li>
			</c:forEach>
		</ul>


		<!-- category출력 ajax  -->
		<script type="text/javascript">
			function openCloseToc() {
				if (document.getElementById('toc-content').style.display === 'block') {
					document.getElementById('toc-content').style.display = 'none';
					document.getElementById('toc-toggle').textContent = '카테고리';
				} else {
					var param = {};

					$.ajax({
						type : "POST",
						url : "getCategoryInfo.do",
						data : {
							param : "value"
						},
						dataType : "json",
						success : function(clistData) {
							renderClist(clistData);
						},
						error : function(request, status, error) {
							console.log("code:" + request.status + "\n"
									+ "message:" + request.responseText + "\n"
									+ "error:" + error);
						}
					});

					document.getElementById('toc-content').style.display = 'block';
					document.getElementById('toc-toggle').textContent = '카테고리';
				}
			}
			function renderClist(clistData) {
				var tocContent = document.getElementById('toc-content');
				tocContent.innerHTML = '';

				var cateTable = document.createElement('table');
				var nowRow;

				cateTable.style.width = '50%';
				cateTable.style.padding = '5px';

				for (var i = 0; i < clistData.length; i++) {
					var category = clistData[i].category_name;
					var link = 'searchBookCategory.do?book_category='
							+ category;

					if (i % 10 === 0) {
						nowRow = document.createElement('tr');
						cateTable.appendChild(nowRow);
					}
					var td = document.createElement('td');
					td.style.padding = '5px';
					td.style.width = '5px';

					var a = document.createElement('a');

					a.href = link;
					a.style.fontSize = '14px';
					a.style.color = 'black';
					a.textContent = category;

					td.appendChild(a);
					nowRow.appendChild(td);

				}
				tocContent.appendChild(cateTable);
			}
			
			
		</script>


<BR>
		<table border=2 style="width: 1100px;">
			<tr>
				<th style="width: 20%;"></th>
				<th></th>
				<th style="width: 10%;"></th>
			</tr>
			<c:if test="${empty blist}">
				<tr>
					<td colspan="3"
						style="text-align: center; padding: 20px; font-size: 30px; font-weight: bold;">
						아직 해당 카테고리의 도서가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="imsi" items="${blist }">

				<tr style="border-bottom: 1px solid #444444;">

					<td><img src="resources/img/book/${imsi.book_img }.jpg"
						width="200px"></td>
					<td>
						<table style="margin-left: 30px; margin-right: 30px;">
							<tr>
								<td><a href="aBookInfo.do?book_isbn=${imsi.book_isbn }">${imsi.book_name }</a>
								</td>
							</tr>
							<tr>
								<td
									style="font-size: 12px; font-color: grey; padding-top: 10px;">${imsi.book_writer }
									/ ${imsi.book_pub }</td>
							</tr>
							<tr>
								<td style="font-weight: bold; color: black; padding-top: 20px;">${imsi.book_price }원</td>
							</tr>
							<tr>
								<td style="font-size: 16px; padding-top: 20px;">${imsi.book_sub }</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					<td>
						<!-- 현재 member_num은 임시로 21사용중(mapper확인) --> <input type=button
						value="바로구매" class=btn1
						onclick="location.href='goPaymentDirect.do?book_isbn=${imsi.book_isbn }&member_num=${sessionScope.memberVO.member_num }'">
						<%-- "location.href='payment.do?book_isbn=${imsi.book_isbn}&book_name=${imsi.book_name}&book_price=${imsi.book_price}&book_point=${imsi.book_point}'"> --%>
						<BR> <input type=button value="장바구니담기" class=btn1
						onclick="location.href='addBasket.do?book_isbn=${imsi.book_isbn}&member_num=${sessionScope.memberVO.member_num }'">
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</div>


<%@ include file="/WEB-INF/views/bottom.jsp"%>