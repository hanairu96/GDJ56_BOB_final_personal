<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="MainPage"/>
</jsp:include>
	<section>
		<div class="wrapper">
			<div id="check">
				<form action="${path}/member/enrollMember" onsubmit="return fn_agree();" method="post">
					<ul>
						<li>
							<input type="checkbox" name="joinMember" id="allcheck" value="selectAll">
							<label for="allcheck"><b>　모두 확인, 동의합니다.</b></label>
						</li>
						<li>
							<input type="checkbox" name="joinMember" id="join1" value='join1'>
							<label for="join1">　이용약관 동의(필수)</label><span class="join"><a class="agree" onclick="fn_agreeJoin1();">내용보기</a></span>
							<textarea readonly class="agreeJoin" id="agreeJoin1">제1조 (목적)
    오늘의 밥 이용약관(이하 ‘본 약관’이라 함)은 오늘의 밥이 제공하는 오늘의 밥(이하 ‘홈페이지’라 함)의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
    
제2조 (서비스 이용시간)
    ① 서비스는 24시간 제공됩니다. 단, 부득이한 사유에 의해 서비스의 제공이 곤란한 사태가 발생한 경우는 예외로 합니다.
    ② 서비스 제공일 및 시간대의 변경은 시행 전에 홈페이지를 통하여 이용자에게 공지합니다. 다만, 피치못할 사정이 있는 경우 사전공고는 생략될 수 있습니다.
							</textarea>
						</li>
						<li>
							<input type="checkbox" name="joinMember" id="join2" value='join2'>
							<label for="join2">　개인정보 수집 및 이용 동의(필수)</label><span class="join"><a class="agree" onclick="fn_agreeJoin2();">내용보기</a></span>
							<textarea readonly class="agreeJoin" id="agreeJoin2">&nbsp;&nbsp;&nbsp; 개인정보의 처리목적은은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 「개인정보 보호법」제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
    - 회원 가입 및 관리
    회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지, 각종 고지·통지, 고충처리 목적으로 개인정보를 처리합니다. 
							</textarea>
						</li>
					</ul>
					<div id="button">
						<button type="submit" class="agree customBtn btnStyle">동의하고 가입하기</button>
					</div>
				</form>
			</div>
		</div>
	</section>
	<style>
		.wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 350px;
    		margin-top: 50px;
    		font-family: 'Gowun Dodum';
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
            width: 130px;
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
        #button{
            display: block;
        }
        #button>button{
            width: 150px;
        }
        /* 동의버튼 */
        button.agree{
            text-align:center;
            display:block;
            margin: 0 auto;
        }
        #check li{
            list-style-type: none;
            border-bottom: 2px solid lightgray;
            margin-bottom: 30px;
            width: 400px;
            font-size: large;
        }
        /* 내용보기 글자위치 */
        span.join{
            float: right;
        }
        .join>.agree{
            color: lightgray;
            font-size: 13px;
            cursor:pointer;
        }
        textarea.agreeJoin{
            display:none;
            width: 390px;
            height: 96px; 
            margin: 0 2%;
            background-color: #f7f7f7;
            color: #888; 
            border: none; 
            text-align: -webkit-match-parent;
            font-size: 15px;
        }
	</style>
	<script>
		const fn_agreeJoin1=()=>{
			$("#agreeJoin1").toggle();
		};
		const fn_agreeJoin2=()=>{
			$("#agreeJoin2").toggle();
		};
		
		$(document).ready(function() {//페이지 로드가 끝나면 실행하는 함수
			$("#allcheck").click(function() {//전체선택을 클릭했을 때
				if($("#allcheck").is(":checked")) {
					$("input[name=joinMember]").prop("checked", true);//전부 체크
				}else {
					$("input[name=joinMember]").prop("checked", false);//전부체크해제
				}
			});
			
			$("input[name=joinMember]").click(function() {
				var total = $("input[name=joinMember]").length;//모든 체크박스의 개수
				var checked = $("input[name=joinMember]:checked").length;//체크되어있는 것의 개수
				
				if(total != checked) $("#allcheck").prop("checked", false);//개수가 다르면 전체선택 체크 해제
				else $("#allcheck").prop("checked", true); 
			});
			
		});
		
		//필수 체크 로직
		const fn_agree=()=>{
			if($("#join1").is(":checked")==false){//필수 동의에 체크하지 않으면
				console.log($("#join1").is(":checked"))
				alert("필수 이용약관에 \n동의해주세요.");
				return false;
			}
			if($("#join2").is(":checked")==false){//개인정보 수집 및 이용동의에 체크하지 않으면
				console.log($("#join2").is(":checked"))
				alert("필수 개인정보 수집 \n및 이용에 동의해주세요.");
				return false;
			}
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>