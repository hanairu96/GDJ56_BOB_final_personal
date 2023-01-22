<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script>console.log("${path }");</script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>오늘만(할인)관리자</title>
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="${path }/resources/pato/images/icons/favicon.png" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<!--===============================================================================================-->
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/slick/slick.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/lightbox2/css/lightbox.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/css/util.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/css/main.css">
</head>
<body class="animsition">

<div>
	<div class="t-center" style="margin-top: 150px;">
		<h3 class="tit3 t-center m-b-35 m-t-2" style="margin-bottom: 150px;">
			오늘만 특가 적용
		</h3>
	</div>

	<section id="item_banner" style="margin-top: 150px;">
		<!-- 개수별for문분기처리 -->
		<!-- 3개까지
		<div class="todaybab_title">
			<h3>💳만원대 추천 상품</h3>
			<h3>🚚무료 배송 상품</h3>
			<h3>🐣냉장고 속 단골 재료</h3>
		</div>
		4개일경우
		<div class="todaybab_title">
			<h3>💳만원대 추천 상품</h3>
			<h3>🚚무료 배송 상품</h3>
		</div>
		<div class="todaybab_title">
			<h3>🌊바다의 맛</h3>
			<h3>💪급진급빠 다이어터 식단</h3>
		</div> -->
		<!-- 5개일경우 -->
		<div class="todaybab_title">
			<a href="#"><h7>현재적용된상품들보여줄지??..뭐가좋을까<h7></a>
		</div>
	</section>
</div>




<form class="wrap-form-reservation size22 m-l-r-auto">
	<div class="row flex-c-m" style="margin-top: 100px;">
		<div class="col-md-2">
			<!-- 검색 -->
			
			<div>
				<!-- Select2 -->
				<select id="selectOp"class="form-select" aria-label="Default select example">
					<option>전체보기</option>
					<option>브랜드</option>
					<option>제품명</option>
				</select>
			</div>
		</div>
		<div style="width: 300px; display: flex;">
			<div class="search-sidebar2 size12 bo2 pos-relative">
				<input class="input-search-sidebar2 txt10 p-l-20 p-r-55" type="text" name="검색할항목ajax로바꿔야함" placeholder="Search">
				<button class="btn-search-sidebar2 flex-c-m ti-search trans-0-4" onclick="searchItem();"></button>
			</div>
		</div>
		<div class="wrap-btn-booking flex-c-m m-t-6">
			<div style="display: flex; margin-left: 65%;">
				<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
					등록하기
				</button>
			</div>
		</div>
	</div>
</form>
<button onclick="searchItem();">검색</button>



<!-- todaybab create -->
<section class="discount-section spad">
	<div class="container">
		<span style="margin-left: 100px;">할인 적용할 상품 선택</span>
		<div class="row flex-c-m">
			<div class="col-lg-10 col-sm-10" id="items" style="margin-top: 30px; margin-bottom: 100px;">
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">상품번호</th>
							<th scope="col">#</th>
							<th scope="col">카테고리명</th>
							<th scope="col">원산지</th>
							<th scope="col">브랜드</th>
							<th scope="col">제품명</th>
							<th scope="col">현재판매가</th><!--현재할인중이면9900원출력-->
							<th scope="col">재고량</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<th scope="row">1</th>
							<td>
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="makeItemArr(this);">
							</td>
							<td>과일</td>
							<td>대한민국</td>
							<td>아삭</td>
							<td>새빨간사과</td>
							<td>8,800</td>
							<td>200</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="makeItemArr(this);">
							</td>
							<td>과일</td>
							<td>대한민국</td>
							<td>아삭</td>
							<td>새빨간사과</td>
							<td>8,800</td>
							<td>200</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="makeItemArr(this);">
							</td>
							<td>과일</td>
							<td>대한민국</td>
							<td>아삭</td>
							<td>새빨간사과</td>
							<td>8,800</td>
							<td>200</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="makeItemArr(this);">
							</td>
							<td>과일</td>
							<td>대한민국</td>
							<td>아삭</td>
							<td>새빨간사과</td>
							<td>8,800</td>
							<td>200</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="makeItemArr(this);">
							</td>
							<td>과일</td>
							<td>대한민국</td>
							<td>아삭</td>
							<td>새빨간사과</td>
							<td>8,800</td>
							<td>200</td>
						</tr>

						</tbody>
				</table>

			</div>
		</div>

		
	</div>

