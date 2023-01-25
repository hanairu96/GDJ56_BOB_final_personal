<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>

	<section class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/breadcrumb.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2><c:out value="${de.itemCategory}"/></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="product-details spad">
    <div>
   		<button class="primary-btn" type="button" onclick="" style="background-color:blue;border: none;">수정</button>
    	<button class="primary-btn" type="button" onclick="deleteItemFile(${de.itemNo},'${picpic}','${de.mainPic}','${de.itemLabel}')" style="background-color:red;border: none;" >삭제</button>
    </div>	
    <script>
    	const deleteItemFile=(no,pic,main,label)=>{
    		const pp=pic.split(",");
    		var addpath="";
    		for(let i=0;i<pp.length;i++){
    			addpath+="&picName="+pp[i];
    		}
    		console.log(addpath);
			location.assign("${path}/market1/deleteItem.do?itemNo="+no+"&mainPic="+main+"&itemLabel="+label+addpath);    	
    	}
    </script>
        <div class="container">
            <div class="row">

                <!-- 슬라이더 사진 4개까지 넣을 수 있다 (사진을 4개 미만으로 넣으면 같은 사진 반복) -->
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                        <c:if test="${empty de.mainPic }">
                            <img class="product__details__pic__item--large"
                                src="${path }/resources/market/img/product/details/product-details-1.jpg" alt="">
                        </c:if>
                        <c:if test="${not empty de.mainPic }">
                            <img class="product__details__pic__item--large"
                                src="${path }/resources/upload/market/mainlabel/${de.itemLabel}" alt="">
                        </c:if>
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                      	<c:if test="${not empty de.ipic }">
	                        <c:forEach var="file" items="${de.ipic }">
									 <img src="${path }/resources/upload/market/detail/${file.picName}">
							</c:forEach>                         
	                            <img src="${path }/resources/upload/market/mainlabel/${de.mainPic}" alt="">
                        </c:if>
                        </div>
                    </div>
                </div>


                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text" style="margin-left:30px;">
                    	<br>
                        <h3><c:out value="${de.itemName }"/></h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 리뷰)</span>
                        </div>
                        <div class="product__details__price"><c:out value="${de.itemPrice }"/>원</div>
                        <p><c:out value="${de.mainContent}"/></p>
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
                        <br><br><br>
                        <b>원산지</b> <span><c:out value="${de.madeIn }"/></span>
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
	    	//상품 슬라이드
		    /*---------------------------------
		        Product Details Pic Slider
		    ----------------------------------*/
		    $(".product__details__pic__slider").owlCarousel({
		        loop: true,
		        margin: 20,
		        items: 4,
		        dots: true,
		        smartSpeed: 1200,
		        autoHeight: false,
		        autoplay: true
		    });
	    	
	    	//상품 갯수
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