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
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              ${m.memberId }님의, 마이페이지
            </h2>
            <!-- CTA -->
            <a
              class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
              href="https://github.com/estevanmaito/windmill-dashboard"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                >
                  <path
                    d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"
                  ></path>
                </svg>
                <span>쇼핑하러 가기</span>
              </div>
              <span>마켓 &RightArrow;</span>
            </a>
            <!-- Cards -->
            <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    내 정보
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    회원or장인 000님
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      fill-rule="evenodd"
                      d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                      clip-rule="evenodd"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    적립금
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    100원
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    장바구니
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    2 (장바구니 담긴개수)
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      fill-rule="evenodd"
                      d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
                      clip-rule="evenodd"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                  1:1 문의글
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    2 개 (작성글 개수)
                  </p>
                </div>
              </div>
            </div>
            
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
	            <div style="width: 150px; margin: auto;">
	              <button type="submit" class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
	                회원수정
	              </button>
	              <br><br><br>
	          </div>
	         </form>
          
          </div>
        </main>
      </div>
    </div>
    
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
