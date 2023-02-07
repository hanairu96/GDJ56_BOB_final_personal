<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
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
                        <h2>오늘의 밥 마켓</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="product spad">
        <div class="container" >
        	<div class="col-lg-9 col-md-7" style="margin-left: 13%;">
            	<div class="row" style="text-align: center;">
				<c:forEach var="sell" items="${i }">
                	<div class="col-lg-4 col-md-6 col-sm-6" >
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
         	</div>
        </div>
               	<script>
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
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>