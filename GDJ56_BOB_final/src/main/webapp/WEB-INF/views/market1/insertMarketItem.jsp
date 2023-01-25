<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!--===============================================================================================-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="${path }/resources/pato/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/fonts/themify/themify-icons.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/css/util.css">
	<link rel="stylesheet" type="text/css" href="${path }/resources/pato/css/main.css">
<!--===============================================================================================-->
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript" src="${path }/resources/pato/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${path }/resources/pato/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/slick/slick.min.js"></script>
	<script type="text/javascript" src="${path }/resources/pato/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/parallax100/parallax100.js"></script>
	<script type="text/javascript">
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script type="text/javascript" src="${path }/resources/pato/vendor/lightbox2/js/lightbox.min.js"></script>
<!--===============================================================================================-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKFWBqlKAGCeS1rMVoaNlwyayu0e0YRes"></script>
	<script src="${path }/resources/pato/js/map-custom.js"></script>
<!--===============================================================================================-->
	<script src="${path }/resources/pato/js/main.js"></script>
	
	
	<section class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/breadcrumb.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>오늘의 밥 마켓 상품 등록</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<section>
		<div class="container">
			<form class="wrap-form-reservation size22 m-l-r-auto" method="post" enctype="multipart/form-data"
			action="${path }/market1/insertMarketItem.do">
				<br>
				<div class="row">
					<div class="col-md-4">
						<span class="txt9" style="font-weight: bold;">
							카테고리(필수)
						</span>
						<input  list="categorylist" placeholder="선택">
						<datalist id="categorylist" name="itemCategory" readonly>
							<option value="채소" selected></option>
							<option value="과일 · 견과 · 쌀 "></option>
							<option value="수산 · 해산 · 건어물"></option>
							<option value="정육 · 계란"></option>
							<option value="국 · 반찬 · 메인요리"></option>
							<option value="샐러드 · 간편식"></option>
							<option value="면 · 양념 · 오일"></option>
						</datalist>
					</div>
					<br>
					<br>
					<br>
					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">브랜드명(선택)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemBrand" placeholder="브랜드 명을 등록해주세요. 없다면 생략해주세요">
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">제품명(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemName" placeholder="30자 이내로 입력해주세요" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">가격(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="itemPrice" placeholder="50000" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">배송비(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="delPrice" placeholder="3000" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">원산지(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="madeIn" placeholder="30자 이내로 입력해주세요" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">중량(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="weight" placeholder="10" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">대표사진(필수)</span>
						<br>
						<input class="" type="file" name="mainPic"  value=""> 
					</div>
					<br><br><br><br>
					
					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품 상세 사진</span><br>
						<span class="txt9">상품사진 1</span>
						<br>
						<input class="" type="file" name="imgFile" id="imgFile1" value=""> 
					</div>
					<br><br><br><br>
					<div class="col-md-12">
						<span class="txt9" >상품사진 2</span>
						<br>
						<input class="" type="file" name="imgFile" id="imgFile2" value=""> 
					</div>
					<br><br><br>
					<div class="col-md-12">
						<span class="txt9">상품사진 3</span>
						<br>
						<input class="" type="file" name="imgFile" id="imgFile3" value=""> 
					</div>
					<br><br><br>

					<div class="col-12" style="margin-top: 2%;">
						<span class="txt9" style="font-weight: bold;">상품설명(필수)</span>
						<textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" name="mainContent" placeholder="상품에 대한 설명을 입력해주세요" required></textarea>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품한줄소개(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemContent" 
							placeholder="상세페이지 및 썸내일(상품리스트)에서도 쓰입니다(15자이내)" maxlength="15" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품특징(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemPoint" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">보관법(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemKeep" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">활용팁(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="itemTip" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품라벨(필수)</span>
						<br>
						<input class="" type="file" name="itemLabel"  value=""> 
					</div>
					<br><br><br>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품재고(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="itemStock" placeholder="3000" value="" required>
						</div>
					</div>

				</div>
				
				<div class="wrap-btn-booking flex-c-m m-t-13">
					<button type="submit" class="btn3 flex-c-m size36 txt11 trans-0-4">
						저장하기
					</button>
				</div>
			</form>
			<br><br><br>
		</div>
	</section>			
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>