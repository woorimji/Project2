<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- listBoard.jsp -->
<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
td.left {
	text-align: left;
}
</style>

<style>
.toolbar-bottom {
	display: flex;
	justify-content: center;
}

.hidden-cell {
	display: none;
}
</style>

<script>
	function PageMove(page) {
		location.href = "listBoard.do?page=" + page;
	}

	
</script>

<div class="container-xxl py-5">
	<div class="container">
		<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
			<h6 class="bg-white text-center text-custom px-3">Board</h6>
			<h1 class="mb-5 text-custom">게시판</h1>
		</div>
		<c:if test="${empty listBoard}">
			<h5 align="center">등록된 게시글이 없습니다.</h5>
		</c:if>
		<div class="container col-lg-8">
			<div class="row justify-content-center">
				<div class="table-responsive">
					<button class="btn btn-primary mb-3" id="filterButton">내 게시글만</button>
					<table class="table table-bordered">
						<tr>
							<td align="right"><a
								href="writeBoard.do?board_parent=${sessionScope.memberVO.member_id}">글쓰기</a></td>
						</tr>
					</table>
					<table class="table table-bordered">
						<tr align="center">
							<th>번호</th>
							<th width="30%">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>

						<c:forEach var="boardVO" items="${listBoard}">
							<tr align="center">
								<td>
									<div class="text-custom">${boardVO.board_number}</div>
								</td>
								<td class="left"><c:if test="${boardVO.board_level > 0}">
										<img
											src="${pageContext.request.contextPath}/resources/img/level.gif"
											width="${15 * boardVO.board_level}">
										<img
											src="${pageContext.request.contextPath}/resources/img/re.gif">
									</c:if> <a href="contentBoard.do?board_number=${boardVO.board_number}">${boardVO.board_subject}</a>
								</td>
								<td>${boardVO.board_writer}</td>
								<td>${boardVO.board_date}</td>
								<td>${boardVO.board_count}</td>
								<td class="hidden-cell">${boardVO.board_parent }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="toolbar-bottom">
						<div class="toolbar mt-lg">
							<div class="sorter">
								<ul class="pagination">
									<li><a href="javascript:PageMove(${pagingVO.firstPageNo})">맨앞으로</a></li>&nbsp;&nbsp;
									<li><a href="javascript:PageMove(${pagingVO.prevPageNo})">앞으로</a></li>&nbsp;&nbsp;
									<c:forEach var="i" begin="${pagingVO.startPageNo}"
										end="${pagingVO.endPageNo}" step="1">
										<c:choose>
											<c:when test="${i eq pagingVO.pageNo}">
												<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>&nbsp;&nbsp;
				                      </c:when>
											<c:otherwise>
												<li><a href="javascript:PageMove(${i})">${i}</a></li>&nbsp;&nbsp;
				                      </c:otherwise>
										</c:choose>
									</c:forEach>
									<li><a href="javascript:PageMove(${pagingVO.nextPageNo})">뒤로</a></li>&nbsp;&nbsp;
									<li><a href="javascript:PageMove(${pagingVO.finalPageNo})">맨뒤로</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var currentUserId1 = '${sessionScope.memberVO.member_id}';
function filterRows() {
    var rows = document.querySelectorAll(".table.table-bordered tr:not(.btn)"); // 수정된 셀렉터

    var currentUserId = currentUserId1.trim().toLowerCase(); // 현재 사용자 ID 가져오기

    console.log(currentUserId);

    rows.forEach(function(row) {
        var writerCell = row.querySelector("td:nth-child(3)");
        var parentCell = row.querySelector("td:nth-child(6)");

        if (writerCell && parentCell) {
            var writer = writerCell.innerText.trim().toLowerCase();
            var parent = parentCell.innerText.trim().toLowerCase();

            console.log("writer:", writer);
            console.log("parent:", parent);

            // 작성자가 현재 사용자와 같거나 parent가 현재 사용자와 같을 때 해당 row를 표시
            if (writer === currentUserId || parent === currentUserId) {
                row.style.display = "table-row";
            } else {
                row.style.display = "none";
            }
        }
    });
}

window.onload = function() {
    var button = document.getElementById("filterButton"); // 버튼의 ID에 맞게 수정
    button.addEventListener("click", filterRows);
}
</script>

<%@ include file="/WEB-INF/views/bottom.jsp"%>