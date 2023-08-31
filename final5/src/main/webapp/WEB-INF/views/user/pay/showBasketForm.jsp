<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	width: 1500px;
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table th {
	width: 25%;
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
	width: 25%;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

.hidden-cell {
	display: none;
}

#firstTotalPriceContainer {
	font-size: 30px;
	font-color: black;
	font-weight: bold;
}

#totalPriceContainer {
	font-size: 30px;
	font-color: black;
	font-weight: bold;
}
</style>
<%@ include file="/WEB-INF/views/top.jsp"%>

<!-- 21을 전부 session 값으로 -->

<div align=center>

	<script type="text/javascript">
	var memberNum = '${sessionScope.memberVO.member_num}';
	
		function addBasketQry(book_isbn, member_num) {
			
			var member_num=memberNum;
			console.log(book_isbn)
			console.log(member_num)

			$.ajax({
				//장바구니에서 해당 도서 개수 한 개 추가
				url : "addBasketQry.do",
				type : "POST",
				data : {
					book_isbn : book_isbn,
					member_num : member_num
				},
				dataType : "json",
				success : function(baslistData) {
					renderBaslist(baslistData);

					var totalPrice = getTotalPrice(baslistData);
					console.log(totalPrice)
					showTotalPrice(totalPrice);

				}
			})

		}

		//################장바구니에서 개수 차감#################
		function subsBasketQry(book_isbn, member_num, basket_qry) {
			var member_num=memberNum;
			console.log(book_isbn)
			console.log(member_num)
			console.log(basket_qry)

			//#############현재 개수가 한 개일 때##################
			if (basket_qry === 1 || basket_qry <= 1) {
				//console.log("basket_qry===1")
				
				var result = confirm("장바구니에서 빼겠습니까");
				//###############하나에서 빼서 장바구니에서 해당 도서 삭제할 때#############
				if (result) {
					$.ajax({
						//장바구니에서 해당 도서 삭제
						url : "delBasketQry.do",
						type : "POST",
						data : {
							book_isbn : book_isbn,
							member_num : member_num
						},
						success : function(baslistData) {
							//장바구니리스트 출력function
							renderBaslist(baslistData);
							var totalPrice = getTotalPrice(baslistData);
							showTotalPrice(totalPrice);
							firstEmptyMessage(totalPrice);
						}
					})
					//##########취소###############
				} else {
					alert("취소하였습니다");
				}
				//##########현재 개수가 한 개 초과일 때###############
			} else {
				$.ajax({
					//장바구니에서 해당 도서 개수 한 개 차감
					url : "subsBasketQry.do",
					type : "POST",
					data : {
						book_isbn : book_isbn,
						member_num : member_num
					},
					success : function(baslistData) {
						renderBaslist(baslistData);
						var totalPrice = getTotalPrice(baslistData);
						showTotalPrice(totalPrice);
					}
				})
			}
		}
		
		
		//##############table 구현 ####################
		function renderBaslist(baslistData) {
			var member_num=memberNum;
			console.log(member_num);
			var basketTable = document.createElement('table');
			var headerRow = basketTable.createTHead().insertRow();

			var headerBox = document.createElement('th');
			headerBox.classList.add('box');
			headerRow.appendChild(headerBox);

			var headerBookName = document.createElement('th');
			headerBookName.textContent = '도서명';
			headerRow.appendChild(headerBookName);

			var headerBookPrice = document.createElement('th');
			headerBookPrice.textContent = '가격';
			headerRow.appendChild(headerBookPrice);

			var headerBasketQry = document.createElement('th');
			headerBasketQry.textContent = '개수';
			headerRow.appendChild(headerBasketQry);

			var headerCounted = document.createElement('th');
			headerCounted.textContent = '소계';
			headerRow.appendChild(headerCounted);
			
		

			for (var i = 0; i < baslistData.length; i++) {
				var basketRow = baslistData[i];
				var row = basketTable.insertRow();

				var boxCell = row.insertCell();
				boxCell.classList.add('box');

				var checkbox = document.createElement('input');
				checkbox.type = 'checkbox';
				checkbox.name = 'checkbox';
				boxCell.appendChild(checkbox);
				/* checkbox.addEventListener('change', function(event){
					basketSelect2();
				}); */
				

				var memberNumCell = row.insertCell();
				memberNumCell.textContent = basketRow.member_num;
				memberNumCell.classList.add('hidden-cell','member_num');
				memberNumCell.setAttribute('id', 'member_num'
						+ basketRow.member_num);
				memberNumCell.setAttribute('value', 'member_num'
						+ basketRow.member_num);

				var bookIsbnCell = row.insertCell();
				bookIsbnCell.textContent = basketRow.book_isbn;
				bookIsbnCell.classList.add('hidden-cell','book_isbn');
				bookIsbnCell.setAttribute('id', 'book_isbn'
						+ basketRow.book_isbn);
				bookIsbnCell.setAttribute('value', 'book_isbn'
						+ basketRow.book_isbn);
				
				var bookPointCell = row.insertCell();
				bookPointCell.textContent = basketRow.book_point;
				bookPointCell.classList.add('hidden-cell','book_point');
				bookPointCell.setAttribute('id', 'book_point'
						+ basketRow.book_point);
				bookPointCell.setAttribute('value', 'book_point'
						+ basketRow.book_point);

				var bookNameCell = row.insertCell();
				bookNameCell.classList.add('name-cell');
				bookNameCell.textContent = basketRow.book_name;

				var bookPriceCell = row.insertCell();
				bookPriceCell.textContent = basketRow.book_price;

				var basketQryCell = row.insertCell();
				basketQryCell.textContent = basketRow.basket_qry;
				basketQryCell.setAttribute('id', 'basket_qry'
						+ basketRow.basket_qry);
				basketQryCell.setAttribute('value', 'basket_qry'
						+ basketRow.basket_qry);

				var qryAddButton = document.createElement('button');

				qryAddButton.textContent = '+';
				qryAddButton.classList.add('btn1');
				qryAddButton.onclick = function(rowBasketRow) {
					return function() {
						addBasketQry(rowBasketRow.book_isbn, rowBasketRow.member_num)
					};
				}(basketRow);
				basketQryCell.appendChild(qryAddButton);

				var qrySubsButton = document.createElement('button');
				qrySubsButton.textContent = '-';
				qrySubsButton.classList.add('btn1');
				qrySubsButton.onclick = function(rowBasketRow) {
					return function() {
						subsBasketQry(rowBasketRow.book_isbn, rowBasketRow.member_num,
								rowBasketRow.basket_qry)
					};
				}(basketRow);
				basketQryCell.appendChild(qrySubsButton);

				var countedCell = row.insertCell();
				countedCell.textContent = basketRow.counted;

			}
			
		
			
			
			
			var basketListContainer = document.getElementById('basketListContainer');

			var firstBasketListContainer = document.getElementById('firstBasketListContainer');
			if (firstBasketListContainer) {
				firstBasketListContainer.innerHTML='';
			}
			basketListContainer.innerHTML = '';
			basketListContainer.appendChild(basketTable);
			
			var firstDelbut=document.getElementById('delbut');
			if(firstDelbut){
				firstDelbut.remove();
				}
			var newDelbut=document.createElement('button');
			newDelbut.type='button';
			newDelbut.className = 'btn1';
			newDelbut.textContent = '선택항목 지우기';
			newDelbut.onclick=basketSelect2;
			
			
			var newButtonContainer = document.getElementById('newButtonContainer');
			newButtonContainer.innerHTML = '';
		    newButtonContainer.appendChild(newDelbut);
			
		
		}
		
		

		/* 페이지 로딩시에 총합가격 출력 */

		//세션값 넘겨야됨
		$(document).ready(function() {
			getFirstTotalPrice();
		});
		function getFirstTotalPrice(member_num) {
			var member_num=memberNum;
			$.ajax({

				url : "getBasketCounted.do",
				type : "POST",
				dataType : "json",
				data: { member_num: member_num},
				success : function(firstBasketData) {
					var ftotalPrice = getTotalPrice(firstBasketData);
					showTotalPrice(ftotalPrice);

				}
			});
		}

		/* 총합 가격 구하는 함수 */
		function getTotalPrice(baslistData) {
			var member_num=memberNum;
			var totalPrice = 0;
			for (var i = 0; i < baslistData.length; i++) {
				var baslist = baslistData[i];
				totalPrice += baslist.book_price * baslist.basket_qry
			}
			return totalPrice;
		}

		/* (페이지 로딩 이후)총합 가격 출력 함수 */
		function showTotalPrice(totalPrice) {
			var member_num=memberNum;
			var totalPriceContainer = document
					.getElementById('totalPriceContainer');

			var firstTotalPriceContainer = document
					.getElementById('firstTotalPriceContainer');
			if (firstTotalPriceContainer) {
				firstTotalPriceContainer.remove();
			}
			totalPriceContainer.textContent = '총합 가격은 ' + totalPrice + '원 입니다';
		}

		
			//개수 1->0일때 해당 도서 장바구니에서 삭제
			function delBasketQry() {
				var member_num=memberNum;
			    var checkedBoxes = document.querySelectorAll('input[name="checkbox"]:checked');
			    var dataToSend = {
			        bookIsbns: [],
			        //member_num: ${sessionScope.memberVO.member_num} 
			    };

			    for (var i = 0; i < checkedBoxes.length; i++) {
			        var bookIsbn = checkedBoxes[i].getAttribute('data-isbn');
			        dataToSend.bookIsbns.push(bookIsbn);
			        console.log(bookIsbn);
			    }
				
			    $.ajax({
			        url: "delBasketQry2.do",
			        type: "POST",
			        contentType: "application/json; charset=UTF-8",
			        data: JSON.stringify(dataToSend),
			        dataType: "json",
			        success: function(response) {
			            // 처리 로직
			            lateGetTableRowCount();
			        },
			        error: function(xhr, status, error) {
			            // 에러 처리 로직
			        }
			    });
			}
	
		
			function basketSelect() {
			    var checkboxes = document.querySelectorAll('input[name="checkbox"]');
			    var selectedRows = [];

			    checkboxes.forEach(function(checkbox) {
			        if (checkbox.checked) {
			            var tr = checkbox.closest('tr');
			            var book_isbn = tr.querySelector('#book_isbn').value;
			            var member_num = memberNum; // member_num을 추가
			            selectedRows.push({ book_isbn, member_num });
			            console.log(selectedRows);
			        }
			    });

			    delSelectedRows(selectedRows);
			}

			function basketSelect2() {
			    var checkboxes = document.querySelectorAll('input[name="checkbox"]');
			    var selectedRows = [];

			    checkboxes.forEach(function(checkbox) {
			        if (checkbox.checked) {
			            var tr = checkbox.closest('tr');
			            var book_isbn = tr.querySelector('.hidden-cell.book_isbn').textContent;
			            var member_num = memberNum; // member_num을 추가
			            selectedRows.push({ book_isbn, member_num });
			        }
			    });

			    delSelectedRows(selectedRows);
			}
		
			function delSelectedRows(selectedRows) {
			    var member_num = memberNum;
			    console.log(selectedRows);
			    if (selectedRows.length === 0) {
			        alert('선택된 항목이 없습니다.');
			        return;
			    }

			    $.ajax({
			        url: 'delSelectedRows.do',
			        type: 'POST',
			        contentType: "application/json; charset=UTF-8", // contentType 수정
			        data: JSON.stringify(selectedRows), // data에 JSON.stringify 적용
			        dataType: 'json', // dataType 수정
			        success: function(baslistData) {
			            renderBaslist(baslistData);

			            var totalPrice = getTotalPrice(baslistData);
			            console.log(totalPrice);
			            showTotalPrice(totalPrice);
			            firstEmptyMessage(totalPrice);
			        }
			    });
			}
			
			
			/* 페이지 로딩시 장바구니 비었을때 */
			window.onload=function firstFirstEmptyMessage(){
			    	var emptyBasketMessage=document.getElementById("emptyBasketMessage");
			    	var table1=document.getElementById("firstBasketList");
			    	if (table1 && table1.rows.length > 1) {
			            emptyBasketMessage.style.display = "none";
			    	}else{
			    		emptyBasketMessage.style.display="block";
			    	}
			    } 
			    
			/* 빈 테이블 텍스트 출력 */
			function firstEmptyMessage(totalPrice) {
				console.log("passed")
				var totalPrice=totalPrice;
				var emptyBasketMessage=document.getElementById("emptyBasketMessage");
				if (totalPrice >0 ){
					emptyBasketMessage.style.display="none";
				}else{
					emptyBasketMessage.style.display="block";
				}
			}
			
			/* 결제페이지 이동 여부 */
			function prePayment() {
			    var member_num = document.getElementById("session").value;
			    var table1 = document.getElementById("firstBasketList");
			    var table2 = document.getElementById("basketListContainer");

			    if (table1 && table1.rows.length > 1) {
			        var url = "goPayment.do?member_num=" + member_num;
			        window.location.href = url;
			    } else if (table2 && table2.innerHTML.trim() !== "") {
			        var url = "goPayment.do?member_num=" + member_num;
			        window.location.href = url;
			    } else {
			        console.log("no basket");
			        alert("장바구니에 도서가 없습니다.");
			    }
			}
			
		/* 	function lateGetTableRowCount(){
				var table=document.getElementById("basketListContainer");
				var tableLength=table.rows.length+1;
				firstEmptyMessage(tableLength);
			}
 */
			
		
		
	
	</script>

	<!--

				
			
