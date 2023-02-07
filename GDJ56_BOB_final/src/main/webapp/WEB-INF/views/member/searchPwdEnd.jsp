<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
    <section>
        <div class="container py-4" style="text-align:center;margin:0 auto;">
            <div class="row align-items-center justify-content-between" id="insert">
                <h2>비밀번호 재설정</h2>
            </div>
            <form name="searchIdPwd" action="${path}/member/updatePwd" method="post" onsubmit="return fn_changePwd();" style="text-align:center;display:flex;flex-direction:column;">    
                <small id="emailHelp" class="form-text text-muted" style="padding-top:0px;padding-left:0px;padding-right:0px;width:100%;">
                    비밀번호를 재설정해주세요.
                </small>
                <input type="hidden" name="memberId" id="memberId" value="${memberId}">
                <div class="form-group has-success" style="text-align:center;" >
                    <div>
	                    <label class="form-label" for="password">새 비밀번호</label>
	                    <input type="password" class="form-control" name="password" id="password">
                    </div>
                    <span class="check" id="checkPass"><small></small></span>
                    <small id="emailHelp" class="form-text text-muted" style="color:gray;padding:10px;">비밀번호는 영문자와 숫자를 각각 하나 이상 포함하여 8자리 이상 입력하세요.<br>특수문자는 포함하지 않습니다.</small>
                    <br><br><br>
                </div>
                <div class="form-group has-danger" style="text-align:center;">
                    <div>
	                    <label class="form-label" for="pwdCheck">새 비밀번호 확인</label>
	                    <input type="password" class="form-control" name="pwdCheck" id="pwdCheck"><br>
                    </div>
                    <span class="check" id="checkPwd"><small></small></span>
                </div>
                <div id="insert2">
                    <div class="d-grid">
                        <br>
                        <button class="customBtn btnStyle" type="submit" style="width:100px;height:40px;font-size:15px;">확인</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <style>
        section{
        	margin-top: 50px;
        }
        section *{
        	font-family: 'Gowun Dodum';
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
            background: royalblue;
            background: linear-gradient(0deg, royalblue 0%, royalblue 100%);
        }
        .btnStyle:hover {
            color: royalblue;
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
            background: royalblue;
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
        .container.py-4{
            margin: 0 auto;
            width : 600px;
            height: 480px;
        }
        #insert{
            display: flex;
            margin-top: 20px;
            margin-bottom: 30px;
            height: 30px;
            text-align:center;
        }
        #insert>h2{
        	width: fit-content;
            margin:0 auto;
        	font-size: 30px;
        }
        #insert2{
            display: flex;
            margin-top: 20px;
            margin-bottom: 20px;
            height: 80px;
            text-align:center;
        }
        .form-group>div{
        	display: flex;
        }
        .form-label{
        	width: 140px;
        	margin: 0px;
        	margin-left: 20px;
        	margin-right: 20px;
        	padding: 5px;
        }
        .form-group input{
        	width: 350px;
        }
        .has-success{
        	height: 100px;
        }
        #emailHelp{
            text-align: center;
            padding: 40px;
            margin-bottom: 20px;
            height: 45px;
        }
        .d-grid{
            margin: 0 auto;
        }
    </style>
    <script>
        $(()=>{
        	//유효한 비밀번호인가
        	$("#password").keyup(e=>{
				const password=$("#password").val().trim();
        		const pwdReg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    			if(password.match(pwdReg)==null){ //비밀번호가 양식대로 입력되지 않았으면
    				$("#checkPass>small").css("color","red").text("비밀번호 형식이 잘못됐습니다.");
    				$("#password").focus();
    			}else{
    				$("#checkPass>small").css("color","red").text("");
    			}
        	})
        	
        	//비밀번호 확인과 일치하는가
			$("#pwdCheck").keyup(e=>{
				const pw=$("#password").val();
				const pwck=$(e.target).val();
				if(pw==pwck){//비밀번호가 일치할 때
					if(pwck!=""){//비밀번호 재확인 칸이 비어있지 않으면
						$("span#checkPwd>small").css("color","green").text("비밀번호가 일치합니다.");                        		   
					}else{
						$("span#checkPwd>small").text(" ");
					}
				}else{//비밀번호가 불일치할 때
					if(pwck==""){//비밀번호 재확인 칸이 비어있으면
						$("span#checkPwd>small").text(" ");
					}else{
						$("span#checkPwd>small").css("color","red").text("비밀번호가 불일치합니다.");
					}
				}
			})
        })

		const fn_changePwd=()=>{
			//비밀번호 필수입력
			const password=$("#password").val().trim();
			//숫자,영문 1개 이상씩 사용하여 8자리 이상 입력조건
			const pwdReg=/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
			if(password.match(pwdReg)==null){ //비밀번호가 양식대로 입력되지 않았으면
				alert("비밀번호는 영문자와 숫자를 각각 하나 이상 포함하여 8자리 이상 입력하세요. 특수문자는 포함하지 않습니다.");
				$("#password").focus();
				return false;
			}
			if($("span#checkPwd>small").text().includes("불")){ //비밀번호가 불일치하면 
				alert("비밀번호 재확인에 비밀번호를 정확히 적어주세요.");
				$("#pwdCheck").focus(); //다시 입력
				return false;
			}
			if($("#pwdCheck").val().trim()==""){ //비밀번호 확인이 비어있다면
				alert("비밀번호 재확인에 비밀번호를 적어주세요.");
				$("#pwdCheck").focus();
				return false;
			}
		};
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>