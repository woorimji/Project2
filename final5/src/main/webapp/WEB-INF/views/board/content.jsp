<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- listBoard.jsp -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<style>
  th, td {
    text-align: center;
  }
  
  td.left {
  	text-align: left;
  }
  
</style>

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-custom px-3">CONTENT</h6>
                <h1 class="mb-5 text-custom">글보기</h1>
        </div>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		        <table class="table table-bordered">
		        	<tr>
				    	<th width="20%">글번호</th>
				    	<td>${boardVO.board_number}</td>
				    	<th width="20%">조회수</th>
				    	<td>${boardVO.board_count}</td>
				  	</tr>
				  	<tr>
				    	<th width="20%">작성자</th>
				    	<td>${boardVO.board_writer}</td>
				    	<th width="20%">작성일</th>
				    	<td>${boardVO.board_date}</td>
			      	</tr>
					<tr>
						<th width="20%">제목</th>
						<td colspan="3">
							${boardVO.board_subject}
						</td>
					</tr>
					<tr>
						<th width="20%">내용</th>
						<td colspan="3" class="left">
							${boardVO.board_content}
						</td>
					</tr>
		          	<tr>
		          		<td colspan="4" align="right">

							<c:if test="${sessionScope.memberVO.member_id eq 'admin'}">
					<input type="button" value="답글쓰기" class="btn btn-primary" id="dap" style=""
						onclick="window.location='writeBoard.do?board_number=${boardVO.board_number}&board_step=${boardVO.board_step}&board_level=${boardVO.board_level}&board_parent=${boardVO.board_writer}'">
				</c:if>
								<input type="button" value="글수정" class="btn btn-primary"
									onclick="window.location='updateBoard.do?board_number=${boardVO.board_number}'">
								<input type="button" value="글삭제" class="btn btn-primary"
									onclick="window.location='deleteBoard.do?board_number=${boardVO.board_number}'">
														
								<input type="button" value="글목록"  class="btn btn-primary"
									onclick="window.location='listBoard.do'">
		          		</td>
		          	</tr> 
		        </table>
		    </div>
		  </div>
		</div>
	</div>
</div>


<%@ include file="/WEB-INF/views/bottom.jsp"%>