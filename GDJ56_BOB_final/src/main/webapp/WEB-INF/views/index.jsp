<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <div class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15 banner">
            <div class="tit6">
                <p>M A R K E T</p>
            </div>
        </div>
        <style>
            .banner{
                background-image: url(${path}/resources/images/banner-market.jpg);
                height: 545px; 
                width: 100%;
            }
            .tit6{
                padding: 250px;
            }
            .tit6>p{
                margin: 0 auto; 
                width: fit-content;
                font-family: 'Secular One';
                font-weight: bolder;
                color: white;
                font-size: 50px;
                cursor: pointer;
            }
        </style>
        <script>
        	//배너 클릭 시 이동할 페이지 이름
        	let page="market";
        	
        	//배너가 3초마다 바뀜
            let count=0;
            setInterval(function(){
                if(count==0){
                    $(".banner").css({"background-image":"url(${path}/resources/images/banner-class.jpg)"});
                    $(".tit6>p").text("O N E - D A Y - C L A S S");
                    page="class";
                }else if(count==1) {
                    $(".banner").css({"background-image":"url(${path}/resources/images/banner-sub.jpg)"});
                    $(".tit6>p").text("S U B S C R I P T I O N").css("color","black");
                    page="sub";
                }else if(count==2) {
                    $(".banner").css({"background-image":"url(${path}/resources/images/banner-market.jpg)"});
                    $(".tit6>p").text("M A R K E T").css("color","white");
                    page="market";
                }
                count++;
                if(count>2) count=0;
            },3000)
            
            //배너의 문자 클릭 시 그 페이지로 감
            $(".tit6>p").click(e=>{
            	if(page=="market"){
            		location.assign("${path}/market1/matketmain.do");
            	}else if(page=="class"){
            		location.assign("${path}/class/main.do");
            	}else if(page=="sub"){
            		location.assign("${path}/subscription/subMain");
            	}
            })
        </script>

        <div class="site-section-main">
            <div class="container-main">
                <div class="rows">
                    <div>
                        <img src="${path}/resources/images/food.jpg" class="img-fluid">
                    </div>
                    <div class="col-md-5">
                        <h3 class="text-black con">Bring joy for your table from Market</h3>
                        <p class="con"><span>당신의 식탁 위에 즐거움을 선사합니다. 저희는 오로지 당신의 식탁을 체울 만한 상품들을 마켓에 가져왔습니다. 특가와 추천상품이 당신을 기다리고있어요!</span></p>
                        <button class="btn-main" onclick="location.assign('${path}/market1/matketmain.do')">More About Market</button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="site-section-main">
            <div class="container-main">
                <div class="rows">
                    <div class="col-md-5">
                        <h3 class="text-black con">Bring joy for your table from One-Day Class</h3>
                        <p class="con"><span>코로나 시대에 우리는 어떤 걸 할 수 있을가요? 이제 저희는 바깥에서 무엇을 경험할 수 있나요? 푸드에 관한 원데이 클래스를 통해 색다른 경험과 소중한 레시피를 쌓아보세요.</span></p>
                        <button class="btn-main" onclick="location.assign('${path}/class/main.do')">More About One-Day Class</button>
                    </div>
                    <div>
                        <img src="${path}/resources/images/food5.jpg" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
      
        <div class="site-section-main">
            <div class="container-main">
                <div class="rows">
                    <div>
                        <img src="${path}/resources/images/food3.jpg" class="img-fluid">
                    </div>
                    <div class="col-md-5">
                        <h3 class="text-black con">Bring joy for your table from Subscription</h3>
                        <p class="con"><span>바쁜 일상 생활, 우리에게 까먹는 것들이 점점 많아집니다. 당신의 식탁에 까먹는 것이 없도록 바랍니다. 구독하기를 통해 당신의 테이블이 가득하기를 바랍니다.</span></p>
                        <button class="btn-main" onclick="location.assign('${path}/subscription/subMain')">More About Subscription</button>
                    </div>
                </div>
            </div>
        </div>
        
        <style>
            .container-main{
             	text-align: center;
            }
            .col-md-5 *{
             	justify-items: center;
            }
            .rows{
             	 display:inline-flex;
            }
            .rows>*{
              	margin: 48px;
              	padding: 20px;
            }
            .btn-main{
            	border-radius: 10px;
             	border-color: wheat;
            	width: 199px;
            	height: 73px;
            	cursor: pointer;
            	background-color: #ffc107;
            	font-size: 16px;
            }
            .con{
            	width: 412px;
            }
            .text-black{
            	font-size: 28px;
            	font-weight:500;
            }
            .col-md-5>p>span{
            	color: gray;
            }
            .site-section-main h3, button{
              	font-family: 'Cairo';
            }
            .site-section-main p{
              	font-family: 'Gowun Dodum';
            }
            .img-fluid{
              	width: 540px;
            	height: 360px;
            }
        </style>

        <!-- Blog Section Begin -->
        <div class="members">
            <h3><strong>관리자들</strong></h3><br>
            <div>
                <div>
                    <h4>최유리</h4>
                    <p>조장</p>
					<img src="${path}/resources/images/최유리.png" style="width: 150px;height: 200px;">
                </div>
                <div>
                    <h4>구예지</h4>
                    <p>구예지</p>
                    <img src="${path}/resources/images/구예지.png" style="width: 150px;height: 200px;">
                </div>
                <div>
                    <h4>김은진</h4>
                    <p>김김</p>
                    <img src="${path}/resources/images/김은진.png" style="width: 150px;height: 200px;">
                </div>
                <div>
                    <h4>문지희</h4>
                    <p>문문</p>
                    <img src="${path}/resources/images/문지희.png" style="width: 150px;height: 200px;">
                </div>
                <div>
                    <h4>이동민</h4>
                    <p>민동</p>
					<img src="${path}/resources/images/이동민.png" style="width: 150px;height: 200px;">
                </div>
                <div>
                    <h4>유승경</h4>
                    <p>유유</p>
                    <img src="${path}/resources/images/유승경.png" style="width: 150px;height: 200px;">
                </div>
            </div>
        </div>
        <style>
            .members *{
                font-family: 'Gowun Dodum';
            }
            .members>*{
                justify-content: space-evenly;
                text-align: center;
            }
            .members>div{
               display: flex;
            }
        </style>
        <!-- Blog Section End -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>