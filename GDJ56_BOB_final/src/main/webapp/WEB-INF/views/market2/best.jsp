<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script>console.log("${path }");</script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>베스트</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>

<body class="animsition">
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-color: #E2DDD3;">
	<h2 class="tit6 t-center" style="font-family: ChosunSm;">
		오 늘 의 밥&nbsp B&nbsp&nbsp&nbspE&nbsp&nbsp&nbspS&nbsp&nbsp&nbspT
		<br><br><p>오늘의 밥 누적판매 TOP100</p>
	</h2>
</section>
<!-- best_item -->
<section id="best_item">
<div class="section-gallery p-t-118 p-b-100 section-best-item">
	<div class="wrap-label-gallery m-b-60">
		<div class="tab">
			<ul>
				<li style="font-family: ChosunSm;">가격대별 베스트</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="10000">~3만원</button><!--  onclick="changeBtn(this); -->
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="20000">~5만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="30000">~7만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="100000">~10만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="100000al">10만원~</button>
				</li>
			</ul>
		</div>
	</div>



	<section class="recipe-section section-best-item">
		<div class="container">
			<p>총 100건</p>
			<div class="row">
				<c:forEach var="i" items="${bestItems }">
				<div id="print" class="col-lg-4 col-sm-6" style="padding: 3%;">
					<div class="recipe-item">
						<div class="zoom">
							<a href="#"><img src="${i.mainPic}" alt="" width="330" height="280"></a><!-- ! 사진경로연결해주기 -->
						</div>
						<div class="ri-text">
							<div class="cat-name">과일<c:out value="${i.itemCategory }"/></div>
							<a href="#">
								<h4><c:out value="${i.itemName }"/></h4>
								<p><c:out value="${i.mainContent }"/></p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5><fmt:formatNumber value="${i.itemPrice }" pattern="###,###,###"/></h5><h5>원</h5>
								</div>
								<div class="zoom">
									<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="pagination flex-l-m flex-w m-l--6 p-t-25">
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">prev</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">1</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">2</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">3</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">next</a>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>


<div class="floating">
	<div>챗봇위치</div>
	<div>최근본상품위치</div>
	<div><button type="button" onclick="toHTMLTop()">위로가기위치</button></div>
</div>
</section>




<script>
$(function(){//레디함수
	
	/* $.get("${path}/market/bestAjax.do?value="
			, data=>{
				console.log(data);
			}); */
	
	
	//가격대별
	$(".changeBtn").click(e=>{
		changeBtn = $(e.target).val();
		$.get("${path}/market/bestAjax.do?value="+changeBtn
    			, data=>{
    				console.log(data);
    				
    				/* var html = '';
    				for(var i=0; data.size(); i++){
			    				html += "<div class='"+col-lg-4 col-sm-6+"' style='"+padding: 3%;+"'>
								<div class='"+recipe-item+"'>
								<div class='"+zoom+"'>
									<a href='"+#+'"><img src='"+${i.mainPic}+"'width='"+330+"' height='"+280+"'></a>
								</div>";
								
						</div>";
    				}
    				
    				$("#print").empty();
    				$("#print").append(html); */
    				
    				
    				
    				
    				
    				
    				
    				
    				
    			});
	});
	
	
});
	


	const fn_pageBtn = (e)=>{
		$(".item-pagination").removeClass("active-pagination");
		$(e.target).addClass("active-pagination");
	}
	function toHTMLTop() {
        $('html').scrollTop(0);
    }
</script>

</body>

