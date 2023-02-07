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
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

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
	<div>
        <div class="main-logo">
            <h1>오늘의 밥</h1>
            <img src="${path}/resources/images/logo-icon.png">
            
            <div id="alarmBellDIV" style="position: absolute; right: 230px; text-align: center; width: 300px; height: 120px; border: 2px solid purple; border-radius: 30px; display: none;">
            </div>
            <c:if test="${not empty master }">
	            <c:if test="${loginMember.memberId ne 'admin'}">
		            <c:if test="${fn:contains(master.ing,'Y')}">
		            	<input type="hidden" id="alarmtext" value="[${master.testDate}] 장인 승인 완료 ">
		            	<input type="hidden" id="alarmtext1" value="'${master.fail}'">
		            </c:if>
		            <c:if test="${fn:contains(master.ing,'B')}">
		            	<input type="hidden" id="alarmtext" value="[${master.testDate}] 장인 박탈 처리 ">
		            	<input type="hidden" id="alarmtext1" value="'${master.fail}'">
		            </c:if>
		            <c:if test="${fn:contains(master.ing,'N')}">
		            	<input type="hidden" id="alarmtext"  value="[${master.testDate}] 장인 거절 처리 ">
		            	<input type="hidden" id="alarmtext1" value="'${master.fail}'">
		            </c:if>
		            <c:if test="${fn:contains(master.ing,'I')}">
		            	<input type="hidden" id="alarmtext"  value="[장인 심사중]">
		            	<input type="hidden" id="alarmtext1" value="'잠시만 기다려 주세요~'">
		            </c:if>
		         </c:if>
	         </c:if>
	         <c:if test="${empty master }">
		         <c:if test="${loginMember.memberId eq 'admin'}">
		            	<input type="hidden" id="alarmtext" value="문의 답변 필수 !!!">
		            	<input type="hidden" id="alarmtext1" value="환불 승인 필수 !!!">
		         </c:if>
		         <c:if test="${loginMember.memberId ne 'admin'}">
		            	<input type="hidden" id="alarmtext" value="최근 업데이트 된">
		            	<input type="hidden" id="alarmtext1" value="알림메세지가 없습니다">
		         </c:if>
		     </c:if>
		     
		     <!-- 군침이 챗봇위치  -->
			<div
			  style="position: absolute; right: 50px;"
			  id="kakao-talk-channel-add-button"
			  data-channel-public-id="_xoixkxixj"
			  data-size="large"
			  data-support-multiple-densities="true"
			>
				<img src="${path }/resources/images/군침이.jpg" style="width:50px;height:50px;">
			</div>
        </div>
        <header class="head-menu">
            <div>
                <p><a href="${path}/market1/matketmain.do">MARKET</a></p>
                <p><a href="${path}/class/main.do">ONE-DAY-CLASS</a></p>
                <p><a href="${path}/subscription/subMain">SUBSCRIPTION</a></p>
                <p><a href="${path}/center/noticeList">CUSTOMER-CENTER</a></p>
                <c:if test="${loginMember!=null}">
	                <c:if test="${loginMember.memberId eq 'admin'}">
	                	<p><a href="${path}/admin/main.do">ADMINPAGE</a></p>
	                </c:if>
	                <c:if test="${loginMember.memberId ne 'admin'}">
	                	<p><a href="${path}/mypage/orderlist.do">MYPAGE</a></p>
	                </c:if>
	                <img src="${path}/resources/images/shopping-basket.png" onclick="">
	                <img src="${path}/resources/images/bell.gif" style="margin-top:10px;width:60px;height:60px;"
	                	 id="alarmBell">
	                <img src="${path}/resources/images/logout.png" onclick="logout();">
                </c:if>
                <c:if test="${loginMember==null}">
                	<img src="${path}/resources/images/login.png" onclick="location.assign('${path}/member/loginpage')">
                </c:if>
            </div>
        </header>
        <script>
         	$("#alarmBell").click(e=>{
         		const alarm=document.querySelector("#alarmtext").value;
         		const alarm1=document.querySelector("#alarmtext1").value;
         		
         		const temp=document.querySelector("#alarmBellDIV");
         		temp.innerHTML='<h5 style="padding-top:3px;padding-bottom:3px;"><b>💡 알림 💡</b></h5>-----------------------------<br>';
         		$("#alarmBellDIV").append(temp).append(alarm+"<br>").append(alarm1);
         		$("#alarmBellDIV").slideToggle();
        	});
        </script>
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
        	
        	
        	//카카오챗봇 , 군침이
			  window.kakaoAsyncInit = function() {
			    Kakao.Channel.createAddChannelButton({
			      container: '#kakao-talk-channel-add-button',
			    });
			  };
			
			  (function(d, s, id) {
			    var js, fjs = d.getElementsByTagName(s)[0];
			    if (d.getElementById(id)) return;
			    js = d.createElement(s); js.id = id;
			    js.src = 'https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.channel.min.js';
			    js.integrity = 'sha384-MEvxc+j9wOPB2TZ85/N6G3bt3K1/CgHSGNSM+88GoytFuzP4C9szmANjTCNfgKep';
			    js.crossOrigin = 'anonymous';
			    fjs.parentNode.insertBefore(js, fjs);
			  })(document, 'script', 'kakao-js-sdk');
			  
			</script>