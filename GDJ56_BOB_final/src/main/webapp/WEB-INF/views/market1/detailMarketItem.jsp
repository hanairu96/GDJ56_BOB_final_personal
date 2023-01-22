<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>

    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="height:250px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>채소</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="product-details spad">
        <div class="container">
            <div class="row">

                <!-- 슬라이더 사진 4개까지 넣을 수 있다 (사진을 4개 미만으로 넣으면 같은 사진 반복) -->
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="img/product/details/product-details-1.jpg" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                            <img data-imgbigurl="img/product/details/product-details-2.jpg"
                                src="img/product/details/thumb-1.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-3.jpg"
                                src="img/product/details/thumb-2.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-5.jpg"
                                src="img/product/details/thumb-3.jpg" alt="">
                            <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                src="img/product/details/thumb-4.jpg" alt="">
                                <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                src="img/product/details/thumb-4.jpg" alt="">
                                <img data-imgbigurl="img/product/details/product-details-4.jpg"
                                src="img/product/details/thumb-4.jpg" alt="">
                        </div>
                    </div>
                </div>


                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>야채 튼튼 세트</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 리뷰)</span>
                        </div>
                        <div class="product__details__price">50000원</div>
                        <p>야채를 드세요 건강해집니다.</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <br>
                        <a href="#" class="primary-btn" style="background-color: #07d448;">장바구니 담기</a>
                        <a href="#" class="primary-btn" style="background-color: #07d448;">바로결제하기</a>
                    </div>
                </div>


                <!-- 상품설명, 리뷰, 교환 및 반품안내, 문의하기 -->
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <br><br>
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true" style="font-size: 25px;">상품설명</a>
                            </li>
                            <li class="nav -item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false" style="font-size: 25px;">리뷰<span>(1)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false" style="font-size: 25px;">교환 및 반품 안내</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                                    aria-selected="false" style="font-size: 25px;">문의하기 <span>(1)</span></a>
                            </li>
                        </ul>
                        <br>
                        <hr/> 
                        <br>
                    </div>
                </div>
                

            </div>
        </div>
    </section>

    <script>
	    (function ($) {  
	        var proQty = $('.pro-qty');
	        proQty.prepend('<span class="dec qtybtn">-</span>');
	        proQty.append('<span class="inc qtybtn">+</span>');
	        proQty.on('click', '.qtybtn', function () {
	            var $button = $(this);
	            var oldValue = $button.parent().find('input').val();
	            if ($button.hasClass('inc')) {
	                var newVal = parseFloat(oldValue) + 1;
	            } else {
	                // Don't allow decrementing below zero
	                if (oldValue > 0) {
	                    var newVal = parseFloat(oldValue) - 1;
	                } else {
	                    newVal = 0;
	                }
	            }
	            $button.parent().find('input').val(newVal);
	            console.log(oldValue);
	        });
	
	    })(jQuery);
    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>