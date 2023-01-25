<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<head>
	<title>원데이 클래스 상세</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${path}/resources/pato/bootstrap/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<script src="https://cdn.ckeditor.com/ckeditor5/35.4.0/classic/ckeditor.js"></script>
	<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
	
	<!-- 다음 api 지도 -->
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=63790162820e52da6fdb26e25b092596"></script>
	
	<!--datepicker -->
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- datepicker 한국어로 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	
	
</head>
<script>
	//달력 배치 및 효과 스크립트
	$(function () {
		$("#search").on("click", function() {
			$("#searchbox").slideDown("fast"); // 2초에 걸쳐서 진행
		})
	})
	$(window).scroll(  
		function(){  
			//스크롤의 위치가 상단에서 450보다 크면  
			if($(window).scrollTop() > 500){  
			/* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
				$('#calender').addClass("fix1");  
				//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
			}else{  
				$('#calender').removeClass("fix1");  
				//위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
			}  
		}  
	);  $(window).scroll(  
		function(){  
			//스크롤의 위치가 상단에서 450보다 크면  
			if($(window).scrollTop() > 1500){  
			/* if(window.pageYOffset >= $('원하는위치의엘리먼트').offset().top){ */  
				$('#datailmenubar').addClass("fix2");  
				//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
			}
		}  
	);  
