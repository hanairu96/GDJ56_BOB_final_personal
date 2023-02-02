<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader2.jsp"/>

<c:set var="path" value="${pageContext.request.contextPath }"/>
	<section class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/breadcrumb.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>오늘의 밥 마켓</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="categories">
        <div class="container">
			<a href="${path }/market1/marketgtg.do">마켓 카테고리 이동</a><br>
			<a href="${path }/itemQna/resultresult.do?itemNo=8">리뷰</a><br>
			<a href="${path }/itemQna/resultresult.do?itemNo=8&memberId=user03">리뷰쓰기</a> 
			<a href="${path}/market1/insertmarket.do" class="primary-btn" style="margin-left:900px;margin-top:30px;background-color: #07d448;" >상품등록</a>
			
            <br><br><br>

            <!-- 이상품 어때요? -->
            <div style="text-align: center;">
                <h3 style="font-weight: bold;">이 상품 어때요? ></h3>
                <br>	
                <h5>야채주스 님 맞춤 상품! 둘러보세요!</h5>
                <br>
            </div>
           <div class="row">
                <div class="categories__slider owl-carousel">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image: url('${path }/resources/market/img/categories/cat-1.jpg');">
                            <h5><a href="#">Fresh Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/market/img/categories/cat-2.jpg');">
                            <h5><a href="#">Dried Fruit</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/market/img/categories/cat-3.jpg');">
                            <h5><a href="#">Vegetables</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/market/img/categories/cat-4.jpg');">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/market/img/categories/cat-5.jpg');">
                            <h5><a href="#">drink fruits</a></h5>
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br>


            <!-- 구독서비스 연결 -->
            <img src="${path }/resources/market/img/banner/banner-2.jpg" alt="" style="width:100%; height: 300px; ">
            <br><br><br><br>
            

            <!-- 1만원대 추천상품 -->
            <div style="text-align: center;">
                <h3 style="font-weight: bold;">1만원대 추천상품 ></h3><br>
                <h5>야채주스 님 맞춤 상품! 둘러보세요!</h5><br>
            </div>
          	<div class="row">
                <div class="categories__slider owl-carousel">
                
                  <c:forEach var="i" begin="1" end="10" >
                    <div class="col-lg-3">
                    <c:if test="${items[i].itemPrice<20000}">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${items[i].mainPic }');">
                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${items[i].itemNo}">${items[i].itemName }</a></h5>
                        </div>
                    </c:if>    
                    </div>
                	</c:forEach>
                	
                </div>
            </div>
            <br><br><br>

            <!-- 냉장고 속 단골재료 -->
            <div style="text-align: center;">
                <h3 style="font-weight: bold;">냉장고 속 단골재료 ></h3><br>
                <h5>야채주스 님 맞춤 상품! 둘러보세요!</h5><br>
            </div>
            <div class="row">
                <div class="categories__slider owl-carousel">
                
                	<c:forEach var="i" begin="1" end="10" >
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${items[i].mainPic }');">
                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${items[i].itemNo}">${items[i].itemName }</a></h5>
                        </div>
                    </div>
                	</c:forEach>
      
                </div>
            </div>
            <br><br><br>


        </div>
    </section>
	<script>
		(function ($) {
		    $(".categories__slider").owlCarousel({
		        loop: true,
		        margin: 0,
		        items: 10,
		        dots: false,
		        nav: true,
		        navText: ["<span class='fa' style='font-weight:bold;'> < <span/>", "<span class='fa' style='font-weight:bold;'> > <span/>"],
		        animateOut: 'fadeOut',
		        animateIn: 'fadeIn',
		        smartSpeed: 1200,
		        autoHeight: false,
		        autoplay: true,
		        responsive: {

		            0: {
		                items: 1,
		            },

		            480: {
		                items: 2,
		            },

		            768: {
		                items: 3,
		            },

		            992: {
		                items: 4,
		            }
		        }
		    });    
		})(jQuery);
	
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>