<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${r.reNo }" class="${r.reContent }"><h3>${r.reIcon }${r.reTitle }</h3></a>
		  </c:forEach>
		</div>
	</c:if>
	<!-- 4개일경우 -->
	<c:if test="${relistCnt == 4}">
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(0).reNo }" class="${relist.get(0).reContent }"><h3>${relist.get(0).reIcon }${relist.get(0).reTitle }</h3></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(1).reNo }" class="${relist.get(1).reContent }"><h3>${relist.get(1).reIcon }${relist.get(1).reTitle }</h3></a>
		</div>
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(2).reNo }" class="${relist.get(2).reContent }"><h3>${relist.get(2).reIcon }${relist.get(2).reTitle }</h3></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(3).reNo }" class="${relist.get(3).reContent }"><h3>${relist.get(3).reIcon }${relist.get(3).reTitle }</h3></a>
		</div>
	</c:if>
	<!-- 5개일경우 -->
	<c:if test="${relistCnt == 5}">
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(0).reNo }" class="${relist.get(0).reContent }"><h3>${relist.get(0).reIcon }${relist.get(0).reTitle }</h3></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(1).reNo }" class="${relist.get(1).reContent }"><h3>${relist.get(1).reIcon }${relist.get(1).reTitle }</h3></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(2).reNo }" class="${relist.get(2).reContent }"><h3>${relist.get(2).reIcon }${relist.get(2).reTitle }</h3></a>
		</div>
		<div class="todaybab_title">
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(3).reNo }" class="${relist.get(3).reContent }"><h3>${relist.get(3).reIcon }${relist.get(3).reTitle }</h3></a>
			<a href="javascript:void(0);" onclick="callFunction(event);" id="${relist.get(4).reNo }" class="${relist.get(4).reContent }"><h3>${relist.get(4).reIcon }${relist.get(4).reTitle }</h3></a>
		</div>
	</c:if>
</section>


<div style="display: flex; margin-left: 65%; margin-bottom: 30px;">


<c:if test="${m!=null and m=='admin' }">
	<c:if test="${relistCnt < 5}"><!-- btn(등록,수정) ->타이틀이 5개로 차면(max5) 등록하기는 안 보이고 수정하기만 보이게 -->
		<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" onclick="location.replace('${path}/market/todayAdmin.do')">등록하기</button>
	</c:if>
	<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin-left:2%" onclick="location.replace('${path}/market/todayAdminModify.do')">수정하기</button>
</c:if>



</div>
<!-- todaybab -->
<section class="discount-section spad">
	<div class="container">
		<!-- <h3 style="text-align: center; margin: 50px; padding-bottom: 10px;">1만원대 추천 상품<p style="margin-top: 20px;">놓치면 후회할 가격!</p></h3> -->
		<div id="printTitle"></div>
		
		<p id="itemleng">총 ${fn:length(tbAll)}건</p>
		<div class="row" id="print">
		<c:forEach var="i" items="${tbAll }">
			<div class="col-lg-4 col-sm-6" style="padding: 3%;${i.itemStock==0?'filter: grayscale(100%)':''};">
				<div class="todaybab-item">
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
								<c:if test="${i.itemDiscount eq 'Y'}">
									<div class="top-left"><img src="${path }/resources/images/iconsale.gif" width="100px" height="100px"/></div>
								</c:if>
								<img src="https://img.icons8.com/ios/512/money-bag.png" width="20" height="20">
								<h5>${i.itemPrice }</h5><h5>원</h5>
								<c:if test="${i.itemDiscount eq 'Y'}">
									<h5 style="color: orange; font-weight: bold;">─▶ 할인가 9,900원</h5>
								</c:if>
							</div>
							<div class="zoom">
									<c:if test="${i.itemStock ==0}">
										<span style="font-size: 18px;">일시품절</span>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
