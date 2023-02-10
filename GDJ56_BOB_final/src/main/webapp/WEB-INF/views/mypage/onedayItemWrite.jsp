<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <span style="color:#707275;" class="ml-4">주문내역</span>
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
                  <path  d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                </svg>
                <span class="ml-4" >1:1 문의글</span>
              </a>
            </li>
            <li class="relative px-6 py-3">
            <span
                class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                aria-hidden="true"
              ></span>
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
                  <path d="M4 6h16M4 10h16M4 14h16M4 18h16" style="color:#1A1C23;"></path>
                </svg>
                <span class="ml-4" style="color:#1A1C23;">원데이클래스/상품 문의글</span>
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
            <div class="overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">분류</th>
                      <th class="px-4 py-3">상품명</th>
                      <th class="px-4 py-3">내용</th>
                      <th class="px-4 py-3">작성날짜</th>
                      <th class="px-4 py-3">답변</th>
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                   <c:if test="${empty mqa}">
                   		<tr class="text-gray-700 dark:text-gray-400">
	                      <td class="px-4 py-3" colspan="5">
	                       	문의내역이 없습니다.
	                     </td>
	                    </tr>
                   </c:if>
                   
                   <c:if test="${not empty mqa}">
                   		<c:forEach var="mq" items="${mqa }">
                   			<tr class="text-gray-700 dark:text-gray-400">
		                      <td class="px-4 py-3 text-sm">
		                      <c:out value="${mq.cate eq 'ITEM' ? '마켓상품': '원데이클래스'}" />
		                      </td>
		                      <td class="px-4 py-3 text-sm">
		                      		<c:if test="${mq.cate eq 'ITEM' }">
		                      			<a href="${path}/market1/marketdetail.do?itemNo=${mq.itemNo }">
					                      	${mq.name }
					                     </a>
		                      		</c:if>
		                      		<c:if test="${mq.cate eq 'ONE' }">
		                      			<a href="${path}/class/odcView.do?no=${mq.itemNo }">
					                      	${mq.name }
					                     </a>
		                      		</c:if>
		                      </td>
		                      <td class="px-4 py-3 text-sm">
			                      	${mq.iqContent }		                      
		                      </td>
		                      <td class="px-4 py-3 text-sm">
			                      	<fmt:formatDate value="${mq.iqDate }" pattern="yyyy-MM-dd"/>
		                      </td>
		                      <td class="px-4 py-3 text-sm">
		                      		<a href="#modal1" rel="modal:open">
		                      		<button onclick="qaReply(event);" value="${mq.cate }" class="px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700">
			                      	답변보기
			                      </button>
		                      		</a>
			                      
			                      <input hidden value="${mq.iqNo }">
		                      </td>
		                    </tr>
                   		</c:forEach>
                   </c:if>
                  </tbody>
                </table>
              </div>
              
              <div
                class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
              >
                <span class="col-span-1"></span>
                <!-- Pagination -->
                <span class="flex col-span-3 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    ${pageBar }
                  </nav>
                </span>
              </div>
            </div>
          </div>
          <br><br>
        </main>
      </div>
    </div>
  </body>
  

		<div
		id="qnaReply" style="width:500px;height:auto; display: none;background-color: white;border-radius: 15px 15px;text-align: left;"
		  class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
		 <h1 style="text-align: center;"><b>문의글 답변</b></h1>
		
		 	<span id="reply"> </span>
		     <div style="margin-top:16px;text-align: center;">
		     	<button
			       type="reset"
			       style="display :inline-block;background-color: white; border: 1.5px solid black; color: black;"
			       class="modal_close_btn px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
			     >
			     확인
			     </button>
		     </div>
		</div>
	
</html>
<script>
	const qaReply=(e)=>{
		console.log(e.target.value);
		console.log(e.target.parentElement.nextElementSibling.value); 
		let cate=e.target.value;
		//let qnaNo=e.target.nextElementSibling.value;
		let qnaNo=e.target.parentElement.nextElementSibling.value;
		if(cate=='ITEM'){
			$.ajax({
				url:"${path}/mypage/itemReply",
				type:"get",
				data:{qnaNo:qnaNo},
				success:data=>{
					//console.log(data);
					if(data[0]!=null){
						//console.log(data);
						modal('qnaReply');
						let rere="";
						for(let i=0;i<data.length;i++){
							rere+=data[i].iqaContent+"\n";
						}
						document.querySelector("#reply").innerText=rere;
						 
					}else{
						alert('미답변상태입니다.');
						/* modal('modal_adminMasterYES');
						document.querySelector("#reply").innerText="미답변 상태입니다."; */
					}
					
				}
	    	});
		}else{
			$.ajax({
				url:"${path}/mypage/onedayReply",
				type:"get",
				data:{qnaNo:qnaNo},
				success:data=>{
					console.log(data);
					if(data[0]!=null){
						//console.log(data);
						modal('qnaReply');
						let rere="";
						for(let i=0;i<data.length;i++){
							rere+=data[i].oqrContent+"\n";
						}
						document.querySelector("#reply").innerText=rere;
						 
					}else{
						alert('미답변상태입니다.');
						/* modal('modal_adminMasterYES');
						document.querySelector("#reply").innerText="미답변 상태입니다."; */
					}
				}
	    	});
		} 
	
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
	}
</script>

