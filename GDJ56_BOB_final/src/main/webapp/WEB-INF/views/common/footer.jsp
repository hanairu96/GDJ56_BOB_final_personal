<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	    <!-- Footer Section Begin -->
	    <footer>
	        <div class="fcontainer">
	            <div class="rowss">
	                <div>
	                    <div>
	                        <div>
	                            <a href=""><img id="footer-logo" src="${path}/resources/images/logo-icon.png"></a>
	                        </div>
	                        <div>
	                            <h2>오늘의 밥</h2>
	                        </div>
	                    </div>
	                </div>
	                <div id="infos">
	                    <ul>
	                        <li>Address: (08505) 서울특별시 금천구 가산디지털로 2로 115(가산동, 대륭테크노타운3차),811호</li>
	                        <li>Phone: 02-2108-5900 </li>
	                        <li>Email: todaysbab@naver.com </li>
	                        <br>
	                        <li>문의사항 있을 시 연락주세요.&nbsp&nbsp<button id="go-center">고객센터 바로가기</button></li>
	                    </ul>
	                </div>
	                <div>
	                    <div>
	                        <h4>Share Our Site Now</h4>
	                        <p>우리 사이트를 SNS로 공유해보세요.</p>
	                        <div class="sns">
	                            <img id="kakao" src="${path}/resources/images/kakaotalk.png" onclick="sendKakao();">
	                            <img id="insta" src="${path}/resources/images/instagram.png">
	                            <img id="face" src="${path}/resources/images/facebook.png">
	                            <img id="twit" src="${path}/resources/images/twitter.png">
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="rowss copyright">
	                <div>
	                    <div class="footer-copyright">
	                        <div class="footer-copyright-text">
	                            <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </footer>
	    <!-- Footer Section End -->
	    <style>
	        footer{
	            background-color:whitesmoke;
	            margin-top: 40px;
	            padding-top: 10px;
	        }
	        footer *{
	            font-family: Gowun Dodum;
	        }
	        .rowss{
	            display: flex;
	            margin-top: 50px;
	            justify-content: space-evenly;
	        }
			#footer-logo{
				width: 150px;
				height: 120px;
			}
			#infos{
				padding-right: 50px;
			}
			#infos>ul{
				width: 450px;
			}
	        footer li{
	            list-style: none;
	        }
	        footer h4{
	        	font-size: 18px;
	        	font-weight: bolder;
	        }
	        .sns>img{
	            width: 40px;
	            height: 40px;
	            cursor: pointer;
	        }
	        #go-center{
	            height: 30px;
	            border: 0px;
	            border-radius: 5px;
	            background-color: #ffc107;
	            cursor: pointer;
	            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
				7px 7px 20px 0px rgba(0,0,0,.1),
				4px 4px 5px 0px rgba(0,0,0,.1);
	        }
			.copyright{
				margin-top: 0px;
			}
	    </style>
	    <script>
	    	//고객센터 이동
	    	document.querySelector("#go-center").addEventListener("click", e=>{
	    		location.assign("${path}/center/noticeList");
	    	});
	    	
	    	//카카오톡 공유하기
	    	// init 체크
 			if (!Kakao.isInitialized()) {
				Kakao.init('d19fa48d55c6bbc111c90960278eb809');
			}
			let sendKakao = function() {
				// 메시지 공유 함수
				Kakao.Link.sendScrap({
					requestUrl: 'http://localhost:9090/', // 페이지 url
					templateId: 89612, // 메시지템플릿 번호
					templateArgs: {
						//PROFILE : '프로필 이미지 주소' // 프로필 이미지 주소 ${PROFILE}
						//THUMB: '썸네일 주소', // 썸네일 주소 ${THUMB}
						TITLE: '요리 재료는 바로 여기! 오늘의 밥', // 제목 텍스트 ${TITLE}
						DESC: '마켓과 원데이 클래스, 그리고 정기 구독까지. 요리를 위한 필수 사이트 오늘의 밥!' // 설명 텍스트 ${DESC}
					},
				});
			};
	    </script>
    </div>
</body>
</html>