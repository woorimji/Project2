<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/top.jsp"%>


<c:import url="/header" />

<style>
.cover {margin-top: 30px;}

.title{margin-bottom:20px;}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

#pwConfirm {
	color: #008000;
	display: none;
}

#pwConfirmFail {
	color: #6A82FB;
	display: none;
}

#emailConfirm {
	color: #008000;
	display: none;
}
#emailConfirmFail {
	color: #6A82FB;
	display: none;
}

#telConfirm {
	color: #008000;
	display: none;
}
#telConfirmFail {
	color: #6A82FB;
	display: none;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- !!!!!!아이디중복체크!!!!!! -->
<script>
	function checkId() {
		var member_id = $('#member_id').val();
		$.ajax({
			url : 'idCheck.do',
			type : 'post',
			data : {
				member_id : member_id
			},
			success : function(cnt) {
				if (cnt == 0) {
					$('.id_ok').css("display", "inline-block");
					$('.id_already').css("display", "none");
				}else if(member_id == null){
					alert('아이디를 입력해주세요.');
				}
				
				else {
					$('.id_already').css("display", "inline-block");
					$('.id_ok').css("display", "none");
					$('#member_id').val('');
				}
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	};
</script>

<!-- !!!!!!비밀번호 확인 체크!!!!!!! -->
<script>
function pwCheck(){
    if($('#member_pw').val() == $('#member_pw_check').val()){
        $('#pwConfirm').css('display', 'inline-block');
        $('#pwConfirmFail').css('display', 'none');
    }else{
    	$('#pwConfirmFail').css('display', 'inline-block');
        $('#pwConfirm').css('display', 'none');
       
    }
}
</script>

<!-- !!!!!!이메일 중복체크!!!!!! -->
<script>
function checkEmail() {
	var member_email = $('#member_email').val();
	$.ajax({
		url : 'emailCheck.do',
		type : 'post',
		data : {
			member_email : member_email
		},
		success : function(cnt) {
			if (cnt == 0) {
				$('#emailConfirm').css("display", "inline-block");
				$('#emailConfirmFail').css("display", "none");
			} else {
				$('#emailConfirmFail').css("display", "inline-block");
				$('#emailConfirm').css("display", "none");
				$('#member_email').val('');
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
};
</script>

<!-- !!!!!!전화번호 중복체크!!!!!! -->
<script>
function checkTel() {
	var member_tel = $('#member_tel').val();
	$.ajax({
		url : 'telCheck.do',
		type : 'post',
		data : {
			member_tel : member_tel
		},
		success : function(cnt) {
			if (cnt == 0) {
				$('#telConfirm').css("display", "inline-block");
				$('#telConfirmFail').css("display", "none");
			} else {
				$('#telConfirmFail').css("display", "inline-block");
				$('#telConfirm').css("display", "none");
				$('#member_tel').val('');
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
};
</script>


<!-- !!!!!!주소!!!!!! -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPost() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						document.getElementById('postcode').value = data.zonecode
						if (data.userSelectedType == 'J') {
							document.getElementById('address').value = data.jibunAddress
						} else {
							document.getElementById('address').value = data.roadAddress
						}
						document.getElementById('detailAddress').focus();

					}
				}).open();
	}
</script>

<div align="center" class="cover">

	<h1 class="title">회원가입</h1>
	<form action="createAccount.do" method="post" id="f">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="member_id" placeholder="아이디" class="form-control"
					id="member_id" oninput="checkId()" required></td>
				<td><span class="id_ok">&nbsp;사용 가능한 아이디입니다.</span><span
					class="id_already">&nbsp;이미 사용중인 아이디입니다.</span>
				</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="member_pw" placeholder="비밀번호" class="form-control"
					id="member_pw"  oninput="pwCheck()" required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="member_pw_check" class="form-control"
					placeholder="비밀번호 확인 " id="member_pw_check" oninput="pwCheck()" required>
				</td>
				<td>
					<span id="pwConfirm">&nbsp;비밀번호가 일치합니다.</span>
					<span id="pwConfirmFail">&nbsp;비밀번호가 틀립니다. </span>
				</td>
				
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="member_name" id="username" class="form-control"
					placeholder="이름" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="member_email" id="member_email" placeholder="이메일" oninput="checkEmail()" class="form-control" required></td>
				<td>
				<span id="emailConfirm">&nbsp;사용 가능한 이메일입니다.</span>
				<span class="email_already" id="emailConfirmFail">&nbsp;이미 사용중인 이메일입니다.</span>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="member_tel" placeholder="전화번호" class="form-control" id="member_tel" class="member_tel" oninput="checkTel()"></td>
				<td>
				<span id="telConfirm">&nbsp;사용 가능한 전화번호입니다.</span>
				<span class="tel_already" id="telConfirmFail">&nbsp;이미 사용중인 전화번호입니다.</span>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" name="postcode" id="postcode"
					placeholder="우편번호" readonly="readonly"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="member_address" id="address" class="form-control"
					placeholder="주소"></td>
				<td><input type="button" onclick="daumPost()" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="detail" id="detailAddress"
					placeholder="상세주소"></td>
			</tr>


			<tr>
				<td colspan="3"><input type="submit" value="회원가입" class="btn btn-primary form-control"></td>
			</tr>
			<tr>
				<td colspan=3>
					<input type="button" value="뒤로가기" class="btn btn-primary form-control" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>


</div>
<c:import url="/footer" />
<%@ include file="/WEB-INF/views/bottom.jsp"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/top.jsp"%>


<c:import url="/header" />

<style>
.cover {margin-top: 30px;}

#title{margin-bottom:20px; margin-top: 30px; color:#9BE8D8;}

.id_ok {
	color: #008000;
	display: none;
}

.id_already {
	color: #6A82FB;
	display: none;
}

#pwConfirm {
	color: #008000;
	display: none;
}

#pwConfirmFail {
	color: #6A82FB;
	display: none;
}

#emailConfirm {
	color: #008000;
	display: none;
}
#emailConfirmFail {
	color: #6A82FB;
	display: none;
}

#telConfirm {
	color: #008000;
	display: none;
}
#telConfirmFail {
	color: #6A82FB;
	display: none;
}
.btn1 {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	margin-left: 3px;
	margin-right: 0px;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- !!!!!!아이디중복체크!!!!!! -->
<script>
	function checkId() {
		var member_id = $('#member_id').val();
		$.ajax({
			url : 'idCheck.do',
			type : 'post',
			data : {
				member_id : member_id
			},
			success : function(cnt) {
				if (cnt == 0) {
					$('.id_ok').css("display", "inline-block");
					$('.id_already').css("display", "none");
				}else if(member_id == null){
					alert('아이디를 입력해주세요.');
				}
				
				else {
					$('.id_already').css("display", "inline-block");
					$('.id_ok').css("display", "none");
					$('#member_id').val('');
				}
			},
			error : function() {
				alert("에러입니다.");
			}
		});
	};
</script>

<!-- !!!!!!비밀번호 확인 체크!!!!!!! -->
<script>
function pwCheck(){
    if($('#member_pw').val() == $('#member_pw_check').val()){
        $('#pwConfirm').css('display', 'inline-block');
        $('#pwConfirmFail').css('display', 'none');
    }else{
    	$('#pwConfirmFail').css('display', 'inline-block');
        $('#pwConfirm').css('display', 'none');
       
    }
}
</script>

<!-- !!!!!!이메일 중복체크!!!!!! -->
<script>
function checkEmail() {
	var member_email = $('#member_email').val();
	$.ajax({
		url : 'emailCheck.do',
		type : 'post',
		data : {
			member_email : member_email
		},
		success : function(cnt) {
			if (cnt == 0) {
				$('#emailConfirm').css("display", "inline-block");
				$('#emailConfirmFail').css("display", "none");
			} else {
				$('#emailConfirmFail').css("display", "inline-block");
				$('#emailConfirm').css("display", "none");
				$('#member_email').val('');
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
};
</script>

<!-- !!!!!!전화번호 중복체크!!!!!! -->
<script>
function checkTel() {
	var member_tel = $('#member_tel').val();
	$.ajax({
		url : 'telCheck.do',
		type : 'post',
		data : {
			member_tel : member_tel
		},
		success : function(cnt) {
			if (cnt == 0) {
				$('#telConfirm').css("display", "inline-block");
				$('#telConfirmFail').css("display", "none");
			} else {
				$('#telConfirmFail').css("display", "inline-block");
				$('#telConfirm').css("display", "none");
				$('#member_tel').val('');
			}
		},
		error : function() {
			alert("에러입니다.");
		}
	});
};
</script>


<!-- !!!!!!주소!!!!!! -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumPost() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						document.getElementById('postcode').value = data.zonecode
						if (data.userSelectedType == 'J') {
							document.getElementById('address').value = data.jibunAddress
						} else {
							document.getElementById('address').value = data.roadAddress
						}
						document.getElementById('detailAddress').focus();

					}
				}).open();
	}
</script>

<div align="center" class="cover">

	<h2 id="title">회원가입</h2>
	<form action="createAccount.do" method="post" id="f">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="member_id" placeholder="아이디" class="form-control"
					id="member_id" oninput="checkId()" required></td>
				<td><span class="id_ok">&nbsp;사용 가능한 아이디입니다.</span><span
					class="id_already">&nbsp;이미 사용중인 아이디입니다.</span>
				</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="member_pw" placeholder="비밀번호" class="form-control"
					id="member_pw"  oninput="pwCheck()" required></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="member_pw_check" class="form-control"
					placeholder="비밀번호 확인 " id="member_pw_check" oninput="pwCheck()" required>
				</td>
				<td>
					<span id="pwConfirm">&nbsp;비밀번호가 일치합니다.</span>
					<span id="pwConfirmFail">&nbsp;비밀번호가 틀립니다. </span>
				</td>
				
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="member_name" id="username" class="form-control"
					placeholder="이름" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="member_email" id="member_email" placeholder="이메일" oninput="checkEmail()" class="form-control" required></td>
				<td>
				<span id="emailConfirm">&nbsp;사용 가능한 이메일입니다.</span>
				<span class="email_already" id="emailConfirmFail">&nbsp;이미 사용중인 이메일입니다.</span>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="member_tel" placeholder="-없이 입력해주세요" class="form-control" id="member_tel" class="member_tel" oninput="checkTel()"
				minlength="11"></td>
				<td>
				<span id="telConfirm">&nbsp;사용 가능한 전화번호입니다.</span>
				<span class="tel_already" id="telConfirmFail">&nbsp;이미 사용중인 전화번호입니다.</span>
				</td>
			</tr>
			<tr>
				<td><input type="hidden" name="postcode" id="postcode"
					placeholder="우편번호" readonly="readonly"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="member_address" id="address" class="form-control"
					placeholder="주소"></td>
				<td><input type="button" onclick="daumPost()" value="우편번호 찾기" class="btn1"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="detail" id="detailAddress"
					placeholder="상세주소"></td>
			</tr>


			<tr>
				<td colspan="3"><input type="submit" value="회원가입" class="btn btn-primary form-control"></td>
			</tr>
			<tr>
				<td colspan=3>
					<input type="button" value="뒤로가기" class="btn btn-primary form-control" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>


</div>
<c:import url="/footer" />
<%@ include file="/WEB-INF/views/bottom.jsp"%>