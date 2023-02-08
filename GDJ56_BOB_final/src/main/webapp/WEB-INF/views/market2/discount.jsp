<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.1.min.js"></script>
<script>console.log("${path }");</script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
<jsp:include page="/WEB-INF/views/common/floatBar.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>오늘만(할인)</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body class="animsition">
<section class="bg-title-page flex-c-m p-t-160 p-b-80 " style="display: flex;flex-direction: column;">
	<img src="${path }/resources/images/itemdiscountbanner3.PNG" width="100%" height="620px" id="itemdiscountbanner" />
	<%-- <img src="${path }/resources/images/itemdiscountbanner1.png" width="1000" id="itemdiscountbanner1" /> --%>
	<%-- <img src="${path }/resources/images/itemdiscountbanner2.png" width="1000" id="itemdiscountbanner2" /> --%>
</section>

<div style="display: flex; margin-left: 65%;">
	<c:if test="${m == 'admin' }">
	<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" onclick="location.replace('${path }/market/discountAdmin.do')">
		등록하기
	</button>
	</c:if>
</div>
<!-- itemdiscount -->
<section class="discount-section spad">
	<div class="container">
		<p>총 ${disCnt }건</p>
		<div class="row">
		
			<c:forEach var="i" items="${disList }">
			<div class="col-lg-4 col-sm-6" style="padding: 3%;${i.itemStock==0?'filter: grayscale(100%)':''};">
				<div class="discount-item">
					<div class="zoom">
						<a href="${path}/market1/marketdetail.do?itemNo=${i.itemNo}"><img src="${path }/resources/upload/market/mainlabel/${i.mainPic }" alt="" width="330" height="280"></a>
					</div>
					<div class="ri-text">
						<div class="cat-name">${i.itemCategory }</div>
						<a href="${path}/market1/marketdetail.do?itemNo=${i.itemNo}">
							<h4>${i.itemName }</h4>
							<p>${i.mainContent }</p>
						</a>
						<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
							<div style="display: flex;">
								<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
								<h6 style="text-decoration: line-through; margin-left: 10px;">${i.itemPrice }</h6><h6 style="text-decoration: line-through;">원</h6>
							</div>
						</div>

						<div style="display: flex; justify-content: space-between; margin-left: 10%; margin-top: 5%;">
							<h5 style="color: red;">할인가 9,900원</h5>
							<div class="zoom">
									<c:if test="${i.itemStock ==0}">
										<span style="font-size: 30px;">일시품절</span>
									</c:if>
									<c:if test="${i.itemStock!=0 }">
									<a href="javascript:void(0);" onclick="addbasketitem(${i.itemNo },'${loginMember.memberId }','${i.mainPic }','${i.itemName }')"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
									</c:if>
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
					<div style="display: flex;margin-left:50%">
			        	${pageBar}
			   		</div>
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

</script>
<script>
var arr=new Array();
<c:forEach var="b" items="${basket}">
   arr.push({itemNo:${b.itemNo}});
</c:forEach>

const addbasketitem=(no,memberId,mainPic,itemName)=>{
    if(${loginMember==null}){
      alert("로그인 후 사용가능합니다.");
   }else{
      const item=arr.filter(e=>e.itemNo==no);
      console.log(item);
       if(item.length>0){
          Swal.fire({
                title: itemName,
                text: "이 상품은 이미 담겨있습니다. 더 담으시겠습니까?",
                imageUrl: '${path }/resources/upload/market/mainlabel/'+mainPic,
                showCancelButton: true,
               	confirmButtonColor: '#07d448',
                cancelButtonColor: 'magenta',
                confirmButtonText: '장바구니 추가',
                cancelButtonText: '계속 쇼핑하기'
            }).then((result) => {
               if (result.isConfirmed) {
                location.assign('${path}/basket/updatebasket.do?itemNo='+no+'&memberId='+memberId+'&add=0'); 
               }
            })
       }else{
          location.assign('${path}/basket/insertbasket.do?itemNo='+no+'&memberId='+memberId+'&add=0');
   
      }
   }
}
</script>






</body>

<style>
	a:hover {
		color: yellowgreen;
	}
	button[type=submit] {
	background: rgb(176, 206, 117);
	border-radius: 10px;
	outline: none !important;
	border: none;
	}
	button[type=submit]:hover {
		background: rgb(92, 121, 34);
		cursor: pointer;
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

	.item-pagination flex-c-m trans-0-4{
		cursor: move;
		/* cursor: url(https://img.icons8.com/ios/512/money-bag.png) 20 20, auto; */
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

	/* /.등록하기수정하기버튼 */
	.item_btn {
		text-align: center;
	}

	.btn {
		background-color: #dddddd;
	}
	.p-b-80 {padding-bottom: 80px;}

	/* 등록하기수정하기버튼./ */
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