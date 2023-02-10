<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<head>
	<title>클래스 등록</title>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

	<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<section>
		<!-- 배너 -->
		<div class="bg-title-page flex-c-m" style="background-image: url(${path}/resources/pato/images/class/class3.gif);">
			<h2 class="tit6 t-center" >
				One-Day Class
			</h2>
		</div>
		<!-- 클래스 등록 입력 -->
		<div>
			<h3 class="tit7 t-center" style="margin: 3%;">
				클래스 등록
			</h3>

			<form class="size22 m-l-r-auto" action="${path}/class/EndclassEnroll.do" method="post" enctype="multipart/form-data">
				<div style="margin-bottom: 3%;">
					<b>
						카테고리
					</b>
					<select  list="categorylist" placeholder="선택" width="100" name="odcCategoty" required>
						<option value="bob">🍚집밥</option>
						<option value="vegan">🥑비건</option>
						<option value="healthy">💪건강식</option>
						<option value="baking">🍰베이킹</option>
						<option value="etc">🍽️etc</option>
					</select>
				</div>
			
				<b>
					클래스 제목
				</b>

				<div class="size12 bo2 bo-rad-10 m-b-23">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="odcClassName" id="odcClassName" onchange="checkClassName();"
					placeholder="상세화면 상단에 등록됩니다(20자 이내 입력)" required>
					<b id="check"></b>
				</div>
				<script>
					function checkClassName(){
						const name=$("#odcClassName").val();
						if(name.length>20){
							$("#check").text('20자 이내로 작성해주세요').css('color','red');
							$("#odcClassName").val('');
						}else{
							$.ajax({
								 type:'get',
							     url : "<c:url value='/class/checkClassname.do'/>",
							     data: {
										"name" : name
									},
							     contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							     success : function(data){
							    	 if(data==""){
							    		 
										$("#check").text('좋은 클래스 이름이네요!').css('color','purple');
										
							    	 }else{
							    		 $("#check").text('중복된 수업명입니다. 다시 입력해주세요').css('color','red');
										 $("#odcClassName").val('');
							    	 }
							     }
							     
							})
						}
					}
				</script>
				
				<b>
					요리 이름
				</b>

				<div class="size12 bo2 bo-rad-10 m-b-23">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="odcCookName" placeholder="상세화면 상단에 등록됩니다" required>
				</div>
					
				<b>
					강사명
				</b>

				<div class="size12 bo2 bo-rad-10 m-b-23">
					<input type="hidden" name="memberId" value="${loginMember.memberId}">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="mastserName" placeholder="" value="${master.name}" readonly>
				</div>
			
				<b>
					클래스 기간
				</b>
				<div style="display: flex;">
					<div class="size12 bo2 bo-rad-10 m-b-23">
						<input class="bo-rad-10 sizefull txt10 p-l-20" type="date" name="startDate" id="startDate" onchange="settleDate()" required>
					</div>
					<h2> &nbsp;~&nbsp; </h2>
					<div class="size12 bo2 bo-rad-10 m-b-23">
						<input class="bo-rad-10 sizefull txt10 p-l-20" type="date" id="endDate" name="endDate" required>
					</div>

				<script>
					let dateElement = document.getElementById('startDate');
					dateElement.setAttribute("min", new Date().toISOString().substring(0, 10));
					
					
					function settleDate(){
						let startDate= document.getElementById('startDate').value;
						console.log(startDate);
						let endDate= document.getElementById('endDate');
						endDate.setAttribute("min",startDate);
					}
				</script>
					
				</div>
			
				<b>
					클래스 시작시간
				</b>
				<div class="size12 bo2 bo-rad-10 m-b-23">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="time" name="odcStartTime" required>
				</div>
			

				<b>
					클래스 소요시간(분 단위)
				</b>
				<div class="size12 bo2 bo-rad-10 m-b-23">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="odcTime" min="1" required>
				</div>
			
				<b>
					클래스 수강인원
				</b>
				<div class="size12 bo2 bo-rad-10 m-b-23" style="display: flex;">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="odcPeople" placeholder="1명이상 입력해주세요" min="1" required>
					<h4>명</h4>
				</div>

				<b>
					클래스 장소
				</b>
		
				<div id="classaddress" style="margin-bottom: 3%; border:solid gray 1px; border-radius: 10px; padding: 2%;">
					<div class=" bo-rad-10" style="display: flex; margin-bottom: 1%;">
						<input  type="text" id="sample4_postcode" placeholder="우편번호" style="border-bottom:solid black 1px;">
						<button type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">우편번호찾기</button>
					</div>
						
						<input type="text" id="sample4_roadAddress" style="border-bottom:solid black 1px; width: 100% ;" placeholder="도로명주소" name="address" required>
						<span>─────────────────────────────────────</span>
						<input  type="text" id="sample4_jibunAddress" style="border-bottom:solid black 1px; width: 100%;" placeholder="지번주소" name="address" required>
						<span>─────────────────────────────────────</span>
						<input  type="text" id="sample4_detailAddress" style="border-bottom:solid black 1px; width: 100%;" placeholder="상세주소를 입력해주세요" name="address">
						<span>─────────────────────────────────────</span>
				</div>
				
				<!-- 다음주소 api 스크립트 -->
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
				    function sample4_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var roadAddr = data.roadAddress; // 도로명 주소 변수
				                var extraRoadAddr = ''; // 참고 항목 변수
				
				                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                    extraRoadAddr += data.bname;
				                }
				                // 건물명이 있고, 공동주택일 경우 추가한다.
				                if(data.buildingName !== '' && data.apartment === 'Y'){
				                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                }
				                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                if(extraRoadAddr !== ''){
				                    extraRoadAddr = ' (' + extraRoadAddr + ')';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample4_postcode').value = data.zonecode;
				                document.getElementById("sample4_roadAddress").value = roadAddr;
				                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
				                
				                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				                if(roadAddr !== ''){
				                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
				                } else {
				                    document.getElementById("sample4_extraAddress").value = '';
				                }
				
				                var guideTextBox = document.getElementById("guide");
				                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				                if(data.autoRoadAddress) {
				                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				                    guideTextBox.style.display = 'block';
				
				                } else if(data.autoJibunAddress) {
				                    var expJibunAddr = data.autoJibunAddress;
				                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
				                    guideTextBox.style.display = 'block';
				                } else {
				                    guideTextBox.innerHTML = '';
				                    guideTextBox.style.display = 'none';
				                }
				            }
				        }).open();
				    }
				</script>
			
				
				<b>
					클래스 가격
				</b>
				<div class="size12 bo2 bo-rad-10 m-b-23" style="display: flex;">
					<input class="bo-rad-10 sizefull txt10 p-l-20" type="number" name="odcPrice" placeholder="금액에 해당하는 숫자값만 입력해주세요"> 
					<h4>원</h4>
				</div>

				<b>
					대표사진
				</b>
				<div style="margin-bottom:3%;">
					<p>- 대표사진은 게시판 리스트와 상세화면 상단에 등록됩니다 </p>
					<input class="" type="file" name="odcpic"> 
				</div>
				
				<b>
					클래스 소개
				</b>
				<textarea rows="5" name="odcContent" id="editor">
					-클래스 소개<br>
					<br><br><br><br>
					-수업 진행<br>
					<br><br><br><br>
				</textarea>
			
				<button type="submit" class="btn3 flex-c-m trans-0-4 m-l-r-auto" style="margin-top:10%">
						클래스 등록
				</button>
			</form>
		</div>
	</section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<script src="${pageContext.request.contextPath}/resources/editor/ckeditor5-build-classic/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/editor/ckeditor5-build-classic/UploadAdapter.js"></script>
