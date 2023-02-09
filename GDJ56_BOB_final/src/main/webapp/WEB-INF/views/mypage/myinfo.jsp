<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>  
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>오늘의 밥 마이페이지</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${path}/resources/assets/css/tailwind.output.css" />
    <script
      src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
      defer
    ></script>
    <script src="${path}/resources/assets/js/init-alpine.js"></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
      defer
    ></script>
     <script src="${path}/resources/assets/js/jquery-3.6.1.min.js"></script>
  </head>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen }"
    >
      <!-- Desktop sidebar -->
      <aside
        class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0"
      >
        <div class="py-4 text-gray-500 dark:text-gray-400">
          <a
            class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
            href="${path}/mypage/orderlist.do"
          >
            Bob MyPage
          </a>
          <ul class="mt-6">
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                href="${path}/mypage/orderlist.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path style="color:#707275;"
                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                  ></path>
                </svg>
                <span class="ml-4" style="color:#707275;">주문내역</span>
              </a>
            </li>
          </ul>
          <ul>
            <li class="relative px-6 py-3">
              <span
              class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
              aria-hidden="true"
            ></span>
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/myinfoPassword.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path style="color:#1A1C23;"
                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                  ></path>
                </svg>
                <span class="ml-4" style="color:#1A1C23;">회원정보</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/basket.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                  ></path>
                </svg>
                <span class="ml-4">장바구니</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/point.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"
                  ></path>
                  <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
                </svg>
                <span class="ml-4">적립금</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/onedayclass.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"
                  ></path>
                </svg>
                <span class="ml-4">원데이클래스</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/writelist.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg>
                <span class="ml-4">1:1 문의글</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/onedayItemWrite.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg>
                <span class="ml-4">원데이클래스/상품 문의글</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/subscription.do"
              >
                <svg
                  class="w-5 h-5"
                  aria-hidden="true"
                  fill="none"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                <path
                d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"
              ></path>
                </svg>
                <span class="ml-4">정기구독</span>
              </a>
            </li>
          </ul>
          <div class="px-6 my-6">
          </div>
        </div>
      </aside>
      <div class="flex flex-col flex-1 w-full">
        <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
          <div
            class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
          >
              <!-- main menu -->
              <div style="display: contents;" class="relative ">
                &nbsp;
               <button style="font-weight: bolder;" onclick="location.assign('${path}/market1/matketmain.do');">
                  MARKET
                </button>
                
                <button style="font-weight: bolder;" onclick="location.assign('${path}/class/main.do');">
                  ONEDAY-CLASS
                </button>

                <button style="font-weight: bolder;" onclick="location.assign('${path}/subscription/subMain');">
                  SUBCRIPTE
                </button>

                <button style="font-weight: bolder;" onclick="location.assign('${path}/center/noticeList');">
                  CUSTOMER-CENTER
                </button>
                &nbsp;
              </div>
            </ul>
          </div>
        </header>
        <main class="h-full overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <!-- 회원공통부분 -->
	 			<jsp:include page="/WEB-INF/views/mypage/mypageCommon.jsp">
	 				<jsp:param name="memberId" value="${memberInfoBar[0]}"/>
	 				<jsp:param name="level" value="${memberInfoBar[1]}"/>
	 				<jsp:param name="basket" value="${memberInfoBar[2]}"/>
	 				<jsp:param name="write" value="${memberInfoBar[3]}"/>
	 				<jsp:param name="point" value="${memberInfoBar[4]}"/>
	 			</jsp:include> 
            
            <div style="width: 1000px; margin: auto;">
              <h2>회원정보</h2>
            </div>
            <form action="${path }/mypage/updateMypage.do" method="post">
	            <div style="width: 1000px; margin: auto;"
	              class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
	            >
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>아이디</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${m.memberId }"
	                  name="updateMemberId"
	                  style="background-color:lightgray;width:fit-content;"
	                  readonly
	                />
	              </label>
	              <br>
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>이름</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${m.mname }"
	                  name="updateName"
	                  style="width:fit-content;"
	                />
	              </label>
	              <br>
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>닉네임</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${m.nickname }"
	                  style="background-color:lightgray;width:fit-content;"
	                  readonly
	                />
	              </label>
	              <br>
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>생년월일</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${m.birthday }"
	                  style="background-color:lightgray;width:fit-content;"
	                  readonly
	                />
	              </label>
	             
	              <div class="mt-4 text-sm">
	                <span class="text-gray-700 dark:text-gray-400">
	                  <b>성별</b>
	                </span>
	                <div class="mt-2">
	                  <label
	                    class="inline-flex items-center text-gray-600 dark:text-gray-400"
	                  >
	                    <input
	                      type="radio"
	                      class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
	                      name="gender"
	                      value="M"
	                      ${fn:contains(m.gender,'M')?'checked':''}
	                    />
	                    <span class="ml-2">남</span>
	                  </label>
	                  <label
	                    class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
	                  >
	                    <input
	                      type="radio"
	                      class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
	                      name="gender"
	                      value="F"
	                      ${fn:contains(m.gender,'F')?'checked':''}
	                    />
	                    <span class="ml-2">여</span>
	                  </label>
	                </div>
	              </div>
	              <br>
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>이메일</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${m.email }"
	                  name="updateEmail"
	                  style="width:fit-content;"
	                />
	              </label>
	              <br>
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>전화번호</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${m.phone }"
	                  name="updatePhone"
	                  style="width:fit-content;"
	                />
	              </label>
	              <br>
	              
	                <label class="block text-sm">
	                  <span class="text-gray-700 dark:text-gray-400"><b>주소</b></span>
	                  	<div style="display:flex;flex-direction:row;">
		                	<div style="width:fit-content;">
		                        <input type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                            id="inputAddress_postcode"
		                            style="background-color:lightgray;"
		                            value="${address.get(0) }"
		                            name="updateAdd1"
		                            readonly>
		                    </div>
		                    <div style="width:fit-content;">
		                        <input id="searchAddr" type="button" style="margin-left:15px;height:40px;"class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
		                        value="주소 검색" onclick="sample6_execDaumPostcode()">
		                    </div>
	                    </div>
		                <div style="display:flex;flex-direction:row;">
		                    <div style="margin-right:10px;">
		                        <input type="text" style="width:300px;background-color:lightgray;" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                             id="inputAddress_address" 
									value="${address.get(1) }"
									name="updateAdd2"
			                        readonly>
		                    </div>
		                   <div style="width:auto;">
		                        <input type="text" style="width:300px;"class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" 
		                            id="inputAddress_detailAddress"
		                            value="${address.get(2) }"
		                            name="updateAdd3">
		                    </div>
		                </div>
	                
	                </label>
	             	 <br>
	             	 
	              <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>회원등급</b></span>
	                <input
	                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
	                  value="${fn:contains(m.grade,'Y')?'장인':'일반'}"
	                  style="background-color:lightgray;width:fit-content;"
	                  readonly
	                />
	              </label>
	              <br>
	              
	               <label class="block text-sm">
	                <span class="text-gray-700 dark:text-gray-400"><b>선호식품</b></span>
	               </label>
	                <div style="margin-top:10px;">
	                
	                <c:if test="${not empty memberlike }">
		                <c:forEach var="ml" items="${memberlike }" >
	                        <input style="padding:5px;" type="checkbox" name="updateLike" value="${ml}"
	                        	checked> ${ml}
		                </c:forEach>
		            </c:if>
		            
		            <c:if test="${not empty memberhate }">
		                <c:forEach var="mh" items="${memberhate }" >
		                        <input style="padding:5px;" type="checkbox" name="updateLike" value="${mh}"
		                        > ${mh}
		                </c:forEach>
		            </c:if>
		            
	                </div><br>
	                <p>추천 상품 목록이 나올 때 반영됩니다.</p>
	            </div>
	            <br>
	            <div style="display:flex; margin-left:35%;">
	            <div style="width: 150px; ">
	              <button type="submit" class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
	                회원수정
	              </button>
	              
	              <br><br><br>
	          </div>
	         </form>
          </div>
          <div style="width: 150px;">
	              <button onclick="passwordCh();" class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"> <!-- class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" -->>
	                비밀변호 변경
	              </button>
	              
	              <br><br><br>
	          </div>
        </main>
        
      </div>
    </div>
    
    <%-- <form action="${path}/mypage/passwordUpdate.do" method="post"> --%>
		<div
		id="passwordChange" style="width:500px;height:auto; display: none;background-color: white;border-radius: 15px 15px;text-align: left;"
		  class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
		 <h1 style="text-align: center;"><b><u>변경할 비밀번호</u>를 입력해주세요</b></h1>
			<div style="text-align:center;">
				비밀번호 : <input type="password" name="pw" id="pw_" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"><br>
				비밀번호 확인 : <input type="password" name="pwck" id="pwck_" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input">
			</div>

		  <div style="margin-top:16px;text-align: center;">
		    <button
		       type="reset"
		       style="display :inline-block;background-color: white; border: 1.5px solid red; color: red;"
		       class="modal_close_btn px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
		     >
		     취소
		     </button>
		     <button
		       type="submit" onclick="changePw();"
		       style="display :inline-block;background-color: white; border: 1.5px solid purple; color: purple;"
		       class="modal_submit_btn px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
		     >
		     변경
		     </button>
		     </div>
		</div>
	<!-- </form> -->
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					//var extraAddr = ''; // 참고항목 변수
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					}else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('inputAddress_postcode').value = data.zonecode;
					document.getElementById("inputAddress_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("inputAddress_detailAddress").focus();
				}
			}).open();
		}
    </script>
  </body>
