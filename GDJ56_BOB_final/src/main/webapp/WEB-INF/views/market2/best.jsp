<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
<div class="section-gallery p-t-118 p-b-100 section-best-item" style="align-items:flex-start;">
	<div class="wrap-label-gallery m-b-60">
		<div class="tab">
			<ul>
				<li style="font-family: ChosunSm;">가격대별 베스트</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="20000">~2만원</button><!--  onclick="changeBtn(this); -->
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="30000">~3만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="40000">~4만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="50000">~5만원</button>
				</li>
				<li><button style="font-family: ChosunSm;" type="button" class="btn btn-light changeBtn" value="50000al">5만원~</button>
				</li>
			</ul>
		</div>
	</div>



	<section class="recipe-section section-best-item">
		<div class="container">
			<p><!-- 총 100건 --></p>
			<div class="row" id="print">
				<c:forEach var="i" items="${bestItems }">
				<div class="col-lg-4 col-sm-6" style="padding: 3%;${i.itemStock==0?'filter: grayscale(100%)':''};">
					<div class="recipe-item">
						<div class="zoom">
							<a href="${path}/market1/marketdetail.do?itemNo=${i.itemNo }"><img src="${path }/resources/upload/market/mainlabel/${i.mainPic }" alt="" width="330" height="280"></a><!-- ! 사진경로연결해주기 -->
						</div>
						<div class="ri-text">
							<div class="cat-name"><c:out value="${i.itemCategory }"/></div>
							<a href="${path}/market1/marketdetail.do?itemNo=${i.itemNo }">
								<h4><c:out value="${i.itemName }"/></h4>
								<p><c:out value="${i.mainContent }"/></p>
							</a>
							<div style="display: flex; margin-top: 1%; justify-content: space-between; align-items: center;">
								<div style="display: flex;">
									<c:if test="${i.itemDiscount eq 'Y'}">
										<div class="top-left"><img src="${path }/resources/images/salee.gif" width="100px" height="100px"/></div>
									</c:if>
									<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
									<h5><fmt:formatNumber value="${i.itemPrice }" pattern="###,###,###"/></h5><h5>원</h5>
									<c:if test="${i.itemDiscount eq 'Y'}">
										<h5 style="color: orange; font-weight: bold;">─▶ 할인가 9,900원</h5>
									</c:if>
								</div>
								<div class="zoom">
									<c:if test="${i.itemStock ==0}">
										<span style="font-size: 15px;">일시품절</span>
									</c:if>
									<c:if test="${i.itemStock!=0 }">
									<a href="javascript:void(0);" onclick="addbasketitem(${i.itemNo },'${loginMember.memberId }','${i.mainPic }','${i.itemName }')"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
<%-- 									<a href="${path }/market/cart.do?id=${m}&itemNo=${i.itemNo}"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a> --%>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>

<!-- 			<div class="row">
				<div class="col-lg-12">
					<div class="pagination flex-l-m flex-w m-l--6 p-t-25">
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">prev</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">1</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">2</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">3</a>
						<a href="#" class="item-pagination flex-c-m trans-0-4" onclick="fn_pageBtn(event)">next</a>
					</div>
				</div>
			</div> -->
		</div>
	</section>
</div>


<!-- <div class="floating">
	<div>챗봇위치</div>
	<div>최근본상품위치</div>
	<div><button type="button" onClick="javascript:window.scrollTo(0,0)">위로가기위치</button></div>
</div> -->
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
var arr=new Array();
<c:forEach var="b" items="${basket}">
   arr.push({itemNo:${b.itemNo}});
</c:forEach>

