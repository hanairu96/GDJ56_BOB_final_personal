<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
    <section>
        <div class="container py-4">
            <div class="row align-items-center justify-content-between" id="insert">
                <h2 class="text-dark h4" onclick="fn_searchId();" id="searchIdtext" style="font-weight: bold;">아이디 찾기</h2>
                <h2 class="text-dark h4" onclick="fn_searchPwd();" id="searchPwdtext">비밀번호 찾기</h2>
            </div>
            <form name="searchIdPwd" action="${path}/member/searchIdPwdEnd" 
                method="post" onsubmit="return fn_searchIdPwd();">
                <input type="hidden" name="choice" id="choice" value="id">
                <small id="emailHelp" class="form-text text-muted">
                    가입 당시 입력한 <b>이메일을 인증</b>해야 이용할 수 있습니다.
                </small>
                <div id="searchIdContainer" class="form-group"  style="display: none;">
                    <label for="exampleInputId" class="form-label mt-4">아이디</label>
                    <input type="text" name="searchId" id="exampleInputId" >
                </div>
                <div class="form-group">
                    <label for="exampleInputName" class="form-label mt-4">이름</label>
                    <input type="text" name="searchName" id="exampleInputName" required>
                </div>
                <span class="check" id="checkEmail"><small></small></span>
                <div class="form-group" style="display:flex; align-items:center;">
                    <label for="exampleInputEmail" class="form-label mt-4">이메일</label>
                    <input type="email" name="searchEmail" id="exampleInputEmail" required>
                    <!-- 이메일인증 -->
                    <button id="searchAddr" name="emailconfirm_btn" onclick="emailcheck();">인증</button><br>
                </div>
                <div class="bir_yy address crtfcNo" id="bir_yy" style="display: none;">
                    <span class="check" id="checkCrtfcNo"><small></small></span>
                    <input type="text" class="form-control" name="inputEmail" id="crtfcNoCheck" placeholder="인증번호 입력">
                    <div class="bir_yy address crtfcNo" style="display:none;">
                        <input id="crtfcButton" name="emailconfirm_btn" type="button" value="확인"
                        onclick="crtNoCheck();" style="float:right;">
                    </div>
                </div>
                <div id="insert">
                    <div class="d-grid">
                        <button id="searchIdPwd" class="customBtn btnStyle" type="submit">다음</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <style>
        section{
            margin-top: 50px;
        }
        section>div{
            border: 1px solid lightgray;
            border-radius: 10px;
        }

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
            min-width: 80px;
            font-family: "Hahmlet";
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
        
        /* 입력창 */
        .container.py-4{
            margin: 0 auto;
            width : 503px;
        }
        /* 탭 및 버튼 정렬 */
        #insert{
            display: flex;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        /* 탭 이름 정렬 */
        .text-dark{
            text-align:center;
            display:block;
            margin: 0 auto;
        }
        .text-dark:hover{
            cursor: pointer;
		}
		#emailHelp{
			text-align: center;
		}
		.form-label{
			margin-left: 30px;
			width: 100px;
			text-align: center;
		}
		.container.py-4 input{
			width: 200px;
		}
		#exampleInputEmail{
			margin-left: 3px;
			margin-right: 10px;
		}
		#searchAddr{
			border: 1px solid gray;
			border-radius: 5px;
			width: 60px;
		}
		#exampleInputEmail, #searchAddr{
			margin-top: 15px;
		}
        /* 버튼 중앙 정렬 */
        .d-grid{
            margin: 0 auto;
            margin-top: 20px;
        }
    </style>
    <script>
		const fn_searchId=()=>{
			$("#searchIdContainer").hide();
			
			$("#searchIdtext").css("font-weight","bold");
			$("#searchPwdtext").css("font-weight","normal");
			
	        document.getElementById("choice").value="id";
		}
		const fn_searchPwd=()=>{
			$("#searchIdContainer").show();
			
			$("#searchPwdtext").css("font-weight","bold");
			$("#searchIdtext").css("font-weight","normal");

	        document.getElementById("choice").value="pwd";
		}
		
		const fn_searchIdPwd=()=>{
			//인증 및 검사
			return true;
		}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>