const callFunction = (e)=>{
		console.log(e.target);

	
		clickTag = $(e.target).parent().attr("id"); //reNo가져옴
		
		clickContent = $(e.target).parent().attr("class");
		
		clickTitle = $(e.target).parent().children().text();
		
		///////
		var title = "";
		title += "<h1 style='text-align: center; margin: 50px; padding-bottom: 10px;font-weight: bold;color: darkorange;'>"+clickTitle+"<h3 style='margin-top: 10px;text-align: center; margin: 50px; padding-bottom: 10px;color: lime;'>"+clickContent+"</h3></h1>";
	
		$("#printTitle").html(title);
		
		
		
		
		///////
		$.get("${path }/market/todayView.do?reNo="+clickTag
				,data=>{
						//console.log(data);
						
						$("#print").html(''); //원래의 값 비워주기
						$("p#itemleng").html('');
						
						
						
						var html = "";
						var itemNoCount = 0;
	   					data.forEach(i=>{
	   						itemNoCount = itemNoCount+1;//개수세기
	   						
    						var stock = i.itemStock==0 ? "<div class='col-lg-4 col-sm-6' style='padding: 3%;filter: grayscale(100%);'>"
    									: "<div class='col-lg-4 col-sm-6' style='padding: 3%;'>";
    						//var stock2 = i.itemStock==0 ? "<a href='${path }/market/cart.do?id=${m}&itemNo="+itemNo+"'><img src='https://img.icons8.com/pastel-glyph/512/shopping-cart.png' width='30' height='30'></a>"
    						var stock2 = i.itemStock==0 ? "<span style='font-size: 18px;'>일시품절</span>"
    									: '<a href="javascript:void(0);" onclick="addbasketitem('+i.itemNo+',\'${loginMember.memberId }\',\''+i.mainPic+'\',\''+i.itemName+'\')"><img src="https://img.icons8.com/pastel-glyph/512/shopping-cart.png" width="3" height="30"></a>';
    						var sale = i.itemDiscount == 'Y' ? "<div class='top-left'><img src='${path }/resources/images/iconsale.gif' width='100px' height='100px'/></div>" : "";
    						var sale2 = i.itemDiscount == 'Y' ? "<h5 style='color: orange; font-weight: bold;'>─▶ 할인가 9,900원</h5>" : "";
	
	
	   						html += stock;
							html += "<div class='recipe-item'>";
							html += "<div class='zoom'>";
							html += "<a href='${path}/market1/marketdetail.do?itemNo="+i.itemNo+"'><img src='${path }/resources/upload/market/mainlabel/"+i.mainPic+"' alt='' width='330' height='280'></a>";
							html += "</div>";
							html += "<div class='ri-text'>";
							html += "<div class='cat-name'>"+i.itemCategory+"</div>";
							html += "<a href='${path}/market1/marketdetail.do?itemNo="+i.itemNo+"'>";
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
							html += stock2;
							html += "</div>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
							html += "</div>";
	   						
	   					
	   					})//forEach i./
	   					
	   					console.log(itemNoCount);
						
	   					$("#print").html(html);
	   					$("p#itemleng").html('총 '+itemNoCount+'건');
						
						
		});//$.get./
	
//		e.stopPropagation();
	
//	};//클릭이벤트./
	
	
	
	
}


</script>
	<%-- <c:if test="${loginMember==null and loginMember.memberId eq 'admin' }"> --%>

<script>
	const fn_pageBtn = (e)=>{
		$(".item-pagination").removeClass("active-pagination");
		$(e.target).addClass("active-pagination");
	}
	function toHTMLTop() {
        $('html').scrollTop(0);
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
<script>
	$(()=>{
		
		//console.log(window.location.search);
		//console.log(window.location.search.substr(1));
		let maintype = '${param.type}';
		console.log(maintype);
		
		if (maintype == 'f') {
			console.log('dd');
 			const targetId=$(".todaybab_title a")[0].id;
 			const targetClass=$(".todaybab_title a")[0].className;
			$(".todaybab_title a").children()[0].click();
		}
		if (maintype == 's') {
			console.log('dd');
 			const targetId=$(".todaybab_title a")[1].id;
 			const targetClass=$(".todaybab_title a")[1].className;
			$(".todaybab_title a").children()[1].click();
		}
	})
</script>





</body>
<style>
	.top-left {
		position: absolute;
	  	top: 1%;
    	left: 1%;
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
		color: inherit;
	}
	
/* 	h4 {
	  color: green;
	 /*  text-decoration: underline yellow; 
	}
	
	h4:focus,
	h4:hover {
	  display: inline-block;
	  color: yellowgreen;
	  /* text-decoration-color: yellow; 
	  transform: translateY(-2px);
	  transition: 1s;
	} */

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