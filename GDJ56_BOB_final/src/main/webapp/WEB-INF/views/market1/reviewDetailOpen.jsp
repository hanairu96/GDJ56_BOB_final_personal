<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세보기</title>
</head>
<body>
<style>
     #test11 img {
        transition: all 0.3s linear;
    }
    #test11>img:last-child:hover  {
        border: 1px solid green;
        transform: scale(2.5);
    }
    #test11>img:first-child:hover  {
        border: 1px solid green;
        transform: scale(2.5);
    }
</style>
<section>
    <div style="width:630px;height:500px;border: 1px solid red;">

        <h3>사진 후기</h3>
        <hr style="color:rgb(238, 238, 238)"> 
        <div style="display:flex;">
            <div>
                <img src="./img/cart/cart-2.jpg" alt="" style="width:300px;height: 400px;">
            </div>
            <div style="margin-left: 20px;">
                <h4>야채주스</h4>
                <h5>판매상품이름</h5>
                <h3>사과가 정말 신선하고 맛있어요</h3>
                <span>2023-01-01</span>
            </div>
            <div id="test11" style="display:flex; position: absolute; top: 330px; left: 310px;margin-left: 5px;">
                <img src="./img/cart/cart-3.jpg" alt="" style="width:150px;height: 150px; ">
                <img src="./img/cart/cart-3.jpg" alt="" style="width:150px;height: 150px; margin-left: 5px;">
            </div>
            <div>
                
            </div>
        </div>
    </div>  
</section>
</body>
</html>