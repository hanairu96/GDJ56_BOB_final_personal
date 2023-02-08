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
            <h1 id="main-title">공지사항</h1>
            <form action="${path}/center/noticeListSearch" class="search-form">
                <select name="option" class="form-select">
                    <option value="notice_title">제목</option>
                    <option value="notice_content">내용</option>
                </select>
                <input class="search" name="optionVal" type="text" placeholder="search">
                <button id="search-btn" class="customBtn btnStyle" type="submit">검색</button>
            </form>
            <table class="list-table" style="text-align: center;margin: 20px;">
                <thead>
                    <tr>
                        <th class="nos">번호</th>
                        <th class="titles">제목</th>
                        <th class="dates">작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:if test="${empty list}">
	                	<tr class="tr">
	                		<td colspan="3">등록된 글이 없습니다.</td>
	                	</tr>
	                </c:if>
                	<c:if test="${not empty list}">
		                <c:forEach var="nl" items="${list}">
		                    <tr class="tr">
		                        <td class="nos">${nl.noticeNo}</td>
		                        <td class="titles"><a href="${path}/center/noticeView?noticeNo=${nl.noticeNo}">${nl.noticeTitle}</a></td>
		                        <td class="dates">${nl.noticeDate}</td>
		                    </tr>
		                </c:forEach>
		            </c:if>
                </tbody>
            </table>
            <c:if test="${loginMember.memberId eq 'admin'}">
            	<button type="button" id="write-btn" class="customBtn btnStyle" onclick="writeBoard();">글쓰기</button>
            </c:if>
            <div class="page-bar">
	        	<!-- 페이지바 -->
	            <div class="product__pagination">
	                <a href="#"><i class="fa" style="font-weight:bold;"> &lt; </i></a>
	                <a href="#">1</a>
	                <a href="#">2</a>
	                <a href="#">3</a>
	                <a href="#"><i class="fa" style="font-weight:bold;"> > </i></a>
	            </div>
                <%-- ${pageBar} --%>
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
            height: 600px;
            border: 1px solid black;
            border-radius: 10px;
        }
        #main-title{
            text-align: center;
            margin-top: 30px;
            font-size: 35px;
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
        .nos{
            width: 120px;
        }
        .titles{
            width: 750px;
        }
        .dates{
            width: 200px;
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
		
		
/* 		.product__pagination,
		.blog__pagination {
			padding-top: 10px;
		}
		   
		.product__pagination a,
		.blog__pagination a {
			display: inline-block;
			width: 30px;
			height: 30px;
			border: 1px solid #b2b2b2;
			font-size: 14px;
			color: #b2b2b2;
			font-weight: 700;
			line-height: 28px;
			text-align: center;
			margin-right: 16px;
			-webkit-transition: all, 0.3s;
			-moz-transition: all, 0.3s;
			-ms-transition: all, 0.3s;
			-o-transition: all, 0.3s;
			transition: all, 0.3s;
		}
		
		.product__pagination a:hover,
		.blog__pagination a:hover {
			background: #7fad39;
			border-color: #7fad39;
			color: #ffffff;
		}
		
		.product__pagination a:last-child,
		.blog__pagination a:last-child {
			margin-right: 0;
		} */
    </style>
   	<script>
 	 	//사이드 메뉴 누르면 페이지 이동
   		$(".side-menu>div:eq(0)").click(e=>{
   			location.assign("${path}/center/noticeList");
   		})
   		$(".side-menu>div:eq(1)").click(e=>{
   			location.assign("${path}/center/clientQnaList");
   		})
   		
   		//
   		$(".product__pagination>a").click(e=>{
   			let cPage=e.target.textContent;
   			console.log(cPage);
   			$.ajax({
   				url:"${path}/center/noticeListPage",
   				data:{cPage:cPage},
   				success:data=>{
   					console.log(data);
   					
   					
   					let content="<tbody>";
   					
   					data.forEach(function(nt){
		                content+="<tr class='tr'>";
		                content+="<td class='nos' style='width: 120px;'>"+nt.noticeNo+"</td>";
		                content+="<td class='titles' style='width: 750px;'><a href='${path}/center/noticeView?noticeNo="+nt.noticeNo+"'>"+nt.noticeTitle+"</a></td>";
		                content+="<td class='dates' style='width: 200px;'>"+nt.noticeDate+"</td>";
		                content+="</tr>";
   					})
   					content+="</tbody>";
   					console.log(content);
   					
   					$("tbody").html(content);
   				}
   			})
   		})
   		
   		//글쓰기
   		const writeBoard=()=>{
   			location.assign("${path}/center/noticeWrite");	
   		}
   	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>