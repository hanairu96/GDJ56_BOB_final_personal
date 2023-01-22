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
</head>
<body>
    <div class="col-lg-6">
        <nav class="header__menu" id="header__menu" style="margin-top: 5px; display: flex;"><!-- 부트입히고 display빼기 -->
            <ul>
                <li class="menu"><a href="${path }/market/best.do" onclick="fn_menu();">베스트</a></li><!--체크시class="active"적용-->
                <li class="menu"><a href="${path }/market/discount.do" onclick="fn_menu();">오늘만</a></li>
                <li class="menu"><a href="${path }/market/today.do" onclick="fn_menu();">오늘의 밥 추천</a></li>
            </ul>
        </nav>
    </div>

</div>
<script>
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


</body>

</html>