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
	                <button type="button" id="update-btn" class="customBtn btnStyle" onclick="">수정하기</button>
	                <button type="button" id="delete-btn" class="customBtn btnStyle" onclick="">삭제하기</button>
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
	            <button type="button" id="enroll-btn" class="customBtn btnStyle" onclick="">등록하기</button><br>
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
            margin-left: 70%
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
        #enroll-btn{
            margin-left: 82%;
            margin-bottom: 30px;
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
		
		//목록으로
    	const goList=()=>{
    		location.assign("${path}/center/clientQnaList");
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>