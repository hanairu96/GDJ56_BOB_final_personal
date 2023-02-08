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
<title>오늘의밥추천관리자수정</title>
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
			오늘의 밥 추천 수정
		</h3>
	</div>

	<form class="flex-c-m todaybab" method="get" name="form">
		
		<div class="col-md-3" style="margin-left: 250px;">
			<!-- 추천제목 -->
			<span class="txt9">
				추천제목
			</span>

			<div class="wrap-inputname m-t-3 m-b-23 t-center">
				<select name="reNo" id="selectTitle"class="form-select" aria-label="Default select example">
					<c:forEach var="t" items="${relist }">
						<option value="${t.reNo }"><c:out value="${t.reIcon }${t.reTitle }"/></option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="col-md-3">
			<div class="wrap-btn-booking flex-c-m m-t-6">
				<div style="display: flex; margin-left: 65%;">
					<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin-left:2%" value="delete" onclick="javascript: form.action='${path}/market/deleteTodayBob.do';">
						삭제하기
					</button>
				</div>
			</div>
		</div>


		
	</form>
</div>




<form class="size22 m-l-r-auto">
	<div class="row flex-c-m" style="margin-top: 100px;">
		<div class="col-md-2">
			<!-- 검색 -->
			
			<div>
				<select id="selectOp"class="form-select" aria-label="Default select example">
					<option value="ALL" selected>전체보기</option>
					<option value="ITEM_CATEGORY">카테고리</option>
					<option value="ITEM_BRAND">브랜드</option>
					<option value="ITEM_NAME">제품명</option>
				</select>
			</div>
		</div>
		<div style="width: 300px; display: flex;">
			<div class="search-sidebar2 size12 bo2 pos-relative">
				<input id="search" class="input-search-sidebar2 p-l-20" type="text" name="" placeholder="Search">
				<!-- <button class="btn-search-sidebar2" onclick="searchItem();"><img style="width: 30px; height: 30px;" src="https://img.icons8.com/ios-filled/512/search.png"></button> -->
			</div>
		</div>
		
	</div>
</form>


<!-- todaybab create -->
<section class="todaybab-section">
	<div class="container">
		<span style="margin-left: 100px;">추천할 상품 선택</span>
		<form name="todaybobFrm" method="get" name="form">
		<div class="row flex-c-m">
			<div id="items"  class="col-lg-10 col-sm-10" style="margin-top: 30px; margin-bottom: 70px;">
				<table id="itemTable" class="table table-striped">
					<thead>
						<tr>
							<th scope="col">상품번호</th>
							<th scope="col">#</th>
							<th scope="col">카테고리명</th>
							<th scope="col">제품명</th>
							<th scope="col">브랜드</th>
							<th scope="col">원산지</th>
							<th scope="col">정가</th>
							<th scope="col">재고량</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${allItems }">
							<tr>
								<th scope="row"><c:out value="${i.itemNo }"/></th>
								<td>
								<input type="checkbox" name="chItems" value="${i.itemNo }" onchange="makeItemArr(this);"> <!-- onchange="makeItemArr(this);" -->
								</td>
								<td><c:out value="${i.itemCategory }"/></td>
								<td><c:out value="${i.itemName }"/></td>
								<td><c:out value="${i.madeIn }"/></td>
								<td><c:out value="${i.itemBrand }"/></td>
								<td><c:out value="${i.itemPrice }"/></td>
								<td><c:out value="${i.itemStock }"/></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				<input type="hidden" id="reIconNext" name="reIcon"/>
				<input type="hidden" id="reTitleNext" name="reTitle" />
				<input type="hidden" id="reContentNext" name="reContent"/>
				
				<!-- checkbox말고 로컬스토리지에 찍힌 값 -->
				<input type="hidden" id="itemLS" name="itemLS"/>
				<input type="hidden" id="selectTitleNext" name="selectTitleNext"/>

			</div>
			<div class="wrap-btn-booking flex-c-m m-t-6">
				<div style="display: flex; margin-left: 75%; margin-bottom: 50px;">
					<button type="submit" class="flex-c-m size36 txt11 trans-0-4"
					value="check" onclick="javascript: form.action='${path}/market/checkTodayBobModify.do'">
						수정하기
					</button>
				</div>
			</div>
		</div>
		</form>

		
	</div>

</section>


<script>

