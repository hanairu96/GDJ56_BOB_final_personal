<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
		});
		$(window).scroll(  
			function(){  
				console.log('test');
				//스크롤의 위치가 상단에서 450보다 크면  
				if($(window).scrollTop() > 500){  
					$('#calender').addClass("fix1");  
					//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
				}else{  
					$('#calender').removeClass("fix1");  
					//위의 if문에 대한 조건 아닌경우 fix라는 class를 삭제함  
				}
			}
		); 
			
		$(window).scroll(  
			function(){  
				//스크롤의 위치가 상단에서 450보다 크면  
				if($(window).scrollTop() > 1500){   
					$('#datailmenubar').addClass("fix2");  
					//위의 if문에 대한 조건 만족시 fix라는 class를 부여함  
				}
			}
		);
	});
</script>

<body>
<input >
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
				<a href="${path }/class/main.do" class="txt27">
					one-day class
				</a>

				<span class="txt29 m-l-10 m-r-10">/</span>

				<a href="${path}/class/menu.do?type=${odc.odcCategoty }" class="txt27">
					${odc.odcCategoty }
				</a>

				<span class="txt29 m-l-10 m-r-10">/</span>

				<span class="txt29">
					${odc.odcClassName }
				</span>
			</div>
		</div>

		<div class="container">
			<div class="row ">
				<div class="col-md-8 col-lg-9">
					<div class=" bo5-r">
						<div class="blo4 p-b-63">

							<div class="zoom bo-rad-10" style="margin: 3%;">
								<img src="${path}/resources/images/onedayclass/${odc.odcMainPic }" height="450">
							</div>

							<div class="t-center">
								<h4 class="">
									<h3>${odc.odcClassName }</h3>
									<br>
								</h4>
								
								<div class="txt32 flex-w" style="display: flex;">
									<div style="border:solid black 2px;padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/cook-male.png" width="30" height="30">
										${odc.mastserName}
										<input type="hidden" name="masterId" value="${odc.memberId }" id="masterId">
										<input type="hidden" name="masterName" value="${odc.mastserName}" id="masterName">
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px;padding: 0.5%;">
										<span>
											<img src="${path}/resources/pato/images/class/time1.png" width="30" height="30">
											수업 소요 시간 : 약 ${odc.odcTime }분
										</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px;  padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/time2.gif" width="30" height="30">
										수업시작 : ${odc.odcStartTime }
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px;  padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/place.png" width="30" height="30">
										<p>${odc.odcCity }</p>
									</span>
									</div>
									&nbsp;&nbsp;
									<div style="border:solid black 2px; padding: 0.5%;">
									<span>
										<img src="${path}/resources/pato/images/class/person.png" width="30" height="30">
										<p>1명~${odc.odcPeople }</p>
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
										<a href="#qna"><h3>문의글</h3></a>
									</div>
								</div>
								<br>
								<!-- 상세페이지 내용 -->
								<div  width="100" height="100">
								${odc.odcContent}
								</div>
								
								<br><br>

								<div style="margin-bottom: 3%; margin-top: 3%;">
									<span>───────────────────────────────────────────────────</span>
								</div>

								<h4 class="txt33 p-b-14">강사님 소개</h4><br>
								<p style="margin: 1%;">
									<%-- <c:set var="keywordArr" value="${fn:split(${am.history},',')}"/>
									<c:foreach var="word" items="${keywordArr}">
									    ${word}
									</c:foreach> --%>
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
									/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
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
									marker.setMap(map); */
									
									// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
									// marker.setMap(null);    
								</script>   
							</div>

							<div style="margin-bottom: 3%; margin-top: 3%;">
								<span>───────────────────────────────────────────────────</span>
							</div>
	
							<!-- 후-->
							<div>
								<div style="display:flex;">
									<h4 class="txt33">
									수강후기
									</h4>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="hidden" name="odcNo" value="${odc.odcNo}" id="odcNo">
									<input type="hidden" name="memberId" value="${loginMember.memberId}" id="memberId">
									<button type="button" class="btn3 flex-c-m size36 txt11 trans-0-4" style="margin-right:30%"
									onclick="goPopup(event);">
											리뷰작성하기
									</button>
									
									
									<script type="text/javascript">
						            	function goPopup(e){
						            		var memberId=$(e.target).prev("input").val();
						            		var odcNo=$(e.target).prev().prev("input").val();
						            		var gsWin=window.open("${path}/class/pop.do?id="+memberId+"&&no="+odcNo,"winName","width=520,height=730"); //open("주소",띄우는방식,크기)
						            		console.log(memberId);
						            		console.log(odcNo);
						            	}
									</script>
									
								</div>
								<br>
								<p style="color: rgb(195, 195, 195);">
									* 클래스를 수강한 회원님들의 후기입니다.
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
							</div>
							
							<div id="reviewtList"></div>

							<div style="margin-bottom: 7%; margin-top: 3%;">
								<span id="qna">───────────────────────────────────────────────────</span>
							</div>
		
							<div>
								<h4 class="txt33 p-b-14">
									문의하기
								</h4>
								<div class="col-md-12" id="">
									<div class=" size12 bo2 bo-rad-10 m-t-3 m-b-23">
										<input type="hidden" name="memberId" value="${loginMember.memberId }" id="memberId">
										<input type="hidden" name="odcNo" value="${odc.odcNo}" id="odcNo">
										<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="oqContent" id="oqContent" placeholder="강사님에게 궁금한 점을 남겨주세요">
									</div>
								<!-- 	<ul style="border: solid 1px; margin-bottom: 1%;"></ul> -->
									<div style="display: flex; align-items:center">
										<button type="button" id="Comment_regist" class="btn3 flex-c-m size36 txt11 trans-0-4">
											등록
										</button>
										&nbsp;&nbsp;
										<div style="margin-bottom: -1%;">
											<label>
												<input type="checkbox" value="secret" name="secret" id="secret">
												비밀글
											</label>
										</div>
									</div>
								</div>
								
								<!-- 댓글리스트 -->
								<div id="commentList" style="margin-top:10%"></div>
								
							</div>
						</div>
					</div>
				</div>

	 	<script type="text/javascript">
		//답댓글보기
		function goView(e){
			const oqno=$(e.target).prev().val();
			const masterName= $('#masterName').val();
			$(e.target).parent().parent().next().next("div").slideToggle("fast");
			console.log(oqno);
			$.ajax({
		        type:'get',
		        url : "<c:url value='/class/selectReOdcQaAll.do'/>",
		        data:{
		        	"oqno" : oqno
				}, 
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		        success : function(data){
		            
					var html = "";
					         
					if(data.length > 0) {
						
						for(i=0; i<data.length; i++){
					      	  
							html+="<ul style='margin:1%;'>";
							html+="<li>";
							html+="<div id='reply_area' class='bo-rad-10 sizefull txt10 p-l-20'>";
							html+="<div id='replyInfo'>";
							html+="<span>"+masterName+"</span>";
							html+="<span>│"+data[i].oqrEnrollDate+"</span>";
							html+="<span style='cursor: pointer;'>│수정</span>";
							html+="<span style='cursor: pointer;'>│삭제</span>";
							html+="</div>";
							html+="<div id='txt_area' class='wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23' style='border: solid gray 1px;'>";
							html+="<p>"+data[i].oqrContetnt+"</p>";
							html+="</div>";
							html+="</div>";
							html+="</li>";
							html+="</ul>";
						}
						
					}else{
						html += '<h6><strong>등록된 댓글이 없습니다</strong></h6>';
					}
						$(".reCommentList").html(html);
				}
			});
			
		};
		
		function goInput(e){
			$(e.target).parent().parent().next("div").slideToggle("fast");
				//$("#commentInput") // 2초에 걸쳐서 진행
		};
		
		//답댓글 데이터 넣어주기
		function reCommentBtn(e){
			//로그인한 회원 아이디
			const memberId= $('#memberId').val();
			const oqno=$(e.target).prev().prev().val();
			//입력값
			const oqrContetnt=$(e.target).prev("input").val();
			const masterId= $('#masterId').val();
			const admin="admin";
			
			console.log(oqrContetnt);
			console.log(memberId);
			console.log(oqno);
			console.log(masterId);
			
 			if(memberId == ''){
				alert('로그인 후 이용해주세요');
				return;
			}else if(oqContent == '') {
				alert('내용을 입력하세요');
			}else if(masterId!=memberId&&memberId!=admin){
				alert('해당 클래스 강사님또는 관리자만 답변이 가능합니다');
				return;
			} 
			
			$.ajax({
				type:'post',
				url:'<c:url value="/class/inputReplayOdcQa.do"/>',
				contentType: 'application/json',
				data:JSON.stringify({
						"oqno":oqno,
						"oqrContetnt":oqrContetnt,
				}), 
				success : function(data){
		          
					alert('댓글을 입력하셨습니다!');
					goView();
		            
		    	},
				error:function(){
					alert('통신실패');
				}
			
			})

		}
		
		
	 	//댓글데이터넣어주기
		$('#Comment_regist').click(function(){
			
			const oqContent=$('#oqContent').val();
			//const oqSecretYn =$('#oqContent').is(":checked");
			const secret=$('#secret').is(":checked");
			var oqSecretYn = (secret == true) ? "Y" : "N";
			const odcNo= $('#odcNo').val();
			const memberId= $('#memberId').val();
			
			console.log(secret);
			console.log(oqContent);
			console.log(oqSecretYn);
			console.log(odcNo);
			console.log(memberId);
			
			
			
			if(memberId == ''){
				alert('로그인 후 이용해주세요');
				return;
			}else if(oqContent == '') {
				alert('내용을 입력하세요');
			}
			
			$.ajax({
				type:'post',
				url:'<c:url value="/class/inputOdcQa.do"/>',
				contentType: 'application/json',
				data:JSON.stringify({
						"odcNo":odcNo,
						"memberId":memberId,
						"oqContent":oqContent,
						"oqSecretYn":oqSecretYn
				}), 
				success : function(data){
		          
		            
					getCommentList();
	                $("#oqContent").val("");
		            
		    	},
				error:function(){
					alert('통신실패');
				}
			
			})
		});
	 	
	 	//댓글리스트 가져오기
		$(function(){
 		    getCommentList();
 		});
	
	
		
	 	//댓글가져오기
		function getCommentList(){
			const odcNo= $('#odcNo').val();
			const masterId= $('#masterId').val();
		    $.ajax({
		        type:'get',
		        url : "<c:url value='/class/selectOdcQaAll.do'/>",
		        data:{
		        	"odcNo" : odcNo
				}, 
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		        success : function(data){
		            
		            var html = "";
		            
		            if(data.length > 0){
		                
		                for(i=0; i<data.length; i++){
		                
		          /*       html +="<span>"+data[i].memberId+"</span>";
		                   html +="<span>"+data[i].oqEnrollDate+"</span>"; */
		                 
		                   html+="<div style='border-bottom: solid 1px gray;margin:2%;'  class='col-md-12'>";
		                   html+="<ul style='margin:1%;'>";
		                   html+="<li>";
		                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
		                   html+="<span>";
		                   html+="<span>"+data[i].memberId+"</span>";
		                   html+="<span>│"+data[i].oqEnrollDate+"</span>";
		                   html+="<span style='cursor: pointer;'>│수정</span>";
		                   html+="<span style='cursor: pointer;'>│삭제</span>";
		                   html+="</span>";
		                   html+="<div class='size12 bo-rad-10 m-b-23' style='border: solid gray 1px; margin-top: 1%;'>";
		                   html+="<p style='padding:auto;'>"+data[i].oqContent+"</p>";
		                   html+="</div>";
		                   html+="<div class='commentView'>";
		                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
		                   html+="<span class='vieCommentList' style='cursor: pointer;' onclick='goView(event);'>댓글보기</span>";
		                   html+="<span class='enrollCommentInput' style='cursor: pointer;' onclick='goInput(event);'>│댓글쓰기</span>";
		                   html+="</div>";
		                   html+="</div>";
		                   html+="<div class='commentInput' style='display:none;'>";
		                   html+="<ul style='margin:1%;'>";
		                   html+="<li>";
		                   html+="<div class='bo-rad-10 sizefull txt10 p-l-20'>";
		                   html+="<div class='replyInfo'>";
		                   html+="<span>강사님</span>";
		                   html+="</div>";
		                   html+="<div style='display: flex;'>";
		                   html+="<input type='hidden' value="+data[i].oqno+" id='oqNo'>"
		                   html+="<input class='bo-rad-10 txt10 p-l-20' id='replyComment' type='text' style='border: solid gray 1px; width: 800px; height: 50px;' placeholder='강사님! 해당 문의에 대한 답글을 남겨 주세요'>";
		                   html+="&nbsp;&nbsp;";
		                   html+="<button style='width: 100px;cursor: pointer;' onclick='reCommentBtn(event);'>등록</button>";
		                   html+="</div>";
		                   html+="</div>";
		                   html+="</li>";
		                   html+="</ul>";
		                   html+="</div>";
		                   html+="<div class='reCommentList' style='display: none;'>";
		                   html+="</div>";
		                   html+="</li>";
		                   html+="</ul>";
		                   html+="</div>";
		                }
		                
		            }else {
		            
		                html += '<h6><strong>등록된 댓글이 없습니다</strong></h6>';
		               
		            }
		            
		            $("#commentList").html(html);
		            
		        },
		        error:function(){
		        	alert('통신실패');
		       }
		        
		    });
		}
	</script>

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
							
						<!-- datepicker 스크립트  -->
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
	li {
        list-style-image: url(${path}/resources/images/send-comment.png) weith:10px height:10px;
    }
</style>
</html>