-->


	<BR> <BR> <BR>
	<h3>내 장바구니</h3>
	
	<!-- 세션값 저장용 -->
	<input type="hidden" id="session"
		value="${sessionScope.memberVO.member_num }">
		
	<!-- 초기 테이블 -->
	<div id="firstBasketListContainer">
		<table id="firstBasketList">
			<tr>
				<th class="box"></th>
				<th>도서명</th>
				<th>가격</th>
				<th>개수</th>
				<th>소계</th>
			</tr>
			<c:forEach var="baslist" items="${baslist }">
				<tr>
					<td class="box"><input type="checkbox" name="checkbox"
						data-index="${index}"></td>
					<td>${baslist.book_name }<input type=hidden
						value="${baslist.book_name }" id="book_name">
					</td>
					<td>${baslist.book_price }<input type=hidden
						value="${baslist.book_price}" id="book_price">
					</td>
					<td>${baslist.basket_qry}<input type=hidden
						value="${baslist.basket_qry}" id="basket_qry">
						<button type=button class=btn1
							onclick="addBasketQry('${baslist.book_isbn}', '${sessionScope.memberVO.member_num}')">+</button>
						<button type=button class=btn2
							onclick="subsBasketQry('${baslist.book_isbn}', '${sessionScope.memberVO.member_num}', '${baslist.basket_qry }')">-</button>
					</td>
					<td>${baslist.counted }<input type=hidden
						value="${baslist.counted }" id="counted"> <input
						type=hidden value="${sessionScope.memberVO.member_num}"
						id="member_num"> <input type=hidden
						value="${baslist.book_isbn }" id="book_isbn"> <input
						type=hidden value="${baslist.book_point }" id="book_point">
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- ajax테이블 -->
	<div id="basketListContainer"></div>
	
	<!-- 출력메세지 -->
	<div id="emptyBasketMessage" style="display: none;">장바구니에 도서가
		없습니다.</div>
		
		
	<!-- 하단 버튼 -->
	<div id="buttonsContainer" style="margin-right: 1200px;">
	
		<!-- 선택항목 지우기 -->
		<button type=button class=btn1 id="delbut" name="delbut"
			onclick="basketSelect()">선택항목 지우기</button>

		<span id="newButtonContainer"></span>


		<!-- 장바구니 비우기 -->
		<button type=button class=btn1
			onclick="location.href='clearBasket.do?member_num=${sessionScope.memberVO.member_num}'">장바구니
			비우기</button>
	</div>


	<!-- 가격 표기 -->
	<div id="firstTotalPriceContainer"></div>
	<div id="totalPriceContainer"></div>

	<!-- 결제버튼 -->
	<button type=button class=btn1 onclick="prePayment()">결제창으로</button>

</div>



<%@ include file="/WEB-INF/views/bottom.jsp"%>
