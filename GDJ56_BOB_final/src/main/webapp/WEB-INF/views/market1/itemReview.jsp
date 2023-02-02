<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
<style>
    #test11 img {
        transition: all 0.3s linear;
    }
    #test11>img:hover  {
        border: 1px solid purple;
        transform: scale(4);
    }
   
</style>
       <div class="container">
			<div style="width:120%;">
               	<h4 style="font-weight: bold;">상품후기</h4><br>
               	<div style="padding-left:15px">
                    <h5 style="font-weight: bold;">리뷰 후기 적립금 100원 혜택이 있어요</h5>
                    <p>
                        · 후기 작성 후 바로 적립금이 지급됩니다.</p>
                    <h5 style="font-weight: bold;">※ 비방과 욕설이 난무하는 리뷰글은 사전 통보 없이 삭제될 수 있습니다.</h5>
                </div>
            </div>
			<br>
			<div style="display: flex;">
			    <div class="col-10">
			        <ul class="nav nav-tabs" role="tablist">
			            <li>
			                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
			                style="font-size: 15px;font-weight: bold;">별점 높은 순</a>
			            </li>
			            <li>
			                <a class="nav-link" data-toggle="tab" href="#tabs-3"
			                style="font-size: 15px;font-weight: bold;">별점 낮은 순</a>
			            </li>
			            <li>
			                <a class="nav-link" data-toggle="tab" href="#tabs-2"
			                aria-selected="false" style="font-size: 15px;font-weight: bold;">사진리뷰</a>
			            </li>
			        </ul>
			    </div>
			</div>


			<!-- 리뷰 묶음-->
			<c:forEach var="re" items="${reviews }">
			<div style="margin:2%;">
			    <div style="display: flex;">
			        <div class="col-9" style="display:flex;margin:10px;">
			        	 <img src="${path }/resources/images/logo-icon.png" alt="" style="height:40px;width: 40px;border-radius: 50%;">
			            <h4 style="margin-left :10px;">${re.memberId }</h4>
			        </div>
			        <div>
			            <button  class="primary-btn" type="button" name="" style="margin-left : 10px;border: none;background-color:magenta;">삭제하기</button>
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
              
              
              
			<!-- 페이징처리 -->
			<div class="product__pagination" style="text-align: center;">
			    <a href="#"><i class="fa fa-long-arrow-left"></i></a>
			    <a href="#">1</a>
			    <a href="#">2</a>
			    <a href="#">3</a>
			    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
			</div>
		</div>
