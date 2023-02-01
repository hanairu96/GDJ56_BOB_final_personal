<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<div id="explain">	
	<div style="padding-bottom:20px;">
        <h6><span style="font-weight:bold;padding:10px;">16(count...)</span> 건</h6>
    </div>
	<div class="row">
		<c:forEach var="sell" items="${ii }">
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
                           <c:out value="${sell.itemName }"/></a></h6>
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