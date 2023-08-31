<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
<c:if test="${listReserv == null}">
   <p>No reservation information found.</p>
</c:if> --%>

<form action="resvdelete.do" method="post">
<table>
   <tr>
      <th>예약 ID</th>
      <th>방번호</th>
      <th>호텔 ID</th>
      <th>방 가격</th>
      <th>체크인날짜</th>
      <th>체크아웃날짜</th>
      <th>Member ID</th>
   </tr>
   <c:forEach var="reservVO" items="${listReserv}">
      <tr>
         <td><input type=checkbox name = reserv_id value=${reservVO.reserv_id}></td>
         <td>${reservVO.room_num}</td>
         <td>${reservVO.hotel_id}</td>
         <td>${reservVO.room_price}</td>
         <td>${reservVO.reserv_in}</td>
         <td>${reservVO.reserv_out}</td>
         <td>${reservVO.mem_id}</td>
      </tr>
   </c:forEach>
</table>

            
            <input type="submit" value="예약 삭제">
        </form>