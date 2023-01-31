<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구독 신청</title>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
</head>
<body>
    <section>
        <h3>정기 구독 신청</h3>
        <img id="character" src="${path}/resources/images/subscription/milk.png" style="width: 100px;height: 100px;">
        <table id="kinds">
            <tr>
                <td>우유</td>
                <td>계란</td>
                <td>과일</td>
            </tr>
        </table>
        <div id="items">
            <input type="button" id="item1" name="item1" value="일반 우유">
            <input type="button" id="item2" name="item2" value="저지방 우유">
            <input type="button" id="item3" name="item3" value="무유당 우유">
        </div>
        <div id="price">
            <p>월별 구독료: 5000원</p>
        </div>
        <button id="pay" class="customBtn btnStyle" onclick="pay();">결제하기</button>
        
    </section>
    <style>
    	body{
    		/* 스크롤바 안 나오게 함 */
    		overflow: hidden;
    	} 
        section{
            width: 500px;
            height: 600px;
            margin: 0 auto;
            text-align: center;
            font-family: 'Gowun Dodum';
        }
        h3{
            margin-top: 30px;
        }
        table#kinds{
            margin: 0 auto;
        }
        table#kinds td{
            border: 0px solid black;
            border-radius: 10px;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 35px;
            padding-right: 35px;
            cursor: pointer;
            font-weight: bold;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
			7px 7px 20px 0px rgba(0,0,0,.1),
			4px 4px 5px 0px rgba(0,0,0,.1);
        }
        td:nth-child(1){
            background-color: mediumpurple;
            color: white;
        }
        td:nth-child(2){
            background-color:lavender;
            color: black;
        }
        td:nth-child(3){
            background-color:lavender;
            color: black;
        }
        #items{
            width: 300px;
            margin: 0 auto;
            margin-top: 10px;
        }
        #items>input{
            background-color:lavender;
            border: 0px solid black;
            width: 300px;
            border-radius: 10px;
            height: 50px;
            margin-top: 10px;
            cursor: pointer;
            font-family: 'Gowun Dodum';
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
			7px 7px 20px 0px rgba(0,0,0,.1),
			4px 4px 5px 0px rgba(0,0,0,.1);
        }
        #items>input:nth-child(1){
            background-color: mediumpurple;
            color: white;
        }
        #price{
            border: 2px solid black;
            border-radius: 10px;
            font-size: 20px;
            width: 300px;
            margin: 0 auto;
            margin-top: 20px;
        }

        #pay{
            margin-top: 20px;
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
    </style>
    <script>
        let choice="일반 우유"; //선택한 항목

        $("#kinds td:nth-child(1)").click(e=>{
            $("#character").attr("src","${path}/resources/images/subscription/milk.png");
            $("#kinds td:nth-child(1)").css("backgroundColor","mediumpurple").css("color","white");
            $("#kinds td:nth-child(2)").css("backgroundColor","lavender").css("color","black");
            $("#kinds td:nth-child(3)").css("backgroundColor","lavender").css("color","black");
            $("#items>input").css("backgroundColor","lavender").css("color","black");
            $("#items>input:nth-child(1)").css("backgroundColor","mediumpurple").css("color","white");
            choice="일반 우유";
            $("#items>input:nth-child(1)").val("일반 우유");
            $("#items>input:nth-child(2)").val("저지방 우유");
            $("#items>input:nth-child(3)").val("무유당 우유");
            $("#price>p").text("월별 구독료: 5000원");
        })
        $("#kinds td:nth-child(2)").click(e=>{
            $("#character").attr("src","${path}/resources/images/subscription/egg.png");
            $("#kinds td:nth-child(1)").css("backgroundColor","lavender").css("color","black");
            $("#kinds td:nth-child(2)").css("backgroundColor","mediumpurple").css("color","white");
            $("#kinds td:nth-child(3)").css("backgroundColor","lavender").css("color","black");
            $("#items>input").css("backgroundColor","lavender").css("color","black");
            $("#items>input:nth-child(1)").css("backgroundColor","mediumpurple").css("color","white");
            choice="특란";
            $("#items>input:nth-child(1)").val("특란");
            $("#items>input:nth-child(2)").val("유정란");
            $("#items>input:nth-child(3)").val("흰색 계란");
            $("#price>p").text("월별 구독료: 15000원");
        })
        $("#kinds td:nth-child(3)").click(e=>{
            $("#character").attr("src","${path}/resources/images/subscription/apple.png");
            $("#kinds td:nth-child(1)").css("backgroundColor","lavender").css("color","black");
            $("#kinds td:nth-child(2)").css("backgroundColor","lavender").css("color","black");
            $("#kinds td:nth-child(3)").css("backgroundColor","mediumpurple").css("color","white");
            $("#items>input").css("backgroundColor","lavender").css("color","black");
            $("#items>input:nth-child(1)").css("backgroundColor","mediumpurple").css("color","white");
            choice="사과";
            $("#items>input:nth-child(1)").val("사과");
            $("#items>input:nth-child(2)").val("포도");
            $("#items>input:nth-child(3)").val("바나나");
            $("#price>p").text("월별 구독료: 12000원");
        })

        $("#items>input").click(e=>{
            $("#items>input").css("backgroundColor","lavender").css("color","black");
            e.target.style.backgroundColor="mediumpurple";
            e.target.style.color="white";
            choice=e.target.value;
            if(e.target.value=="사과"){
                $("#character").attr("src","${path}/resources/images/subscription/apple.png");
            }else if(e.target.value=="포도"){
                $("#character").attr("src","${path}/resources/images/subscription/grape.png");
            }else if(e.target.value=="바나나"){
                $("#character").attr("src","${path}/resources/images/subscription/banana.png");
            }
        })

        const pay=()=>{
            console.log(choice);
            let decide=confirm(choice+"를 정말로 정기 결제 하시겠습니까?");
            alert("결제 완료");
        }

    </script>
</body>
</html>