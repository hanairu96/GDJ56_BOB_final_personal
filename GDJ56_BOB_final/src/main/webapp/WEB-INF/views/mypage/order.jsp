<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<body>
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
           <!--  <form action="#"> -->
                <h4>주문상품</h4>
                <c:forEach var="io" items="${orderitemlist }">
                <c:forEach var="ios" items="${io.item }">
                	<div class="blog__sidebar__recent">
                            <span class="blog__sidebar__recent__item">
                                <div class="blog__sidebar__recent__item__pic">
                                    <img style=" width:110px;height:110px" src="${path }/resources/upload/market/mainlabel/${ios.mainPic}" alt="">
                                </div>
                                <div class="blog__sidebar__recent__item__text">
                                	<h6>
	                                 	<c:if test="${empty ios.itemBrand}">${ios.itemName}</c:if>
				    					<c:if test="${not empty ios.itemBrand}">[${ios.itemBrand}]${ios.itemName}</c:if>
                                    </h6>
                                    <div style="justify-content: space-evenly;">
                                    <h6 style="display: flex; justify-content: space-evenly;color:black; ">
                                    	<span  style="color:black; margin-left:600px;" >수량 : ${io.itemCount }</span> 
                                    	가격 :<span color:black; id="resultPrice" > </span>원</h6>
                                    	<input id="itemcount" value="${io.itemCount }" hidden>
                                    	<input id="itemprice" value="${ios.itemPrice }" hidden>
                                    </div>
                                    <br>
                                </div>
                            </span>
                        </div> 
                 </c:forEach>            
                </c:forEach>
                        

                <h4>배송지</h4>
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        
                        
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p><b>수령인</b><span><small>&nbsp;(*필수)</small></span></p>
                                    <input type="text" id="orderName">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p><b>전화번호</b><span><small>&nbsp;(*필수)</small></span></p>
                                    <input type="text" id="orderPhone" placeholder="01012345678">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                        <span class="text-gray-700 dark:text-gray-400"><b>주소</b></span><span style="color:red;"><small>&nbsp;(*필수)</small></span>
	                  	<div style="display:flex;flex-direction:row;">
		                	<div style="width:fit-content;">
		                        <input type="text" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                            id="inputAddress_postcode"
		                            style="background-color:#1a1c231b;"
		                            value="${address.get(0) }"
		                            name="updateAdd1"
		                            readonly>
		                    </div>
		                    <div style="width:fit-content;">
		                        <input id="searchAddr" type="button" style="margin-left:20px; color:#1a1c23be;font-weight:bolder;"class="font-medium leading-5 text-black transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
		                        value="주소검색" onclick="sample6_execDaumPostcode()">
		                    </div>
	                    </div>
		                <div style="display:flex;flex-direction:row;">
		                    <div style="margin-right:10px;">
		                        <input type="text" style="width:300px;background-color:#1a1c231b;" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
		                             id="inputAddress_address" 
									value="${address.get(1) }"
									name="updateAdd2"
			                        readonly>
		                    </div>
		                   <div style="width:auto;">
		                        <input type="text" style="width:300px;"class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input" 
		                            id="inputAddress_detailAddress"
		                            value="${address.get(2) }"
		                            name="updateAdd3" placeholder="상세주소">
		                    </div>
		                </div>
                           <!--  <p>배송지<span>*</span></p>
                            <input type="text" placeholder="Street Address" class="checkout__input__add">
                            <input id="searchAddr" type="button" style="margin-left:15px;height:40px;"class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
		                        value="주소 검색" onclick="sample6_execDaumPostcode()">
                            <input type="text" placeholder="Apartment, suite, unite ect (optinal)"> -->
                        </div>
                        <div class="checkout__input">
                                    <p><b>요청사항</b><span></span></p>
                                    <input type="text" id="orderComment">
                                </div>
                        <h4>적립금</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>사용할 적립금<span></span></p>
                                    <div style="display: flex;">
                                        <input id="point" type="number" min="0" max="123" style="width: 200px;" value="" onkeyup="fn_eventKeyupPoint(this.value)">
                                        <button id="pointAll" type="button" class="site-btn" onclick="fn_pointAll()">전액사용</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <p>사용 가능한 적립금<span>*</span></p>
                                <p id="mypoint" style="vertical-align: middle;">${pointAll}원</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>결제상세</h4>
                            <div class="checkout__order__products">주문금액<span id="totalPrice">Total</span></div>
                            <ul>
                                <li>배송비 <span id="delprice">2000</span></li>
                            </ul>
                            <div class="checkout__order__subtotal">적립금 사용 <span id="finalpoint">0</span></div>
                            <div class="checkout__order__total">최종결제금액 <span id="totaltotal"></span></div>
                            <button onclick="basketpay()" class="site-btn" id="payBtn" disabled style="background-color: gray;">결제하기</button>
                            <p id="payTxt">결제 진행을 위해 아래의<br>결제 진행 필수 동의를 해 주세요</p>
                        </div>
                    </div>
                </div>
            <!-- </form> -->
        </div>
        <br><br><br><br><br>
        <div class="row">
            <div class="col-lg-12">
                <h6 id="checkline"><span class="icon_tag_alt"></span> 개인정보 수집/제공 | 결제 진행 필수 전체 동의  
                    <a href="#" onclick="fn_confirm()" style="color: red;">(필수)동의하기</a>
                    <a href="#" onclick="fn_alert()">상세보기</a>
                </h6>
            </div>
        </div>
    </div>
