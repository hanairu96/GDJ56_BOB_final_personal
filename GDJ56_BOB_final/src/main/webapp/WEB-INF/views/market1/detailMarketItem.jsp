<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/common/marketHeader.jsp"/>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
   <div class="breadcrumb-section set-bg" style="height: 350px;background-image: url('${path }/resources/market/img/mainbanner.jpg');">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                       	<h2 style="color:black;"><c:out value="${de.itemCategory}"/></h2>
                    </div>
                 </div>
             </div>
         </div>
     </div>
 </section>
    <section class="product-details spad">
    

        <div class="container">
			<div>            
	            <div class="row">
	                <!-- 슬라이더 사진 4개까지 넣을 수 있다 (사진을 4개 미만으로 넣으면 같은 사진 반복) -->
	                <div class="col-lg-6 col-md-6">
                    <div>
				   		<button class="primary-btn" type="button" onclick="updateItem(${de.itemNo})" style="background-color:blue;border: none;">수정</button>
				    	<c:if test="${loginMember.memberId eq 'admin' }">
				    	<button class="primary-btn" type="button" onclick="deleteItemFile(${de.itemNo},'${picpic}','${de.mainPic}','${de.itemLabel}')" style="background-color:red;border: none;" >삭제</button>
				   		</c:if>	
				    </div>	
	                    <div class="product__details__pic">
	                        <div class="product__details__pic__item">
	                        <!-- 메인사진이 없는 경우 -->
	                        <c:if test="${empty de.mainPic }">
	                            <img class="product__details__pic__item--large"
	                                src="${path }/resources/market/img/product/details/product-details-1.jpg" alt="">
	                        </c:if>
							<!-- 메인사진이 있는 경우 -->	                        
	                        <c:if test="${not empty de.mainPic }">
	                            <img id="bigpicmain" class="product__details__pic__item--large"
	                                src="${path }/resources/upload/market/mainlabel/${de.mainPic}" alt="">
	                        
	                        </c:if>
	                        </div>
	                        <!-- 배열로 돌아갈 4가지 사진 -->
	                        <div id="imgcollect" class="product__details__pic__slider owl-carousel">
	                      	<c:if test="${not empty de.ipic }">
		                        <c:forEach var="file" items="${de.ipic }">
									<img class="picpicsmall" 
									data-imgbigurl="${path }/resources/upload/market/detail/${file.picName}"
									src="${path }/resources/upload/market/detail/${file.picName}">
								</c:forEach>                         
		                            <img class="picpicsmall"
		                            data-imgbigurl="${path }/resources/upload/market/mainlabel/${de.mainPic}"
		                            src="${path }/resources/upload/market/mainlabel/${de.mainPic}" alt="">
	                        </c:if>
	                        </div>
	                    </div>
	                </div>
	                <!-- ?????????이건 왜 안먹히는걸까????????? -->
