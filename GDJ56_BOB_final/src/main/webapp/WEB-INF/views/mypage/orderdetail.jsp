<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
    <meta charset="UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
    
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
              <span
                class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"
              ></span>
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
                  <path
                    d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                  ></path>
                </svg>
                <span class="ml-4">주문내역</span>
              </a>
            </li>
          </ul>
          <ul>
            <li class="relative px-6 py-3">
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
                <path
                d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
              ></path>
                </svg>
                <span class="ml-4" >회원정보</span>
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
        <main  class="h-full overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              
            </h2>
            <!-- CTA -->
            <a
              class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
              href="${path }"
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
                <span>메인으로 가기</span>
              </div>
              <span>&RightArrow;</span>
            </a>

            <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">주문번호${orderdetail.orderNo}</th>
                      <th class="px-4 py-3">상품내역</th>
                      <th class="px-4 py-3">개수</th>
                      <th class="px-4 py-3">가격</th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                  			<c:forEach var="item" items="${itemdetail}" varStatus="status1"> 
                  				<tr class="text-gray-700 dark:text-gray-400">
			                      <td class="px-4 py-3 text-sm">
			                      		<div style="display:flex;">
					                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					                        <input type="text" hidden value="${item.orderitem.itemNo}" id="itemNo_">
					                        <a href="${path}/market1/marketdetail.do?itemNo=${item.orderitem.itemNo}">
					                        <img style="width:100px;height:70px" src="${path}/resources/upload/market/mainlabel/${item.orderitem.mainPic}" >
			                        		</a>
			                        	</div>
			                      </td>
			                      <input type="text" value="${item.orderitem.itemDiscount eq 'Y' ? '9900': item.orderitem.itemPrice}" id="itemPrice" hidden>
			                      <td class="px-4 py-3">
			                        <div class="flex items-center text-sm" id="stockinfo">
			                        	<a href="${path}/market1/marketdetail.do?itemNo=${item.orderitem.itemNo}">
				                        <c:if test="${empty item.orderitem.itemBrand}">${item.orderitem.itemName}</c:if>
			    						<c:if test="${not empty item.orderitem.itemBrand}">[${item.orderitem.itemBrand}]${item.orderitem.itemName}</c:if>
			    						&nbsp;
			    						</a>
			    						
			    						<div id="reviewbtn">
			    						</div>
			    						<input type="text" hidden value="${item.orderitem.itemName}">
			    						<input type="text" hidden value="${item.orderitem.mainPic}">
			    						 <c:if test="${orderdetail.delivery eq '구매확정'}">
			    							<c:if test="${empty reviewItemNo}"> 
				    							<button onclick="location.assign('${path }/itemReview/insertReviewGo.do?itemNo=${item.orderitem.itemNo}&itemName=${item.orderitem.itemName}&mainPic=${item.orderitem.mainPic}&orderNo=${orderdetail.orderNo}')"
							    					class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
							    					리뷰쓰기
						    					</button>
			    							</c:if>
			    							</c:if>
			                        </div>
			                      </td>
			                      <td class="px-4 py-3 ">
			                          <span id='result'>${item.count}</span>개
			                      </td>
			                      <td class="px-4 py-3">	
			                        <span id="priceResult"></span>원
			                      </td>
                    		</tr>
                    		</c:forEach>
                    		<tr class="text-gray-700 dark:text-gray-400">
			                      <td class="px-4 py-3 text-sm" >
			                      </td>
			                      <td class="px-4 py-3">
			                      배송비
			                      </td>
			                      <td class="px-4 py-3">
			                      </td>
			                      <td class="px-4 py-3">
			                        <span id="priceResult">+2000</span>원
			                      </td>
                    		</tr>
                    		<tr class="text-gray-700 dark:text-gray-400">
			                      <td class="px-4 py-3 text-sm">
			                      </td>
			                      <td class="px-4 py-3">
			                      사용 적립금
			                      </td>
			                      <td class="px-4 py-3">
			                        
			                      </td>
			                      <td class="px-4 py-3">
			                        <span id="priceResult">-${orderdetail.pointUse}</span>원
			                      </td>
                    		</tr>
                    		<tr class="text-gray-700 dark:text-gray-400">
			                      <td class="px-4 py-3 text-sm">                     
			                      </td>
			                      <td class="px-4 py-3">총 결제금액
			                      </td>
			                      <td class="px-4 py-3">
			                       
			                      </td>
			                      <td class="px-4 py-3">
			                        <span id="priceResult">${orderdetail.price}</span>원
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
                </span>
              </div>
            </div>
            <br><br>
                        <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">주문자정보</th>
                      <th class="px-4 py-3"></th>
                      <th class="px-4 py-3"></th>
                      <th class="px-4 py-3"></th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                  				<tr class="text-gray-700 dark:text-gray-400">
				                      <td class="px-4 py-3 text-sm">
				                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                      		수령인
				                      </td>
				                      <td class="px-4 py-3" colspan="3">
				                        ${orderdetail.orderName}
				                      </td>
	                    		</tr>
								<tr class="text-gray-700 dark:text-gray-400">
				                      <td class="px-4 py-3 text-sm">
				                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                      		주소
				                      </td>
				                      <td class="px-4 py-3" colspan="3">
				                        ${orderdetail.address}
				                      </td>
	                    		</tr>
	                    		<tr class="text-gray-700 dark:text-gray-400">
				                      <td class="px-4 py-3 text-sm">
				                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                      		전화번호
				                      </td>
				                      <td class="px-4 py-3" colspan="3">
				                        ${orderdetail.orderPhone}
				                      </td>
	                    		</tr>
	                    		<tr class="text-gray-700 dark:text-gray-400">
				                      <td class="px-4 py-3 text-sm">
				                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                      		요청사항
				                      </td>
				                      <td class="px-4 py-3" colspan="3">
				                        ${orderdetail.orderComment}
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
                </span>
              </div>
            </div>
             <br><br>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
