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
	                   <h2>상품 리뷰 작성</h2>
	                   </div>
	               </div>
	           </div>
	       </div>
	   </div>
	</section>
	
    <section class="product spad">
        <div class="container">
            <form class="mb-3" action="" name="reviewform" id="reviewform" method="post">
                <hr/>
                <div style="display: flex;">
                    <img src="./img/banner/banner-1.jpg" style="width:150px;height:150px;margin-left: 10px;"/>
                    <h3 style="margin:55px;">상품 이름</h3>
                </div>
                <hr/>
                <div style="display: flex;">
                    <h4 style="margin-left: 10px;">별점</h4>
                </div>
                <div>
                    <link href="/assets/css/star.css" rel="stylesheet"/>
                    <fieldset>
                        <span class="text-bold">별점을 선택해주세요</span>
                        <input type="radio" name="reviewStar" value="5" id="rate1"><label
                            for="rate1">★</label>
                        <input type="radio" name="reviewStar" value="4" id="rate2"><label
                            for="rate2">★</label>
                        <input type="radio" name="reviewStar" value="3" id="rate3"><label
                            for="rate3">★</label>
                        <input type="radio" name="reviewStar" value="2" id="rate4"><label
                            for="rate4">★</label>
                        <input type="radio" name="reviewStar" value="1" id="rate5"><label
                            for="rate5">★</label>
                    </fieldset>
                    <hr/>
                    <h4>사진첨부(최대 3장)</h4>
                    사진 첨부1 : <input type="file" name="files" id="" /><br><br>
                    사진 첨부2 : <input type="file" name="files" id="" /><br><br>
                    사진 첨부3 : <input type="file" name="files" id="" />
                    <br><br>
                    <div>
                        <textarea class="col-auto form-control" type="text" id="reviewContents"
                                placeholder="구매 후기를 작성해주세요!"></textarea>
                    </div>
                </div>
            </form>		

            <hr/>
        </div>
    </section>
    <style>
        #myform fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
        #myform fieldset legend{
            text-align: right;
        }
        #myform input[type=radio]{
            display: none;
        }
        #myform label{
            font-size: 3em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }
        #myform label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #myform label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #myform input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        #reviewContents {
            width: 100%;
            height: 150px;
            padding: 10px;
            box-sizing: border-box;
            border: solid 1.5px #D3D3D3;
            border-radius: 5px;
            font-size: 16px;
            resize: none;
        }
    </style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>