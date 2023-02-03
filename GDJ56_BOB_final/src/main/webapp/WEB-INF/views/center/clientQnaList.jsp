<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
    <section>
        <div class="side-menu">
            <div>공지사항</div>
            <div>1:1 문의</div>
        </div>
        <div class="board">
            <h1 id="main-title">1:1 문의</h1>
            <p>운영자에게 신고하기, 제안하기 등 다양한 문의를 자유롭게 보내주세요.</p>
            <p>오늘의 밥은 항상 고객님들의 소리에 귀 기울이겠습니다.</p>
            <form action="" class="search-form">
                <select name="search-option" class="form-select">
                    <option value="qna-title">제목</option>
                    <option value="qna-contents">내용</option>
                    <option value="qna-category">분류</option>
                    <option value="qna-writer">작성자</option>
                </select>
                <input class="search" name="search" type="text" placeholder="search">
                <button id="search-btn" class="customBtn btnStyle" type="submit">검색</button>
            </form>
            <table class="list-table" style="text-align: center;margin: 20px;">
                <thead>
                    <tr>
                        <th class="categorys">분류</th>
                        <th class="titles">제목</th>
                        <th class="writers">작성자</th>
                        <th class="dates">작성일</th>
                        <th class="answers">답변상태</th>
                    </tr>
                </thead>
                <tbody>
	                <c:if test="${empty list}">
	                	<tr>
	                		<td colspan="5">등록된 글이 없습니다.</td>
	                	</tr>
	                </c:if>
	                <c:if test="${not empty list}">
		                <c:forEach var="ql" items="${list}">
		                    <tr>
			                    <td class="categorys">${ql.cqCate}</td>
			                    <c:if test="${(ql.cqSe eq 'Y')}">
			                        <c:if test="${(loginMember.memberId ne ql.memberId)&&(loginMember.memberId ne 'admin')}">
				                        <td class="titles"><img src="${path}/resources/images/lock.png">비밀글입니다.</td>
		    		                    <td class="writers">${ql.memberId.substring(0,1)}*****</td>
			                        </c:if>
			                        <c:if test="${(loginMember.memberId eq ql.memberId)||(loginMember.memberId eq 'admin')}">
				                        <td class="titles"><a href="${path}/center/clientQnaView?cqNo=${ql.cqNo}"><img src="${path}/resources/images/lock.png">${ql.cqTitle}</a></td>
		    		                    <td class="writers">${ql.memberId}</td>
			                        </c:if>
			                    </c:if>
			                    <c:if test="${ql.cqSe ne 'Y'}">
			                        <td class="titles"><a href="${path}/center/clientQnaView?cqNo=${ql.cqNo}">${ql.cqTitle}</a></td>
		    	                    <td class="writers">${ql.memberId}</td>
			                    </c:if>
		                        <td class="dates">${ql.cqDate}</td>
		                        <td class="answers">
			                        <c:if test="${ql.cqCheck eq 'Y'}">
			                        	답변완료
			                        </c:if>
			                        <c:if test="${ql.cqCheck ne 'Y'}">
			                        	답변대기
			                        </c:if>	
		                        </td>
		                    </tr>
		                </c:forEach>
		            </c:if>
                </tbody>
            </table>
            <c:if test="${not empty loginMember}">
            	<button type="button" id="write-btn" class="customBtn btnStyle" onclick="">글쓰기</button>
            </c:if>
            <div class="page-bar">
                ${pageBar}
            </div>
        </div>
    </section>
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
            height: 670px;
            border: 1px solid black;
            border-radius: 10px;
        }
        #main-title{
            text-align: center;
            margin-top: 30px;
            font-size: 35px;
        }
        .board>p{
            text-align: center;
            margin-top: 10px;
        }
        .list-table{
            border-collapse: collapse;
            margin: 0 auto !important;
            margin-top: 20px !important;
            margin-bottom: 20px !important;
        }
        .list-table th, td{
            border-bottom: 1px solid gray;
            height: 50px;
        }
        .list-table img{
        	width: 25px;
        	height: 25px;
        }
        .search-form{
            text-align: right;
            margin-right: 30px;
        }
        .search-form select{
            height: 35px;
        }
        .search-form>.search{
            height: 35px;
        }
        #search-btn{
            width: 70px;
            height: auto;
        }
        .categorys{
            width: 120px;
        }
        .titles{
            width: 630px;
        }
        .writers{
            width: 120px;
        }
        .dates{
            width: 100px;
        }
        .answers{
            width: 100px;
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            color: gray;
        }
        #write-btn{
            margin-left: 30px;
            width: 100px;
            height: auto;
        }
        .page-bar{
            text-align: center;
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
   		
		//답변완료면 보라색으로 표시  		
        for(let i=0;i<6;i++){
            if(document.querySelectorAll(".answers")[i].textContent.trim()=="답변완료"){
                $(".answers:eq("+i+")").css("color", "purple").css("font-weight", "bolder");
            }
        }
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>