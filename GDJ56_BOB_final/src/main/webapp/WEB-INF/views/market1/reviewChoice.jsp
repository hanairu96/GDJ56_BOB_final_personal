<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
	<c:forEach var="re" items="${reviews }">
		<div id="reviewList" style="margin:2%;">
		    <div style="display: flex;">
		        <div class="col-9" style="display:flex;margin:10px;">
		        	 <img src="${path }/resources/images/logo-icon.png" alt="" style="height:40px;width: 40px;border-radius: 50%;">
		            <h4 style="margin-left :10px;">${re.nickname}(${re.memberId })</h4>
		        </div>
		    </div>
		    <div class="product__detailss__rating">
			    <c:forEach var="i" begin="1" end="${re.iqrStar}">
			    	<img src="${path }/resources/market/star1.png" style="width:25px;"/>
			    </c:forEach>
		        <span style="margin-left:20px;">${re.iqrStar }</span>
		    </div>
		    <div style="margin:10px;">
		        <h5>${re.iqrContent }</h5>
		    </div>
		    <br>
		    <div id="test11">
		    <c:forEach var="pic" items="${picpic }">
		    	<c:if test="${re.reNo == pic.reNo }">
		        	<img src="${path }/resources/upload/market/review/${pic.picName}" alt="" style="width:100px;height: 100px;margin-right:30px;">
		        </c:if>
		    </c:forEach>
		    </div>
		    <div style="padding:10px; color:rgb(207, 207, 207);">
		        <fmt:formatDate type="date" value="${re.iqrDate }"/>
		    </div>
		</div>
    <hr/>
	</c:forEach>
	<c:if test="${empty reviews }">
		<div>상품 후기가 없습니다.</div>
	</c:if>
