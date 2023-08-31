<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<style>
#toc-content {
	display: none;
}

#toc-toggle {
	cursor: pointer;
	color: #2962ff;
}

#toc-toggle:hover {
	text-decoration: none;
}

#categoryList {
	display: inline;
	padding-right: 15px;
	margin: 0 auto;
}

.mainTopContainer {
	background:#F0FBFC;
	font-color: black; 
	height: 5vh;
	display: flex;
	flex-direction: row;
	flex-flow: row nowrap;
	justify-content: space-around;
}

.boardContainer {
}

.notContainer {
}

.categories {
	display: absolute;
	background: #F0FBFC;
}

.mainMiddle {
	display: flex;
	justify-content: center;
	padding: 15px;
}

.mainBookContainer {
	background: beige;
	height: 40vh;
	display: flex;
	flex-direction: row;
	flex-flow: row nowrap;
	justify-content: space-around;
	padding: 15px;
}

.searchBookInfo {
	display: flex;
	justify-content: center;
}

.book1Container{
	display: flex;
	justify-content: center;
	padding: 15px;
}
#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
</style>


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
				var link = 'searchBookCategory.do?book_category=' + category;

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
<div class="mainTopContainer">
	<!-- 카테고리 리스트 -->
	<div class="categoryContainer">
		[<span id="toc-toggle" onclick="openCloseToc()">카테고리</span>]
	</div>

	<div class="boardContainer">
		<a href="listBoard.do">QNA게시판</a>
	</div>
	
	
</div>

<div class="categories">
	<ul id="toc-content">
		<c:forEach var="clist" items="${clist}">
			<li id="categoryList">
				<a href="searchBookCategory.do?book_category=${clist.category_name }">${clist.category_name }</a>
			</li>
		</c:forEach>
	</ul>
</div>
<h2 style="text-align: center;" id="title">오늘의 추천 도서</h2>
<div class="mainMiddle">
	
	<div class="mainBookContainer">
		
			<a href="aBookInfo2.do?book_img=38" class="book1Container">
				<img src="resources/img/book/38.jpg">
			</a>
			<a href="aBookInfo2.do?book_img=24" class="book1Container">
				<img src="resources/img/book/24.jpg">
			</a>
			<a href="aBookInfo2.do?book_img=2" class="book1Container">
				<img src="resources/img/book/2.jpg">
			</a>
			<a href="aBookInfo2.do?book_img=55" class="book1Container">
				<img src="resources/img/book/55.jpg">
			</a>
			<a href="aBookInfo2.do?book_img=68" class="book1Container">
				<img src="resources/img/book/68.jpg">
			</a>
			<a href="aBookInfo2.do?book_img=33" class="book1Container">
				<img src="resources/img/book/33.jpg">
			</a>
			
	</div>

	<!-- 책 제목 검색  -->

</div>
<h5 id="title" style="text-align:center;">도서명으로 검색하기</h5>
	<div class="searchBookInfo">
	
		<form action="searchBookInfo.do" method="post">
			<input type=text name=book_name> <input type=submit value="검색">
		</form>
	</div>


<%@ include file="bottom.jsp"%>