<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/wow/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/easing/easing.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/lib/owlcarousel/owl.carousel.min.js"></script>
<!-- Template Javascript -->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

<head>
    <meta charset="UTF-8">
    <title>라이북러리 Li-book-lary</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
    <style>
		.text-custom { /* 글자 색깔 */
	  		color: #9BE8D8;
		}
		
		.bg-color{ /* footer 배경색 */
			background-color: 98EECC; 
		}
		
	</style>
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	
    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-custom" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
        <a href="index.do" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            <h2 class="m-0 text-custom"><i class="fas fa-book"></i>&nbsp;라이북러리 Li-book-lary</h2>
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
	          
	            <c:if test="${not empty sessionScope.memberVO}">
	            	<c:if test="${sessionScope.memberVO.member_id=='admin' }">
		            	<a href="categoryFind.do" class="nav-item nav-link">카테고리 목록</a>
		            	<a href="addCategory.do" class= "nav-item nav-link">카테고리 등록</a>
		            	<a href="addBook.do" class="nav-item nav-link">신간 등록</a>
		            	<a href="memberList.do" class="nav-item nav-link">회원목록</a>
						<a href="deleteMember.do" class="nav-item nav-link">회원삭제</a>
		            	<a href="getbook.do" class="nav-item nav-link">재고 관리</a>
		            	<a href="everyOrder.do" class="nav-item nav-link">배송 정보</a>
		            	<a href="listBoard.do" class="nav-item nav-link">QNA 확인</a>
	            	</c:if>
	            	<c:if test="${sessionScope.memberVO.member_id !='admin' }">
		            	<a href="mypage.do" class="nav-item nav-link">내 정보</a>
		            	<a href="goBasket.do?member_num=${sessionScope.memberVO.member_num }" class="nav-item nav-link">내 장바구니</a>
		            	<a href="orderChk.do?member_num=${sessionScope.memberVO.member_num }" class="nav-item nav-link">내 주문내역/배송상태</a>	
	            	</c:if>
	            </c:if>
	            <a href="index.do" class="nav-item nav-link active">홈</a>
	            
            </div>
            <c:if test="${empty sessionScope.memberVO}">
            	<a href="loginForm.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그인<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
            <c:if test="${not empty sessionScope.memberVO}">
            	<a href="logout.do" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
        	</c:if>
        </div>
    </nav>
    <!-- Navbar End -->