<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 페이지입니다.</title>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
		<h6 class="bg-white text-center text-primary px-3"></h6>
		<h1 class="mb-5">회원 삭제</h1>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<form action="delete.do" method="post">
					<input type="hidden" name="action" value="confirm"> <input
						type="hidden" name="MEM_ID" value="confirm">

					<div class="d-flex justify-content-center">
						<div class="text-center">
							<h3 class="text-primary">
								비밀번호 입력 <input type="password" name="MEM_PW"
									placeholder="비밀번호 입력" required>

								<button type="submit" class="btn btn-primary btn-lg">확인</button>
							</h3>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
</body>
</html>
<%@ include file="bottom.jsp"%>
