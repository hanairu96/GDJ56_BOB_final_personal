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
                <span class="check" id="checkId"><small></small></span>
                <div id="searchIdContainer" class="form-group"  style="display: none;">
                    <label for="exampleInputId" class="form-label">아이디</label>
                    <input type="text" name="searchId" id="exampleInputId" >
                </div>
                <span class="check" id="checkName"><small></small></span>
                <div class="form-group">
                    <label for="exampleInputName" class="form-label">이름</label>
                    <input type="text" name="searchName" id="exampleInputName" required>
                </div>
                <span id="dummySpan" style="margin-left: 82px;"></span> <!-- 아이디 찾기 클릭 시 이 부분이 있어야 위치가 제대로 나옴 -->
                <span class="check" id="checkEmail"><small></small></span>
                <div class="form-group" style="display:flex; align-items:center;">
                    <label for="exampleInputEmail" class="form-label">이메일</label>
                    <input type="email" name="searchEmail" id="exampleInputEmail" required>
                    <!-- 이메일인증 -->
                    <button id="searchAddr" type="button" name="emailconfirm_btn" onclick="emailcheck();">인증</button><br>
                </div>
                <span class="check" id="checkCrtfcNo"><small></small></span>
                <div class="crtfcNo" id="crtfcNo" style="display: none;align-items:center;">
                    <label for="exampleInputEmail" class="form-label mt-4"></label>
                    <input type="text" class="form-control" name="inputEmail" id="crtfcNoCheck" placeholder="인증번호 입력">
                    <button id="crtfcButton" type="button" name="emailconfirm_btn" onclick="crtNoCheck();">확인</button>
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
            font-family: 'Gowun Dodum';
        }
        .text-dark:hover{
            cursor: pointer;
		}
		#emailHelp{
			text-align: center;
		}
		.form-label{
			margin-top: 0px;
			margin-left: 30px;
			width: 100px;
			text-align: center;
		}
		.container.py-4 input{
			width: 200px;
		}
		#exampleInputEmail, #crtfcNoCheck{
			margin-left: 3px;
			margin-right: 10px;
		}
		#searchAddr, #crtfcButton{
			border: 1px solid gray;
			border-radius: 5px;
			width: 60px;
		}
        /* 버튼 중앙 정렬 */
        .d-grid{
            margin: 0 auto;
            margin-top: 20px;
        }
        .check{
        	margin-left: 82px;
        }
    </style>
    <script>
		//제대로 입력했는지 확인용 변수
		let idOk=true;
		let nameOk=false;
		let emailOk=false;
    
		const fn_searchId=()=>{
			document.getElementById("exampleInputId").value="";
			document.getElementById("exampleInputName").value="";
			document.getElementById("exampleInputEmail").value="";
			$(".check>small").empty();
						
			$("#checkId *").hide();
			$("#searchIdContainer").hide();
			
			$("#searchIdtext").css("font-weight","bold");
			$("#searchPwdtext").css("font-weight","normal");
			
	        document.getElementById("choice").value="id";

	        //잘못된 입력 시 메시지 위치
	        $(".check").attr("style", "margin-left: 82px;")
	        $("#dummySpan").attr("style", "margin-left: 82px;")
	        
	        idOk=true;
		}
		const fn_searchPwd=()=>{
			document.getElementById("exampleInputId").value="";
			document.getElementById("exampleInputName").value="";
			document.getElementById("exampleInputEmail").value="";
			$(".check>small").empty();
			
			$("#checkId *").show();
			$("#searchIdContainer").show();
			
			$("#searchPwdtext").css("font-weight","bold");
			$("#searchIdtext").css("font-weight","normal");

	        document.getElementById("choice").value="pwd";

	        //잘못된 입력 시 메시지 위치
	        $(".check").attr("style", "margin-left: 165px;")
	        $("#dummySpan").attr("style", "margin-left: 0px;")
	        
	        idOk=false;
		}
		
		//입력했을 때 나옴
		$(()=>{
			//아이디 형식 검증
			$("#exampleInputId").keyup(e=>{
				let inputId=e.target.value;
				const idReg=/^[A-Za-z0-9]{5,12}$/;
				if(inputId==""){ //입력을 안 했으면
					$("span#checkId>small").text("아이디를 입력해주세요.").css("color","red");					
					idOk=false;
				}else if(!idReg.test(inputId)){ //아이디가 잘못됐으면
					$("span#checkId>small").text("올바른 아이디를 입력해주세요.").css("color","red");
					idOk=false;
				}else{
					$("span#checkId>small").text("");
					idOk=true;
				}				
			});
			//이름 형식 검증
			$("#exampleInputName").keyup(e=>{
				let inputName=e.target.value;
				const nameReg=/^[가-힣a-zA-Z][가-힣a-zA-Z]+$/;
				if(inputName==""){ //입력을 안 했으면
					$("span#checkName>small").text("이름을 입력해주세요.").css("color","red");
					nameOk=false;
				}else if(!nameReg.test(inputName)){ //이름이 잘못됐으면
					$("span#checkName>small").text("올바른 이름을 입력해주세요.").css("color","red");
					nameOk=false;
				}else{
					$("span#checkName>small").text("");
					nameOk=true;
				}
			});
			//이메일 형식 검증
			$("#exampleInputEmail").keyup(e=>{
				let inputEmail=e.target.value;
				const emailReg=/^[0-9a-zA-Z_]+@[a-zA-Z]+.[a-zA-Z]{2,3}$/i;
				if(inputEmail==""){ //입력을 안 했으면
					$("span#checkEmail>small").text("이메일을 입력해주세요.").css("color","red");
					emailOk=false;
				}else if(!emailReg.test(inputEmail)){ //이메일이 잘못됐으면
					$("span#checkEmail>small").text("올바른 이메일을 입력해주세요.").css("color","red");
					emailOk=false;
				}else{
					$("span#checkEmail>small").text("");
					emailOk=true;
				}
			});
		});
			
		//인증 버튼 눌렀을 때
		const emailcheck=()=>{
			//비밀번호 찾기일 때 아이디 입력했는지, 이름과 이메일 입력했는지 확인
			console.log(idOk);
			console.log(nameOk);
			console.log(emailOk);
			
			if(!idOk||!nameOk||!emailOk){
					alert("모든 칸을 제대로 입력했는지 확인해주세요!");
			}else{
				//등록된 이메일인지, 이메일과 입력한 아이디, 이름과 일치하는지 ajax로 확인
				let searchs=[$("input[name=choice]").val(), $("input[name=searchId]").val(), $("input[name=searchName]").val(), $("input[name=searchEmail]").val()];
				console.log(searchs);
				$.ajax({
					url:"${path}/member/emailExist",
					type:"post",
					//dataType:"json",
					data:{inputs:searchs},
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					success:data=>{
						if(data=="성공"){
							//맞다면 이메일 인증 번호 보내기
							sendEmail();
							//인증번호 입력 창 나옴
							$(".crtfcNo").attr("style", "display:flex;");
						}else{
							alert(data);
						}
					}
				});
			}
		};
		
		//인증번호 초기화
		let crtfcNoData="";
		const sendEmail=()=>{
			let email=$("input[name=searchEmail]").val().trim();
			$.ajax({
				type:"GET",
				url:"${path}/member/emailCheck?email="+email,
				success: function(data){
					if(data==null){
						alert("인증번호 전송에 실패하였습니다.");
						return false;
					}else{
						//인증번호를 변수에 저장
						crtfcNoData=data;
						$("span#checkCrtfcNo>small").text("인증번호를 발송했습니다. 인증번호를 입력해주세요.").css("color","#7e8cd2");
						$("span#checkCrtfcNo").show();
						$("div.crtfcNo").show();
						console.log(crtfcNoData);
					}
				}
			});
		}
		
		//이메일 인증 성공 여부
		let emailSuccess=false;
		//인증 확인 버튼 눌렀을 때
		const crtNoCheck=()=>{
			//인증번호 칸에 아무것도 입력하지 않았을 경우
			if($("#crtfcNoCheck").val().trim()==""){
				$("span#checkCrtfcNo>small").text("인증번호를 입력해주세요.").css("color","red");
				$("span#checkEmail>small").text("");
				console.log("인증번호 칸 비어있음");
			//인증번호가 틀렸을 경우
			}else if(crtfcNoData!=$("#crtfcNoCheck").val().trim()||$("#crtfcNoCheck").val().trim()==""){
				$("span#checkCrtfcNo>small").text("인증에 실패하였습니다. 다시 시도해주세요.").css("color","red");
				$("span#checkEmail>small").text("");
				console.log("인증코드 틀림");
				return false;
			//올바른 인증번호 입력
			}else if(crtfcNoData == $("#crtfcNoCheck").val().trim()){
				$("span#checkCrtfcNo>small").text("인증에 성공하였습니다.").css("color","green");
				emailSuccess=true;
				console.log(emailSuccess);
			}
		}
			
		//다음 버튼 눌렀을 때
		const fn_searchIdPwd=()=>{
			//이메일 인증 확인이 돼야 다음 버튼 누를 수 있음
			console.log(emailSuccess);
			if(!emailSuccess){
				return false;
			}
		}
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>