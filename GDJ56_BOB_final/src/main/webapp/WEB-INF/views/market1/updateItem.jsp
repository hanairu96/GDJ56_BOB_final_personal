<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
   /* 전체 배치 */
   * {
      margin: 0px; 
      padding: 0px; 
      box-sizing: border-box;
   }
   /* 전체 글씨체 */
   *{
      font-family: 'Gowun Dodum', sans-serif;
   }
   /* 버튼 속 글씨 정중앙 정렬 */
   .flex-c-m {
      display: flex;
      justify-content: center;
      align-items: center;
   }
   /* 효과 천천히 */
   .trans-0-4 {
      -webkit-transition: all 0.4s;
      -o-transition: all 0.4s;
      -moz-transition: all 0.4s;
      transition: all 0.4s;
   }
   
   /* input 효과 */
   .bo2 {border: 2px solid #d9d9d9;}
   .bo-rad-10 {border-radius: 10px;} 
   input {
      outline: none;
      border: none
   }

   .sizefull {
      width: 100%;
      height: 100%;
   }

   /* input 크기 및 정렬 */
   .size22 {
      max-width: 870px;
   }
   
   .size12 {
      width: 100%;
      height: 50px;
   }
   .m-b-23 {
         margin-bottom: 23px;
      }
   .m-t-3 {
      margin-top: 3px;
   }
   .p-l-20 {padding-left: 20px;}
   .m-l-r-auto {margin-left: auto;   margin-right: auto;}

   /* (사진)확대 효과 */
   .zoom {
      display: block;
      overflow: hidden;
   }

   .zoom img{
      width: 100%;
      -webkit-transition: all 0.6s;
      -o-transition: all 0.6s;
      -moz-transition: all 0.6s;
      transition: all 0.6s;
   }

   .zoom:hover img {
      -webkit-transform: scale(1.1);
      -moz-transform: scale(1.1);
      -ms-transform: scale(1.1);
      -o-transform: scale(1.1);
      transform: scale(1.1);
   }
   

   /* 버튼 효과 */
   .btn3 {
      background: #111111;
      border-radius: 10px;
      color: white;
      width: 120px;
      height: 40px;
   }
   .btn3:hover {
      background-color: #6A0dad;
      color: white;
      width: 120px;
      height: 40px;
   }
   textarea:focus, input:focus {
      border-color: transparent !important;
      box-shadow: 0 0 0px 2px #6A0dad;
      -moz-box-shadow: 0 0 0px 2px #6A0dad;
      -webkit-box-shadow: 0 0 0px 2px #6A0dad;
      -o-box-shadow: 0 0 0px 2px #6A0dad;
      -ms-box-shadow: 0 0 0px 2px #6A0dad;
   }
   .bg-title-page {
      width: 100%;
      min-height: 545px;
      padding-left: 15px;
      padding-right: 15px;
      background-repeat: no-repeat;
      background-position: center 0;
      background-size: cover;
   }

   @media (max-width: 576px) {
   .bg-title-page .tit6 {font-size: 30px;}
   }
   .tit6 {
      font-family: Poppins;
      font-weight: 700;
      font-size: 50px;
      line-height: 1.2;
      color: white;
      text-transform: uppercase;
      letter-spacing: 6px;
      word-spacing: 6px;
   }

   .t-center{
      text-align: center;
   }
   /* 배치 */
   *, ::after, ::before {
    box-sizing: inherit;
   }
   .bo5-b {
    border-bottom: 1px solid #e6e6e6;
   }
   .p-b-17 {
      padding-bottom: 17px;
   }
   .p-t-17 {
      padding-top: 17px;
   }
   .container {
    margin-right: auto;
    margin-left: auto;
    padding-right: 15px;
    padding-left: 15px;
    width: 100%;
   }
   /* 달력 */
   .fix1{
      position: fixed;   
      z-index: 0;
      right: -1;
      -webkit-transform: translateY(-80%);
      -ms-transform: translateY(-99%);
      transform: translateY(-99%);
   }
   .fix2{      
         position: sticky;
         top:80px;
         height: 80px; 
         width: 100%;
         background-color: white;
         z-index: 0;
         box-shadow: 0px 5px 5px -5px gray;
   }
</style>
	
	
	<section class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/breadcrumb.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>오늘의 밥 마켓 상품 수정</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section>
		<div class="container">
			<form class="wrap-form-reservation size22 m-l-r-auto" method="post" enctype="multipart/form-data"
			action="${path }/market1/updateMarketItem.do">
				<br>
				<div class="row">
					<div class="col-md-4">
						<span class="txt9" style="font-weight: bold;">
							카테고리</span>
						<br>
						<input type="hidden" name="itemNo" value="${up.itemNo }"/>
						<select id="itemCategory" name="itemCategory">
							<option value="채소" ${fn:contains(up.itemCategory,"채소")?"selected":"" }>채소</option>
							<option value="과일 · 견과 · 쌀 " ${fn:contains(up.itemCategory,"과일")?"selected":"" }>과일 · 견과 · 쌀</option>
							<option value="수산 · 해산 · 건어물" ${fn:contains(up.itemCategory,"수산")?"selected":"" }>수산 · 해산 · 건어물</option>
							<option value="정육 · 계란" ${fn:contains(up.itemCategory,"정육")?"selected":"" }>정육 · 계란</option>
							<option value="국 · 반찬 · 메인요리" ${fn:contains(up.itemCategory,"국")?"selected":"" }>국 · 반찬 · 메인요리</option>
							<option value="샐러드 · 간편식" ${fn:contains(up.itemCategory,"샐러드")?"selected":"" }>샐러드 · 간편식</option>
							<option value="면 · 양념 · 오일" ${fn:contains(up.itemCategory,"면")?"selected":"" }>면 · 양념 · 오일</option>
						</select>
						<br>
					</div>
					<br>
					<br>
					<br>
					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">브랜드명(선택)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemBrand" value="${up.itemBrand}" placeholder="브랜드 명을 등록해주세요. 없다면 생략해주세요">
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">제품명(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemName" value="${up.itemName }" placeholder="30자 이내로 입력해주세요" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">가격(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="itemPrice" value="${up.itemPrice }" placeholder="50000" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">배송비(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="delPrice" value="${up.delPrice }" placeholder="3000" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">원산지(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="madeIn" value="${up.madeIn }" placeholder="30자 이내로 입력해주세요" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">중량(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="weight" value="${up.weight }" placeholder="10" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">대표사진(필수)</span>
						<br>
						<input class="" type="file" name="mainPic"  value=""> 
						<input class="" type="hidden" name="mainPic1"  value="${up.mainPic }">
					</div>
					<br><br>
					
					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품 상세 사진</span><br>
						<span class="txt9">상품사진 1</span>
						<br>
						<input class="" type="file" name="imgFile" id="imgFile1" value=""> 
					</div>
					<br>
					<div class="col-md-12">
						<span class="txt9">상품사진 2</span>
						<br>
						<input class="" type="file" name="imgFile" id="imgFile2" value=""> 
					</div>
					<br>
					<div class="col-md-12">
						<span class="txt9">상품사진 3</span>
						<br>
						<input class="" type="file" name="imgFile" id="imgFile3" value=""> 
					</div>
					<c:if test="${not empty file }">
						<c:forEach var="ff" items="${file }">
							<input type="hidden" name="imgFiles" value="${ff}"/>
							<c:out value="${ff}"/>
						</c:forEach>
					</c:if>
					<br>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품한줄소개(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="mainContent" 
							placeholder="상세페이지 및 썸내일(상품리스트)에서도 쓰입니다(15자이내)" value="${up.mainContent }" maxlength="15" required>
						</div>
					</div>
					
					<div class="col-12" style="margin-top: 2%;">
						<span class="txt9" style="font-weight: bold;">상품설명(필수)</span><br>
						<textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" 
						 rows="4" cols="120" name="itemContent"  placeholder="상품에 대한 설명을 입력해주세요" required>${up.itemContent }</textarea>
					</div><br>


					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품특징(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemPoint" value="${up.itemPoint }" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">보관법(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemKeep" value="${up.itemKeep }" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">활용팁(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemTip" value="${up.itemTip }" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품라벨(필수)</span>
						<br>
						<input class="" type="file" name="itemLabel"  value=""> 
						<input class="" type="hidden" name="itemLabel1"  value="${up.itemLabel }"> 
					</div>
					<br>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품재고(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="itemStock" placeholder="3000" value="${up.itemStock }" required>
						</div>
					</div>

				</div>
				
				<div class="wrap-btn-booking flex-c-m m-t-13">
					<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
						수정하기
					</button>
				</div>
			</form>
			<br><br><br>
		</div>
	</section>			
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>