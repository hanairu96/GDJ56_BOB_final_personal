<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
    #test11 img {
        transition: all 0.3s linear;
    }
    #test11>img:last-child:hover  {
        border: 1px solid purple;
        transform: scale(3.5);
    }
    #test11>img:first-child:hover  {
        border: 1px solid purple;
        transform: scale(3.5);
    }
</style>
<section>
    <section class="product-details spad">
        <div class="container">
            <div class="row">
				          
				<div>
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
                   <div class="col-2">
                       <label><input type="checkbox"> 내가 쓴 글</label>
                   </div>
               </div>

               <!-- 리뷰 묶음-->
               <div style="margin:5%;">
                   <div style="display: flex;">
                       <div class="col-9">
                           <h4>야채주스</h4>
                       </div>
                       <div>
                           <button type="button" name="" style="border: none;">수정하기</button>
                       </div>
                       <div>
                           <button type="button" name="" style="margin-left : 10px;border: none;">삭제하기</button>
                       </div>
                   </div>
                   <div class="product__detailss__rating">
                       <i class="fa fa-star"></i>
                       <i class="fa fa-star"></i>
                       <i class="fa fa-star"></i>
                       <i class="fa fa-star"></i>
                       <i class="fa fa-star-half-o"></i>
                       <span>5</span>
                   </div>
                   <div>
                       <h5>야채주스 해먹었어요 너무 맛있어요!!</h5>
                   </div>
                   <br>
                   <div id="test11">
                       <img src="./img/banner/jjjj.jpg" alt="" style="width:100px;height: 100px;">
                       <img src="./img/banner/jjjj.jpg" alt="" style="width:100px;height: 100px;">
                   </div>
                   <div style="padding:10px; color:rgb(207, 207, 207);">
                       2023.01.05
                   </div>
               </div>
               <hr/>
               
               <!-- 페이징처리 -->
               <div class="product__pagination" style="text-align: center;">
                   <a href="#"><i class="fa fa-long-arrow-left"></i></a>
                   <a href="#">1</a>
                   <a href="#">2</a>
                   <a href="#">3</a>
                   <a href="#"><i class="fa fa-long-arrow-right"></i></a>
               </div>
               
        </div>
    </div>
</section>
