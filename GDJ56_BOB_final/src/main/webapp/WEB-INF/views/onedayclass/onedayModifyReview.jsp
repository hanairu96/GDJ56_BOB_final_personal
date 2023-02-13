<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<head>
	<title>후기작성</title>
	<meta charset="UTF-8">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
</head>

<body>
	<section>
		<div>
			<h3 class="tit7 t-center" style="margin: 3%;">
				REVIEW 수정
			</h3>
			<form class="size22 m-l-r-auto" action="${path }/class/reviewEndEnroll.do" method="post" enctype="multipart/form-data">
				<div style="display: flex; padding: 5%;">
						<img src="${path}/resources/images/onedayclass/${odVe.odcPic}" width="150" height="150">
						<div style="display: inline; padding: 2%;">
							<input type="hidden" value="${odVe.odcreNo }" name="odcreNo">
							<input type="hidden" value="${odVe.odcNo }" name="odcNo">
							<h3>[클래스명] ${odVe.odcClassName }</h3>
							<br>
							<p>강사명 : ${odVe.master }</p>
							<p>금액 : ${odVe.odcPrice }원</p>
							<div style="display:flex">
								<p>수강날짜 : ${odcDate}</p>
								
							 </div>
						</div>
				</div>
		</div>
					
				<ul style="border: solid 1px; margin-bottom: 1%;"></ul>

				<h3 class="tit7 t-center" style="margin: 3%;">
					클래스 평가하기
				</h3>
				

				<div id="wrap">
				<c:choose>
					<c:when test="${odRe.oreSame eq 'Y'}">
						<c:set var="select1" value="checked"/>
					</c:when>
					
					<c:when test="${odRe.oreSame eq 'N'}">
						<c:set var="select2" value="checked"/>
					</c:when>
				</c:choose>
					<div id="tabs">
						<button type="button" name="" value="Y" class="selected" id="good" >이 강의를 추천해요👍</button>
						<button type="button" name="" value="N" class="" id="bad" >이 강의를 추천하지 않습니다👎</button>
						<input type="hidden" value="N" name="oreGood" id="gb">
					</div>	
					<br>
						
					<div class="t-center">
						<label>
							<h4 class="tit7 t-center" style="margin: 3%;">
								실제 수업은 클래스 소개와 동일한 방식으로 진행됐나요?
							</h4>
							<input type="radio" name="oreSame" value="Y" ${select1} required/>
							<span>예😊</span>
						</label>
						<label>
							&nbsp;
							<input type="radio" name="oreSame" value="N" ${select2} required/>
							<span>아니오😓</span>
						</label>
					</div>
				</div>

				<h3 class="tit7 t-center" style="margin: 3%;">
				리뷰 작성하기
				</h3>
				<div id="wrap" style="">
					<p>사진첨부(한 장만 가능합니다)</p>
					<input type="file" name="orePic1" value="${odRe.orePic }" required>
					<br><br>
					<textarea style="width: 100%; height: 10em;" name="oreContent" placeholder="과도한 욕설과 비방은 통보없이 삭제됩니다. 오늘도 소중한 리뷰를 남겨주셔서 감사합니다 :)" required>
					 ${odRe.oreContent}
					</textarea>
				</div>
				<input type="submit" class="btn3 t-center" style="margin-left: 40%; margin-right: 50%;" value="저장하기">
				<input type="hidden" name="memberId" value="${loginMember.memberId }">
			</form>
	</section>
</body>
						
<script>
	$("button").click(function () {
		$("button").css({ "background-color": "#fff" });
		$(this).css({ "background-color": "rgb(239, 239, 239)" });
	});
	$("button#good").click(function () {
		console.log($("input#good"));
		$("input#gb").attr("value","Y");
	});
	$("button#bad").click(function () {
		console.log($("input#good"));
		$("input#gb").attr("value","N");
	});

</script>

<style>
	div#wrap {
		border: 1px solid #000;
		width: 500px;
		margin: 20px auto;
		padding: 40px;
	}
	
	button {
		border: 1px solid rgb(170, 170, 170);
		font-size: 16px;
		font-weight: bold;
		padding: 2px 10px;
		border-right: none;
		border-left: none;
		cursor: pointer;
	}
	
	div#tabs {
		display: flex;
	}
	
	button.selected {
		border-right: 1px solid #aaa;
		border-left: 1px solid #aaa;
		background-color: #fff;
	}
	
	button:not(.selected) {
		border-right: 1px solid #aaa;
	}
			
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
	.sizefull {
		width: 100%;
		height: 100%;
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
</style>