const makeItemArr = (target)=>{
	var todaying = JSON.parse(localStorage.getItem("today")).today;
	var checkVal = target.value;
	var confirmCheck = target.checked;
	if(confirmCheck == true){	todaying.push(checkVal);	}
	else{	todaying.splice(	todaying.indexOf(checkVal), 1);	}
	localStorage.removeItem('todaying');//지우고
	todaying = JSON.stringify({today:todaying});
	localStorage.setItem("today",todaying);//조합한거다시올림 //최종db에서사용할값
	
	var next = JSON.parse(localStorage.getItem("today")).today;
	
	$("#itemLS").attr("value", next);
	console.log(typeof $("#itemLS").val());
}



	
	
</script>
<script>
$(function(){//레디함수
	
	//제목선택시
	localStorage.removeItem('itemString'); //로드될 때 로컬스토리지에 저장된 값은 체크해줌
	
	let selectTitle = "ALL";
	$("#selectTitle").change(e=>{
		
		localStorage.removeItem('itemString');
		
		selectTitle = $(e.target).val();
		console.log("추천시퀀스"+selectTitle); //추천시퀀스
		
		$("#selectTitleNext").attr("value",selectTitle);
		
		$.get("${path}/market/chageItem.do?reNo="+selectTitle
    			, data=>{
    				//해당 추천상품 먼저 checked
    				let itemNo = new Array();
    				data.forEach(i=>{
    					itemNo.push(i.itemNo.toString());
    				});//console.log(itemNo);
    				
    				var today = JSON.stringify({today:itemNo});
    				localStorage.setItem("today",today);//올림
    				var todaying = JSON.parse(localStorage.getItem("today")).today;
    				//console.log(todaying);
    				//console.log(typeof todaying);
    				
     				$("input[name=chItems]").each((i,v)=>{ //상품의 checkbox를 모두 가져와서 //includes()로 로컬스토리지에 포함되어 있다면 checked로 변경
    					
    					//checked되어있으면 모든 checked풀고
    					if($("input:checkbox[name=chItems]:checked").length == 0){}
    					else{
    						$(v).prop("checked", false);
    					}
    					
    					const no = $(v).val();
    					
    					if(todaying.toString().includes(no)) $(v).prop("checked", true); //해당상품은 checked
    					

    				});
    				

    				
    				
    	});//$.get./
    	
    	

    	
    	

	});//selectTitle.change./
	

	
	
	//검색
	let selectOp = "ALL";
	$("#selectOp").change(e=>{
		//console.log($(e.target).val());
		selectOp = $(e.target).val();
	});
    $("#search").keyup(e=>{
    	//console.log($(e.target).val());
    	
    	var todaying = JSON.parse(localStorage.getItem("today")).today;
    	
    	$.get("${path}/market/discountAdminAjax.do?value="+$(e.target).val()+"&selectOp="+selectOp
    			, data=>{
    				//console.log(data);
    				$("#itemTable tbody").html(''); //원래의 값 비워주기
    				
    				data.forEach(i=>{
    					let itemInfo = i.itemNo;
    					
    					let input = "";
    					//input = $("<input type='checkbox' name='chItems' onchange='makeItemArr(this);'>").val(itemInfo);
    					
    					
    					if(todaying.toString().includes(itemInfo.toString())) { //자료형에 맞추기 - getItems눈 문자, itemInfo는 숫자
    						input = $("<input type='checkbox' name='chItems' onchange='makeItemArr(this);' checked>").val(itemInfo);
    						console.log("있"+input);
    					}else{
    						input = $("<input type='checkbox' name='chItems' onchange='makeItemArr(this);'>").val(itemInfo);
    						console.log("없"+input);
    					}
    					
    					
	    				let tr = $("<tr>");
    					let itemNo = $("<td>").text(i.itemNo);
    					let checkbox = $("<td>").append(input); //로컬스토리지 포함 체크
    					let itemCategory = $("<td>").text(i.itemCategory);
    					let itemName = $("<td>").text(i.itemName);
    					let itemBrand = $("<td>").text(i.itemBrand);
    					let madeIn = $("<td>").text(i.madeIn);
    					let itemPrice = $("<td>").text(i.itemPrice);
    					let itemStock = $("<td>").text(i.itemStock);
    					
    					tr.append(itemNo).append(checkbox).append(itemCategory).append(itemName).append(itemBrand).append(madeIn).append(itemPrice).append(itemStock);
    					$("#itemTable tbody").append(tr);
    				});
    		});//$.get./
    			
    });//$("#search").keyup.e./
    
	
    
    
    
});//레디함수./
</script>






</body>
<style>
	.modal-dialog{
		width: 35%;
		height: 35%;
		position:[10,20];
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
		height: 450px;
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