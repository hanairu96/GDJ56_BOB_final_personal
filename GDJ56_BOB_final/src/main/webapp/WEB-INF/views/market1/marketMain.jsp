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
	.top-left {
      position: absolute;
      top: -10px;
      left: -15px;
      z-index: 1;
   	}
</style>
   <div class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/mainbanner.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                    	<h2 style="color:black;">오늘의 밥 마켓</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
        <div class="container">
         <%-- <a style="font-size:30px;" href="${path }/market1/marketgtg.do">마켓 카테고리 이동</a><br> --%>
         <c:if test="${loginMember.memberId eq 'admin' }">
         <a href="${path}/market1/insertmarket.do" class="primary-btn" style="margin-left:85%;margin-top:30px;background-color:#bde28f;" >상품등록</a>
         </c:if>
            <br><br><br>

            <!-- 이상품 어때요? -->
            <div style="text-align: center;">
            <c:if test="${likemenu==null or likectg ==null}">
                <a href="${path }/market1/marketgtg.do"><h2 style="font-weight: bold;">이 상품 어때요? ></h2></a>
            </c:if>
            <c:if test="${likemenu!=null }">
                <a href="${path }/market1/memberLikeList.do"><h3 style="font-weight: bold;">이 상품 어때요? ></h3></a>
            </c:if>
            
            
                <br>   
            <c:if test="${loginMember!=null }">
            	<c:if test="${likemenu !=null }">
                	<h5>${likectg }를 선호하시는 ${loginMember.nickname } 님 맞춤 상품! 둘러보세요!</h5>
                </c:if>
            	<c:if test="${likemenu ==null }">
               		<h5>${loginMember.nickname } 님 맞춤 상품! 둘러보세요!</h5>
            	</c:if>
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
                       	<c:if test="${items[i].itemDiscount eq 'Y' }">
                      		<img class="top-left" src="${path }/resources/images/iconsale.gif" style="width:100px;"/>
                      	</c:if>
                               <h5><a href="${path}/market1/marketdetail.do?itemNo=${items[i].itemNo}">${items[i].itemName }</a></h5>
                           </div>
                       </div>
                    </c:forEach>
                 </c:if>
                 <c:if test="${likemenu!=null }">
                    <c:forEach var="like" items="${likemenu }">
                       <div class="col-lg-3">
                           <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${like.mainPic }');">
                            <c:if test="${like.itemDiscount eq 'Y' }">
                      			<img class="top-left" src="${path }/resources/images/iconsale.gif" style="width:100px;"/>
							</c:if>
                              <h5><a href="${path}/market1/marketdetail.do?itemNo=${like.itemNo}">${like.itemName }</a></h5>
                           </div>
                       </div>
                    </c:forEach>
                 </c:if>
                </div>
            </div>
            <br>
            
            
    <!-- Featured Section Begin -->
    <section class="featured spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title">
              <h2>같이 사면 좋은 상품!</h2>
            </div>
            <div class="featured__controls">
              <ul>
                <li class="active" data-filter="*">전체</li>
                <li data-filter=".rice">떡볶이</li>
                <li data-filter=".pasta">파스타</li>
                <li data-filter=".fried">볶음밥</li>
                <li data-filter=".pan">부침개</li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row featured__filter">
          <div class="col-lg-3 col-md-4 col-sm-6 mix rice pasta fried pan">
            <div class="featured__item">
            <!-- 양파 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==105 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix rice fried pan">
            <div class="featured__item">
            <!-- 대파 -->
          	<c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==250 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix rice fried">
            <div class="featured__item">
            <!-- 알룰로스 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==201 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix fruit pasta">
            <div class="featured__item">
            <!-- 양송이 버섯 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==254 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix pasta">
            <div class="featured__item">
            <!-- 파스타면 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==13 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix pasta pan">
            <div class="featured__item">
            <!-- 아보카도 오일 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==257 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix pasta fried pan">
            <div class="featured__item">
            <!-- 새우살 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==247 }">
            <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6 mix rice fried">
            <div class="featured__item">
            <!-- 계란 -->
            <c:forEach var="ii" items="${items }">
            <c:if test="${ii.itemNo==224 }">
             <a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
              <div
                class="featured__item__pic set-bg"
                style="background-image: url('${path }/resources/upload/market/mainlabel/${ii.mainPic }');">
              </div>
           	</a>
              <div class="featured__item__text">
                <h6><a href="${path }/market1/marketdetail.do?itemNo=${ii.itemNo }" >
                   	<c:if test="${ii.itemBrand!=null }">
		        		[${ii.itemBrand }]
		        	</c:if>
                    <c:out value="${ii.itemName }"/>
                </a>
                </h6>
                <h5>${ii.itemPrice } 원</h5>
              </div>
              </c:if>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
            
            
            
            
            
            
            

   <!--여기!!  -->
            <div style="text-align: center;">
                <a href="${path }/market/today.do?type=f"><h2 style="font-weight: bold;">${relist.get(0).reIcon }${relist.get(0).reTitle } ></h2></a>
                <h5>${relist.get(0).reContent }</h5><br>
            </div>
             <div class="row">
                <div class="categories__slider owl-carousel">
                  <c:forEach var="i" begin="0" end="${fn:length(relistbyno0) -1 }" >
                    <div class="col-lg-3">
                    	<div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${relistbyno0[i].mainPic }');">
                        <c:if test="${relistbyno0[i].itemDiscount eq 'Y' }">
                      		<img class="top-left" src="${path }/resources/images/iconsale.gif" style="width:100px;"/>
                      	</c:if>    
                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${relistbyno0[i].itemNo}">${relistbyno0[i].itemName }</a></h5>
                        </div>
                    </div>
                   </c:forEach>
                   
                </div>
            </div>
            <br><br><br><br><br>
            <div style="text-align: center;">
                <a href="${path }/market/today.do?type=s"><h2 style="font-weight: bold;">${relist.get(1).reIcon }${relist.get(1).reTitle } ></h2></a><br>
                <h5>${relist.get(1).reContent }</h5><br>
            </div>
             <div class="row">
                <div class="categories__slider owl-carousel">
                
                  <c:forEach var="i" begin="0" end="${fn:length(relistbyno1) -1 }" >
                    <div class="col-lg-3">
                    	<div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${relistbyno1[i].mainPic }');">
                        <c:if test="${relistbyno1[i].itemDiscount eq 'Y' }">
                      		<img class="top-left" src="${path }/resources/images/iconsale.gif" style="width:100px;"/>
                      	</c:if>    
                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${relistbyno1[i].itemNo}">${relistbyno1[i].itemName }</a></h5>
                        </div>
                    </div>
                   </c:forEach>
                   
                </div>
            </div>
            <br><br><br><br><br>

            <!-- 1만원대 추천상품 -->
            <div style="text-align: center;">
                <a href="${path }/market1/recommendman.do?"><h2 style="font-weight: bold;">1만원대 추천상품 ></h2></a><br>
                <h5>베스트 상품! 둘러보세요!</h5><br>
            </div>
             <div class="row">
                <div class="categories__slider owl-carousel">
                
                  <c:forEach var="i" items="${reco }" >
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${i.mainPic }');">
                        <c:if test="${i.itemDiscount eq 'Y' }">
                      		<img class="top-left" src="${path }/resources/images/iconsale.gif" style="width:100px;"/>
                      	</c:if>    
                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${i.itemNo}">${i.itemName }</a></h5>
                        </div>
                    </div>
                   </c:forEach>
                   
                </div>
            </div>
            <br><br><br>


            <!-- 매진임박상품 -->
            <div style="text-align: center;">
               <div>
                  <img src="${path }/resources/market/img/soon.gif" style="width:130px;"/>
               </div>
                <a href="${path }/market1/soldoutsoon.do"><h2 style="font-weight: bold;">매진임박 상품 ! ></h2></a><br>
            </div>
            
            <div class="row">
                <div class="categories__slider owl-carousel">
                
                   <c:forEach var="i" items="${soon }" >
                    <div class="col-lg-3">
                        <div class="categories__item set-bg" style="background-image:url('${path }/resources/upload/market/mainlabel/${i.mainPic }');">
                        <c:if test="${i.itemDiscount == 'Y' }">
                      		<img class="top-left" src="${path }/resources/images/iconsale.gif" style="width:100px;"/>
                      	</c:if> 
                            <h5><a href="${path}/market1/marketdetail.do?itemNo=${i.itemNo}">${i.itemName }</a></h5>
                        </div>
                    </div>
                   </c:forEach>
      
                </div>
            </div>
            <br><br><br><br><br><br>
            

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