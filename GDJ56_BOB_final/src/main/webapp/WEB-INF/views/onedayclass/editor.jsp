<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<head>
	<title>장인 신청</title>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
	<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>
</head>

<body>
		<!-- 배너 -->
		<div class="bg-title-page flex-c-m" style="background-image: url(${path}/resources/pato/images/class/class3.gif);">
			<h2 class="tit6 t-center" >
				One-Day Class
			</h2>
		</div>
		<!-- 장인 신청 content -->
		<div class="container">
			<div class="t-center" style="margin: 5%;">
				<h2>
					장인신청하기
				</h2>
			</div>

			<div class="t-center" style="margin: 2%;">
				<img src="${path}/resources/pato/images/class/icon1.jpg" width="70" height="70">
				<h3>
					<span style="background-color: #bde28f;">
						장인등록과정
					</span>
				</h3>
			</div>
			
			<!-- 등록과정 설명 -->
			<div style="display: flex; margin-left: 1%; margin-right: 1%;">
				<div class="zoom" style="margin-left: 2%; border:solid; text-align: center; border-radius: 5%;">
					<img src="${path}/resources/pato/images/class/mac3.png"  height="400" width="300">
					<div style="margin-top: 7%;">
						<h3>1.장인신청등록</h3>
						<b>회원가입 후, 장인신청을 신청해주세요</b>
					</div>
				</div>

				<div class="zoom" style="margin-left: 2%; border:solid; text-align: center; border-radius: 5%;">
					<img src="${path}/resources/pato/images/class/mac2.jpg" height="400">
					<div style="margin-top: 7%;">
						<h3>2.검토후승인</h3>
						<b>승인결과는 가입 시 등록했던 이메일로 보내드려요</b>
					</div>
				</div>

				<div class="zoom" style="margin-left: 2%;padding: 2%; border:solid; text-align: center; border-radius: 5%;">
					<img src="${path}/resources/pato/images/class/mac33.png" alt="IMG-OUR" height="400" width="350" style="margin-bottom: 4%;">
					<div style="margin-top: -1%;">
						<h3>3.원데이클래스개설</h3>
						<b>장인 승인 후 클래스를 개설이 가능해집니다</b>
					</div>
				</div>
			</div>
			
			<!-- 장인신청 정보입력 -->
			<div style="margin: 9%;">
				<form class="size22 m-l-r-auto" method="post" action="${path}/class/masterEndEnroll.do">
					<div>
						<h4>
							이름
						</h4>
						<div class="size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input type="hidden" name="memberId" value="${loginMember.memberId}">
							<input class="bo-rad-10 sizefull txt10 p-l-20" type="text" value="${loginMember.mname}" readonly>
						</div>
					</div>

					<div>
						<h4>
							강사명
						</h4>
						<div class="size12 bo2 bo-rad-10 m-t-3 m-b-23">
							<input class="bo-rad-10 sizefull p-l-20" type="text" name="name" placeholder="장인신청 승인 후 활동명으로 쓰입니다">
						</div>
					</div>
					
					<div id="box">
						  <h3>
	                          경력사항
	                      </h3>
	                      <div id="bobmaster">
	                      	<div>
			                     <div class="size12 bo2 bo-rad-10 m-t-3 m-b-23">
			                          <input class="bo-rad-10 sizefull p-l-20" type="text" name="history" placeholder="예) 파리바게트 근무 10년">
			                     </div>
		                  		<button onclick="plus();" type="button">추가</button>
                                <button onclick="del(event);" type="button">삭제</button>
                           	</div>
	                      </div>
					</div>

						<script>
							   const plus=()=>{
									const copy=$("div#box div:first").clone(true); 
									copy.appendTo($("div#box>div"));
								}

								const del=(e)=>{
									if($("div#bobmaster").length>1){
									const delete1=$("div#bobmaster div:last").detach()+$("div#bobmaster div:last button").remove(); // 삭제버튼을 누르면 젤 아래 input을 삭제하는 법
									//const delete1=$(e.target.parentElement).remove(); //삭제버튼을 누른 그 input을 삭제하는 법
									}else{ alert("더 이상 삭제가 불가능합니다.")}
								}
						</script>
					
					<!-- 텍스트에디터 자리 -->
					<div class="col-12" style="margin-top: 2%;">
						<h4>
							자기소개
						</h4>
						<textarea rows="5" name="info" id="editor">
						-원데이클래스 장인 신청한 동기 또는 자기소개를 간략히 적어주세요<br>
						<br><br><br><br>
						-향후 수업 계획을 간략히 적어주세요<br>
						<br><br><br><br>
						*자격증은 사진으로 첨부해주세요(필수x)
						</textarea>
					</div>
					
					<span>신청결과는 일주일 이내에 이메일로 전송됩니다. </span>
					
					<button type="submit" class="btn3 flex-c-m trans-0-4 m-l-r-auto">
						Submit
					</button>
				</form>	
			</div>
		</div>
	</body>
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
</html>