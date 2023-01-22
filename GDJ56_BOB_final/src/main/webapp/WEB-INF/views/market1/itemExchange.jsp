<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
	<div style="width: 100%;">
		<h3 style="color:purple; font-weight: bold; text-align: center;">교환 및 환불 안내</h3><br>
		<div style="display: flex; justify-content: space-between; padding: 2rem;">
		    <div class="col-4" style="font-weight: bold;font-weight: bold;">
		        01.상품에 문제가 있는 경우
		    </div>
		    <div class="col-7">
		        받으신 상품이 표시 , 광고 내용 또는 계약 내용과 다른 경우에 상품을 받은 날부터 3개월 이내,
		        그 사실을 알게 된 날부터 30일 이내 교환 및 환불을 요청하실 수 있습니다.
		        상품의 정확한 상태를 확인할 수 있도록 사진을 함께 보내주시면 더 빠른 상담이 가능합니다.
		    </div>
		</div>
		<hr style="margin: 0;"/>
		<div style="display: flex; justify-content: space-between; padding: 2rem;">
		    <div class="col-4" style="font-weight: bold;font-weight: bold;">
		        02. 단순 변심, 주문 착오의 경우
		    </div>
		    <div class="col-7">
		        신선 / 냉장 / 냉동 식품의 경우<br>
		        재판매가 불가한 상품의 특성상, 단순변심, 주문착오시 교환 및 반품이 어려운 점 양해 부탁 드립니다.
		        상품에 따라 조금씩 맛이 다를 수 있으며, 개인의 기호에 따라 같은 상품도 다르게 느껴지실 수 있습니다.
		        <br>    
		        유통기한 30일 이상 식품& 기타상품<br>
		        상품을 받은 날부터 7일 이내에 문의해주세요
		        (단순변심으로 인한 배송상품 교환 및 환불의 경우 고객님이 배송비 6000원을 부담하셔야합니다)
		    </div>
		</div>
		<hr style="margin: 0;"/>
		<div style="display: flex; justify-content: space-between; padding: 2rem;">
		    <div class="col-4" style="font-weight: bold;font-weight: bold;">
		        03. 교환, 반품 이 불가한 경우
		    </div>
		    <div class="col-7">
		        다음 해당하는 교환 . 환불 신청은 처리가 어려울 수 있으니 양해 부탁드립니다.<br>
		        · 고객님의 책임이 있는 사유로 상품이 별실되거나 훼손된 경우<br>
		        · 고객님의 사용 또는 일부 소비로 상품의 가티가 감소한 경우<br>
		        · 시간이 지나 다시 판매하기 곤란할 정도로 상품가치가 감소한경우<br>
		        · 고객님의 주문에 따하 개별적으로 생산되는 상품의 제작이 이미 진행된 경우<br>
		    </div>
		</div>
		<div style="display: flex; justify-content: space-between; padding: 2rem;">
		    <div class="col-4" style="font-weight: bold;font-weight: bold;">
		            주문 취소 관련
	        </div>
	        <div class="col-7">
	            - 고객님의 책임이 있는 사유로 상품이 별실되거나 훼손된 경우
	            - 고객님의 사용 또는 일부 소비로 상품의 가티가 감소한 경우
	            - 시간이 지나 다시 판매하기 곤란할 정도로 상품가치가 감소한경우
	            - 고객님의 주문에 따하 개별적으로 생산되는 상품의 제작이 이미 진행된 경우
	        </div>
	    </div>
	</div>
	<br><br>
	<hr />
	<br>
	
	<div style="display: flex; justify-content: space-between; padding-left: 5%; font-size: 20px;">
		<div class="col-2">
		    <span style="background-color: rgb(196, 245, 228);font-weight: bold;">판매자 정보 </span>
		</div>
		<div class="col-10">
		    <span style="background-color: rgb(220, 243, 236);">오늘의 밥</span>
	    </div>
	</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>