<!-- 	                <script>
		                const bigpic=document.querySelector("#imgcollect");
		                var smallpic=document.querySelectorAll(".picpicsmall");
		                console.log(bigpic);
		                console.log(smallpic);
		                for(let i=0;i<smallpic.length;i++){
		                	smallpic[i].addEventListener("click",changepic());
		                	smallpic[i].onclick=changepic;
		                }
		                function changepic(){
		                    var changesmallpic=this.getAttribute("src");
		                    bigpic.setAttribute("src",changesmallpic);
		                }
						                
	                </script>  -->
	                <div class="col-lg-6 col-md-6">
	                    <div class="product__details__text" style="margin-left:30px;">
	                    	<br>
	                        <h3>
	                        <c:if test="${de.itemBrand!=null }">
						        [${de.itemBrand }]
						    </c:if>
	                        <c:out value="${de.itemName }"/></h3>
	                        
	                        <div class="product__details__rating">
	                        <c:if test="${reavg !=null }">
		                        <c:forEach var="i" begin="1" end="${reavg }">
		                        	<img src="${path }/resources/market/star1.png" style="width:30px;"/>
		                        </c:forEach>
	                        </c:if>
	                        <c:if test="${reavg ==null }">
							   	<img src="${path }/resources/market/star1.png" style="width:30px;"/>
									첫 리뷰를 등록해주세요
						    </c:if>	
	                            <span style="font-size:20px;">(리뷰 ${reviews.size() })</span>
	                        </div>
	                        
	                        
	                        <div class="product__details__price">
	                        <c:if test="${de.itemDiscount eq 'Y' }">
                        		<h5 style="text-decoration:line-through;">${de.itemPrice }원</h5>
                        		<h5 style="color:magenta; margin:10px;">할인가 9900원</h5>
                        	</c:if>
                        	<c:if test="${de.itemDiscount eq 'N' }">
                        		<h5><c:out value="${de.itemPrice }"/>원</h5>
                        	</c:if>
	                        </div>
	                        <p><c:out value="${de.mainContent}"/></p>
	                        <div class="product__details__quantity">
	                            <div class="quantity">
	                                <div class="pro-qty">
	                                    <input type="text" id="testtesttest" value="1">
	                                </div>
	                            </div>
	                        </div>
	                        <br>
	                        <c:if test="${de.itemStock==0 }">
		                        <a href="javascript:void(0);" class="primary-btn" style="background-color: magenta;" onclick="soldoutItem();">품절되었습니다.</a>
	                        </c:if>
	                        <c:if test="${de.itemStock>0 }">
		                        <a class="primary-btn" href="javascript:void(0);" onclick="addbasketitem(${de.itemNo },'${loginMember.memberId }','${de.mainPic }','${de.itemName }')" style="background-color:#bde28f;">장바구니 담기</a>
	                        </c:if>
	                        <br><br><br>
	                        <b>원산지</b> <span><c:out value="${de.madeIn }"/></span><br><br>
	                        <b>배송비</b> <span><c:out value="${de.delPrice }"/>원</span>
	                    </div>
	                </div>
				</div>

                <!-- 상품설명, 리뷰, 교환 및 반품안내, 문의하기 -->
                <div class="col-lg-12">
                    <div class="product__details__tab" id="acollect">
                        <br><br>
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" role="tab"
                                    aria-selected="true" style="font-size: 25px;"
                                    href="javascript:void(0);" onclick="choiceexplain(${de.itemNo},'aa');">상품설명</a>
                            </li>
                            <li class="nav -item">
                                <a class="nav-link" data-toggle="tab" role="tab"
                                    aria-selected="false" style="font-size: 25px;"
                                    href="javascript:void(0);" onclick="choiceexplain(${de.itemNo},'bb');">리뷰<span>(${reviews.size() })</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" role="tab"
                                    aria-selected="false" style="font-size: 25px;"
                                    href="javascript:void(0);" onclick="choiceexplain(${de.itemNo},'cc');">교환 및 반품 안내</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" role="tab" style="font-size: 25px;"
                                    href="javascript:void(0);" onclick="choiceexplain(${de.itemNo},'dd');">문의하기 <span>(${qna.size()})</span></a>
                            </li>
                        </ul>
                        <br>
                        <hr/> 
                        <br>
                    </div>
                </div>
                
                <script>
                	const soldoutItem=()=>{
                		alert("품절되었습니다! 재입고를 기다려주세요!");
                	}
                
                
	            	const deleteItemFile=(no,pic,main,label)=>{
	            		const pp=pic.split(",");
	            		var addpath="";
	            		for(let i=0;i<pp.length;i++){
	            			addpath+="&picName="+pp[i];
	            		}
	        			location.assign("${path}/market1/deleteItem.do?itemNo="+no+"&mainPic="+main+"&itemLabel="+label+addpath);    	
	            	}
	            	
	            	const updateItem=(no)=>{
	        			location.assign("${path}/market1/updateItemGo.do?itemNo="+no); 
	            	}
	                
	                function choiceexplain(no,check){
				 		 $.ajax({
							type:"get",
							url:"${path}/market1/choiceexplain.do?itemNo"+no,
							data:{"itemNo":no,
								 "check":check},
							success:data=>{
			    				$("#explain").html(data);
							}
						})
	                }
	                
	                
	                
	                //장바구니
					var arr=new Array();
					<c:forEach var="b" items="${basket}">
						arr.push({itemNo:${b.itemNo}});
					</c:forEach>
					
					
					const addbasketitem=(no,memberId,mainPic,itemName)=>{
	 					if(${loginMember==null}){
	 						alert("로그인 후 사용가능합니다.");
						}else{
						var test=$("#testtesttest").val();
						const item=arr.filter(e=>e.itemNo==no);
							console.log(item);
								if(item.length>0){
									Swal.fire({
							            title: itemName,
							            text: "이 상품은 이미 담겨있습니다. 더 담으시겠습니까?",
							            imageUrl: '${path }/resources/upload/market/mainlabel/'+mainPic,
							            showCancelButton: true,
						            	confirmButtonColor: '#07d448',
							            cancelButtonColor: 'magenta',
							            confirmButtonText: '장바구니 추가',
							            cancelButtonText: '계속 쇼핑하기'
							        }).then((result) => {
							        	if (result.isConfirmed) {
											location.assign('${path}/basket/updatebasket.do?itemNo='+no+'&memberId='+memberId+'&add='+test); 
							        	}
							        })
								}else{
									location.assign('${path}/basket/insertbasket.do?itemNo='+no+'&memberId='+memberId+'&add='+test);
						
							}
						}
					}
                </script>
                
                
                <div id="explain">
	             	<div class="tab-content" >
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
						    <div class="product__details__tab__desc" >
						        <br>
						        <h3 style="text-align: center;font-weight:bold;" >
						        <c:if test="${de.itemBrand!=null }">
						        	[${de.itemBrand }]
						        </c:if>
						        ${de.itemName }
						        </h3>
						        <br>
						        <div style="text-align: center;"> 
						            <p>
										${de.itemContent }
						            </p>
						        </div>
						        <br>
						        <div  style="text-align: center;flex-wrap: wrap;width:510px;margin:0 auto;">
						        <c:if test="${not empty de.ipic }">
			                        <c:forEach var="file" items="${de.ipic }">
											 <img src="${path }/resources/upload/market/detail/${file.picName}" style="width:500px;height: 500px;margin:15px;">
									</c:forEach>                         
	                        	</c:if>
						        </div>
						        <br><br>
						        <div>
						            <span class="col-1" style="font-weight:bold;">용량 </span><span style="margin-left:2%">${de.weight }</span><br>
						            <span class="col-1" style="font-weight:bold;">특징 </span><span style="margin-left:2%">${de.itemPoint }</span><br>
						            <span class="col-1" style="font-weight:bold;">보관법</span><span class="col-3">${de.itemKeep }</span><br>
						            <span class="col-1" style="font-weight:bold;">활용팁</span><span class="col-3">${de.itemTip }</span><br>
						        </div>
						        <br>
						        <div style="text-align: center;">
						            <img src="${path }/resources/upload/market/mainlabel/${de.itemLabel }" alt="" >
					            </div>
					            <br><br><br>
					        </div>
					    </div>
					</div>
				</div>
				
				
            </div>
            <br><br><br>
			<div>
			    <span class="col-5" style="background-color: rgb(232, 247, 242);font-weight: bold;">판매자 정보 : </span>
			    <span class="col-6" style="background-color: rgb(242, 253, 250);font-weight: bold;">오늘의 밥</span>
			</div>
        </div>
        
    </section>

    <script>
	    (function ($) {  
	    	//상품 슬라이드
		    /*---------------------------------
		        Product Details Pic Slider
		    ----------------------------------*/
		    $(".product__details__pic__slider").owlCarousel({
		        loop: true,
		        margin: 20,
		        items: 4,
		        dots: true,
		        smartSpeed: 1200,
		        autoHeight: false,
		        autoplay: true
		    });
	    	
		     /*--------------------------
		         Select
		     ----------------------------*/
		     $("select").niceSelect();
	
		     /*------------------
		       Single Product
		    --------------------*/
		     $('.product__details__pic__slider img').on('click', function () {
	
		         var imgurl = $(this).data('imgbigurl');
		         var bigImg = $('.product__details__pic__item--large').attr('src');
		         if (imgurl != bigImg) {
		             $('.product__details__pic__item--large').attr({
		                 src: imgurl
		             });
		         }
		     });
	    	
	    	
	    	//상품 갯수
	        var proQty = $('.pro-qty');
	        proQty.prepend('<span class="dec qtybtn">-</span>');
	        proQty.append('<span class="inc qtybtn">+</span>');
	        proQty.on('click', '.qtybtn', function () {
	            var $button = $(this);
	            var oldValue = $button.parent().find('input').val();
	            if ($button.hasClass('inc')) {
	                var newVal = parseFloat(oldValue) + 1;
	            } else {
	                // Don't allow decrementing below zero
	                if (oldValue > 0) {
	                    var newVal = parseFloat(oldValue) - 1;
	                } else {
	                    newVal = 0;
	                }
	            }
	            $button.parent().find('input').val(newVal);
	            //console.log(oldValue);
	        });
	
	    })(jQuery);
	    
	    
	    //최근 본 상품 리스트
	    var no = ${de.itemNo};
	       var pic = '${de.mainPic}';
	       var item = JSON.stringify({itemNo: ${de.itemNo}, mainPic: pic});
	       
	       
	       
	       //최근본상품
	        if(localStorage.getItem("floatF") != null && localStorage.getItem("floatS") != null && localStorage.getItem("floatL") != null){
	          localStorage.setItem("floatF", localStorage.getItem("floatS")); //두번째를 첫번째에
	          localStorage.setItem("floatS", localStorage.getItem("floatL")); //라스트를 두번째에
	          localStorage.setItem("floatL", item); //라스트에 새로운 값을
	      }
	        if(localStorage.getItem("floatL") == null && localStorage.getItem("floatS") != null){
	         localStorage.setItem("floatL", item);
	      }
	       if(localStorage.getItem("floatS") == null && localStorage.getItem("floatF") != null){
	          localStorage.setItem("floatS", item);
	       }
	         if(localStorage.getItem("floatF") == null){
	          localStorage.setItem("floatF", item);
	       } 
	    
	    
	    
	    </script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>