<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	.top-left {
      position: absolute;
      top: -20px;
      width: 90px;
      left: -10px;
      z-index: 1;
   }
</style>
<div id="explain">	
	<div style="padding-bottom:20px;">
        <h6><span style="font-weight:bold;padding:10px;">${ii.size() }</span> 건</h6>
    </div>
	<div class="row">
		<c:forEach var="sell" items="${ii }">
  			<div class="col-lg-4 col-md-6 col-sm-6">
  			
  				<c:if test="${sell.itemDiscount eq 'Y' }">
               		<img class="top-left" src="${path }/resources/images/iconsale.gif"/>
               	</c:if>
  			
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
                         	<c:if test="${sell.itemDiscount eq 'Y' }">
                        		<h5 style="text-decoration:line-through;"><c:out value="${sell.itemPrice }"/>원</h5>
                        		<h5 style="color:tomato;margin-top:5px;">할인가 9900원</h5>
                        	</c:if>
                        	<c:if test="${sell.itemDiscount eq 'N' }">
                        		<h5><c:out value="${sell.itemPrice }"/>원</h5>
                        	</c:if>
                        </c:if>
                    </div>
				</div>
			</div>
			<c:if test="${sell eq null }">
				<div>내가 쓴 댓글이 없습니다.</div>
			</c:if>
		</c:forEach>
		
	</div>
</div>