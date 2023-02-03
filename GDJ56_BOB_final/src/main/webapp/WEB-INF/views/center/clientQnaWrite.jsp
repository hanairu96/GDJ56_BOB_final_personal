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
            <table class="outline">
                <tr>
                    <td class="line-title">제목</td>
                    <td class="line-content headline"><input type="text" id="input-title" placeholder="제목을 입력하세요."></td>
                </tr>
               	<tr>
                    <td class="line-title">작성자</td>
                    <td class="line-content">${loginMember.memberId}</td>
                </tr>
                <tr>
                    <td class="line-title">분류</td>
                    <td class="line-content"><input type="text" id="input-category" placeholder="분류를 입력하세요."></td>
                </tr>
                <tr>
                    <td class="line-title">작성일</td>
                    <td class="line-content date"></td>
                </tr>
            </table>
            <div id="secret-div">
            	<input type="checkbox" id="secret" value="비밀글 여부"> 비밀글 여부
            </div>
            <textarea id="input-content" rows="10" cols="130"></textarea>
            <div id="enroll-cancel">
	            <button type="button" id="enroll-end" class="customBtn btnStyle" onclick="enrollEnd();">등록</button><br>
	            <button type="button" id="cancel" class="customBtn btnStyle" onclick="cancel();">취소</button><br>
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
            height: fit-content;
            border: 1px solid black;
            border-radius: 10px;
        }
        .board td{
        	height: 53px;
        }
        #main-title{
            text-align: center;
            margin-top: 30px;
            font-size: 35px;
        }
        .outline{
            /* width: 1000px; */
            height: 100px;
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
        .headline>input{
			width: 600px;
        }
        #secret-div{
        	width: fit-content;
        }
		#input-content{
			width: 87%;
            margin-top: 10px;
            margin-bottom: 20px;
            padding: 20px;
            resize: none;
        }
        #enroll-cancel{
        	display: flex;
	        margin-left: 74%;
            margin-bottom: 30px;
        }
        #enroll-cancel>button{
        	width: 100px;
        	margin-left: 10px;
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
		
		//처음에 자동으로 제목 입력창에 포커스
		$("#input-title").focus();
		
		//작성일 칸에 날짜 자동 입력
		let today=new Date();
	 	let dateToday=today.toLocaleDateString();
	 	$(".date").text(dateToday);
	 	
	 	//체크박스 영역을 누르면 체크가 됨
	 	$("#secret-div").click(e=>{
	 		$("#secret").prop("checked", true);
	 	})
	 	
	 	//textarea 좌우 가운데 정렬
	 	let bdWidth=$(".board").css("width").replace('px',''); //board 영역의 너비
	 	let taWidth=$("#input-content").css("width").replace('px',''); //textarea 영역의 너비
	 	let marginVal=(bdWidth-taWidth)/2;
	 	$("#input-content").css("margin-left", marginVal).css("margin-right", marginVal);
	 	//체크박스 영역의 왼쪽 margin
	 	$("#secret-div").css("margin-left", marginVal);
		
		//1:1 문의 등록
		const enrollEnd=()=>{
			let title=$("#input-title").val(); //제목
			let writer="${loginMember.memberId}"; //작성자
			let category=$("#input-category").val(); //분류
			let secret=$("#secret").is(':checked'); //비밀글 여부
			let content=$("#input-content").val(); //내용
			let input=[title, writer, category, secret, content];
			//등록 성공 여부를 boolean 값으로 받음
			$.ajax({
				url:"${path}/center/cqWriteEnd",
				data:{input:input},
				success:data=>{
					if(data){
						alert("등록되었습니다.");
						//등록 성공했으면 목록으로 가기
						location.assign("${path}/center/clientQnaList");
					}else{
						alert("등록이 실패하였습니다.");
					}
				}
			})
		}
		
		//취소하면 목록으로
    	const cancel=()=>{
    		location.assign("${path}/center/clientQnaList");
    	}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>