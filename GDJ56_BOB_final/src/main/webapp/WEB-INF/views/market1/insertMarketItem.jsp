<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
</head>
<body>
	<section>
		<div class="container">
			<div style="text-align: center;">
				<img src="./images/오늘의 밥 메인로고.jpg" alt="" style="text-align:center;height: 250px;width:300px; margin: 50px;">
			</div>

			<h2 class="tit7 t-center">오늘의 밥 마켓 상품 등록</h2>
			<br><br>
			<form class="wrap-form-reservation size22 m-l-r-auto">
				
				<div class="row">
					<div class="col-md-4">
						<!-- Name -->
						<span class="txt9" style="font-weight: bold;">
							카테고리(필수)
						</span>
						<input  list="categorylist" placeholder="선택">
						<datalist id="categorylist" readonly>
							<option value="채소">
							<option value="과일 · 견과 · 쌀 ">
							<option value="수산 · 해산 · 건어물">
							<option value="정육 · 계란">
							<option value="국 · 반찬 · 메인요리">
							<option value="샐러드 · 간편식">
							<option value="면 · 양념 · 오일">
						</datalist>
					</div>
					<br>
					<br>
					<br>
					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">브랜드명(선택)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="" placeholder="브랜드 명을 등록해주세요. 없다면 생략해주세요">
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">제품명(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="" placeholder="30자 이내로 입력해주세요" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">가격(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="" placeholder="50000" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">배송비(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="" placeholder="3000" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">중량(필수, 숫자만 입력)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="" placeholder="10" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">대표사진(필수)</span>
						<br>
						<input class="" type="file" name=""  value=""> 
					</div>
					<br><br><br><br>
					
					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품 상세 사진</span><br>
						<span class="txt9">상품사진 1</span>
						<br>
						<input class="" type="file" name=""  value=""> 
					</div>
					<br><br><br><br>
					<div class="col-md-12">
						<span class="txt9" >상품사진 2</span>
						<br>
						<input class="" type="file" name=""  value=""> 
					</div>
					<br><br><br>
					<div class="col-md-12">
						<span class="txt9">상품사진 3</span>
						<br>
						<input class="" type="file" name=""  value=""> 
					</div>
					<br><br><br>

					<div class="col-12" style="margin-top: 2%;">
						<span class="txt9" style="font-weight: bold;">상품설명(필수)</span>
						<textarea class="bo-rad-10 size35 bo2 txt10 p-l-20 p-t-15 m-b-10 m-t-3" name="message" placeholder="상품에 대한 설명을 입력해주세요" required></textarea>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품한줄소개(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="" 
							placeholder="상세페이지 및 썸내일(상품리스트)에서도 쓰입니다(15자이내)" maxlength="15" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품특징(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">보관법(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">활용팁(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="" value="" required>
						</div>
					</div>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품라벨(필수)</span>
						<br>
						<input class="" type="file" name=""  value=""> 
					</div>
					<br><br><br>

					<div class="col-md-12">
						<span class="txt9" style="font-weight: bold;">상품재고(필수)</span>
						<div class="wrap-inputemail size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="" placeholder="3000" value="" required>
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