<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/top.jsp"%>
<!-- index.jsp -->

<style>
details > summary {
  padding: 4px;
  left:47%;
  background-color: #eeeeee;
  border: none;
  box-shadow: 1px 1px 2px #bbbbbb;
  cursor: pointer;
}

details > p {
  background-color: #eeeeee;
  padding: 4px;
  margin: 0;
  box-shadow: 1px 1px 2px #bbbbbb;
}
form{
	
        top: 40px;
}
a {

display: block;

text-align: center;

}
div.range-slider {
  position: relative;
  left:34%;
  /* margin:0 auto; */
  float: left;
  text-align: center;
}
div.range-slider input[type=range] {
  pointer-events: none;
  position: absolute;
  -webkit-appearance: none;
  -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
  border: none;
  border-radius: 14px;
  background: #F1EFEF;
  box-shadow: inset 0 1px 0 0 #cdc6c6, inset 0 -1px 0 0 #d9d4d4;
  -webkit-box-shadow: inset 0 1px 0 0 #cdc6c6, inset 0 -1px 0 0 #d9d4d4;
  overflow: hidden;
  left: 0;
  top: 50px;
  width: 300px;
  outline: none;
  height: 20px;
  margin: 0;
  padding: 0;
}
div.range-slider input[type=range]::-webkit-slider-thumb {
  pointer-events: all;
  position: relative;
  z-index: 1;
  outline: 0;
  -webkit-appearance: none;
  width: 20px;
  height: 20px;
  border: none;
  border-radius: 14px;
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #dad8da), color-stop(100%, #413F41));
  /* android <= 2.2 */
  background-image: -webkit-linear-gradient(top, #dad8da 0, #413F41 100%);
  /* older mobile safari and android > 2.2 */
  background-image: linear-gradient(to bottom, #dad8da 0, #413F41 100%);
  /* W3C */
}
div.range-slider input[type=range]::-moz-range-thumb {
  pointer-events: all;
  position: relative;
  z-index: 10;
  -moz-appearance: none;
  width: 20px;
  height: 20px;
  border: none;
  border-radius: 14px;
  background-image: linear-gradient(to bottom, #dad8da 0, #413F41 100%);
  /* W3C */
}
div.range-slider input[type=range]::-ms-thumb {
  pointer-events: all;
  position: relative;
  z-index: 10;
  -ms-appearance: none;
  width: 20px;
  height: 20px;
  border-radius: 14px;
  border: 0;
  background-image: linear-gradient(to bottom, #dad8da 0, #413F41 100%);
  /* W3C */
}
div.range-slider input[type=range]::-moz-range-track {
  position: relative;
  z-index: -1;
  background-color: black;
  border: 0;
}
div.range-slider input[type=range]:last-of-type::-moz-range-track {
  -moz-appearance: none;
  background: none transparent;
  border: 0;
}
div.range-slider input[type=range]::-moz-focus-outer {
  border: 0;
}
</style>

	<h1 align="center">모든책</h1>
	
	
	<!-- <script type="text/javascript" src="sc.js"></script> -->
	<script>
	function getVals(){
		  // Get slider values
		  var parent = this.parentNode;
		  var slides = parent.getElementsByTagName("input");
		    var slide1 = parseFloat( slides[0].value );
		    var slide2 = parseFloat( slides[1].value );
		  // Neither slider will clip the other, so make sure we determine which is larger
		  if( slide1 > slide2 ){ var tmp = slide2; slide2 = slide1; slide1 = tmp; }
		  
		  var displayElement = parent.getElementsByClassName("rangeValues")[0];
		      displayElement.innerHTML = "최소 가격 " + slide1 + "원 ~ 최대 가격 " + slide2 + "원";
		}

		window.onload = function(){
		  // Initialize Sliders
		  var sliderdivs = document.getElementsByClassName("range-slider");
		      for( var x = 0; x < sliderdivs.length; x++ ){
		        var sliders = sliderdivs[x].getElementsByTagName("input");
		        for( var y = 0; y < sliders.length; y++ ){
		          if( sliders[y].type ==="range" ){
		            sliders[y].oninput = getVals;
		        
		            sliders[y].oninput();
		          }
		        }
		      }
		}
	</script>
	
	<details>
    <summary>검색기능 켜기</summary>
    <p style="text-align:center">
	    <form action="testsc.do" method="post" align="center">
			<div class="range-slider">
			 	<span class="rangeValues"></span>
			 	<input value="15500" min="8000" max="38000" step="500" type="range" name="sc1">
			  	<input value="30500" min="8000" max="38000" step="500" type="range" name="sc2">
			</div>
			<br><br><br><br>
			<input type="submit" value="가격대 검색">
		</form>
		<br>
	
		<form action="searchbook.do" method="post" align="center">
			도서명 검색<br>
			<input type="text" name="book_name">
			<input type="submit" value="검색하기">
		</form>
		<br>
		<form action="searchwriter.do" method="post" align="center">
			작가명 검색<br>
			<input type="text" name="book_writer">
			<input type="submit" value="검색하기">
		</form>
    </p>
	</details>
	
	
	<br><br><br><br>
	<br>
	<table border="2" align="center" style="width:80%;">
	<thead>	
		<tr>
			<td><a href="orderbynumdesc.do?">번호▼</a></td>
			<td><a href="orderbynumasc.do?">번호▲</a></td>
			<td><a href="orderbynamedesc.do">도서명▼</a></td>
			<td><a href="orderbynameasc.do">도서명▲</a></td>
			<td colspan="2"><a href="#">작가</a></td>
			<td><a href="orderbypricedesc.do">가격▼</a></td>
			<td><a href="orederbypriceacs.do">가격▲</a></td>
			<td><a href="#">재고▼</a></td>
			<td><a href="#">재고▲</a></td>
		</tr>
	
	</thead>
	<tbody> 
	  <c:forEach var="imsi" items="${alist}">
		  <tr>
			<td colspan="2"><a>${imsi.book_isbn}</a></td>
			<td colspan="2"><a href="getBookInfo.do?book_name=${imsi.book_name}">${imsi.book_name}</a></td>
			<td colspan="2"><a>${imsi.book_writer}</a></td>
			<td colspan="2"><a>${imsi.book_price}</a></td>
			<td>${imsi.book_img}</td>
			<td>${imsi.BOOK_CATEGORY}</td>
			<td colspan="2"><a>${imsi.book_qry}</a></td>
			<td>${imsi.BOOK_POINT}</td>
		  </tr>
	  </c:forEach>
	</tbody>
	</table>
	

<%@ include file="/WEB-INF/views/bottom.jsp"%> --%>

<%@page import="java.util.List"%>
<%@page import="com.itbank.libook.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- index.jsp -->
	
<style>
details > summary {
  padding: 4px;
  left:47%;
  background-color: #eeeeee;
  border: none;
  box-shadow: 1px 1px 2px #bbbbbb;
  cursor: pointer;
}

details > p {
  background-color: #eeeeee;
  padding: 4px;
  margin: 0;
  box-shadow: 1px 1px 2px #bbbbbb;
}
form{
	
        top: 40px;
}
a {

display: block;

text-align: center;

}
div.range-slider {
  position: relative;
  left:34%;
  /* margin:0 auto; */
  float: left;
  text-align: center;
}
div.range-slider input[type=range] {
  pointer-events: none;
  position: absolute;
  -webkit-appearance: none;
  -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
  border: none;
  border-radius: 14px;
  background: #F1EFEF;
  box-shadow: inset 0 1px 0 0 #cdc6c6, inset 0 -1px 0 0 #d9d4d4;
  -webkit-box-shadow: inset 0 1px 0 0 #cdc6c6, inset 0 -1px 0 0 #d9d4d4;
  overflow: hidden;
  left: 0;
  top: 50px;
  width: 300px;
  outline: none;
  height: 20px;
  margin: 0;
  padding: 0;
}
div.range-slider input[type=range]::-webkit-slider-thumb {
  pointer-events: all;
  position: relative;
  z-index: 1;
  outline: 0;
  -webkit-appearance: none;
  width: 20px;
  height: 20px;
  border: none;
  border-radius: 14px;
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #dad8da), color-stop(100%, #413F41));
  /* android <= 2.2 */
  background-image: -webkit-linear-gradient(top, #dad8da 0, #413F41 100%);
  /* older mobile safari and android > 2.2 */
  background-image: linear-gradient(to bottom, #dad8da 0, #413F41 100%);
  /* W3C */
}
div.range-slider input[type=range]::-moz-range-thumb {
  pointer-events: all;
  position: relative;
  z-index: 10;
  -moz-appearance: none;
  width: 20px;
  height: 20px;
  border: none;
  border-radius: 14px;
  background-image: linear-gradient(to bottom, #dad8da 0, #413F41 100%);
  /* W3C */
}
div.range-slider input[type=range]::-ms-thumb {
  pointer-events: all;
  position: relative;
  z-index: 10;
  -ms-appearance: none;
  width: 20px;
  height: 20px;
  border-radius: 14px;
  border: 0;
  background-image: linear-gradient(to bottom, #dad8da 0, #413F41 100%);
  /* W3C */
}
div.range-slider input[type=range]::-moz-range-track {
  position: relative;
  z-index: -1;
  background-color: black;
  border: 0;
}
div.range-slider input[type=range]:last-of-type::-moz-range-track {
  -moz-appearance: none;
  background: none transparent;
  border: 0;
}
div.range-slider input[type=range]::-moz-focus-outer {
  border: 0;
}
</style>
<%@ include file="/WEB-INF/views/top.jsp"%>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<h1 align="center"><a href="goshowallbook.do">모든책</a></h1>
	<%-- <%
	ArrayList<BookVO>list=(ArrayList<BookVO>)session.getAttribute("alist");
	String [] arr={};
	if(list!=null){
		for(int i=0;i<list.size();i++){
			arr[i]=list.get(i).getBook_name();
		}
	}
	%>
	<div>
	<%=list %>
	<%=arr %>
	<%=arr[0] %>
	<%=arr[1] %>
	</div> --%>
	<!-- <script type="text/javascript" src="sc.js"></script> -->
	<script>
	function getVals(){
		  // Get slider values
		  var parent = this.parentNode;
		  var slides = parent.getElementsByTagName("input");
		    var slide1 = parseFloat( slides[0].value );
		    var slide2 = parseFloat( slides[1].value );
		  // Neither slider will clip the other, so make sure we determine which is larger
		  if( slide1 > slide2 ){ var tmp = slide2; slide2 = slide1; slide1 = tmp; }
		  
		  var displayElement = parent.getElementsByClassName("rangeValues")[0];
		      displayElement.innerHTML = "최소 가격 " + slide1 + "원 ~ 최대 가격 " + slide2 + "원";
		}

		window.onload = function(){
		  // Initialize Sliders
		  var sliderdivs = document.getElementsByClassName("range-slider");
		      for( var x = 0; x < sliderdivs.length; x++ ){
		        var sliders = sliderdivs[x].getElementsByTagName("input");
		        for( var y = 0; y < sliders.length; y++ ){
		          if( sliders[y].type ==="range" ){
		            sliders[y].oninput = getVals;
		        
		            sliders[y].oninput();
		          }
		        }
		      }
		}
	</script>
	
	<details>
    <summary>검색기능 켜기</summary>
    <p style="text-align:center">
	    <form action="testsc.do" method="post" align="center">
			<div class="range-slider">
			 	<span class="rangeValues"></span>
			 	<input value="15500" min="8000" max="38000" step="500" type="range" name="sc1">
			  	<input value="30500" min="8000" max="38000" step="500" type="range" name="sc2">
			</div>
			<br><br><br><br>
			<input type="submit" value="가격대 검색">
		</form>
		<br>
	
		<form action="searchbook.do" method="post" align="center">
			도서명 검색<br>
			<input type="text" id="bookname" name="book_name">
			<input type="submit" value="검색하기">
			<script>
$( "#bookname" ).autocomplete({
  source:[
	  "이기적 유전자",
	  "일이란 무엇인가",
	  "변신/소송",
	  "라플라스의 마녀",
	  "나미야 잡화점의 기적",
	  "다빈치코드 1",
	  "다빈치코드 2",
	  "화차",
	  "챗GPT, 질문이 돈이 되는 세상",
	  "위자드 베이커리",
	  "시계태엽 오렌지",
	  "ETS 토익 정기시험 기출문제집",
	  "바다가 들리는 편의점",
	  "마음의 자유",
	  "부서진 우울의 말들",
	  "도파미네이션",
	  "메타 인지의 힘",
	  "지브리 입체건축전 도록",
	  "오타니 쇼헤이의 쇼타임",
	  "우울할 땐 뇌과학",
	  "미움받을 용기",
	  "미움받을 용기2",
	  "나쁜 사마리아인들",
	  "장하준의 경제학 레시피",
	  "이방인",
	  "아프니까 청춘이다",
	  "하늘과 바람과 별과 시",
	  "데미안",
	  "돈으로 살 수 없는 것들",
	  "정리하는 뇌",
	  "조선의 밥상",
	  "떨림과 울림",
	  "과학이 필요한 시간",
	  "크리톤",
	  "열린사회와 그 적들 1",
	  "좀머 씨 이야기",
	  "일리아스",
	  "Java의 정석",
	  "혼자 공부하는 파이썬",
	  "사피엔스",
	  "하얼빈",
	  "불편한 편의점2",
	  "계속 가보겠습니다",
	  "지리의 힘",
	  "차이나 쇼크, 한국의 선택",
	  "부자 아빠 가난한 아빠 ",
	  "미래의 부를 위한 투자 공부",
	  "물고기는 존재하지 않는다",
	  "코스모스",
	  "읽으면서 바로 써먹는 어린이 수수께끼: 공포 특급",
	  "포켓몬스터 썬문 포켓몬 전국대도감",
	  "너무 잘하려고 애쓰지 마라",
	  "꽃을 보듯 너를 본다",
	  "벌거벗은 세계사: 전쟁편",
	  "세상에서 가장 짧은 한국사",
	  "이순신의 바다",
	  "파친코1",
	  "세상의 마지막 기차역",
	  "오늘 밤, 세계에서 이 눈물이 사라진다 해도",
	  "백년허리 2: 치료편",
	  "최소한의 한국사",
	  "인생의 열 가지 생각",
	  "여행의 시간",
	  "내 코드가 그렇게 이상한가요?",
	  "보리도등론난처석",
	  "누구도 나를 파괴할 수 없다",
	  "내 디자인, 뭐가 잘못됐나요?",
	  "공부하고 있다는 착각",
	  "이미 시작된 전쟁",
	  "거장의 경매 수첩",
	  "6시간 후 너는 죽는다",
	  "무례한 사람을 다루는 법",
	  "나의 사주명리",
	  "나의 사주명리 : 심화 편",
	  "광고천재 이제석",
	  "살 때, 팔 때, 벌 때",
	  "이파라파냐무냐무",
	  "1분 요리 뚝딱이형",
	  "마인크래프트 초보자 가이드",
	  "오해의 동물원"
	  ]
});
</script>
		</form>
		<br>
		<form action="searchwriter.do" method="post" align="center">
			작가명 검색<br>
			<input type="text" id="bookwriter" name="book_writer">
			<input type="submit" value="검색하기">
			<script>
$( "#bookwriter" ).autocomplete({
  source:[
	  "리처드 도킨스",
	  "고동진",
	  "프란츠 카프카",
	  "히가시노 게이고",
	  "히가시노 게이고",
	  "댄 브라운",
	  "댄 브라운",
	  "미야베 미유키",
	  "전상훈",
	  "구병모",
	  "앤서니 버지스",
	  "ETS",
	  "마치다 소노코",
	  "정윤",
	  "에바 메이어르",
	  "애나 렘키",
	  "구본권",
	  "스튜디오 지브리",
	  "코다마 미츠오",
	  "앨릭스 코브",
	  "기시미 이치로",
	  "기시미 이치로",
	  "장하준",
	  "장하준",
	  "알베르 카뮈",
	  "김난도",
	  "윤동주",
	  "헤르만 헤세",
	  "마이클 샌델",
	  "대니얼 J. 레비틴",
	  "김상보",
	  "김상욱",
	  "궤도",
	  "플라톤",
	  "칼 포퍼",
	  "파트리크 쥐스킨트",
	  "호메로스",
	  "남궁성",
	  "윤인성",
	  "유발 하라리",
	  "김훈",
	  "김호연",
	  "임은정",
	  "팀 마샬",
	  "한청훤",
	  "로버트 기요사키",
	  "신진상",
	  "룰루 밀러",
	  "칼 세이건",
	  "한날",
	  "대원키즈편집부",
	  "나태주",
	  "나태주",
	  "tvn<벌거벗은세계사>제작팀",
	  "김재원",
	  "황현필",
	  "이민진",
	  "무라세 다케시",
	  "이치조 미사키",
	  "정선근",
	  "최태성",
	  "이해인",
	  "김진애",
	  "센바 다이야",
	  "아띠쌰",
	  "데이비드 고긴스",
	  "석중휘",
	  "대니얼 T. 윌링햄",
	  "이철",
	  "심완보",
	  "다카노 가즈아키",
	  "이헌주",
	  "현묘",
	  "현묘",
	  "이제석",
	  "강영현",
	  "이지은",
	  "뚝딱이형",
	  "Mojang Studio",
	  "루시 쿡"
	  ]
});
</script>
		</form>
    </p>
	</details>
	
	
	<br><br><br><br>
	<br>
	
	<table border="2" align="center" style="width:80%;">
	<thead>	
		<tr>
			<td><a href="orderbynumdesc.do?">번호▼</a></td>
			<td><a href="orderbynumasc.do?">번호▲</a></td>
			<td><a href="orderbynamedesc.do">도서명▼</a></td>
			<td><a href="orderbynameasc.do">도서명▲</a></td>
			<td colspan="2"><a href="#">작가</a></td>
			<td><a href="orderbypricedesc.do">가격▼</a></td>
			<td><a href="orederbypriceacs.do">가격▲</a></td>
			<td><a href="#">재고▼</a></td>
			<td><a href="#">재고▲</a></td>
		</tr>
	
	</thead>
	<tbody> 
	  <c:forEach var="imsi" items="${alist}">
		  <tr>
			<td colspan="2"><a>${imsi.book_isbn}</a></td>
			<td colspan="2"><a href="getBookInfo.do?book_name=${imsi.book_name}">${imsi.book_name}</a></td>
			<td colspan="2"><a>${imsi.book_writer}</a></td>
			<td colspan="2"><a>${imsi.book_price}</a></td>
			<%-- <td>${imsi.book_img}</td>
			<td>${imsi.BOOK_CATEGORY}</td> --%>
			<td colspan="2"><a>${imsi.book_qry}</a></td>
			<%-- <td>${imsi.BOOK_POINT}</td> --%>
		  </tr>
	  </c:forEach>
	</tbody>
	</table>
	

<%@ include file="/WEB-INF/views/bottom.jsp"%>

