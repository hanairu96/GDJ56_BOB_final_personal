<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
	<section>
        <div class="container">
            <div class="row align-items-center justify-content-between"> 
                <span class="text-dark h4">회원정보 입력</span>                 
            </div>
            <form name="enrollMemberFrm" action="${path}/logIn/enrollMemberEnd.do" 
                method="post" onsubmit="return fn_enrollFail();">
                <input type="hidden" name="emailAgree" id="emailAgree" value=""/>
                <div class="form-group">
                    <label for="inputId" class="form-label mt-4">아이디<span class="obli">(필수)</span></label>
                    <input id="idCheck" type="button" value="중복확인" onclick="idCheck();">
                    <span class="check" id="checkId"><small></small></span>
                    <input type="text" class="form-control" name="inputId" id="inputId" 
                        aria-describedby="emailHelp" placeholder="아이디를 입력해주세요" required maxlength="8">
                    <small class="form-text text-muted">아이디는 5자리 이상 입력하세요</small>
                </div>
                <div class="form-group has-success">
                    <label class="form-label mt-4" for="inputPwd">비밀번호<span class="obli">(필수)</span></label>
                    <input type="password" class="form-control" name="inputPwd" id="inputPwd" placeholder="비밀번호를 입력해주세요" required>
                    <small id="emailHelp" class="form-text text-muted">비밀번호는 숫자, 영문자를 포함하여 8자리 이상 입력하세요</small>
                </div>
                <div class="form-group has-danger">
                    <label class="form-label mt-4" for="pwdCheck">비밀번호 재확인</label> 
                    <input type="password" class="form-control" name="pwdCheck" id="pwdCheck"
                        placeholder="비밀번호를 다시한번 입력해주세요">
                    <span class="check" id="checkPwd"><small></small></span>
                </div>
                <div class="form-group">
                    <label for="inputName" class="form-label mt-4">이름<span class="obli">(필수)</span></label>
                    <span class="check" id="checkName"><small></small></span>
                    <input type="text" class="form-control" name="inputName" id="inputName"
                        placeholder="이름을 입력해주세요" required>
                </div>
                <div class="form-group">
                    <label for="inputNickname" class="form-label mt-4">닉네임<span class="obli">(필수)</span></label>
                    <span class="check" id="checkNickname"><small></small></span>
                    <input type="text" class="form-control" name="inputNickname" id="inputNickname"
                        placeholder="닉네임을 입력해주세요" required>
                </div>
                <div class ="bir_wrap">
                    <label class="form-label mt-4">생년월일<span class="obli">(필수)</span></label>
                    <span class="check" id="checkYear"><small></small></span>
                    <div class="bir_yy">
                        <span class="ps_box">
                            <input type="text" class="form-control" name="yy" id="yy" 
                            placeholder="년(4자)" maxlength="4" required>
                        </span>
                    </div>
                    <div class="bir_mm">
                        <span class="ps_box focus">
                            <select name="month" name="month" id="month" class="custom-select">
                                <option value="01">1
                                </option>
                                <option value="02">2
                                </option>
                                <option value="03">3
                                </option>
                                <option value="04">4
                                </option>
                                <option value="05">5
                                </option>
                                <option value="06">6
                                </option>
                                <option value="07">7
                                </option>
                                <option value="08">8
                                </option>
                                <option value="09">9
                                </option>
                                <option value="10">10
                                </option>
                                <option value="11">11
                                </option>
                                <option value="12">12
                                </option>
                            </select>
                        </span>
                    </div>
                    <div class="bir_dd">
                        <select name="day" name="day" id="day" class="custom-select">
                            <option value="01" selected="selected">1
                            </option>
                            <option value="02">2
                            </option>
                            <option value="03">3
                            </option>
                            <option value="04">4
                            </option>
                            <option value="05">5
                            </option>
                            <option value="06">6
                            </option>
                            <option value="07">7
                            </option>
                            <option value="08">8
                            </option>
                            <option value="09">9
                            </option>
                            <option value="10">10
                            </option>
                            <option value="11">11
                            </option>
                            <option value="12">12
                            </option>
                            <option value="13">13
                            </option>
                            <option value="14">14
                            </option>
                            <option value="15">15
                            </option>
                            <option value="16">16
                            </option>
                            <option value="17">17
                            </option>
                            <option value="18">18
                            </option>
                            <option value="19">19
                            </option>
                            <option value="20">20
                            </option>
                            <option value="21">21
                            </option>
                            <option value="22">22
                            </option>
                            <option value="23">23
                            </option>
                            <option value="24">24
                            </option>
                            <option value="25">25
                            </option>
                            <option value="26">26
                            </option>
                            <option value="27">27
                            </option>
                            <option value="28">28
                            </option>
                            <option value="29">29
                            </option>
                            <option value="30">30
                            </option>
                            <option value="31">31
                            </option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhone" class="form-label mt-4">핸드폰번호('-'없이 입력해주세요)<span class="obli">(필수)</span></label>
                    <span class="check" id="checkPhone"><small></small></span>
                    <input type="text" class="form-control" name="inputPhone" id="inputPhone" >
                </div>
                <div class="form-group">
                    <label class="form-label mt-4">성별<span class="obli">(필수)</span></label>
                </div>  
                <div class="btn-group " data-toggle="buttons">
                    <label for="gender1" class="btn btn-outline-secondary">
                        <input type="radio" class="radio " name="gender" id="gender1" value="M" checked> 남
                    </label>
                    <label for="gender2" class="btn btn-outline-secondary">
                        <input type="radio" class="radio" name="gender" id="gender2" value="F"> 여
                    </label>
                </div>      
                <div class="form-group">
                    <label for="inputEmail" class="form-label mt-4">이메일<span class="obli">(필수)</span></label>
                    <span class="check" id="checkEmail"><small></small></span>
                    <div class="email_ee address">
                        <input type="email" class="form-control" name="inputEmail" id="inputEmail"
                            placeholder="이메일을 입력해주세요" required>
                    </div>
                    <div class="bir_yy address">
                        <input id="searchAddr" name="emailconfirm_btn" type="button" value="인증"
                            onclick="emailcheck();">
                    </div>
                    <span class="check" id="checkCrtfcNo"style="display:none;"><small></small></span>
                    <div class="bir_yy address crtfcNo" style="display:none;" >
                        <input type="text" class="form-control" name="inputEmail" id="crtfcNoCheck"
                            placeholder="인증번호 입력">
                    </div>
                    <div class="bir_yy address crtfcNo" style="display:none;">
                        <input id="crtfcButton" name="emailconfirm_btn" type="button" value="확인" style="margin-left:10px;height:35px;"
                            onclick="crtNoCheck();">
                    </div>
                </div>
                <div class ="adddressContainer">
                    <label class="form-label mt-4">주소<span class="obli">(필수)</span></label>
                    <div class="bir_yy address">
                        <input type="text" class="form-control inputAddr"
                            name="inputAddress_postcode" id="inputAddress_postcode" placeholder="우편번호" readonly>
                    </div>
                    <div class="bir_yy address">
                        <input id="searchAddr" type="button" value="주소 검색" onclick="sample6_execDaumPostcode()">
                    </div>
                </div>
                <div class ="adddressContainer">
                    <div class="bir_yy address">
                        <input type="text" class="form-control inputAddr"
                            name="inputAddress_address" id="inputAddress_address" placeholder="주소" readonly>
                    </div>
                    <div class="bir_yy address">
                        <input type="text" class="form-control inputAddr" 
                            name="inputAddress_detailAddress"id="inputAddress_detailAddress" placeholder="상세주소">
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label mt-4">음식 취향<span class="obli">(선택)</span></label>
                </div>  
                <div class="btn-group like-food" data-toggle="buttons">
                    <label for="member-like1" class="btn btn-outline-secondary">
                        <input type="checkbox" name="member_like" value="vegetable" checked> 채소
                    </label>
                    <label for="member-like2" class="btn btn-outline-secondary">
                        <input type="checkbox" name="member_like" value="fruit">과일
                    </label>
                    <label for="member-like3" class="btn btn-outline-secondary">
                        <input type="checkbox" name="member_like" value="sea"> 수산물
                    </label>
                    <label for="member-like4" class="btn btn-outline-secondary">
                        <input type="checkbox" name="member_like" value="meat"> 육류
                    </label>
                    <label for="member-like5" class="btn btn-outline-secondary">
                        <input type="checkbox" name="member_like" value="side"> 반찬
                    </label>
                </div><br>
                <p>추천 상품 목록이 나올 때 반영됩니다.</p>
                <div id="insert">
                    <div class="d-grid">
                        <button class="customBtn btnStyle" type="submit">
                            가입하기
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <br>
    </section>
    <style>
        #searchAddr, #crtfcNoCheck{
            height: 36px;
            margin-left: 5px;
        }
        .adddressContainer{
            margin: 5px;
        }
        .address{
            margin-right: 5px;
        }
        .inputAddr{
            margin-right: 5px;
        }
        #inputAddress_address{
            width: 300px;
        }
        /* 버튼 스타일 */
        .customBtn {
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
            min-width: 90px;
            margin: 20px;
        }
        .btnStyle {
            line-height: 40px;
            padding: 0;
            border: none;
            background: #7e8cd2;
            background: linear-gradient(0deg, #7e8cd2 0%, #7e8cd2 100%);
        }
        .btnStyle:hover {
            color: #7e8cd2;
            background: transparent;
            box-shadow:none;
        }
        .btnStyle:before,.btnStyle:after{
            content:'';
            position:absolute;
            top:0;
            right:0;
            height:2px;
            width:0;
            background: #7e8cd2;
            box-shadow:
            -1px -1px 5px 0px #fff,
            7px 7px 20px 0px #0003,
            4px 4px 5px 0px #0002;
            transition:400ms ease all;
        }
        .btnStyle:after{
            right:inherit;
            top:inherit;
            left:0;
            bottom:0;
        }
        .btnStyle:hover:before,.btnStyle:hover:after{
            width:100%;
            transition:800ms ease all;
        }
        /* 중복확인 버튼 */
        #idCheck{
            font-size: small;
        }
        /* 가입하기 버튼 */
        #insert{
            display: flex;
        }
        .d-grid{
            margin: 0 auto;
        }
        /* 생년월일 */
        .bir_yy,.bir_mm,.bir_dd{
            width:160px;
            display:table-cell;
        }
        .email_ee{
            width:340px;
            display:table-cell;
        }
        .bir_mm+.bir_dd, .bir_yy+.bir_mm{
            padding-left:10px;
        }
        .text-dark{
            text-align:center;
            display:block;
            margin: 0 auto;
        }
        /* (필수) */
        span.obli{
            color: rgba(103, 103, 194, 0.685);
            font-size: small;
        }
        /* 입력창 */
        .container{
            margin: 0 auto;
            width : 503px;
            border: 1px solid lightgray;
            border-radius: 10px;
            margin-top: 50px;
            padding-top: 20px;
        }
    </style>
    <script>
    	const idCheck=()=>{
    		$("#inputId")
    	}
    	////
		
		//아이디 중복확인
		$("input#inputId").keyup(e=>{
       		$.ajax({
       			url:"<%=request.getContextPath()%>/logIn/idDuplicateCheck.do",
       			data:{inputId:$("input#inputId").val().trim()},
       			dataType:"json",
       			success:data=>{
       				if(data!=null){
       					$("span#checkId>small").text("사용 불가한 아이디입니다.").css("color","red");
       				}else if($("#inputId").val()==""){
       					$("span#checkId>small").text("아이디를 입력해주세요.").css("color","red");
       				}else if($("#inputId").val().length<5){
       					$("span#checkId>small").text("아이디는 5자리 이상 입력해주세요.").css("color","red");
       				}else{
       					$("span#checkId>small").text("사용 가능한 아이디입니다.").css("color","green");
       				}
       			}
       		})
		});
        
		//비밀번호 재확인
		$(()=>{
			$("#pwdCheck").keyup(e=>{
				const pw=$("#inputPwd").val();
				const pwck=$(e.target).val();
				if(pw==pwck){//비밀번호가 일치할 때
					if(pwck!=""){//비밀번호재입력 칸이 비어있지 않으면
						$("span#checkPwd>small").css("color","green").text("비밀번호가 일치합니다.");                        		   
					}else{
						$("span#checkPwd>small").text(" ");
					}
				}else{//비밀번호가 불일치할 때
					if(pwck==""){//비밀번호입력칸이 비어있으면
						$("span#checkPwd>small").text(" ");
					}
					$("span#checkPwd>small").css("color","red").text("비밀번호가 불일치합니다.");
				}
			});
		})
             
		//정규식 확인
		var crtfcNoData="";//변수에 인증번호를 저장하기 위함
		//인증번호전송 눌렀을 때
		const emailcheck=()=>{
			$("span#checkEmail>small").text("");
			const inputEmail=$("#inputEmail").val().trim();
			var emailReg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(inputEmail==""){
				$("span#checkEmail>small").text("이메일을 입력해주세요.").css("color","red");
				$("#inputEmail").focus();
				return false;
			}
			if(!emailReg.test(inputEmail)){
				$("span#checkEmail>small").text("올바른 이메일을 입력해주세요.").css("color","red");
				$("#inputEmail").focus();
				return false;
			}
			$("span#checkCrtfcNo>small").text("인증번호를 발송했습니다. 인증번호를 입력해주세요.").css("color","#7e8cd2");
			$("span#checkCrtfcNo").show();
			$("div.crtfcNo").show();
			//인증번호 확인하기 위한 ajax
			$.ajax({
				url:"<%=request.getContextPath()%>/gmailCheck.do",
				data:{"email":inputEmail},//입력받은 이메일 넘기기
				success:data=>{//ajax로 돌려받은 인증번호
					// 인증번호 값이 없을 경우
					if(data==null){
						Swal.fire("인증에 실패하였습니다. \n다시 시도해주세요");
						$("span#checkCrtfcNo>small").text(" ");//인증번호 발신메세지 지우기
						return false;
					// ajax가 돌아가서 제대로 값이 돌아온 경우
					}else{
						crtfcNoData=data;//인증번호를 변수에 저장
					}
				}
			})
		}

		//인증번호 입력 후 확인버튼 눌렀을 때
		const crtNoCheck=()=>{
			//console.log("인증번호 : "+crtfcNoData);
			//인증번호 칸에 아무것도 입력하지 않았을 경우
			if($("#crtfcNoCheck").val().trim()==""){
				$("span#checkCrtfcNo>small").text("인증번호를 입력해주세요.").css("color","red");
				$("span#checkEmail>small").text("");
				console.log("인증번호 칸 비어있음");
			//인증번호가 틀렸을 경우
			}else if(crtfcNoData!=$("#crtfcNoCheck").val().trim()||$("#crtfcNoCheck").val().trim()==""){
				$("span#checkCrtfcNo>small").text("인증에 실패하였습니다. 다시 시도해주세요.").css("color","red");//인증번호 실패메세지
				$("span#checkEmail>small").text("");
				console.log("인증코드 틀림");
				return false;
			//올바른 인증번호 입력
			}else if(crtfcNoData == $("#crtfcNoCheck").val().trim()){
				//이메일 중복확인
				$.ajax({
					url:"<%=request.getContextPath()%>/logIn/emailDuplicateCheck.do",
					data:{inputEmail:$("input#inputEmail").val().trim()},
					dataType:"json",
					success:data=>{
						console.log(data);
						if(data!=null){
							$("span#checkEmail>small").text("이미 가입된 이메일 입니다.").css("color","red");
							$("span#checkCrtfcNo>small").text("인증에 성공하였습니다.").css("color","green");
						}else{
							$("span#checkEmail>small").text("사용 가능한 이메일입니다.").css("color","green");
							$("span#checkCrtfcNo>small").text("인증에 성공하였습니다.").css("color","green");
						}
					}
				})
			}
		}

		const fn_enrollFail=()=>{
			//아이디 5자리 이상 필수입력
			const inputId=$("#inputId").val().trim();
			if(!($("span#checkId>small").text().includes("가능한"))){//아이디 사용 가능하다는 말이 없으면
				$("#inputId").focus();
				return false;
			}
			//비밀번호 필수입력
			const inputPwd=$("#inputPwd").val().trim();
			//숫자,영문 1개 이상씩 사용하여 8자리 이상 입력조건
			const pwdReg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			if(inputPwd.match(pwdReg)==null){//비밀번호가 양식대로 입력되지 않았으면(==실패)
				Swal.fire("비밀번호는 숫자, 영문자를 \n포함하여 8자리 이상 입력하세요");
				$("#inputPwd").focus();
				return false;
			}
			if($("span#checkPwd>small").text().includes("불")){//비밀번호가 불일치하면 
				$("#pwdCheck").focus();//다시 입력
				return false;
			}
			if($("#pwdCheck").val().trim()==""){
				$("#pwdCheck").focus();
				return false;
			}
			//이름 정규식 표현
			const inputName=$("#inputName").val().trim();
			const nameReg=/^[가-힣]{2,5}$/;//한글이름2~5자
			if(!nameReg.test(inputName)){//이름이 틀렸으면
				$("span#checkName>small").text("올바른 이름을 입력해주세요.").css("color","red");
				$("#inputName").focus();
				return false;
			}else{
				$("span#checkName>small").text(" ");
			}
			//년도 입력
			const yy=$("#yy").val().trim();
			const pattern=/^(19|20)\d{2}$/;//1900~2099년도까지
			if(!pattern.test(yy)){//연도입력이 잘못 되었으면
				$("span#checkYear>small").text("올바른 연도를 입력해주세요.").css("color","red");
				$("#yy").focus();
				return false;
			}else{
				$("span#checkYear>small").text(" ");
			}
			//핸드폰 번호 입력
			const inputPhone=$("#inputPhone").val().trim();
			const phoneReg=/^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;//핸드폰 번호(- 없음)
			if(inputPhone==""||phoneReg.test(inputPhone)){
				$("span#checkPhone>small").text(" ");
			}else{
				$("span#checkPhone>small").text("올바른 번호를 입력해주세요.").css("color","red");
				$("#inputPhone").focus();		
				return false;
			}
			//이메일 입력
			const inputEmail=$("#inputEmail").val().trim();
			var emailReg=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(inputEmail==""){
				$("span#checkEmail>small").text("이메일을 입력해주세요.").css("color","red");
				$("#inputEmail").focus();
				return false;
			}else{
				if(!emailReg.test(inputEmail)){
					$("span#checkEmail>small").text("올바른 이메일을 입력해주세요.").css("color","red");
					$("#inputEmail").focus();
					return false;
				}
			}
			//가입가능한 이메일
			if(!($("span#checkEmail>small").text().includes("가능"))){//가능한 이메일이라는 말이 없으면 빠꾸
				$("#inputEmail").focus();
				return false;
			}
		}
	</script>

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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>