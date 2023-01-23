<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>오늘의 밥</title>

    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Secular+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    
    <!-- 마켓 부트스트랩 -->
	<link rel="stylesheet" href="${path}/resources/market/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/resources/market/css/style.css" type="text/css">
    <script src="${path}/resources/market/js/bootstrap.min.js"></script>
    <script src="${path}/resources/market/js/jquery.nice-select.min.js"></script>
    <script src="${path}/resources/market/js/jquery-ui.min.js"></script>
    <script src="${path}/resources/market/js/mixitup.min.js"></script>
    <script src="${path}/resources/market/js/jquery.slicknav.js"></script>
    <script src="${path}/resources/market/js/owl.carousel.min.js"></script>
    <script src="${path}/resources/market/js/main.js"></script> 
</head>

<body>
    <section>
        <div class="main-logo">
            <h1>오늘의 밥</h1>
            <img src="${path}/resources/images/logo-icon.png">
        </div>
        <header class="head-menu">
            <div>
                <p><a href="${path}/market1/matketmain.do">MARKET</a></p>
                <p><a href="">ONE-DAY-CLASS</a></p>
                <p><a href="">SUBSCRIPTION</a></p>
                <p><a href="">CUSTOMER-CENTER</a></p>
                <c:if test="${loginMember!=null}">
	                <c:if test="${loginMember.memberId eq admin}">
	                	<p><a href="${path}/admin/main.do">ADMINPAGE</a></p>
	                </c:if>
	                <c:if test="${loginMember.memberId ne admin}">
	                	<p><a href="">MYPAGE</a></p>
	                </c:if>
	                <img src="${path}/resources/images/shopping-basket.png" onclick="">
	                <img src="${path}/resources/images/logout.png" onclick="logout();">
                </c:if>
                <c:if test="${loginMember==null}">
                	<img src="${path}/resources/images/login.png" onclick="location.assign('${path}/member/login')">
                </c:if>
            </div>
        </header>
        <style>
			.main-logo{
				height: 150px; 
				display: flex; 
				padding: 50px;
			}
			.main-logo>h1{
				padding-top: 0px;
				font-family: 'Gowun Dodum';
				font-weight:bolder;
				font-size: 45px;
				cursor: pointer;
			}
			.main-logo>img{
				width: 150px;
				height: 120px;
				cursor: pointer;
			}
            /* 헤더 부분 상단에 고정 */
            .head-menu{
                position: sticky;
                top:0;
                height: 80px; 
                width: 100%;
                background-color: white;
                z-index: 1;
                box-shadow: 0px 5px 5px -5px gray;
				display: block;
            }
			.head-menu>div{
				display: flex;
				margin: 25px;
			}
			.head-menu>div>*{
				margin-top: 20px;
			}
			.head-menu>div>img{
				width: 40px;
				height: 40px;
				/* margin-top: 10px; */
			}
            .head-menu p{
                padding-top: 10px;
            }
            .head-menu a{
                font-size: 25px;
                font-weight: bolder;
                font-family: '휴먼옛체';
            }
            .head-menu>*{
                justify-content: space-around;
            }
            .head-menu img{
                cursor: pointer;
            }
            a{
                text-decoration: none;
            }
            .head-menu a{
                color: rgba(102,102,102);
            }
            .head-menu a:hover{
                color: purple;
                transition: 0.5s;
            }
        </style>
        <script>
        	$(".main-logo>*").click(e=>{
        		location.assign("${path}");
        	});
        
        	const logout=()=>{
        		let result=confirm("정말로 로그아웃하시겠습니까?");
        		if(result){
	        		location.replace('${path}/member/logout');
	        		alert("로그아웃이 완료되었습니다.");
        		}
        	}
        </script>