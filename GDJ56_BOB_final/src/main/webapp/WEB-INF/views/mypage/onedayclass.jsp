<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
              <a
                class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                href="${path}/mypage/myinfo.do"
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
                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                  ></path>
                </svg>
                <span class="ml-4">회원정보</span>
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
              <span
                class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"
              ></span>
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
                  <path style="color:#1A1C23;"
                    d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"
                  ></path>
                </svg>
                <span class="ml-4" style="color:#1A1C23;">원데이클래스</span>
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
                <button style="font-weight: bolder;">
                  MARKET
                </button>
                
                <button style="font-weight: bolder;">
                  ONEDAY-CLASS
                </button>

                <button style="font-weight: bolder;">
                  SUBCRIPTE
                </button>

                <button style="font-weight: bolder;">
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
              00님의, 마이페이지
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

            <!-- New Table -->
            <div class="overflow-hidden rounded-lg shadow-xs" style="width: 1100px; margin: auto;">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3" colspan="4">클래스 정보</th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >

                    <tr class="text-gray-700 dark:text-gray-400">
                      <td class="px-1 py-3 text-sm">
                        <div style="border: 1px; width:180px; height: 140px; margin-left:20px;">
                          <img style="width:100%; height: 100%;" src="data:image/jpeg;base64,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" alt="">
                        </div>
                      </td>
                      <td class="px-3 py-3 text-sm">
                        <div style="padding-left:30px; display: flex;align-items: center;border: solid #7072754a 2px; border-radius: 20px;width: 800px; height: 140px;font-weight: bolder;">
                          에그타르트 만들기 <br>
                          강사 : 에타광인 <br>
                          날짜 : 2023/02/14 <br>
                          위치 : 서울특별시 서대문구 구디아카데미 32호점
                      </div>
                      </td>
                    </tr>

                    <tr class="text-gray-700 dark:text-gray-400">
                      <td class="px-1 py-3 text-sm">
                        <div style="border: 1px; width:180px; height: 140px; margin-left:20px;">
                          <img style="width:100%; height: 100%;" src="data:image/jpeg;base64,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" alt="">
                        </div>
                      </td>
                      <td class="px-3 py-3 text-sm">
                        <div style="padding-left:30px; display: flex;align-items: center;border: solid #7072754a 2px; border-radius: 20px;width: 800px; height: 140px;font-weight: bolder;">
                          에그타르트 만들기 <br>
                          강사 : 에타광인 <br>
                          날짜 : 2023/02/14 <br>
                          위치 : 서울특별시 서대문구 구디아카데미 32호점
                      </div>
                      </td>
                    </tr>

                    <tr class="text-gray-700 dark:text-gray-400">
                      <td class="px-1 py-3 text-sm">
                        <div style="border: 1px; width:180px; height: 140px; margin-left:20px;">
                          <img style="width:100%; height: 100%;" src="data:image/jpeg;base64,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" alt="">
                        </div>
                      </td>
                      <td class="px-3 py-3 text-sm">
                        <div style="padding-left:30px; display: flex;align-items: center;border: solid #7072754a 2px; border-radius: 20px;width: 800px; height: 140px;font-weight: bolder;">
                          에그타르트 만들기 <br>
                          강사 : 에타광인 <br>
                          날짜 : 2023/02/14 <br>
                          위치 : 서울특별시 서대문구 구디아카데미 32호점
                      </div>
                      </td>
                    </tr>

                  </tbody>
                </table>
              </div>
              <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
              >
                <span class="col-span-1"></span>
                <!-- Pagination -->
                <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">
                      <li>
                        <button
                          class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                          aria-label="Previous"
                        >
                          <svg
                            aria-hidden="true"
                            class="w-4 h-4 fill-current"
                            viewBox="0 0 20 20"
                          >
                            <path
                              d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          1
                        </button>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          2
                        </button>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          3
                        </button>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          4
                        </button>
                      </li>
                      <li>
                        <span class="px-3 py-1">...</span>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          8
                        </button>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          9
                        </button>
                      </li>
                      <li>
                        <button
                          class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                          aria-label="Next"
                        >
                          <svg
                            class="w-4 h-4 fill-current"
                            aria-hidden="true"
                            viewBox="0 0 20 20"
                          >
                            <path
                              d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                              clip-rule="evenodd"
                              fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </li>
                    </ul>
                  </nav>
                </span>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
