<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
        <div class="container">
            <div class="row align-items-center justify-content-between"> 
                <span class="text-dark h4">회원정보 입력</span>                 
            </div>
            <form name="enrollMemberFrm" action="${path}/logIn/enrollMemberEnd.do" 
                method="post" onsubmit="return fn_enrollFail();">
                <input type="hidden" name="emailAgree" id="emailAgree" value=""/>
                <div class="form-group">
                    <label for="inputId" class="form-label mt-4">아이디<span class="obli">(필수)</span></label>
                    <input id="idCheck" type="button" value="중복확인">
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
                    <label for="inputPhone" class="form-label mt-4">핸드폰번호('-'없이 입력해주세요)</label>
                    <span class="check" id="checkPhone"><small></small></span>
                    <input type="text" class="form-control" name="inputPhone" id="inputPhone" >
                </div>
                <div class="form-group">
                    <label class="form-label mt-4">성별</label>
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
                    <label class="form-label mt-4">주소</label>
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
                    <label class="form-label mt-4">음식 취향</label>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>