</html>
<script>
function modal(id) {
	   var zIndex = 9999;
	   var modal = document.getElementById(id);
	
	   // 모달 div 뒤에 희끄무레한 레이어
	   var bg = document.createElement('div');
	   /* bg.setStyle({
	       position: 'fixed',
	       zIndex: zIndex,
	       left: '0px',
	       top: '0px',
	       width: '100%',
	       height: '100%',
	       overflow: 'auto',
	       // 레이어 색깔은 여기서 바꾸면 됨
	       backgroundColor: 'rgba(0,0,0,0.4)'
	   }); */
	   bg.style.position='fixed';
	   bg.style.zIndex='zIndex';
	   bg.style.left='0px';
	   bg.style.top='0px';
	   bg.style.width='100%';
	   //bg.style.height='100%';
	   //bg.style.overflow='auto';
	   //bg.style.backgroundColor='rgba(0,0,0,0.4)'; 
	   
	   document.body.append(bg);
	
	   // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	   modal.querySelector('.modal_close_btn').addEventListener('click', function() {
	       bg.remove();
	       modal.style.display = 'none';
	   });
	
	   /* modal.setStyle({
	       position: 'fixed',
	       display: 'block',
	       boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
	
	       // 시꺼먼 레이어 보다 한칸 위에 보이기
	       zIndex: zIndex + 1,
	
	       // div center 정렬
	       top: '50%',
	       left: '50%',
	       transform: 'translate(-50%, -50%)',
	       msTransform: 'translate(-50%, -50%)',
	       webkitTransform: 'translate(-50%, -50%)'
	   }); */
	   modal.style.position='fixed';
	   modal.style.display='block';
	   modal.style.boxShadow='0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)';
	   modal.style.zIndex='zIndex + 1';
	   modal.style.top='50%';
	   modal.style.left='50%';
	   modal.style.transform='translate(-50%, -50%)';
	   modal.style.msTransform='translate(-50%, -50%)';
	   modal.style.webkitTransform='translate(-50%, -50%)';
	   
	   //확인 버튼 처리, 회원탈퇴, 레이어와 모달 div 지우기
	   /* modal.querySelector('.modal_submit_btn').addEventListener('click',function(){
		   bg.remove();
		   modal.style.display = 'none';
	   }) */
	}
	
	const passwordCh=()=>{
		/* alert("d"); */
		modal('passwordChange');
	}
	
	const changePw=()=>{
		let pw=$("#pw_").val().trim();
		let pwck=$("#pwck_").val().trim();
		const pwdReg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		
			if(pw==pwck){
				if(pw.match(pwdReg)==null){
					alert("비밀번호는 영문자와 숫자를 각각 하나 이상 포함하여 8자리 이상 입력하세요. 특수문자는 포함하지 않습니다.");
					$("#pw_").focus();
				}else{
					$.ajax({
						url:"${path}/mypage/updatePassword",
						type:"post",
						data:{pw:pw},
						success:data=>{
							if(data==1){
								alert("비밀번호변경 성공");
							}else{
								alert("비밀번호변경 성공");
							} 
							location.replace('${path}/mypage/myinfoPassword.do');
						}
			    	});
				}
			}else{
				alert('비밀번호가 맞지않습니다.');
			}

	}
</script>