</section>


<script>
	function eventKeyup1(str){
		$("#reTitlePrint").html(str);
	}
	function eventKeyup2(str){
		$("#reContentPrint").html(str);
	}
	function eventKeyup3(str){
		$("#reIconPrint").html(str);
	}

	var cbArr = new Array(); //체크한 상품번호를 저장할 배열
	const makeItemArr = (target)=>{
		
			var checkVal = target.value; //선택된 값
			var confirmCheck = target.checked; //check여부 확인
		
			//선택
			if(confirmCheck == true){	cbArr.push(checkVal);	} //cbArr배열에 저장 *push() 배열입력 함수
			//선택해제
			else{	cbArr.splice(cbArr.indexOf(checkVal), 1);	} //cbArr배열에 있는 값 삭제 *splice(삭제하고싶은인덱스, 삭제할개수)
			
			console.log("검색할 값 : "+cbArr);
			console.log(cbArr);
	}
</script>
<style>
	a:hover {
		color: yellowgreen;
	}
	button[type=submit] {
	background: rgb(176, 206, 117);
	}
	button[type=submit]:hover {
		background: rgb(92, 121, 34);
	}
	textarea:focus, input:focus {
	border-color: transparent !important;
	box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-moz-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-webkit-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-o-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-ms-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	}
	select {
	width: 100px; 
	text-align: center;
	padding: .8em .5em; 
	border: 1px solid #999;
	font-family: inherit;  
	background: url('arrow.jpg') no-repeat 95% 50%; 
	border-radius: 0px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
	}

	select::-ms-expand {
		display: none;
	}
	/* /.테이블스크롤 */
	#items{
		overflow: scroll;
		height: 300px;
		width: 600px;
	}
	#items::-webkit-scrollbar{
		width: 10px;
	}
	#items::-webkit-scrollbar-thumb{
		background-color: rgb(246, 246, 246);
		border-radius: 10px;    
	}
	#items::-webkit-scrollbar-track{
		background-color: rgba(0,0,0,0);
	}
	/* 테이블스크롤./ */
	.cat-name {
		color: #fff;
		background: #cfe1b9;
		display: inline-block;
		font-size: 12px;
		font-weight: 700;
		text-transform: uppercase;
		padding: 4px 25px 4px 25px;

	}

	.ri-text>* {
		font-family: "경기천년제목";
	}

	/* 등록하기수정하기버튼 시작 */
	.item_btn {
		text-align: center;
	}

	.btn {
		background-color: #dddddd;
	}

	/* 등록하기수정하기버튼 끝 */
	/*추천타이틀*/
	#item_banner {
		border: 2px solid rgb(175, 175, 175);
		border-radius: 13px;
		background-image: 20%;
		width: 60%;
		background-size: 20% 20%;
		margin-top: 40px;
		margin-bottom: 40px;
		margin-left: 20%;
		min-height: 100px;
		padding: 40px 50px 40px;
		text-align: center;
		font-size: 18px;
		font-weight: bold;
		justify-content: center;

	}

	#item_banner .todaybab_title {
		display: flex;
		align-items: center;
		justify-content: space-evenly;
		margin: 20px;
		padding: 15px;
	}

	.todaybab {
		width: 90%;
	}
</style>




	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${path }/resources/pato/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${path }/resources/pato/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="${path }/resources/pato/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/lightbox2/js/lightbox.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="${path }/resources/pato/js/main.js"></script>

</body>
</html>