</script>
<body>
	<!-- 배너 -->
	<div class="bg-title-page flex-c-m" style="background-image: url(${path}/resources/pato/images/class/class3.gif);">
		<h2 class="tit6 t-center" >
			One-Day Class
		</h2>
	</div>


	<!-- 루트분류 -->
	<section>
		<div class="bo5-b p-t-17 p-b-17">
			<div class="container" >
				<a href="index.html" class="txt27">
					one-day class
				</a>

				<span class="txt29 m-l-10 m-r-10">/</span>

				<a href="blog.html" class="txt27">
					기타
				</a>

				<span class="txt29 m-l-10 m-r-10">/</span>

				<span class="txt29">
					저염 치즈 만들기 클래스
				</span>
			</div>
		</div>

		<div class="container">
			<div class="row ">
				<div class="col-md-8 col-lg-9">
					<div class=" bo5-r">
						<div class="blo4 p-b-63">

							<div class="zoom bo-rad-10" style="margin: 3%;">
								<img src="${path}/resources/pato/images/class/diy1.jpg" alt="IMG-BLOG" height="450">
							</div>

							<div class="t-center">
								<h4 class="">
									<h3>저염 치즈 만들기 클래스</h3>
									<br>
								</h4>
								
								<div class="txt32 flex-w" style="display: flex;">
									<div style="border:solid black 2px;padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/cook-male.png" width="30" height="30">
										김강사
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px;padding: 0.5%;">
										<span>
											<img src="${path}/resources/pato/images/class/time1.png" width="30" height="30">
											수업 소요 시간 : 약 120분
										</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px;  padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/time2.gif" width="30" height="30">
										수업시작 : 오전 11시 30분
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px;  padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/place.png" width="30" height="30">
										서울시 관악구
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px; padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/person.png" width="30" height="30">
										1~10명
									</span>
									</div>
								</div>

								<!-- 상세페이지 메뉴바 -->
								<div class="multab" style="display: flex; padding: 5%; text-align: center;box-shadow: 0px 5px 5px -5px gray;" id="datailmenubar">
									<div style="margin-left: 3%;margin-right: 3%; display: flex;">
										<h3>클래스 소개</h3>
									</div>
									<h3>│</h3>
									<div style="margin-left: 3%;margin-right: 3%; display: flex;">
										<h3>강사 소개</h3>
									</div>
									<h3>│</h3>
									<div style="margin-left: 3%;margin-right: 3%; display: flex;">
										<h3>수강 후기</h3>
									</div>
									<h3>│</h3>
									<div style="margin-left: 3%;margin-right: 3%; display: flex;">
										<h3>문의글</h3>
									</div>
								</div>
								
								<!-- 상세페이지 내용 -->
								<h4 class="txt33 p-b-14">클래스 소개</h4><br>
								<p style="margin: 3%;">
									
									내 손으로 직접 만드는 요리의 기쁨을 '나우쿠킹'에서 느껴보세요!<br>

									12세 이상 누구나 참여할 수 있는 성인 쿠킹 클래스입니다.<br>

									각 팀마다 오븐, 가스렌지 4구를 사용하기 때문에 다른 팀과 사회적 거리 충분히 유지하고, <br>
									독립적인 요리환경을 가지고 있습니다
									
								</p>
									
								<img src="${path}/resources/pato/images/class/diy2.jpg" width="700" height="500" style="margin: 1%;">
								<p style="margin: 3%;">
									특별한 선물이 되는 베이킹 클래스가 기다리고 있어요.<br>
									
									개인별 참여는 물론, 연인, 친구와도 함께 배워보세요 :)<br>
									
									
									​나우쿠킹에서 준비한 성인베이킹 클래스입니다!

								</p>
								
								
								<img src="${path}/resources/pato/images/class/diy3.jpg" width="700" height="500" style="margin-top: 3%; margin-bottom: 2%;">
								<br><br>

								<div style="margin-bottom: 3%; margin-top: 3%;">
									<span>───────────────────────────────────────────────────</span>
								</div>

								<h4 class="txt33 p-b-14">강사님 소개</h4><br>
								<p style="margin: 1%;">
									
									파리바게트 근무 10년<br>

									클래스 오픈 경험 2년<br>

									바리스타/제과제빵 자격증 보유<br>
									르코르등 블루 숙명아카데미 상급요리 수료<br>

									이탈리아 일꾸오구 알마 수료<br>

									호텔한정식, 궁중음식연구원 수료
									
								</p>	
								<div style="margin-bottom: 3%; margin-top: 3%;">
									<span>───────────────────────────────────────────────────</span>
								</div>
	
								<h4 class="txt33 p-b-14" style="padding : 2%">
									대한민국 서울특별시 관악구 봉천동 인헌2길 9-3 플러스홈
								</h4>
								<!-- 다음 지도api-->
								<div id="all" style="align-items: center;">
									<div id="map" style="width:500px;height:300px;align-items: center;"></div>
								</div>
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									mapOption = { 
										center: new kakao.maps.LatLng(37.4780485, 126.8790079), // 지도의 중심좌표
										level: 3 // 지도의 확대 레벨
									};
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
									
									// 마커가 표시될 위치입니다 
									var markerPosition  = new kakao.maps.LatLng(37.4780485, 126.8790079); 
									
									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
										position: markerPosition
									});
									
									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);
									
									// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
									// marker.setMap(null);    
								</script>   
							</div>

							<div style="margin-bottom: 3%; margin-top: 3%;">
								<span>───────────────────────────────────────────────────</span>
							</div>
	
							<!-- 후기 리뷰 남기기 -->
							<form class="leave-comment p-t-10">
								<h4 class="txt33 p-b-14">
									수강후기
								</h4>
	
								<p style="color: rgb(195, 195, 195);">
									* 과도한 욕설과 비방은 통보없이 삭제될 수 있습니다 
								</p>
								<br>
								<div class="col-md-12" style="display: flex;">
			
									<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
										<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email" placeholder="수강후기를 남겨주세요">
									</div>
									<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin: 1%;">
										등록
									</button>
								</div>
	
							</form>

							<div style="margin-bottom: 3%; margin-top: 3%;">
								<span>───────────────────────────────────────────────────</span>
							</div>
		
							<form class="leave-comment p-t-10">
								<h4 class="txt33 p-b-14">
									문의하기
								</h4>
								<div class="col-md-12">
									<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
										<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email" placeholder="강사님에게 궁금한 점을 남겨주세요">
									</div>
									<ul style="border: solid 1pt; margin-bottom: 1%;"></ul>
									<div style="display: flex; align-items:center">
										<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
											등록
										</button>
										&nbsp;&nbsp;
										<div style="margin-bottom: -1%;">
											<label>
												<input type="checkbox" value="secret">
												비밀글
											</label>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				
		

				
				<!-- 사이드 달력 -->
				<div class="col-md-4 col-lg-3" style="width: 30%; height: 100%;">
					<div>
						<div style="text-align: center;" id="calender">
							<h3>클래스일정</h3>
							<p>원하는 날짜를 선택해주세요</p>
							<input type="text" id="testDatepicker" style="border: #111111 solid 2px;" placeholder="클릭해서 가능한 날짜 보기" onchange="inputValueChange()">
							<button type="submit" class="btn3" id="search">
								날짜확정
							</button>	
							
							<!-- datepicker 스크립트 -->
							<script>
								$(function(){
									const date=$("#testDatepicker").datepicker({
									});
								})
							</script>
							
							
							<div style="border: solid black; width: 100; height: 300; display: none; text-align: center;" id="searchbox">
								<p>참가인원 10/100</p>
								<p>예약 금액 1인 38,000원</p>
								<p>17:30 예약하시겠습니까?</p>
								<p>
									클래스 특성상 예약 후 재료준비로 인해
									취소 및 환불이 불가능 합니다.
								</p>	
								<label>
								<input type="checkbox">
								동의
								</label>
								
								<br>
								
								<button type="submit" class="btn3" >
									예약하기
								</button>	
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<style>
	/* 전체 배치 */
	* {
		margin: 0px; 
		padding: 0px; 
		box-sizing: border-box;
	}
	/* 전체 글씨체 */
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	/* 버튼 속 글씨 정중앙 정렬 */
	.flex-c-m {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	/* 효과 천천히 */
	.trans-0-4 {
		-webkit-transition: all 0.4s;
		-o-transition: all 0.4s;
		-moz-transition: all 0.4s;
		transition: all 0.4s;
	}
	
	/* input 효과 */
	.bo2 {border: 2px solid #d9d9d9;}
	.bo-rad-10 {border-radius: 10px;} 
	input {
		outline: none;
		border: none
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
	.p-l-20 {padding-left: 20px;}
	.m-l-r-auto {margin-left: auto;	margin-right: auto;}

	/* (사진)확대 효과 */
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
	

	/* 버튼 효과 */
	.btn3 {
		background: #111111;
		border-radius: 10px;
		color: white;
		width: 120px;
		height: 40px;
	}
	.btn3:hover {
		background-color: #6A0dad;
		color: white;
		width: 120px;
		height: 40px;
	}
	textarea:focus, input:focus {
		border-color: transparent !important;
		box-shadow: 0 0 0px 2px #ec1d25;
		-moz-box-shadow: 0 0 0px 2px #ec1d25;
		-webkit-box-shadow: 0 0 0px 2px #ec1d25;
		-o-box-shadow: 0 0 0px 2px #ec1d25;
		-ms-box-shadow: 0 0 0px 2px #ec1d25;
	}
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

	.t-center{
		text-align: center;
	}
	/* 배치 */
	*, ::after, ::before {
    box-sizing: inherit;
	}
	.bo5-b {
    border-bottom: 1px solid #e6e6e6;
	}
	.p-b-17 {
		padding-bottom: 17px;
	}
	.p-t-17 {
		padding-top: 17px;
	}
	.container {
    margin-right: auto;
    margin-left: auto;
    padding-right: 15px;
    padding-left: 15px;
    width: 100%;
	}
	/* 달력 */
	.fix1{
		position: fixed;	
		z-index: 0;
		right: -1;
		-webkit-transform: translateY(-80%);
		-ms-transform: translateY(-99%);
		transform: translateY(-99%);
	}
	.fix2{		
			position: sticky;
			top:80px;
			height: 80px; 
			width: 100%;
			background-color: white;
			z-index: 0;
			box-shadow: 0px 5px 5px -5px gray;
	}
</style>
</html>