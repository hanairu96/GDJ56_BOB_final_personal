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
                        <h2>채소</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="product spad">
        <div class="container">
            <div class="row">

                <a href="${path}/market1/insertmarket.do" class="primary-btn" style="margin-left:900px;background-color: #07d448;" >상품등록</a>
                <div class="col-lg-3 col-md-5">
                    <div class="sidebar">

                        <div class="sidebar__item">
                            <h4>카테고리</h4>
                            <ul id="ctgcheck">
                                <li><a href="javascript:void(0);" onclick="checkcheck('vege');">채소</a></li>
                                <li><a href="javascript:void(0);" onclick="checkcheck('fruit');">과일 · 견과 · 쌀</a></li>
                                <li><a href="javascript:void(0);" onclick="checkcheck('sea');">수산 · 해산 · 건어물</a></li>
                                <li><a href="javascript:void(0);" onclick="checkcheck('meat');">정육 · 계란</a></li>
                                <li><a href="javascript:void(0);" onclick="checkcheck('soup');">국 · 반찬 · 메인요리</a></li>
                                <li><a href="javascript:void(0);" onclick="checkcheck('salad');">샐러드 · 간편식</a></li>
                                <li><a href="javascript:void(0);" onclick="checkcheck('noodle');">면 · 양념 · 오일</a></li>
                            </ul>
                        </div>
                        <script>
                        function checkcheck(ct){
                       		$.ajax({
                       			type:'get',
                       			url:'${path}/market1/searchCtg.do?itemCategory='+ct,
                       			data:{"ct":ct},
                       			success:data=>{
                       				$("#explain").html(data);
                       			}
                       		})
                       	}

                       	</script>

                        <div class="sidebar__item" >
                            <h4>가격</h4>
                            <div class="price-range-wrap">


                                <div id="sss" class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="1000" data-max="500000" >
                                </div>

                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount" class="amount">
                                        <input type="text" id="maxamount" class="amount">
                                    </div>
                                </div>

                            </div> 
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-2 col-md-순">
                                <div class="filter__found">
                                    <h6><span>16(count...)</span>건</h6>
                                </div>
                            </div>

                            <div class="col-lg-9 col-md-3">
                                <div class="filter__option" style="font-weight: bold;">
                                    <a href="" style="color: black;">고액순 </a>|
                                    <a href="" style="color: black;"> 저가순 </a>|
                                    <a href="" style="color: black;"> 판매순</a>
                                </div>
                            </div>

                        </div>
                    </div>
                    
                    
                        <!-- 재고 0일경우  -->
                        <%-- <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg hov-img-zoom"  data-setbg="${path }/img/product/product-2.jpg" style="filter: grayscale(100%);">
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#">바나나</a></h6>
                                    <p>맛있는 바나나</p>
                                    <h5 style="color: tomato;">재입고 준비중입니다</h5>
                                </div>
                            </div>
                        </div> --%>
                    <div id="explain">
	                    <div class="row">
						<c:forEach var="sell" items="${i }">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg" style="background-image: url('${path }/resources/upload/market/mainlabel/${sell.mainPic }')">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="#"><i class="fa fa-shopping" ><img src="${path }/resources/market/img/market-cart.png" style="width:27px;"></i></a></li>
	                                    </ul>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6><a href="${path }/market1/marketdetail.do?itemNo=${sell.itemNo }">
	                            	    <c:if test="${sell.itemBrand!=null }">
								        	[${sell.itemBrand }]
								        </c:if>
	                                    <c:out value="${sell.itemName }"/>
	                                    </a></h6>
	                                    <p><c:out value="${sell.mainContent }"/></p>
	                                    <h5><c:out value="${sell.itemPrice }"/>원</h5>
	                                </div>
	                            </div>
	                        </div>
						</c:forEach>
	                	</div>
	                    <!-- 페이징처리 -->
	                    <div class="product__pagination">
	                        <a href="#"><i class="fa" style="font-weight:bold;"> &lt; </i></a>
	                        <a href="#">1</a>
	                        <a href="#">2</a>
	                        <a href="#">3</a>
	                        <a href="#"><i class="fa" style="font-weight:bold;"> > </i></a>
	                    </div>
                	</div>
                
            </div>
        </div>
    </section>
    <script>
    /*-----------------------
		Price Range Slider
	------------------------ */
    (function ($) {
        var rangeSlider = $(".price-range"),
            minamount = $("#minamount"),
            maxamount = $("#maxamount"),
            minPrice = rangeSlider.data('min'),
            maxPrice = rangeSlider.data('max');
        rangeSlider.slider({
            range: true,
            min: minPrice,
            max: maxPrice,
            values: [minPrice, maxPrice],
            slide: function (event, ui) {
                minamount.val(ui.values[0]);
                maxamount.val(ui.values[1]);
                console.log(minamount.val());
                console.log(maxamount.val());
            }
        });
        minamount.val(rangeSlider.slider("values", 0));
        maxamount.val(rangeSlider.slider("values", 1));
    })(jQuery);

    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>