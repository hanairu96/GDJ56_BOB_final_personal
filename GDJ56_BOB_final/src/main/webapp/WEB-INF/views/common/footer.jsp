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
                        <li>Email: todaysbob@naver.com </li>
                        <br>
                        <li>문의사항 있을 시 연락주세요.&nbsp&nbsp<button id="go-center">고객센터 바로가기</button></li>
                    </ul>
                </div>
                <div>
                    <div>
                        <h4>Share Our Site Now</h4>
                        <p>우리 사이트를 SNS로 공유해보세요.</p>
                        <div class="sns">
                            <img src="${path}/resources/images/kakaotalk.png">
                            <img src="${path}/resources/images/instagram.png">
                            <img src="${path}/resources/images/facebook.png">
                            <img src="${path}/resources/images/twitter.png">
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
            font-family: Gowun Dodum;
            background-color:whitesmoke;
            margin-top: 40px;
            padding-top: 10px;
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
        }
		.copyright{
			margin-top: 0px;
		}
    </style>
</body>
</html>