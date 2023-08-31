<%@page import="com.yakaja.vo.PagingVO"%>
<%@page import="com.yakaja.vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yakaja.dao.YakajaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="top.jsp"%>
<%-- <%@ include file="mainStyle.jsp" %> --%>

<!-- writeReview -->
<!-- 게시판 리뷰목록 -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	YakajaDAO tidao = new YakajaDAO();
	PagingVO paging = (PagingVO)request.getAttribute("paging");
	int total = paging.getTotalCount();		
	out.println("전체 게시물 : " + total);
	ArrayList<ReviewVO> list = (ArrayList<ReviewVO>)request.getAttribute("list");
	
%>

<script>
function PageMove(page){
    location.href = "paging.do?page="+page;
  }
</script>
 
<!-- 드롭다운 -->
<form style="float:right; margin-right:200px;">
<select id="orderSelect">
	<option value="scoreOrder">평점순</option>
	<option value="nameOrder">호텔명순</option>
</select>
<select id="sortSelect">
	<option value="descOrder">내림차순</option>
	<option value="ascOrder">오름차순</option>
</select>
</form>
<br><br>

<!-- redirectHotel -->

<!-- reviewTable출력 -->
<table class="reviewTable">
	<thead>
	<tr>
		<th id="nameColumn">호텔</th>
		<th id="titleColumn">제목</th>
		<th id="writerColumn">닉네임</th>
		<th id="contentColumn">내용</th>
		<th id="scoreColumn">평점</th>
	</tr>
	</thead>


	<tbody>
	<% for(ReviewVO imsi : list){ %>
	<tr>	
		<td><%= imsi.getHotel_id() %></td>
		<td><%= imsi.getReview_title() %></td>
		<td><%= imsi.getMem_name() %></td>
		<td>
		<%= imsi.getReview_content()%>
		<!-- 눌렀을때 커짐 -->
	
		</td>
		<td>
		<%
			String scoreOne = imsi.getReview_score();
			Double scoreTwo = Double.parseDouble(scoreOne);
			int scoreIpart = (int) Math.floor(scoreTwo);
			Double scoreDpart = scoreTwo-scoreIpart;
			String scoreResult = String.format("%.1f", scoreDpart);
			double scoreDouble = Double.parseDouble(scoreResult) * 10;
			String scoreFinal = "";
			if(scoreDouble >= 5){
				scoreFinal = scoreIpart + ".5";
			}else if(scoreDouble < 5){
				scoreFinal = String.valueOf(scoreIpart);
			}
		%>	
		<img src="img/score/score<%=scoreFinal%>.png">
		<%
			out.print(imsi.getReview_score());
		%>
		
		</td>
		<td>	
    		<input type="button" value="호텔로 이동" onclick="location.href='goHotel.do?hotel_name=<%=imsi.getHotel_name()%>'" style="background-color:#97DEFF;">
		</td>
		
	</tr>
	<%} %>
	</tbody>
</table>

<style>
  .toolbar-bottom {
    display: flex;
    justify-content: center;
  }
</style>

<div class="toolbar-bottom">
  <div class="toolbar mt-lg">
    <div class="sorter">
      <ul class="pagination">
        <li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>&nbsp;&nbsp;
        <li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>&nbsp;&nbsp;
              <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
                  <c:choose>
                      <c:when test="${i eq paging.pageNo}">
                		<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>&nbsp;&nbsp;
                      </c:when>
                      <c:otherwise>
                        <li><a href="javascript:PageMove(${i})">${i}</a></li>&nbsp;&nbsp;
                      </c:otherwise>
                  </c:choose>
              </c:forEach>
        <li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>&nbsp;&nbsp;
        <li><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
      </ul>
    </div>
  </div>
</div>

<%@ include file="bottom.jsp"%>