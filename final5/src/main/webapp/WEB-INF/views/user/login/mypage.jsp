<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
   .input {border:0; border-radius:5px;}
   #address{width:70%}
    #title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;} 
</style>

<script
   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function daumPost() {
      new daum.Postcode(
            {
               oncomplete : function(data) {

                  // document.getElementById('postcode').value = data.zonecode
                  if (data.userSelectedType == 'J') {
                     document.getElementById('address').value = data.jibunAddress
                  } else {
                     document.getElementById('address').value = data.roadAddress
                  }
                  // document.getElementById('detailAddress').focus();

               }
            }).open();
   }
</script>
</head>
<body>
<BR><BR><BR>
   <div class="cover" align="center">
   <h2 id=title>마이페이지</h2>
   <form method="post">
   <table border="1" class="table table-hover table-border" style="width:50%">
      <tr><td>아이디</td><td><input type="text" value="${sessionScope.memberVO.member_id}" name="member_id" class="input" readonly></td></tr>
      <tr><td>비밀번호</td><td><input type="password" value="${sessionScope.memberVO.member_pw}" class="input" name="member_pw"></td></tr>
      <tr><td>이름</td><td><input type="text" value="${sessionScope.memberVO.member_name}" class="input" name="member_name"></td></tr>
      <tr><td>이메일</td><td><input type="email" value="${sessionScope.memberVO.member_email}" class="input" name="member_email"></td></tr>
      <tr><td>전화번호</td><td><input type="tel" value="${sessionScope.memberVO.member_tel}" class="input" name="member_tel"></td></tr>
      <tr><td>주소</td><td><input type="text" value="${sessionScope.memberVO.member_address}" class="input" name="member_address" id="address">
      <input type="button" onclick="daumPost()" value="우편번호 찾기"></td></tr>
      <tr><td>포인트</td><td>${sessionScope.memberVO.member_point}</td></tr>
      <table>
         <tr>
            <td><input type="submit" formaction="updateMyInfo.do" class="btn btn-primary form-control" value="수정하기"></td>
            <td><input type="submit" formaction="deleteMyInfo.do" class="btn btn-primary form-control" value="회원탈퇴"></td>
         </tr>
      </table>
   </table>
   </form>
   </div>
</body>
</html>
<%@ include file="/WEB-INF/views/bottom.jsp"%>