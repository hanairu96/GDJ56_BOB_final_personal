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
                <span class="ml-4">회원정보</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
              <span
                class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"
              ></span>
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
                  <path style="color:#1A1C23;"
                    d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                  ></path>
                </svg>
                <span class="ml-4" style="color:#1A1C23;">장바구니</span>
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

            <!-- New Table -->
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr id="pp"
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">
                        <input type="checkbox" onclick="checkAll();" id="allCheck">
                        전체선택(<span id="checkcount">0</span>/${basket.size()})
                      </th>
                      <th class="px-4 py-3">상품정보</th>
                      <th class="px-4 py-3">수량</th>
                      <th class="px-4 py-3">가격</th>
                      <th class="px-4 py-3">삭제</th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                  		<c:if test="${empty basket}">
	                     	<tr class="px-4 py-3">
								<td class="px-4 py-3" colspan="5">
									<p>장바구니가 비었습니다.</p>
								</td>
							</tr>
	                     </c:if>
                  		<c:if test="${not empty basket}">
                  			<c:forEach var="b" items="${basket}"> 
                  			<c:forEach var="bi" items="${b.item}"> 
                  				<tr class="text-gray-700 dark:text-gray-400">
			                      <td class="px-4 py-3 text-sm">
			                      		<div style="display:flex;">
					                        <input type="checkbox" name="productCheck" id="productCheck_" value="${b.basketNo }">
					                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${path}/market1/marketdetail.do?itemNo=${bi.itemNo}">
					                        <img style="width:70px;height:60x" alt="" src="${path }/resources/upload/market/mainlabel/${bi.mainPic}">
			                        	</a></div>
			                      </td>
			                      <td class="px-4 py-3">
			                        <div class="flex items-center text-sm" id="stockinfo">
			                        <a href="${path}/market1/marketdetail.do?itemNo=${bi.itemNo}">
				                        <c:if test="${empty bi.itemBrand}">${bi.itemName}</c:if>
			    						<c:if test="${not empty bi.itemBrand}">[${bi.itemBrand}]${bi.itemName}</c:if>
			    					</a>
			                        </div>
			                      </td>
			                      <td class="px-4 py-3 text-sm">
			                        <button onclick="count(event)" value='minus'
			                          class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700"
			                        >
			                        -
			                        </button>
			                          <span id='result'>${b.itemCount} </span>개
			                        <button onclick="count(event)" value='plus'
			                          class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700"
			                        >
			                        +
			                        </button>&nbsp;
			                        <button id="modifyNum" class="px-2 py-1 font leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
			                          수정
			                        </button>
			                        <input type="text" value=${b.basketNo } hidden>
			                      </td>
			                      <td class="px-4 py-3 text-sm">	
			                        <span id="priceResult"></span>원
			                        <input type="text" value="${bi.itemDiscount eq 'Y' ? '9900': bi.itemPrice}" id="itemPrice" hidden >
			                      </td>
			                      <td>
			                        &nbsp;&nbsp;
			                        <button id="deleteBasket" class="px-2 py-1 font leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
			                          삭제
			                        </button>
			                        <input type="text" value="${bi.itemStock}" id="itemstock" hidden>
			   
			                      </td>
                    		</tr>
                    		</c:forEach>
                  			</c:forEach>
                  		</c:if>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3" colspan="2"></th>
                      <th class="px-4 py-3" colspan="2" style="color: #1A1C23; font-size: 16px; ">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        총가격
                        &nbsp;&nbsp;&nbsp;
                        <span id="totalPrice">0</span>원	
                      </th>
                      <th>
                        <button onclick="orderOrder();" id="order" style="height: 30px; width: 80px; font-size: 16px;" class="leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                          주문
                        </button>
                      </th>
                    </tr>

                  </tbody>
                </table>
              </div>
              <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
              >
                <span class="col-span-1"></span>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
