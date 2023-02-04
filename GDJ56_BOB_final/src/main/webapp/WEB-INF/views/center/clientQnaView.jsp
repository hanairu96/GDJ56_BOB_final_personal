<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
	<!-- 비밀글일 때 로그인 안 했거나 작성자 또는 관리자가 아니면 접근 불가 -->
	<c:if test="${(cq.cqSe eq 'Y')&&((empty loginMember)||(not empty loginMember)&&(loginMember.memberId ne cq.memberId)&&(loginMember.memberId ne 'admin'))}">
		<script>
			console.log("실패");
			alert("잘못된 접근입니다.");
			location.assign("${path}/center/clientQnaList");
		</script>
	</c:if>
	<!-- 비밀글이 아니거나 작성자이거나 관리자면 접근 가능 -->
	<c:if test="${(cq.cqSe ne 'Y')||(loginMember.memberId eq cq.memberId)||(loginMember.memberId eq 'admin')}">
		<script>console.log("성공");</script>
	    <section>
	        <div class="side-menu">
	            <div>공지사항</div>
	            <div>1:1 문의</div>
	        </div>
	        <div class="board">
	            <h1 id="main-title">1:1 문의</h1>
	            <table class="outline">
	                <tr>
	                    <td class="line-title">제목</td>
	                    <td class="line-content headline">${cq.cqTitle}</td>
	                </tr>
	                <tr>
	                    <td class="line-title">작성자</td>
	                    <td class="line-content">${cq.memberId}</td>
	                </tr>
	                <tr>
	                    <td class="line-title">분류</td>
	                    <td class="line-content">${cq.cqCate}</td>
	                </tr>
	                <tr>
	                    <td class="line-title">작성일</td>
	                    <td class="line-content">${cq.cqDate}</td>
	                </tr>
	            </table>
	            <div class="btns">
	            	<c:if test="${loginMember.memberId eq cq.memberId}">
		                <button type="button" id="update-btn" class="customBtn btnStyle" onclick="updateCq();">수정하기</button>
	            	</c:if>
	            	<c:if test="${(loginMember.memberId eq cq.memberId)||(loginMember.memberId eq 'admin')}">
	                	<button type="button" id="delete-btn" class="customBtn btnStyle" onclick="deleteCq();">삭제하기</button>
	                </c:if>
	            </div>
	            <div id="text">
	                ${cq.cqContent}
	            </div>
	            <h2 id="as-title">답변</h2>
	            <div id="answer">
	            	<c:if test="${not empty cq.cqanswer.cqaContent}">
		                ${cq.cqanswer.cqaContent}
	            	</c:if>
	            	<c:if test="${empty cq.cqanswer.cqaContent}">
		                <p>(아직 등록된 답변이 없습니다.)</p>
	            	</c:if>
	            </div>
	            <textarea id="textEnroll" rows="5" cols="130"></textarea>
	            <c:if test="${loginMember.memberId eq 'admin'}">
	            	<c:if test="${empty cq.cqanswer.cqaContent}">
			            <button type="button" id="enroll-as-btn" class="customBtn btnStyle" onclick="answerEnroll();">답변 등록</button><br>
	            	</c:if>
	            	<c:if test="${not empty cq.cqanswer.cqaContent}">
			            <button type="button" id="update-as-btn" class="customBtn btnStyle" onclick="answerUpdate();">답변 수정</button><br>
	            	</c:if>
		            <div id="enroll-cancel">
			            <button type="button" id="enroll-as-end" class="customBtn btnStyle" onclick="answerEnrollEnd();">등록</button><br>
			            <button type="button" id="cancel" class="customBtn btnStyle" onclick="cancel();">취소</button><br>
		            </div>
		            <div id="update-cancel">
			            <button type="button" id="update-as-end" class="customBtn btnStyle" onclick="answerUpdateEnd();">수정</button><br>
			            <button type="button" id="cancel" class="customBtn btnStyle" onclick="cancel();">취소</button><br>
		            </div>
	            </c:if>
	            <button type="button" id="list-btn" class="customBtn btnStyle" onclick="goList();">목록으로</button>
	        </div>
	    </section>
	</c:if>
    <style>
        section{
            display: flex;
            margin-top: 50px;
        }
        section>*{
            margin: 0 auto;
        }
        section *{
            font-family: 'Gowun Dodum';
        }
        .side-menu{
            margin-top: 20px;
            width: 18%;
        }
        .side-menu>div{
            border: 0px solid black;
            border-radius: 20px;
            height: 70px;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            line-height: 70px;
            margin: 10px;
            cursor: pointer;
            background-color: lavender;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
        }
        .board{
            width: 75%;
            height: fit-content;
            border: 1px solid black;
            border-radius: 10px;
        }
        #main-title{
            text-align: center;
            margin-top: 30px;
            font-size: 35px;
        }
        .outline{
            /* width: 1000px; */
            height: 200px;
            border-collapse: collapse;
            margin: 0 auto !important;
            margin-top: 20px !important;
            margin-bottom: 20px !important;
        }
        .outline *{
            border: 1px solid black;
        }
        .line-title{
            width: 200px;
            text-align: center;
            font-weight: bold;
        }
        .line-content{
            width: 700px;
            padding-left: 20px;
        }
        .headline{
            font-weight: bold;
        }
        .btns{
            margin-right: 7%;
            text-align: right;
        }
        #text{
            border: 1px solid black;
            margin-left: 70px;
            margin-right: 70px;
            margin-top: 20px;
            margin-bottom: 20px;
            padding: 20px;
            min-height: 250px;
        }
        #as-title{
        	font-size: 20px !important;
        	font-weight: bold;
            margin-left: 70px;
        }
        #answer{
            border: 1px solid black;
            margin-left: 70px;
            margin-right: 70px;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 20px;
            min-height: 10px;
        }
        #answer p{
        	text-align: center;
        	color: gray;
        	margin-bottom: 0px;
        }
        #textEnroll{
        	display: none;
        	margin-left: 70px;
            margin-right: 70px;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 20px;
            resize: none;
        }
        #enroll-as-btn, #update-as-btn{
            margin-left: 82%;
            margin-bottom: 30px;
        }
        #enroll-cancel, #update-cancel{
        	display: none;
	        margin-left: 74%;
            margin-bottom: 30px;
        }
        #enroll-cancel>button, #update-cancel>button{
        	width: 100px;
        	margin-left: 10px;
        }
        #list-btn{
            margin-left: 6%;
            margin-bottom: 30px;
        }

        .customBtn {
			color: #fff;
			border-radius: 5px;
			padding: 10px 25px;
			font-weight: 500;
			background: transparent;
			cursor: pointer;
			transition: all 0.3s ease;
			position: relative;
			display: inline-block;
			box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
			7px 7px 20px 0px rgba(0,0,0,.1),
			4px 4px 5px 0px rgba(0,0,0,.1);
			outline: none;
			width: 130px;
		}
		.btnStyle {
			line-height: 40px;
			padding: 0;
			border: none;
			background: royalblue;
			background: linear-gradient(0deg, royalblue 0%, royalblue 100%);
		}
		.btnStyle:hover {
			color: royalblue;
			background: transparent;
			box-shadow:none;
		}
		.btnStyle:before,.btnStyle:after{
			content:'';
			position:absolute;
			top:0;
			right:0;
			height:2px;
			width:0;
			background: royalblue;
			box-shadow:
			-1px -1px 5px 0px #fff,
			7px 7px 20px 0px #0003,
			4px 4px 5px 0px #0002;
			transition:400ms ease all;
		}
		.btnStyle:after{
			right:inherit;
			top:inherit;
			left:0;
			bottom:0;
		}
		.btnStyle:hover:before,.btnStyle:hover:after{
			width:100%;
			transition:800ms ease all;
		}
    </style>
    <script>
	 	//사이드 메뉴 누르면 페이지 이동
		$(".side-menu>div:eq(0)").click(e=>{
			location.assign("${path}/center/noticeList");
		})
		$(".side-menu>div:eq(1)").click(e=>{
			location.assign("${path}/center/clientQnaList");
		})
		
		//글 수정
		const updateCq=()=>{
			
		}
		
		//글 삭제
		const deleteCq=()=>{
			let check=confirm("정말로 삭제하시겠습니까?");
			if(check){
				$.ajax({
					url:"${path}/center/cqDelete",
					data:{no:${cq.cqNo}},
					success:data=>{
						if(data){
							alert("삭제되었습니다.");
							//삭제 성공했으면 목록으로
							location.assign("${path}/center/clientQnaList");
						}else{
							alert("삭제에 실패하였습니다.");
						}
					}
				})
			}
		}
		
		//답변 등록 버튼 나옴
		const answerEnroll=()=>{
			$("#answer").hide();
			$("#textEnroll").show();
			$("#textEnroll").focus();
			$("#enroll-as-btn").hide();
			$("#enroll-cancel").css("display","flex");
			$("#enroll-cancel").show();
		}
		
		//답변 등록하기
		const answerEnrollEnd=()=>{
			let no=${cq.cqNo}; //문의글 번호
			let answer=$("#textEnroll").val(); //textarea에 입력한 내용
			let args=[no, answer];
			//등록 성공 여부를 boolean 값으로 받음
			$.ajax({
				url:"${path}/center/answerEnroll",
				data:{args:args},
				success:data=>{
					if(data){
						alert("등록되었습니다.");
						//등록 성공했으면 새로고침
						location.reload();
					}else{
						alert("등록이 실패하였습니다.");
					}
				}
			})
		}
		
		//답변 수정 버튼 나옴
		const answerUpdate=()=>{
			$("#answer").hide();
			$("#textEnroll").show();
			$("#textEnroll").focus();
			$("#update-as-btn").hide();
			$("#update-cancel").css("display","flex");
			$("#update-cancel").show();
		}
		
		//답변 수정하기
		const answerUpdateEnd=()=>{
			let no=${cq.cqNo}; //문의글 번호
			let answer=$("#textEnroll").val(); //textarea에 입력한 내용
			let args=[no, answer];
			//등록 성공 여부를 boolean 값으로 받음
			$.ajax({
				url:"${path}/center/answerUpdate",
				data:{args:args},
				success:data=>{
					if(data){
						alert("수정되었습니다.");
						//등록 성공했으면 새로고침
						location.reload();
					}else{
						alert("수정이 실패하였습니다.");
					}
				}
			})
		}
		
		//취소 시 원래 상태로 복구
		const cancel=()=>{
			location.reload();
		}
		
		//목록으로
    	const goList=()=>{
    		location.assign("${path}/center/clientQnaList");
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>