<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path }/resources/js/jquery-3.6.1.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<head>
	<title>원데이클래스</title>
	<meta charset="UTF-8">
	<!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>

<body>
	<section>
		<!-- 배너 -->
		<div class="bg-title-page flex-c-m" style="background-image: url(${path}/resources/pato/images/class/class3.gif);">
			<h2 class="tit6 t-center">
				One-Day Class
			</h2>
		</div>

		<!-- 분류 메뉴 -->
		<div style="padding-left: 46%; margin-right: 3%; padding-top: 5%;">
				<button class="menu txt26 trans-0-4" onclick="location.assign('${path}/class/main.do')">
					전체
				</button>
				<button class="menu txt26 trans-0-4" onclick="location.assign('${path}/class/menu.do?type=bob')">
					🍚집밥
				</button>

				<button class="menu txt26 trans-0-4" onclick="location.assign('${path}/class/menu.do?type=vegan')">
					🥑비건
				</button>
				<button class="menu txt26 trans-0-4" onclick="location.assign('${path}/class/menu.do?type=healthy')">
					💪건강식
				</button>

				<button class="menu txt26 trans-0-4" style="background-color:#bde28f; color:white;" onclick="location.assign('${path}/class/menu.do?type=baking')">
					🍰베이킹
				</button>
				<button class="menu txt26 trans-0-4" onclick="location.assign('${path}/class/menu.do?type=etc')">
					🍽️etc
				</button>
				<button class="menu txt26 trans-0-4" id="search">
					검색
				</button>
		</div>

		<!-- 검색창 -->
		<div id="searchbox" >
				
			<form action="${path }/class/search.do">
				<select name='searchlist' style="padding: 0.3%; margin: 1%; margin-left:-6%;">
					<option value='ODC_COOKNAME'>요리이름</option>
					<option value='M_NAME'>강사</option>
					<option value='ODC_ADD'>지역</option>
					<input id="searchclass" type="text" name="search" placeholder="Search" onchange="change();"/>
					<button class="search-btn">&nbsp; 검색 &nbsp;</button>
				</select>
			</form>
			
		</div>
		<script>
			$(function () {
				$("#search").on("click", function() {
					$("#searchbox").slideToggle("fast"); // 2초에 걸쳐서 진행
				})
			})
		</script>

		<!-- 원데이클래스 리스트 -->
		<div class="container">
			<div class="row">
			   <c:choose>
	               <c:when test="${empty classlist }">
		               <div class="col-lg-4" style="padding: 3%;">
		               		<h3>아직 등록된 원데이클래스 강의가 없습니다 :(</h3>
		               </div>
	               </c:when>
	               <c:otherwise>
	               		<c:forEach var="c" items="${classlist}">
							<div class="col-lg-4" style="padding: 3%;">
								<div class="zoom">
									<a href="${path}/class/odcView.do?no=${c.odcNo }"><img src="${path}/resources/images/onedayclass/${c.odcMainPic}" width="350" height="300"></a>
								</div>
									
								<div class="category-name" >${c.odcCategoty}</div>
			
								<a href="${path}/class/odcView.do?no=${c.odcNo }"><b><h4>${c.odcCookName}</h4></b></a>
			
								<div style="display: flex; margin-top: 1%;">
									<img src="${path}/resources/pato/images/class/chef-hat.png" width="20" height="20"><h5>${c.masterName}</h5>
									&nbsp;&nbsp;&nbsp;<img src="${path}/resources/pato/images/class/place-marker.png" width="20" height="20" ><h5>${c.odcCity}</h5>
								</div>			
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
	    </div>
			  
		<!-- 페이지바 -->
	  	<div style="display: flex;margin-left:50%">
        	${pageBar}
   		</div>
		<!-- 글등록,장인등록 -->
		<div style="display: flex; margin-left:70%">
			<c:if test="${!empty loginMember }">
				<c:if test="${fn:contains(loginMember.grade, 'Y')}">
					<form action="${path }/class/classEnroll.do?id="+${loginMember.memberId }>
						<button type="submit" class="btn3 flex-c-m txt11 trans-0-4">
						클래스 등록
						</button>
					</form>
				</c:if>
				<c:if test="${fn:contains(master.ing, 'N') || (empty master.ing)}">
					&nbsp;&nbsp;
					<button type="submit" class="btn3 flex-c-m txt11 trans-0-4" onclick="location.assign('${path}/class/editor.do')">
						장인 신청
					</button>
				</c:if>
			</c:if>
		</div>	
	</section>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>

<style>
	/* 전체 글씨체 */
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	.container * {
		font-family: 'Gowun Dodum', sans-serif;
	}

	/* 폰트 효과 */
	.txt26 {
	font-weight: 500;
	font-size: 18px;
	color: #333333;
	letter-spacing: 5px;
	font-family: 'Gowun Dodum', sans-serif;
	}

	.t-center{
		text-align: center;
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

	/* 검색창 */

	.search-btn{
	border: #111111 2px solid; 
	border-radius: 10px; 
	background-color: white;
	}

	.search-btn:hover {
	background-color: #bde28f;
	color: black;
	}

	#searchbox{
	display: none; 
	position: relative; 
	margin-top:2%; 
	left: 70%; 
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: 600;
	}

	/* 효과 천천히 */
	.trans-0-4 {
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	transition: all 0.4s;
	}

	/* 버튼 속 글씨 정중앙 정렬 */
	.flex-c-m {
	display: flex;
	justify-content: center;
	align-items: center;
	}

	/* 사진 밑 카테고리 효과 */
	.category-name {
	color: #fff;
	background :#cfe1b9;
	display: inline-block;
	font-size: 12px;
	font-weight: 700;
	text-transform: uppercase;
	padding: 4px 25px 4px 25px;
	}

	/* 배너 효과 */
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
	}

	/* 페이지 버튼 효과*/
	.item-pagination {
	font-size: 13px;
	color: #808080;
	width: 36px;
	height: 36px;
	border-radius: 50%;
	border: 1px solid #e6e6e6;
	margin: 6px;
	}

	.item-pagination:hover {
	background-color: #6A0dad;
	color : white;
	}

	.active-pagination {
	background-color: #333333;
	color: white;
	}

	/* 분류 메뉴 버튼 효과 */
	.menu {
	border-radius: 10px;
	padding: 2px 11px;
	margin: 5px 0;
	background-color:white;
	}

	.menu:hover {
	background-color: #bde28f;
	color: white;
	}

	/* a태그 효과*/ 
	a * {
	color: #666666;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
	}

	a:hover * {
	color: #cfe1b9;
	}

	/* (사진) 줌 효과 */
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

</style>


</html>