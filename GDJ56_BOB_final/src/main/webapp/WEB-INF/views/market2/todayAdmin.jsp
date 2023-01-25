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
<title>오늘의밥추천관리자등록</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body class="animsition">
<div>
	<div class="t-center" style="margin-top: 150px;">
		<h3 class="tit3 t-center m-b-35 m-t-2" style="margin-bottom: 150px;">
			<!-- 등록수정 분기처리해줘야함(+밑에버튼도) -->
			추천 타이틀 등록
		</h3>
	</div>

	<form class="flex-c-m todaybab">
		<span class="tit2 t-center" style="margin-left: 300px;color: rgb(100, 20, 175);">
			preview
		</span>
		<div class="col-lg-4">
			<div class="dis-flex">
				<div class="p-r-40">
					<img src="images/icons/map-icon.png" alt="IMG-ICON">
				</div>

				<div class="flex-col-l">
					<span id="reTitlePrint" class="txt5 p-b-10">
						1만원대 추천 상품
					</span>

					<span id="reContentPrint" class="txt23 size38">
						놓치면 후회할 가격!
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<!-- 추천제목 -->
			<span class="txt9">
				추천제목
			</span>

			<div class="wrap-inputname size12 bo2 bo-rad-10 m-t-3 m-b-23 t-center">
				<input id="reTitle" onkeyup="fn_eventKeyup1(this.value)" 
				class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="reTitle" placeholder="예시)1만원대 추천 상품">
			</div>

			<!-- 한줄설명 -->
			<span class="txt9">
				한줄설명
			</span>

			<div class="wrap-inputphone size12 bo2 bo-rad-10 m-t-3 m-b-23">
				<input id="reContent" onkeyup="fn_eventKeyup2(this.value)"
				class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="reContent" placeholder="예시)놓치면 후회할 가격!">
			</div>

			<!-- 아이콘 -->
			<span class="txt9">
				아이콘넣는버튼으로바꾸기
			</span>

			<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
				<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="reIcon" placeholder="예시)">
			</div>
			<div class="wrap-btn-booking flex-c-m m-t-6">
				<div style="display: flex; margin-left: 65%;">
					<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
						등록하기저장하기
					</button>
			
					<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin-left:2%">
						수정하기저장하기
					</button>
				</div>
			</div>
		</div>


		
	</form>
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
				<button class="btn-search-sidebar2" onclick="searchItem();"><img style="width: 30px; height: 30px;" src="https://img.icons8.com/ios-filled/512/search.png"></button>
			</div>
		</div>
	</div>
</form>
<button onclick="searchItem();">검색</button>



<!-- todaybab create -->
<section class="discount-section spad">
	<div class="container">
		<span style="margin-left: 100px;">추천할 상품 선택(20개 필수)</span>
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
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="fn_makeItemArr(this);">
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
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="fn_makeItemArr(this);">
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
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="fn_makeItemArr(this);">
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
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="fn_makeItemArr(this);">
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
							<input type="checkbox" name="chItems" value="체크된상품번호" onchange="fn_makeItemArr(this);">
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
	const fn_eventKeyup1 = (str)=>{
		$("#reTitlePrint").html(str);
	}
	const fn_eventKeyup2 = (str)=>{
		$("#reContentPrint").html(str);
	}
	const fn_eventKeyup3 = (str)=>{
		$("#reIconPrint").html(str);
	}

	var cbArr = new Array(); //체크한 상품번호를 저장할 배열
	const fn_makeItemArr = (target)=>{
			var checkVal = target.value;
			var confirmCheck = target.checked;
			if(confirmCheck == true){	cbArr.push(checkVal);	}
			else{	cbArr.splice(cbArr.indexOf(checkVal), 1);	}
			console.log("검색할 값 : "+cbArr);
			console.log(cbArr);
	}
</script>