<style>
	/* .마켓헤더 */
    .marketHeader {
        position: sticky;
        z-index: 100;
        top: 100px;
        background: rgba(137, 43, 226, 0.167);
    }

    /* 마켓헤더./ */
    /* /.챗봇최근본상품위로가기 */
    .floating {
        background-color: #f9f9f9;
        border: 2px solid #dddddd;
        position: fixed;
        right: 36%;
        top: 380px;
        margin-right: -500px;
        text-align: center;
        height: 350px;
        width: 70px;
        border-radius: 30px;
        /* -webkit-border-radius: 8px;
    position: absolute;
        width: 70px;
        height: 350px;
        right: 50px;
        border-radius: 70px;
        top: 250px;
        border: 1px solid #dddddd; */
    }

    .floating div:nth-child(1) {
        border: 1px solid blueviolet;
        border-radius: 100%;
        height: 70px;
    }

    .floating div:nth-child(2) {
        border: 1px solid blueviolet;
        border-radius: 8px;
        height: 278px;
    }

    .floating div:nth-child(3) button {
        border: 1px solid blueviolet;
        border-radius: 100%;
        height: 70px;
    }
    /* 챗봇최근본상품위로가기./ */

	a:hover {
			color: yellowgreen;
		}
	button[type=submit] {
		background: rgb(187, 219, 124);
	}
	button[type=submit]:hover {
		background: rgb(92, 121, 34);
	}
	
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

	@font-face {
		font-family: 'ChosunSm';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.1/ChosunSm.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	.section-best-item {
		/* 오늘의밥BEST */
		width: 90%;
		display: flex;
		list-style-type: none;
		flex-direction: row;
		align-items: center;
	}


	/* tab 시작 */
	#best_item .tab {
		/* background: #9f2525; */
		/* opacity: 0.5; */
		border-bottom: 0;
		float: left;
		width: 320px;
		padding: 30px;
		margin: 20px;
		height: 1300px
	}

	#best_item .tab li {
		padding: 10px 5px;
		margin: 20px;
		text-align: center;
		font-size: 25px;
	}

	#best_item .tab li button {

		font-size: 18px;
	}


	#best_item_div {

		width: 100px;
		margin-left: auto;
		margin-right: auto;

	}

	.best_item_img {
		display: flex;
		align-items: center;
		justify-content: space-evenly;

	}
	.container {
		max-width: 1200px;
	}
	/* 상품 정렬 */
	.row{display:-ms-flexbox;display:flex;-ms-flex-wrap:wrap;flex-wrap:wrap;margin-right:-15px;margin-left:-15px}
	/* 가격대별 버튼 */
	.m-b-60 {margin-bottom: 60px;}
	/* 버튼&상품 영역 */
	.p-t-118 {padding-top: 118px;}
	.p-b-100 {padding-bottom: 100px;}
	/* 상품명 */
	h4{
		font-size: 1.5rem;
	}
	h5{
		font-size: 1.25rem;
	}
	h4, h5{
		font-family: inherit;
		font-weight: 500;
		line-height: 1.1;
		color: inherit;
	}

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
		color: #ec1d25;
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

	/* 폰트 효과 */
	.txt26 {
	font-weight: 500;
	font-size: 18px;
	color: #333333;
	letter-spacing: 5px;
	font-family: 'Gowun Dodum', sans-serif;
	}

	.t-center{
		text-align: center;
	}
	
	.tit6 {
	font-family: Poppins;
	font-weight: 700;
	font-size: 50px;
	line-height: 1.2;
	color: white;
	text-transform: uppercase;
	letter-spacing: 6px;
	word-spacing: 6px;

	}

	/* 검색창 */

	.search-btn{
	border: #111111 2px solid; 
	border-radius: 10px; 
	background-color: white;
	}

	.search-btn:hover {
	background-color: #bde28f;
	color: black;
	}

	#searchbox{
	display: none; 
	position: relative; 
	margin-top:2%; 
	left: 70%; 
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: 600;
	}

	/* 효과 천천히 */
	.trans-0-4 {
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
	}

	/* 버튼 속 글씨 정중앙 정렬 */
	.flex-c-m {
	display: flex;
	justify-content: center;
	align-items: center;
	}

	/* 사진 밑 카테고리 효과 */
	.category-name {
	color: #fff;
	background :#cfe1b9;
	display: inline-block;
	font-size: 12px;
	font-weight: 700;
	text-transform: uppercase;
	padding: 4px 25px 4px 25px;
	}

	/* 배너 효과 */
	.bg-title-page {
	width: 100%;
	min-height: 545px;
	padding-left: 15px;
	padding-right: 15px;
	background-repeat: no-repeat;
	background-position: center 0;
	background-size: cover;
	}

	@media (max-width: 576px) {
	.bg-title-page .tit6 {font-size: 30px;}
	}

	/* 버튼 효과 */
	.btn3 {
	background: #111111;
	border-radius: 10px;
	color: white;
	}

	.btn3:hover {
	background-color: #6A0dad;
	color: white;
	}

	/* 페이지 버튼 효과*/
	.item-pagination {
	font-size: 13px;
	color: #808080;
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border: 1px solid #e6e6e6;
	margin: 6px;
	}

	.item-pagination:hover {
	background-color: #6A0dad;
	color : white;
	}

	.active-pagination {
	background-color: #333333;
	color: white;
	}

	/* 메뉴 버튼 효과 */
	.menu {
	border-radius: 10px;
	padding: 2px 11px;
	margin: 5px 0;
	background-color:white;
	}

	.menu:hover {
	background-color: #bde28f;
	color: white;
	}

	/* a태그 효과 : 효과 천천히*/ 
	a {
	color: #666666;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	}

	a:hover {
	color: #cfe1b9;
	}

	/* (사진) 줌 효과 */
	.zoom {
	display: block;
	overflow: hidden;
	}
	.zoom img{
	width: 100%;
	-webkit-transition: all 0.6s;
	-o-transition: all 0.6s;
	-moz-transition: all 0.6s;
	transition: all 0.6s;
	}
	.zoom:hover img {
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-o-transform: scale(1.1);
	transform: scale(1.1);
	}
</style>

</html>