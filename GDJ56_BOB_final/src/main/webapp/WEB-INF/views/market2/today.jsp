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
<title>오늘의밥추천</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body class="animsition">

<section id="item_banner" style="margin-top: 150px;">
	<!-- 개수별for문분기처리 -->
	<!-- 3개까지 -->
	<c:if test="${relistCnt <= 3}"> 
		<div class="todaybab_title">
		  <c:forEach var="r" items="${relist }">
			<a href="javascript:callFunction();" id="${r.reNo } class="${r.reContent }"><h4>${r.reIcon }${r.reTitle }</h4></a>
		  </c:forEach>
		</div>
	</c:if>
	<!-- 4개일경우 -->
	<c:if test="${relistCnt == 4}">
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(0).reNo }" class="${relist.get(0).reContent }"><h4>${relist.get(0).reIcon }${relist.get(0).reTitle }</h4></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(1).reNo }" class="${relist.get(1).reContent }"><h4>${relist.get(1).reIcon }${relist.get(1).reTitle }</h4></a>
		</div>
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(2).reNo }" class="${relist.get(2).reContent }"><h4>${relist.get(2).reIcon }${relist.get(2).reTitle }</h4></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(3).reNo }" class="${relist.get(3).reContent }"><h4>${relist.get(3).reIcon }${relist.get(3).reTitle }</h4></a>
		</div>
	</c:if>
	<!-- 5개일경우 -->
	<c:if test="${relistCnt == 5}">
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(0).reNo }" class="${relist.get(0).reContent }"><h4>${relist.get(0).reIcon }${relist.get(0).reTitle }</h4></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(1).reNo }" class="${relist.get(1).reContent }"><h4>${relist.get(1).reIcon }${relist.get(1).reTitle }</h4></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(2).reNo }" class="${relist.get(2).reContent }"><h4>${relist.get(2).reIcon }${relist.get(2).reTitle }</h4></a>
		</div>
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(3).reNo }" class="${relist.get(3).reContent }"><h4>${relist.get(3).reIcon }${relist.get(3).reTitle }</h4></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(4).reNo }" class="${relist.get(4).reContent }"><h4>${relist.get(4).reIcon }${relist.get(4).reTitle }</h4></a>
		</div>
	</c:if>
</section>
<script>
const callFunction = (e)=>{

	
		clickTag = $(e.target).parent().attr("id"); //reNo가져옴
		console.log(clickTag);
		
		clickContent = $(e.target).parent().attr("class");
		console.log(clickContent);
		
		clickTitle = $(e.target).parent().children().text();
		console.log(clickTitle);
		
		///////
		var title = "";
		title += "<h3 style='text-align: center; margin: 50px; padding-bottom: 10px;'>"+clickTitle+"<p style='margin-top: 20px;'>"+clickContent+"</p></h3>";
	
		$("#printTitle").html(title);
		
		
		
		
		///////
		$.get("${path }/market/todayView.do?reNo="+clickTag
				,data=>{
						//console.log(data);
						
						$("#print").html(''); //원래의 값 비워주기
	
						
						
						
						var html = "";
	   					data.forEach(i=>{
	   						//var itemNo = i.itemNo;
	   						
	   						
	
	
	   						html += "<div class='col-lg-4 col-sm-6' style='padding: 3%;'>";
							html += "<div class='recipe-item'>";
							html += "<div class='zoom'>";
							html += "<a href='#'><img src='"+i.mainPic+"' alt='' width='330' height='280'></a>";
							html += "</div>";
							html += "<div class='ri-text'>";
							html += "<div class='cat-name'>"+i.itemCategory+"</div>";
							html += "<a href='${path}/market1/marketdetail.do?itemNo="+i.itemNo+"'>";
							html += "<h4>"+i.itemName+"</h4>";
							html += "<p>"+i.mainContent+"</p>";
							html += "</a>";
							html += "<div style='display: flex; margin-top: 1%; justify-content: space-between; align-items: center;'>";
							html += "<div style='display: flex;'>";
							html += "<img src='https://img.icons8.com/ios/512/money-bag.png' width='20' height='20'>";
							html += "<h5>"+i.itemPrice+"</h5><h5>원</h5>";
							html += "</div>";
							html += "<div class='zoom'>";
							html += "<a href=''><img src='https://img.icons8.com/pastel-glyph/512/shopping-cart.png' width='30' height='30'></a>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
	   						
	   					
	   					})//forEach i./
						
	   					$("#print").html(html);
						
						
						
		});//$.get./
	
//		e.stopPropagation();
	
//	};//클릭이벤트./
	
	
	
	
}


</script>

<div style="display: flex; margin-left: 65%; margin-bottom: 30px;">
	<c:if test="${relistCnt < 5}"><!-- btn(등록,수정) ->타이틀이 5개로 차면(max5) 등록하기는 안 보이고 수정하기만 보이게 -->
		<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" onclick="location.replace('${path}/market/todayAdmin.do')">등록하기</button>
	</c:if>
	<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin-left:2%" onclick="location.replace('${path}/market/todayAdminModify.do')">수정하기</button>
	
</div>
<!-- todaybab -->
<section class="discount-section spad">
	<div class="container">
		<!-- <h3 style="text-align: center; margin: 50px; padding-bottom: 10px;">1만원대 추천 상품<p style="margin-top: 20px;">놓치면 후회할 가격!</p></h3> -->
		<div id="printTitle"></div>
		
		<p>총 20건</p>
		<div class="row" id="print">
			<!-- <div class="col-lg-4 col-sm-6" style="padding: 3%;">
				<div class="todaybab-item">
					<div class="zoom">
						<a href="#"><img src="data:image/jpeg;base64,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" alt="" width="350" height="300"></a>
					</div>
					<div class="ri-text">
						<div class="cat-name">과일</div>
						<a href="#">
							<h4>사과</h4>
							<p>달달 꿀사과</p>
						</a>
						<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
							<div style="display: flex;">
								<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
								<h5>8,800</h5><h5>원</h5>
							</div>
							<div class="zoom">
								<a href=""><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
							</div>
						</div>
					</div>
				</div>
			</div> -->
			
			
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
<script>
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
	textarea:focus, input:focus {
	border-color: transparent !important;
	box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-moz-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-webkit-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-o-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
	-ms-box-shadow: 0 0 0px 2px rgb(159, 209, 59);
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
		background-image: 15%;
		width: 68%;
		background-size: 20% 20%;
		margin-top: 40px;
		margin-bottom: 40px;
		margin-left: 15%;
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
		/* color: inherit; */
	}
	
	h4 {
	  color: green;
	 /*  text-decoration: underline yellow; */
	}
	
	h4:focus,
	h4:hover {
	  display: inline-block;
	  color: yellowgreen;
	  /* text-decoration-color: yellow; */
	  transform: translateY(-2px);
	  transition: 1s;
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