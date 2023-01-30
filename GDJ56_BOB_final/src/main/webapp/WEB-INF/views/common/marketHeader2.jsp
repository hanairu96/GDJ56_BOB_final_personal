<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>console.log("헤더: ${path}")</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${path}/resources/pato/js/jquery-3.6.1.min.js"></script>
	<%-- <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/resources/market/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/style.css" type="text/css"> --%>
    
    <!-- pato -->

    
</head>
<body>
<div class="marketHeader" style="width: 89%; display: flex; margin-left: 100px;">
    <!-- /.카테고리 -->
    <section class="hero hero-normal col-lg-3" style="margin-top: 25px;">
        <div class="hero__categories">
            <div class="hero__categories__all">
                <i class="fa fa-bars"></i>
                <span style="font-family: TmonMonsori;">카테고리</span>
            </div>
            <ul>
                <li><a href="#">채소</a></li>
                <li><a href="#">과일·견과·쌀</a></li>
                <li><a href="#">수산·해산·건어물</a></li>
                <li><a href="#">정육·계란</a></li>
                <li><a href="#">국·반찬·메인요리</a></li>
                <li><a href="#">샐러드·간편식</a></li>
                <li><a href="#">면·양념·오일</a></li>
            </ul>
        </div>
    </section>
    <!-- 카테고리./ -->
    <div class="col-lg-6">
        <nav class="header__menu" id="header__menu" style="margin-top: 5px; display: flex;"><!-- 부트입히고 display빼기 -->
            <ul>
                <li class="menu"><a href="${path }/market/best.do" onclick="fn_menu();">베스트</a></li><!--체크시class="active"적용-->
                <li class="menu"><a href="${path }/market/discount.do" onclick="fn_menu();">오늘만</a></li>
                <li class="menu"><a href="${path }/market/today.do" onclick="fn_menu();">오늘의 밥 추천</a></li>
            </ul>
        </nav>
    </div>

    <div class="col-lg-3" style="margin-top: 25px;">

            <div class="blog__sidebar__search">
                <form action="#">
                    <input type="text" placeholder="What do yo u need?">
                    <button type="submit" class="site-btn">SEARCH</button>
                </form>
            </div>

    </div>
</div>
<script>

$('.hero__categories__all').on('click', function(){
    $('.hero__categories ul').slideToggle(400);
});

const fn_menu = ()=>{
    $("ul>li.menu").removeClass("active");
    $("ul>li.menu").addClass("active");
}
</script>
<style>
@font-face {
    font-family: 'TmonMonsori';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/TmonMonsori.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#header__menu>ul>li{
    font-family: TmonMonsori;
    font-size: 100px;
}
#header__menu>ul>li>a{
    font-size: 20px;
    margin-left: 20px;
    padding-left: 32px;
    color: gray; 
}
.hero__categories ul li a{
    color: gray;
}
.marketHeader {
    position: sticky;
    z-index: 100;
    top: 200px;
    background: rgba(137, 43, 226, 0.167);
}
</style>

    

    <!-- Js Plugins -->
    <%-- <script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/resources/js/bootstrap.min.js"></script>
    <script src="${path}/resources/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/js/jquery-ui.min.js"></script>
    <script src="${path}/resources/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/js/mixitup.min.js"></script>
    <script src="${path}/resources/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/js/main.js"></script> --%>

 

</body>

</html>