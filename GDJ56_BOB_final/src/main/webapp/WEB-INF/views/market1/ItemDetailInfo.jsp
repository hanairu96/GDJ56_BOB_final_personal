<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<section>
	<div class="tab-content">
	         <div class="tab-pane active" id="tabs-1" role="tabpanel">
	             <div class="product__details__tab__desc">
	                 <h3 style="text-align: center;">[선물세트]유명산지 사과세트</h3><br>
	                 <div style="text-align: center;"> 
	                     <p>이번 명절엔 어떤 과일 선물세트를 전할까 고민하고 있다면, 유명산지 사과세트를 선택해보세요. 국내 사과 유명산지에서 
	                         맛있는 사과를 골라 꼭꼭 채워 담은 선물세트랍니다. 한번에 먹기 맞은 사이즈라, 온 가족이 나누는 과일 디저트로 안성맞춤이에여요.
	                         색택이 곱고 윤기가 흐르는 과수만을 엄선했기에 받는 분도, 보내는 분도 모두 흡족하실 거랍니다. 한 알 한 알 정성스레 골라 담은 과일 세트로 감사의 마음을 전해보세요
	                     </p>
	                 </div>
	                 <div  style="text-align: center;"> 
	                     <img src="./img/mmmmm.jpg" alt="" style="width:500px;height: 500px;">
	                 </div>
	                 <br>
	                 <div >
	                     <span>용량 : 1박스(3.8kg내외)</span><br>
	                     <span>특징 : 국내 유명 산지에서 수확항 사과를 15개 담았어요. 후식 과일로 먹기 알맞은 사이즈 입니다.</span><br>
	                     <span>보관법 : 직사광선을 피해주세요</span><br>
	                     <span>활용팁 : 명절 선물세트를 고마운 지인에게 선물해보세요</span><br>
	                 </div>
	                 <br>
	                 <div  style="text-align: center;">
	                     <img src="./img/ssss.jpg" alt="" style="width:500px;height: 500px;">
	                     <img src="./img/latest-product/lp-2.jpg" alt="" style="width:500px;height: 500px;">
	                 </div>
	                 <br><br><br>
	             </div>
	         </div>
	     </div>
	     <div>
	             <span style="background-color: rgb(196, 245, 228);">판매자 정보 : </span>
	             <span style="background-color: rgb(220, 243, 236);">오늘의 밥</span>
	     </div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>