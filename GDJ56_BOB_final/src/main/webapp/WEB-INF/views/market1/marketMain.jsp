<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
	<div class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/breadcrumb.jpg');">
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
    </div>
    
        <div class="container">
			<a style="font-size:30px;" href="${path }/market1/marketgtg.do">마켓 카테고리 이동</a><br>
			<a href="${path}/market1/insertmarket.do" class="primary-btn" style="margin-left:900px;margin-top:30px;background-color: #07d448;" >상품등록</a>
			
            <br><br><br>

            <!-- 이상품 어때요? -->
            <div style="text-align: center;">
            <c:if test="${likemenu==null }">
                <a href="${path }/market1/marketgtg.do"><h3 style="font-weight: bold;">이 상품 어때요? ></h3></a>
            </c:if>
            <c:if test="${likemenu!=null }">
                <a href="${path }/market1/memberLikeList.do"><h3 style="font-weight: bold;">이 상품 어때요? ></h3></a>
            </c:if>
            
            
                <br>	
            <c:if test="${loginMember!=null }">
                <h5>${likectg }를 선호하시는 ${loginMember.nickname } 님 맞춤 상품! 둘러보세요!</h5>
            </c:if>    
            <c:if test="${loginMember==null }">
                <h5> 오늘의 밥 인기상품 ! 둘러보세요!</h5>
            </c:if>    
                <br>
            </div>
           <div class="row">
                <div class="categories__slider owl-carousel">
                <c:if test="${likemenu==null }">
	                <c:forEach var="i" begin="1" end="10" >
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${items[i].mainPic }');">
	                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${items[i].itemNo}">${items[i].itemName }</a></h5>
	                        </div>
	                    </div>
	                 </c:forEach>
                 </c:if>
                 <c:if test="${likemenu!=null }">
	                 <c:forEach var="like" items="${likemenu }">
	                    <div class="col-lg-3">
	                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${like.mainPic }');">
	                        	<h5><a href="${path}/market1/marketdetail.do?itemNo=${like.itemNo}">${like.itemName }</a></h5>
	                        </div>
	                    </div>
	                 </c:forEach>
                 </c:if>
                </div>
            </div>
            <br><br><br>

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


            <!-- 매진임박상품 -->
            <div style="text-align: center;">
                <h3 style="font-weight: bold;">매진임박 상품 ! ></h3><br>
            </div>
            <div>
            	<img src="${path }/resources/market/img/soon.gif" style="width:150px;"/>
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
            
            <!-- 구독서비스 연결 -->
            <img src="${path }/resources/market/img/banner/banner-2.jpg" alt="" style="width:100%; height: 300px; ">
            <br>


        </div>
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