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
            </div>
            <form>       
                <small id="emailHelp" class="form-text text-muted" style="font-size: larger;">
                    고객님의 아이디는<br><span id="idResult">''</span><br>입니다.
                </small>
                <div id="insert">
                    <div class="d-grid">
                        <button class="customBtn btnStyle" type="button" onclick="location.assign('<%=request.getContextPath()%>/logIn/logIn.do');">로그인페이지로 이동</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <style>
        section{
            margin-top: 100px;
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
        .container.py-4{
            margin: 0 auto;
            width : 503px;
        }
        #insert{
            display: flex;
            margin-top: 20px;
            margin-bottom: 30px;
        }
        #emailHelp{
            text-align: center;
            padding: 40px;
            margin-bottom: 20px;
        }
        .d-grid{
            margin: 0 auto;
        }
        #idResult{
            color:#7e8cd2;
            font-weight: bold;
        }
    </style>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>