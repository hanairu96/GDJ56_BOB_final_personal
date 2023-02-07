<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%-- <jsp:include page="/WEB-INF/views/common/floatBar.jsp"/> --%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
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
                                <!-- <li><a href="javascript:void(0);" onclick="checkcheck('vege');">채소</a></li> -->
                                <li><a href="javascript:void(0);" onclick="checkcheck('채소');">채소</a></li>
                                <input id="vege" type="hidden" value="채소">
                                <li><a href="javascript:void(0);" onclick="checkcheck('과일');">과일 · 견과 · 쌀</a></li>
                                <input id="fruit" type="hidden" value="과일">
                                <li><a href="javascript:void(0);" onclick="checkcheck('수산');">수산 · 해산 · 건어물</a></li>
                                <input id="sea" type="hidden" value="수산">
                                <li><a href="javascript:void(0);" onclick="checkcheck('정육');">정육 · 계란</a></li>
                                <input id="meat" type="hidden" value="정육">
                                <li><a href="javascript:void(0);" onclick="checkcheck('국');">국 · 반찬 · 메인요리</a></li>
                                <input id="soup" type="hidden" value="국">
                                <li><a href="javascript:void(0);" onclick="checkcheck('샐러드');">샐러드 · 간편식</a></li>
                                <input id="salad" type="hidden" value="샐러드">
                                <li><a href="javascript:void(0);" onclick="checkcheck('면');">면 · 양념 · 오일</a></li>
                                <input id="noodle" type="hidden" value="면">
                            </ul>
                        </div>
                        
                        <!-- 카테고리만 ajax로 구현했을경우 -->
                     <!--    <script>
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

                       	</script> -->

                        <div class="sidebar__item" >
                            <h4>가격</h4>
                            <div class="price-range-wrap">

                                <div id="sss" class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
                                    data-min="100" data-max="600000" >
                                </div>

                                <div class="range-slider">
                                    <div class="price-input">
                                        <input type="text" id="minamount" class="amount">
                                        <input type="text" id="maxamount" class="amount">
                                    </div>
                                </div>
                                
								<!-- 가격 검색 버튼 -->
								<button class="primary-btn" type="button" name="search" style="background-color:#07d448;border: none;color: white;"
								onclick="pricemaxmin();">가격 검색</button>
                            
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-md-7">
                    <div class="filter__item" style="padding-top:20px;">
	                    <div class="filter__option" style="font-weight: bold;font-size:20px;">
	                        <a a href="javascript:void(0);" onclick="sortsort('고액순');" style="color: black;margin:10px;">고액순 </a>|
	                        <input type="hidden" id="high" value="고액순" >
	                        <a a href="javascript:void(0);" onclick="sortsort('저가순');" style="color: black;margin:10px;"> 저가순 </a>|
	                        <input type="hidden" id="low" value="저가순" >
	                        <a a href="javascript:void(0);" onclick="sortsort('인기상품순');" style="color: black;margin:10px;"> 인기상품순</a>
	                        <input type="hidden" id="popular" value="인기상품순" >
	                    </div>
                    </div>
                    <script>
                    	const checkcheck=(ct)=>{
                    		totalajax(ct);
                    	}
                    	const sortsort=(so)=>{
                    		totalajax(so);	
                    	}
                    	const pricemaxmin=()=>{
                    		const max=$("#maxamount").val();
                    		const min=$("#minamount").val();
                    		console.log("최고가 : "+max+"최저가 : "+min);	
                    		totalajax(max,min);
                    	}
                    
                    	const totalajax=(ct,so,max,min)=>{
                    		console.log(ct+so+max+min);
                    		
                    		
                    		
                    		
                    		
                    	} 
                    
                    
                    
                    </script>
                    
                    
                    <div id="explain">
	                    <div style="padding-bottom:20px;">
                            <h6><span style="font-weight:bold;padding:10px;">${i[0].sellitem_count }</span> 건</h6>
                        </div>
	                    <div class="row">
						<c:forEach var="sell" items="${i }">
	                        <div class="col-lg-4 col-md-6 col-sm-6">
	                            <div class="product__item">
	                                <div class="product__item__pic set-bg"
		style="background-image: url('${path }/resources/upload/market/mainlabel/${sell.mainPic }');${sell.itemStock==0?'filter: grayscale(100%)':''};">
	                            	<c:if test="${sell.itemStock!=0 }">
	                                    <ul class="product__item__pic__hover">
	                                        <li><a href="javascript:void(0);" onclick="addbasketitem(${sell.itemNo },'${loginMember.memberId }','${sell.mainPic }','${sell.itemName }')"><i class="fa fa-shopping" ><img src="${path }/resources/market/img/market-cart.png" style="width:27px;"></i></a></li>
	                                    </ul>
	                                </c:if>
	                                </div>
	                                <div class="product__item__text">
	                                    <h6><a href="${path }/market1/marketdetail.do?itemNo=${sell.itemNo }" style="font-weight:bold;">
	                            	    <c:if test="${sell.itemBrand!=null }">
								        	[${sell.itemBrand }]
								        </c:if>
	                                    <c:out value="${sell.itemName }"/>
	                                    </a></h6>
	                                    <p><c:out value="${sell.mainContent }"/></p>
	                                    <c:if test="${sell.itemStock==0 }">
	                                    	<h5 style="color: tomato;">재입고 준비중입니다</h5>
	                                    </c:if>
	                                    <c:if test="${sell.itemStock>0 }">
	                                    	<h5><c:out value="${sell.itemPrice }"/>원</h5>
	                                    </c:if>
	                                </div>
	                            </div>
	                        </div>
						</c:forEach>
	                	</div>
	                    <!-- 페이징처리 -->
	                    	${pageBar }
                		</div>
                	
                	<script>
                	
                		/* const data={
                			cate:"",
                			highprice:"$("#maxamount").val()",
                			lowprice:"$("#minamount").val()",
                			sort:""
                		} */
                	
                	
                	
                		//장바구니 상품담기
						var arr=new Array();
						<c:forEach var="b" items="${basket}">
							arr.push({itemNo:${b.itemNo}});
						</c:forEach>
						
						const addbasketitem=(no,memberId,mainPic,itemName)=>{
		 					if(${loginMember==null}){
								alert("로그인 후 사용가능합니다.");
							}else{
								const item=arr.filter(e=>e.itemNo==no);
								console.log(item);
 								if(item.length>0){
 									Swal.fire({
 							            title: itemName,
 							            text: "이 상품은 이미 담겨있습니다. 더 담으시겠습니까?",
 							            imageUrl: '${path }/resources/upload/market/mainlabel/'+mainPic,
 							            showCancelButton: true,
							            confirmButtonColor: '#07d448',
 							            cancelButtonColor: 'magenta',
 							            confirmButtonText: '장바구니 추가',
 							            cancelButtonText: '계속 쇼핑하기'
 							        }).then((result) => {
 							        	if (result.isConfirmed) {
 											location.assign('${path}/basket/updatebasket.do?itemNo='+no+'&memberId='+memberId+'&add=0'); 
 							        	}
 							        })
 								}else{
 									location.assign('${path}/basket/insertbasket.do?itemNo='+no+'&memberId='+memberId+'&add=0');
							
								}
							}
						}
                	</script>
                
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
                //console.log(minamount.val());
                //console.log(maxamount.val());
            }
        });
        minamount.val(rangeSlider.slider("values", 0));
        maxamount.val(rangeSlider.slider("values", 1));
    })(jQuery);

    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>