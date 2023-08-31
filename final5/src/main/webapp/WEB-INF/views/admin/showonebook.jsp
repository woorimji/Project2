<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- index.jsp -->
<style>
input[type=text]{
	
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
</style>
<%@ include file="/WEB-INF/views/top.jsp"%>
	<h1 align="center">모든책</h1>
	<form action="updatebook.do" method="post">
	<table border="2" align="center" style="width:80%;">
	
	  <c:forEach var="imsi" items="${blist}">
		  <tr align="center">
			<td>isbn번호</td><td><input type="text" style="color:white;" style="background-color:gray;" name="book_isbn"  value="${imsi.book_isbn}" readonly></td>
		  </tr>
		
		<tr align="center">
			<td>도서명</td><td><input type="text" style="color:white;" style="background-color:gray;" name="book_name" value="${imsi.book_name}" readonly></td>
		  </tr>
		  
		  <tr align="center">
			<td>저자</td><td><input type="text" style="color:white;" style="background-color:gray;" name="book_writer" value="${imsi.book_writer}" readonly></td>
		  </tr>
		  
		 <tr align="center">
			<td>가격</td><td><input type="text" style="color:white;" style="background-color:gray;" name="book_price" value="${imsi.book_price}" readonly></td>
		  </tr>
		  
		  <tr align="center">
			<td>재고</td><td><input type="text" name="book_qry" value="${imsi.book_qry}"></td>
		  </tr>
			<tr>
				<td><input type="submit" value="업데이트">
			</tr>
			
			
			<td>${imsi.book_img}</td>
			<td>${imsi.BOOK_CATEGORY}</td>
			
			<td>${imsi.BOOK_POINT}</td>
		  
	  </c:forEach>
	  	
		  <tr align="center">
			<td>isbn번호</td><td><input type="text"  name="book_isbn"  value="${a}" readonly></td>
		  </tr>
		
		<tr align="center">
			<td>도서명</td><td><input type="text"  name="book_name" value="${b}" readonly></td>
		  </tr>
		  
		  <tr align="center">
			<td>저자</td><td><input type="text" name="book_writer" value="${c}" readonly></td>
		  </tr>
		  
		 <tr align="center">
			<td>가격</td><td><input type="text"  name="book_price" value="${d}" readonly></td>
		  </tr>
		  
		  <tr align="center">
			<td>재고</td><td><input type="text" name="book_qry" value="${e}"></td>
		  </tr>
			<tr>
				<td><input type="submit" value="업데이트">
			</tr>
			
			
			<td>${imsi.book_img}</td>
			<td>${imsi.BOOK_CATEGORY}</td>
			
			<td>${imsi.BOOK_POINT}</td>
	</tbody>
	</table>
	</form>
	

<%@ include file="/WEB-INF/views/bottom.jsp"%> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- index.jsp -->
<style>
input[type=text]{
	
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}
</style>
<%@ include file="/WEB-INF/views/top.jsp"%>

	<h1 align="center"><a href="goshowallbook.do">모든책</a></h1>
	<form action="updatebook.do" method="post">
	<table border="2" align="center" style="width:80%;">
	  	
		  <tr align="center">
			<td colspan=3>isbn번호</td><td colspan=3><input type="text"  name="book_isbn"  value="${a}" readonly></td>
		  </tr>
		
		<tr align="center">
			<td colspan=3>도서명</td><td colspan=3><input type="text"  name="book_name" value="${b}" readonly></td>
		  </tr>
		  
		  <tr align="center">
			<td colspan=3>저자</td><td colspan=3><input type="text" name="book_writer" value="${c}" readonly></td>
		  </tr>
		  
		 <tr align="center">
			<td colspan=3>가격</td><td colspan=3><input type="text"  name="book_price" value="${d}" readonly></td>
		  </tr>
		  
		  <tr align="center">
			<td colspan=3>재고</td><td colspan=3><input type="text" id="res" name="book_qry" value="${e}"></td>
		  </tr>
		  <tr align="center">
		  	<td>
		  		<input type='button' onclick='count("minusten")' value='-10'/>
		  	</td>
		  	<td>
		  		<input type='button' onclick='count("minusfive")' value='-5'/>
		  	</td>
		  	<td>
		  		<input type='button' onclick='count("minusone")' value='-1'/>
		  	</td>
		  	<td>
		  		<input type='button' onclick='count("plusone")' value='+1'/>
		  	</td>
		  	<td>
		  		<input type='button' onclick='count("plusfive")' value='+5'/>
		  	</td>
		  	<td>
		  		<input type='button' onclick='count("plusten")' value='+10'/>
		  	</td>
		  </tr>
			<tr align="center">
				<td><input type="submit" value="업데이트">
			</tr>
			<script>
function count(type)  {
	  /* var id = $('#res').val();
		console.log(id); 

	  
	  var number =id; */
	  
	  var number = $('#res').val();
	  // 현재 화면에 표시된 값
	  
	  
	  
	  if(type === 'minusten') {
	    number = parseInt(number) -10;
	  }
	  else if(type === 'minusfive')  {
	    number = parseInt(number) - 5;
	  }
	  else if(type === 'minusone')  {
		    number = parseInt(number) - 1;
		  }
	  else if(type === 'plusone')  {
		    number = parseInt(number) +1;
		  }
	  else if(type === 'plusfive')  {
		    number = parseInt(number) + 5;
		  }
	  else if(type === 'plusten')  {
		    number = parseInt(number) +10;
		  }
	  
	  
	  // 결과 출력
	 	//$('res').val(number);
	  $('#res').attr("value",number)
	  
	}
</script>
			
			<%-- <td>${imsi.book_img}</td>
			<td>${imsi.BOOK_CATEGORY}</td> --%>
			
			<%-- <td>${imsi.BOOK_POINT}</td> --%>
	</tbody>
	</table>
	</form>

<%@ include file="/WEB-INF/views/bottom.jsp"%>

