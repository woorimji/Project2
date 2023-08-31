<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 등록 페이지입니다.</title>
</head>
<body>

    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="bg-white text-center text-primary px-3">Join</h6>
                <h1 class="mb-5">호텔등록</h1>
        </div>
        <div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
<form action="hoteljoin.do" method="post" id="form">
<table class="table table-bordered">
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">호텔이름</span>
						</h5>
					</td>
					<td>
						<span style="flex-grow: 1;">
							<input type="text" name="HOTEL_NAME" value="hotel_name" class="form-control" required>
						</span>
					</td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">호텔주소</span>
						</h5>
					</td>
		            <td><input type="text" name="HOTEL_ADDRESS"  value ="hotel_address" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">a방가격</span>
						</h5>
					</td>
		            <td><input type="text" name="ROOM_APRICE" value = "room_aprice" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">b방가격</span>
						</h5>
					</td >
		            <td><input type="text" name="ROOM_BPRICE" value = "room_bprice" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
					    <h5 align="center" class="text-primary">
					    	<span style="flex-grow: 1;">c방가격</span>
						</h5>
					</td>
		            <td><input type="text" name="ROOM_CPRICE" value = "room_cprice" class="form-control" required></td>
		          </tr>
		          <tr>   
					<td>
		            <td>
		            	<div align="center" class="text-primary">
							<span style = "flex-grow: 1;">와이파이유무</span>
							<input type="checkbox" name="HOTEL_WIFI" value="hotel_wifi"><br>
		            	</div>
		            </td>
		     
		          </tr>
		          <tr>   
					<td>
		            <td>
		            	<div align="center" class="text-primary">
							<span style = "flex-grow: 1;">반려동뭉 수용유무</span>
							<input type="checkbox" name="HOTEL_PET" value="hotel_pet"><br>
		            	</div>
		            </td>
		     
		          </tr>
		          
		          <tr>   
					<td>
		            <td>
		            	<div align="center" class="text-primary">
							<span style = "flex-grow: 1;">조식 제공 여부</span>
							<input type="checkbox" name="HOTEL_BF" value="hotel_bf"><br>
		            	</div>
		            </td>
		     
		          </tr>
		          
		          <tr>   
					<td>
		            <td>
		            	<div align="center" class="text-primary">
							<span style = "flex-grow: 1;">룸서비스 여부</span>
							<input type="checkbox" name="HOTEL_RS" value="hotel_rs"><br>
		            	</div>
		            </td>
		     
		          </tr>
		          
		          <tr>   
					<td>
		            <td>
		            	<div align="center" class="text-primary">
							<span style = "flex-grow: 1;">흡연가능 여부</span>
							<input type="checkbox" name="HOTEL_CIGA" value="hotel_ciga"><br>
		            	</div>
		            </td>
		     
		          </tr>
		          
		          <tr>   
					<td>
		            <td>
		            	<div align="center" class="text-primary">
							<span style = "flex-grow: 1;">개별욕실/화장실</span>
							<input type="checkbox" name="HOTEL_WC" value="hotel_wc"><br>
		            	</div>
		            </td>
		     
		          </tr>
		          
		          
		          <tr>
		            <td colspan="2" align="center">
		            	<input type="submit" value="호텔 등록" onclick="location.href='index.jsp'" class="btn btn-primary">
		            	
		            </td>
		          </tr>
		        </table>
		      </form>
		    </div>
		  </div>
		</div>
</body>

</html>
<%@ include file="bottom.jsp"%>