<script>

	var itemcount =	document.querySelectorAll("#result");
	var price =	document.querySelectorAll("#itemPrice");
	var resultPrice = document.querySelectorAll("#priceResult");
	//console.log(itemcount[0].innerHTML);
	//console.log(price[0].value);
	for(let i=0;i<itemcount.length;i++){
		let totalprice = parseInt(itemcount[i].innerHTML)*parseInt(price[i].value);
		resultPrice[i].innerText=totalprice;
	} 
	
	var listss = new Array();

	<c:forEach items="${reviewItemNo}" var="item">
		listss.push("${item}");
	</c:forEach>
	
	var itemNo = document.querySelectorAll("#itemNo_");
	var reviewbtn = document.querySelectorAll("#reviewbtn");

	
	if(listss.length>0){
		for(let i=0;i<itemNo.length;i++){
			let count=0;
			//console.log(itemNo[i].value);
			for(let j=0;j<listss.length;j++){
				if(itemNo[i].value!=listss[j] ){
					//console.log(list[j]);
					count=count+1;
				}
			}  
			if(count==listss.length){
				const btn = document.createElement("button");
				btn.innerHTML="리뷰쓰기";
				btn.className="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100";
				reviewbtn[i].appendChild(btn);
				btn.onclick = function () {
				    this.parentElement;
				    console.log('d'); 
				    console.log(this.parentElement.nextElementSibling);
				    location.assign('${path }/itemReview/insertReviewGo.do?itemNo='+itemNo[i].value+'&itemName='+this.parentElement.nextElementSibling.value+'&mainPic='+this.parentElement.nextElementSibling.nextElementSibling.value+'&orderNo=${orderdetail.orderNo}'); 
			}; 

		}else{
				const btn = document.createElement("button");
				btn.innerHTML="리뷰완료";
				btn.className="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700";
				reviewbtn[i].appendChild(btn);
				btn.onclick = function () {
					location.assign('${path}/market1/marketdetail.do?itemNo='+itemNo[i].value);
				};
			}
		}
	} 
	

</script>