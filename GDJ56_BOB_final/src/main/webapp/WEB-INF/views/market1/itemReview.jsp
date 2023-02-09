<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
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
			                <a class="nav-link active" data-toggle="tab" href="javascript:void(0);" role="tab"
			                style="font-size: 15px;font-weight: bold;" onclick="reviewlist('high',);">별점 높은 순</a>
			            </li>
			            <li>
			                <a class="nav-link" data-toggle="tab" href="javascript:void(0);"
			                style="font-size: 15px;font-weight: bold;" onclick="reviewlist('low');">별점 낮은 순</a>
			            </li>
			            <!-- <li>
			                <a class="nav-link" data-toggle="tab" href="#tabs-2"
			                aria-selected="false" style="font-size: 15px;font-weight: bold;">사진리뷰</a>
			            </li> -->
			            <li>
			                <a class="nav-link" data-toggle="tab" href="javascript:void(0);"
			               	style="font-size: 15px;font-weight: bold;" onclick="reviewlist('mem');">내가 쓴 댓글보기</a>
			            </li>
			        </ul>
			    </div>
			</div>
			
			<script>
				function reviewlist(list){
					/* if(list == 'mem'){
						if(${loginMember==null}){
							alert("로그인 후 사용이 가능합니다.");
						}
					}else if{ */
	               		$.ajax({
	               			type:'get',
	               			url:'${path}/itemReview/choiceReviewList.do?',
	               			data:{"list":list,
	               				"itemNo":${itemNo}},
	               			success:data=>{
	               				$("#reviewList").html(data);
	               			}
	               		})
					};
			</script>			


			<!-- 리뷰 묶음-->
			<div id="reviewList" style="margin:2%;">
			<c:forEach var="re" items="${reviews }">
			    <div style="display: flex;">
			        <div class="col-9" style="display:flex;margin:10px;">
			        	 <img src="${path }/resources/images/logo-icon.png" alt="" style="height:40px;width: 40px;border-radius: 50%;">
			            <h4 style="margin-left :10px;">${re.memberId }</h4>
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
            <hr/>
			</c:forEach>
			</div> 
              
			<c:if test="${empty reviews }">
				<div>상품 후기가 없습니다.</div>
			</c:if>
              
              
			<!-- 페이징처리..다시.... -->
			<%-- <div style="text-align: center;">
				 ${pageBar }
			</div> --%>
		</div>
