<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- writeBoard.jsp -->
<%@ include file="/WEB-INF/views/top.jsp"%>

<div class="container-xxl py-5">
	<div class="container">
    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-custom px-3">DELETE</h6>
                <h1 class="mb-5 text-custom">글삭제</h1>
        </div>
		<div class="container col-lg-8">
		  <div class="row justify-content-center">
		    <div class="table-responsive">
		    	<form name="f" action="deleteBoard.do" method="post">
					<input type="hidden" name="board_number" value="${boardVO.board_number}"/>
			    	<table class="table table-bordered">
						<tr align="center">
							<th>비밀번호를 입력해주세요</th>	
						</tr> 
						<tr align="center">
							<td><input type="password" name="member_pw" size="50"></td>
						</tr>
						<tr align="center">
							<td colspan="2" align="right">
								<input type="submit" value="글삭제" class="btn btn-primary">
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