const addbasketitem=(no,memberId,mainPic,itemName)=>{ //=>()=>{클로저함수
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


<script>
$(function(){//.레디함수
	
	//최근본상품
/*  	var out = localStorage.getItem('list');
	var list = JSON.parse(out);
	if ( list == null) list = [];
	
	var id = $('#itemName').html();
	var category = $('#cate').html();
	var price = $('#price').html();
	var str = id+'|'+category+'|'+price;
	
	if(id != null) {
		list.unshift(str); // 앞에서부터 저장
		localStorage.setItem('list', JSON.stringify(list));
	} */
	
	
	
	
	//가격대별
	$(".changeBtn").click(e=>{
		changeBtn = $(e.target).val();
		$.get("${path}/market/bestAjax.do?value="+changeBtn
    			, data=>{
    					console.log(data);
    					
    				
    					//반복문 2개 : 1//data.forEach(i=>{	console.log(i)	}); 2//for(let i=0; i<data.length; i++){ console.log(data[i]);	};
    					
    					$("#print").html(''); //원래의 값 비워주기
    					
    					
    					var html = "";
    					data.forEach(i=>{	console.log(i)
    						//html += "<h4>"+i.itemName+"</h4>";
    						
    						var m = '${loginMember.memberId }';
    						//var aaaaa= addbasketitem(i.itemNo,m,i.mainPic,i.itemName);
    						//$("<a>").attr({}).click(addbaketItem)
    						
    						var itemNo = i.itemNo;
    						var stock = i.itemStock==0 ? "<div class='col-lg-4 col-sm-6' style='padding: 3%;filter: grayscale(100%);'>"
    									: "<div class='col-lg-4 col-sm-6' style='padding: 3%;'>";
    						//var stock2 = i.itemStock==0 ? "<a href='${path }/market/cart.do?id=${m}&itemNo="+itemNo+"'><img src='https://img.icons8.com/pastel-glyph/512/shopping-cart.png' width='30' height='30'></a>"
    						var stock2 = i.itemStock==0 ? "<span style='font-size: 15px;'>일시품절</span>"
    									: '<a href="javascript:void(0);" onclick="addbasketitem('+i.itemNo+',\'${loginMember.memberId }\',\''+i.mainPic+'\',\''+i.itemName+'\')"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="3" height="30"></a>';
//    									: "<a href='javascript:void(0);' onclick='addbasketitem("+aaaaa+"');'><img src='https://img.icons8.com/pastel-glyph/512/shopping-cart.png' width='30' height='30'></a>";
    						var sale = i.itemDiscount == 'Y' ? "<div class='top-left'><img src='${path }/resources/images/iconsale.gif' width='100px' height='100px'/></div>" : "";
    						var sale2 = i.itemDiscount == 'Y' ? "<h5 style='color: orange; font-weight: bold;'>─▶ 할인가 9,900원</h5>" : "";
    						
    						
    						
    						html += stock
							html += "<div class='recipe-item'>";
							html += "<div class='zoom'>";
							html += "<a href='${path}/market1/marketdetail.do?itemNo="+i.itemNo+"'><img src='${path }/resources/upload/market/mainlabel/"+i.mainPic+"' alt='' width='330' height='280'></a>";
							html += "</div>";
							html += "<div class='ri-text'>";
							html += "<div class='cat-name'>"+i.itemCategory+"</div>";
							html += "<a href='${path}/market1/marketdetail.do?itemNo="+itemNo+"'>";
							html += "<h4>"+i.itemName+"</h4>";
							html += "<p>"+i.mainContent+"</p>";
							html += "</a>";
							html += "<div style='display: flex; margin-top: 1%; justify-content: space-between; align-items: center;'>";
							html += "<div style='display: flex;'>";
							html += sale;
							html += "<img src='https://img.icons8.com/ios/512/money-bag.png' width='20' height='20'>";
							html += "<h5>"+i.itemPrice+"</h5><h5>원</h5>";
							html += sale2;
							html += "</div>";
							html += "<div class='zoom'>";
							html += stock2
							html += "</div>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
    					
    					
    					
    					});//data.forEach반복문./
    					
    					$("#print").html(html);
    					

			}); //data./$.get./
	
	
	})//e./click./
	
/* <c:if test="${i.itemStock ==0}">
		<span style="font-size: 30px;">일시품절</span>
	</c:if>
	<c:if test="${i.itemStock!=0 }">
	<a href='javascript:void(0);' onclick="addbasketitem(${i.itemNo },'${loginMember.memberId }','${i.mainPic }','${i.itemName }')"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
										<a href="${path }/market/cart.do?id=${m}&itemNo=${i.itemNo}"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="30" height="30"></a>
	</c:if> */
//	"<a href='javascript:void(0);' onclick='addbasketitem(${i.itemNo },'${loginMember.memberId }','${i.mainPic }','${i.itemName }')'><img src='https://img.icons8.com/pastel-glyph/512/shopping-cart.png' width='30' height='30'></a>"
	
	
	
	
	
});//레디함수./
	


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

	.top-left {
		position: absolute;
	  	top: 1%;
    	left: 1%;
	}

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
		height: 1300px;
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