<script>
function MyCustomUploadAdapterPlugin(editor) {
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new UploadAdapter(loader)
    }
}


ClassicEditor
.create( document.querySelector( '#editor' ), {
	extraPlugins: [MyCustomUploadAdapterPlugin],
	toolbar: {
		items: [
			'heading',
			'|',
			'fontFamily',
			'fontSize',
			'fontColor',
			'bold',
			'underline',
			'italic',
			'blockQuote',
			'specialCharacters',
			'|',
			'bulletedList',
			'numberedList',
			'indent',
			'outdent',
			'|',
			'insertTable',
			'link',
			'imageUpload',
			'undo',
			'redo'
		]
	},
	language: 'ko',
	image: {
		toolbar: [
			'imageTextAlternative',
			'imageStyle:full',
			'imageStyle:side'
		]
	},
	table: {
		contentToolbar: [
			'tableColumn',
			'tableRow',
			'mergeTableCells',
			'tableCellProperties',
			'tableProperties'
		]
	},
	licenseKey: '',
} )
.then( editor => {
	window.editor = editor;
} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	
	console.error( error );
} );
</script>
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
	h2,h3,h4,h5{
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
		border: none !important;
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
	.m-l-r-auto {margin-left: auto;	margin-right: auto;}

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
</style>
</html>