</section>
<!-- Checkout Section End -->
<script>
	
	
	
	var itemcount =	document.querySelectorAll("#itemcount");
	var price =	document.querySelectorAll("#itemprice");
	var resultPrice =document.querySelectorAll("#resultPrice");
	let totalresult=0;
	for(let i=0;i<itemcount.length;i++){
		//console.log(parseInt(itemcount[i].value));
		//console.log(parseInt(price[i].value));
		let totalprice = parseInt(itemcount[i].value)*parseInt(price[i].value);
		resultPrice[i].innerText=totalprice;
		//console.log(totalprice);
		totalresult=parseInt(totalprice)+parseInt(totalresult);
		//console.log(totalresult);
	} 
	
	document.querySelector("#totalPrice").innerHTML=totalresult;
	document.querySelector("#totaltotal").innerHTML=parseInt(totalresult)+parseInt(30);
	
	
	

    //사용할적립금
    const fn_eventKeyupPoint = (str)=>{
    	if(str==""){
    		str=0;
    		$("#finalpoint").text(str);
    	}else{
    		$("#finalpoint").text(str);
    	}
    	
        
        //해야하는것!max 넘기면 값입력못하게 or 사용가능적립금으로변경되게
		
        let totaltotal=parseInt(totalresult)+
    	parseInt(document.querySelector("#delprice").innerText)-
    	parseInt(document.querySelector("#finalpoint").innerHTML); 
        
        if(totaltotal<100){
        	alert("결제 최소금액은 100원입니다.");
        	$("#point").val(0);
        	document.querySelector("#finalpoint").innerHTML=0;
        	totaltotal=parseInt(totalresult)+
        	parseInt(document.querySelector("#delprice").innerText)-
        	parseInt(document.querySelector("#finalpoint").innerHTML); 
        }
    	
        document.querySelector("#totaltotal").innerHTML=totaltotal;
        
        
         
    }

    //포인트전액사용
    const fn_pointAll = ()=>{
        
        let mypointtext = $("#mypoint").text();
        let mypoint = mypointtext.substring(0, mypointtext.length -1);
        console.log(mypoint);
        
        
        let pointover=parseInt(document.querySelector("#totalPrice").innerText)+30-100;
        console.log(pointover);
        console.log(mypoint);
        
        if(parseInt(mypoint)>parseInt(pointover)){
        	alert("결제 최소금액은 100원입니다.");
        	document.querySelector("#finalpoint").innerHTML=0;
        	document.querySelector("#finalpoint").innerHTML=0;
        }else{
        	//사용할적립금변경
            console.log($("#point").val(mypoint));
            //최종사용적립금변경
            console.log($("#finalpoint").text(mypoint));
        }
        
        let totaltotal=parseInt(totalresult)+
    	parseInt(document.querySelector("#delprice").innerText)-
    	parseInt(document.querySelector("#finalpoint").innerHTML);
        
        document.querySelector("#totaltotal").innerHTML=totaltotal;

        //사용할적립금변경
        //console.log($("#point").val(mypoint));
        //최종사용적립금변경
        //console.log($("#finalpoint").text(mypoint));
		

    }
    
    //개인정보동의
    const fn_confirm = ()=>{

        let text = "개인정보 수집이용 및 처리 동의(필수)\n개인정보 제3자 제공 동의(필수)\n전자지급 결제대행 서비스 이용약관 동의(필수)";
        
        let msg = confirm(text);
        
        if(msg == true){
            document.getElementById('payBtn').disabled = false;
            document.getElementById("payBtn").style = "";
            document.getElementById("payTxt").innerText = "";
        }else{
            document.getElementById('payBtn').disabled = true;
            document.getElementById("payBtn").style = "background-color: gray";
            document.getElementById("payTxt").innerHTML = "결제 진행을 위해 <br>결제 진행 필수 동의를 해 주세요";
        }
    }
    const fn_alert = ()=>{
        let text = "1. 개인정보를 제공받는 자 : 상품 및 서비스 판매자\n"
                +"2. 제공하는 개인정보 항목 : 이름, 네이버 아이디, (휴대)전화번호, 상품 구매정보,결제수단, 상품 수령인 정보(배송상품:수령인명, 주소, (휴대)전화번호/ E쿠폰:이름, 네이버 아이디, 휴대전화번호)\n"
                +"3. 개인정보를 제공받는 자의 이용목적 : 판매자와 구매자의 원활한 거래 진행, 본인의사의 확인, 고객상담 및 불만처리/부정이용 방지 등의 고객관리, 물품배송, 새로운 상품/서비스 정보와 고지사항의 안내, 상품/서비스 구매에 따른 혜택 제공\n"
                +"4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보존합니다. 단, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 삭제합니다.\n"
                +"위 개인정보 제공 동의를 거부할 권리가 있으나, 거부 시 상품 및 디지털 콘텐츠 구매가 불가능합니다."
        alert(text);
    }
    
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
    
    
    
    const basketpay=()=>{
	    //console.log($("#totaltotal").html());
	    //console.log($("#orderName").val());
	    //console.log($("#orderPhone").val());
	    /* console.log(${loginMember.memberId}); */
	    let orderaddr="("+$("#inputAddress_postcode").val()+") "+$("#inputAddress_address").val()+","+$("#inputAddress_detailAddress").val();
	    //console.log(orderaddr);
	    let merchant = 'bob_'+Math.floor(Math.random() * 100000000)+1;
	    console.log(merchant);
	    let inputname=$("#orderName").val();
	    let inputorderPhone=$("#orderPhone").val();
	    let inputorderAddr=$("#inputAddress_postcode").val();
	    console.log(inputname+"d"+inputorderPhone+"D"+inputorderAddr);
	    if(inputname!="" && inputorderPhone!="" && inputorderAddr!="" ){
	    	IMP.init("imp44501773");
    		IMP.request_pay({
    			pg : "html5_inicis",
    			name : "장바구니 결제하기",
    			pay_method : "card",
    			amount : $("#totaltotal").html(),
    			merchant_uid : merchant,
    			buyer_name : $("#orderName").val(),
    			buyer_email : "email@email",
    			buyer_tel : $("#orderPhone").val(),
    			buyer_addr: orderaddr
    		}, function(rsp){	
    				if(rsp.success){
    					 /* console.log(rsp.imp_uid+"uid");
    					alert("결제가 완료되었습니다."); */ 
    					$.ajax({
    						url : "${path}/mypage/pay.do",
    						type : "post",
    						/* contentType:"application/json", */
    						 data : {
    								price : Number($("#totaltotal").html()),
    								buyer_addr: orderaddr,
    								buyer_name : $("#orderName").val(),
    								buyer_tel : $("#orderPhone").val(),
    								orderComment : $("#orderComment").val(),
    								merchant : rsp.imp_uid,
    								use_point : Number($("#finalpoint").html()),
    								basketss : JSON.stringify(${basketss}),
    								sellItemNoCount : JSON.stringify(${sellItemNoCount})
    								},
    						success:data=>{
    							if(data>0){
    								console.log(data);
    								alert("결제가 완료되었습니다.");
    								location.replace('${path}/mypage/basket.do');
    							}else{
    								console.log(data);
    								alert("결제가 실패하였습니다.");
    							}
    							
    							
    						},error : function(request, status, error) {
    						   	 alert("code : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
    					    }
    					}); 
    					
    				 }else{	
    					alert(rsp.error_msg);
    				}
    			});		 
	    }else{
	    	alert('필수입력값을 채워주세요');
	    }
	    
      
    } 
</script>

</body>

</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>