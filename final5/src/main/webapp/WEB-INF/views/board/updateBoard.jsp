<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- listBoard.jsp -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<script type="text/javascript">
		function check(){
			if (f.subject.value==""){
				alert("제목을 입력해 주세요!!")
				f.subject.focus()
				return false
			}
			if (f.content.value==""){
				alert("내용을 입력해 주세요!!")
				f.content.focus()
				return false
			}
			return true
		}
	</script>

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
                <h6 class="bg-white text-center text-custom px-3">UPDATE BOARD</h6>
                <h1 class="mb-5 text-custom">글수정</h1>
        </div>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
			    <form name="f" action="updateBoard.do" method="post" onsubmit="return check()">
			    	<input type="hidden" name="board_number" value="${boardVO.board_number}"/>
					<table class="table table-bordered">
						<tr align="center">
							<th width="20%">작 성 자</th>
							<td><input type="text" name="board_writer" size="50" value="${boardVO.board_writer}" readOnly></td> <!-- ${sessionScope.memberVO.member_name} -->
						</tr> 
						<tr align="center">
							<th width="20%">제 목</th>
							<td><input type="text" name="board_subject" size="50" value="${boardVO.board_subject}"></td>
						</tr>
						<tr align="center">
							<th width="20%">내 용</th>
							<td><textarea name="board_content" rows="13" cols="50">${boardVO.board_content}</textarea></td>
						</tr>
						<tr align="center">
							<td colspan="2" align="right">
								<input type="submit" value="글수정" class="btn btn-primary">
								<input type="reset" value="다시작성" class="btn btn-primary">
								<input type="button" value="목록보기" onclick="window.location='listBoard.do'" class="btn btn-primary">
							</td>
						</tr>
				        </table>
			    </form>
		    </div>
		  </div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/bottom.jsp"%>