<script>
	
	var ckckck=document.querySelectorAll("#productCheck_");
	var stockinfo=document.querySelectorAll("#stockinfo");
	var itemstock = document.querySelectorAll("#itemstock");
	var itemcount =	document.querySelectorAll("#result");
	var price =	document.querySelectorAll("#itemPrice");
	var resultPrice = document.querySelectorAll("#priceResult");
	//console.log(itemcount[0].innerHTML);
	//console.log(price[0].value);
	for(let i=0;i<itemcount.length;i++){
		let totalprice = parseInt(itemcount[i].innerHTML)*parseInt(price[i].value);
		resultPrice[i].innerText=totalprice;
	} 
	
	for(let i=0;i<ckckck.length;i++){
		//console.log(parseInt(itemstock[i].value));
		//console.log(parseInt(itemcount[i].innerHTML));
		if(parseInt(itemstock[i].value)<parseInt(itemcount[i].innerHTML)){
			ckckck[i].disabled="false";
			//stockinfo[i].innerHTML="*재고량부족*";
			stockinfo[i].style="text-decoration:line-through";
		}
	} 
	
	
	

  //증가,감소
  function count(e)  {
	  
	  let productCount;
		  //document.getElementById('result');
	  let number;
	 /*  let number = productCount.innerText; */
	  
	  if(e.target.value === 'plus') {
		productCount=e.target.previousElementSibling;
		number=productCount.innerText;
	    number = parseInt(number) + 1;
	   
	  }else if(e.target.value === 'minus')  {
		  productCount=e.target.nextElementSibling;
		  number=productCount.innerText;
	    if(number<=1){
	      number=1;
	    }else{
	      number = parseInt(number) - 1;
	    }	    
	    
	  }
	  productCount.innerText = number;
	}

//전체선택
/* function checkAll() {
	if($("#allCheck").is(':checked')) {
		$("input[name=productCheck]").prop("checked", true);
	} else {
		$("input[name=productCheck]").prop("checked", false);
	}
} */
function checkAll() {
	if($("#allCheck").is(':checked')) {
		$(":checkbox:not(:disabled)").prop("checked", "checked");
	} else {
		$("input[name=productCheck]").prop("checked", false);
	}
}

	//수정,삭제버튼누르면
	const modifyNum = document.querySelectorAll("#modifyNum");
	const deleteBasket = document.querySelectorAll("#deleteBasket");
	for (let i=0; i<modifyNum.length; i++) {
	    modifyNum[i].addEventListener("click", click);
	  }
	for (let i=0; i<deleteBasket.length; i++) {
	  deleteBasket[i].addEventListener("click", click);
	}

  function click(e) {
    if(e.target.id=="modifyNum"){
      let result=window.confirm("수정하시겠습니까?");
      
      if(result){
    	  let itemCount=e.target.previousElementSibling.previousElementSibling.innerHTML;
    	  let basketNo=e.target.nextElementSibling.value;
    	  //console.log(itemNum);
        //수정하면 장바구니 회원아이디,상품번호로 where, 개수update
    	   $.ajax({
				url:"${path}/mypage/updateBasketCount.do",
				type:"get",
				data:{itemCount:itemCount,basketNo:basketNo},
				success:data=>{
					if(data==1) alert("수정성공");
					else alert("수정실패");
					location.replace('${path}/mypage/basket.do');
				}
	    	}); 
      }
    }else if(e.target.id=="deleteBasket"){
      let dresult=window.confirm("삭제하시겠습니까?");
      if(dresult){
        //true면 delete 장바구니로 where
        	//console.log(e.target.parentElement.previousElementSibling.previousElementSibling.children[4].value);
    	  let dbasketNo=e.target.parentElement.previousElementSibling.previousElementSibling.children[4].value;
    	  $.ajax({
				url:"${path}/mypage/deleteBasketCount.do",
				type:"get",
				data:{dbasketNo:dbasketNo},
				success:data=>{
					if(data==1) alert("삭제성공");
					else alert("삭제실패");
					location.replace('${path}/mypage/basket.do');
				}
	    	});
      }
    }
  }

  $(document).ready(function() {
      $("input[type=checkbox]").click(function(e) {
    	  	
              let totalP=0;
              let ckdata=$("input:checkbox[id=productCheck_]:checked");
              //console.log(ckdata);
              for(let i=0;i<ckdata.length;i++){
                //console.log(ckdata[i].parentElement.parentElement);
                let par=ckdata[i].parentElement.parentElement.parentElement;
                let ckprice=par.children[3].children[0].innerHTML;
                //console.log(parseInt(ckprice)); 
                totalP=parseInt(ckprice)+parseInt(totalP);
                //console.log(totalP);
              }
              document.querySelector("#totalPrice").innerText=parseInt(totalP);

              document.querySelector("#checkcount").innerText=ckdata.length;
      	
        }); 
});
  
  const orderOrder=()=>{
	  
	  let basketarray=new Array();
	  let ckdata=$("input:checkbox[id=productCheck_]:checked");
	  if(ckdata.length>0){
		  for(let i=0;i<ckdata.length;i++){
			  basketarray.push(ckdata[i].value);
		  }
		  //console.log(basketarray);
		  location.assign("${path}/mypage/basket/order.do?basketss="+basketarray);
	  }else{
		  alert('제품을 선택해주세요');
	  }
	  
	  
  }
</script>