</body>
<style>
	/* 전체 글씨체 */
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	a {
		font-family: Montserrat;
		font-weight: 400;
		font-size: 15px;
		line-height: 1.7;
		color: #666666;
		margin: 0px;
		transition: all 0.4s;
		-webkit-transition: all 0.4s;
		-o-transition: all 0.4s;
		-moz-transition: all 0.4s;
		text-decoration : none;
	}

	a:focus {
		outline: none !important;
	}

	a:hover {
		text-decoration: none;
		color: yellowgreen;
	}

	/* ------------------------------------ */
	h1,h2,h3,h4,h5,h6 {
		margin: 0px;
	}

	p {
		font-family: Montserrat;
	font-weight: 400;
		font-size: 15px;
		line-height: 1.7;
		color: #666666;
		margin: 0px;
	}

	ul, li {
		margin: 0px;
		list-style-type: none;
	}
	button[type=submit] {
	background: rgb(176, 206, 117);
	border-radius: 10px;
	outline: none !important;
	border: none;
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
	/* form영역 */
	.size22 {max-width: 870px;	}
	.m-l-r-auto {margin-left: auto;	margin-right: auto;}
	.flex-c-m {
		display: -webkit-box;
		display: -webkit-flex;
		display: -moz-box;
		display: -ms-flexbox;
		display: flex;
		justify-content: center;
		-ms-align-items: center;
		align-items: center;
	}
	.pos-relative {position: relative;}
	.bo2 {border: 2px solid #d9d9d9;}
	.size12 {
		width: 100%;
		height: 50px;
	}
	input {
		outline: none;
		border: none !important;
	}
	.btn-search-sidebar2 {
	position: absolute;
	top: 0;
	right: 0;
	width: 46px;
	height: 46px;
	background-color: #333333;
	color: white;
	font-size: 18px;

	box-shadow: 0 0 0px 1px #333333;
	-moz-box-shadow: 0 0 0px 1px #333333;
	-webkit-box-shadow: 0 0 0px 1px #333333;
	-o-box-shadow: 0 0 0px 1px #333333;
	-ms-box-shadow: 0 0 0px 1px #333333;

	-webkit-transform: rotateY(180deg);
	-moz-transform: rotateY(180deg);
	-ms-transform: rotateY(180deg);
	-o-transform: rotateY(180deg);
	transform: rotateY(180deg);
	}

	.btn-search-sidebar2:hover {
	color: #ec1d25;
	}

	.input-search-sidebar2 {
	width: 100%;
	height: 100%;
	}
	/* 페이지설명 */
	.t-center {text-align: center;}
	.m-b-35 {margin-bottom: 35px;}
	.tit3 {
		font-family: Poppins;
		font-weight: 700;
		font-size: 50px;
		line-height: 1.2;
		color: #222222;
		text-transform: uppercase;
		letter-spacing: 6px;
	}
	/* 버튼 */
	.flex-c-m {
		display: -webkit-box;
		display: -webkit-flex;
		display: -moz-box;
		display: -ms-flexbox;
		display: flex;
		justify-content: center;
		-ms-align-items: center;
		align-items: center;
	}
	.size36 {
		width: 120px;
		height: 40px;
	}
	.txt11 {
		font-family: Montserrat;
		font-weight: 400;
		font-size: 12px;
		line-height: 1.1;
		color: white;
		text-transform: uppercase;
		letter-spacing: 1px;
	}
	.trans-0-4 {
		-webkit-transition: all 0.4s;
		-o-transition: all 0.4s;
		-moz-transition: all 0.4s;
		transition: all 0.4s;
	}
	.p-l-20 {padding-left: 20px;}
	/* 가운데로옮기기전체에 */
	.flex-c-m {
		display: -webkit-box;
		display: -webkit-flex;
		display: -moz-box;
		display: -ms-flexbox;
		display: flex;
		justify-content: center;
		-ms-align-items: center;
		align-items: center;
	}
	/* 프리뷰 */
	@import url('https://fonts.googleapis.com/css2?family=Courgette&display=swap');
	@font-face {
		font-family: 'Shilla_CultureB-Bold';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/Shilla_CultureB-Bold.woff2') format('woff2');
		font-weight: 700;
		font-style: normal;
	}
	.tit2 {
		font-family: 'Shilla_CultureB-Bold';
		font-size: 30px;
		line-height: 1.2;
	}
	.txt5 {
		font-family: Poppins;
		font-weight: 500;
		font-size: 22px;
		color: #333333;
		text-transform: uppercase;
		letter-spacing: 3px;
	}
	.p-b-10 {padding-bottom: 10px;}
	.txt23 {
		font-family: Montserrat;
		font-weight: 400;
		font-size: 13px;
		color: #666666;
		line-height: 1.7;
	}
	.size38 {max-width: 190px;}
		.flex-col-l {
		display: -webkit-box;
		display: -webkit-flex;
		display: -moz-box;
		display: -ms-flexbox;
		display: flex;
		-webkit-flex-direction: column;
		-moz-flex-direction: column;
		-ms-flex-direction: column;
		-o-flex-direction: column;
		flex-direction: column;
		-ms-align-items: flex-start;
		align-items: flex-start;
	}

	.col-lg-4{
		flex: 0 0 33.333333%;
		max-width: 33.333333%;
	}
	.dis-flex {
		display: -webkit-box;
		display: -webkit-flex;
		display: -moz-box;
		display: -ms-flexbox;
		display: flex;
	}
	.p-r-40 {padding-right: 40px;}
	/* input 효과 */
	.bo2 {border: 2px solid #d9d9d9;}
	.bo-rad-10 {border-radius: 10px;} 
	input {
		outline: none;
		border: none !important;
	}
	.sizefull {
		width: 100%;
		height: 100%;
	}

	/* input 크기 및 정렬 */
	.size22 {
		max-width: 870px;
	}
	
	.size12 {
		width: 100%;
		height: 50px;
	}
	.m-b-23 {
			margin-bottom: 23px;
		}
	.m-t-3 {
		margin-top: 3px;
	}
	.m-l-r-auto {margin-left: auto;	margin-right: auto;}
	/* 테이블크기 */
	.col-lg-10{
		flex: 0 0 83.333333%;
		max-width: 83.333333%;
	}
	.col-lg-10, .col-sm-10{
		position: relative;
		min-height: 1px;
		padding-right: 15px;
		padding-left: 15px;
	}
	.table thead th {
		vertical-align: bottom;
		border-bottom: 2px solid #e9ecef;
	}
	.table td, .table th {
		padding: .75rem;
		border-top: solid #e9ecef;
	}
	.ti-search:before {
		content: "\e610";
	}

</style>

</html>