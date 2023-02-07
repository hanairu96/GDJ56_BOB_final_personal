<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<div class="floating">
	<div>챗봇위치</div>
	<div>최근 본 <br>상품
		<ul style="padding: 0;">
			<li>
				<a id="li3" href="">
				<img id="li3Img" src="" alt="test" width="50" height="50" onerror="this.style.display='none'"></a>
			</li>
			<li>
				<a id="li2" href="">
				<img id="li2Img" src="" alt="test" width="50" height="50" onerror="this.style.display='none'"></a>
			</li>
			<li>
				<a id="li1" href="">
				<img id="li1Img" src="" alt="test" width="50" height="50" onerror="this.style.display='none'"></a>
			</li>
		</ul>
	</div>
	<div><button type="button" onClick="javascript:window.scrollTo(0,0)"><img src="${path }/resources/images/up.png"></button></div>
</div>
<script>
var l = JSON.parse(localStorage.getItem("floatL"));
var s = JSON.parse(localStorage.getItem("floatS"));
var f = JSON.parse(localStorage.getItem("floatF"));


if(localStorage.getItem("floatL") != null){
	$("#li3Img").attr("src",'${path }/resources/upload/market/mainlabel/'+l.mainPic);
	$("#li3").attr("href",'${path}/market1/marketdetail.do?itemNo='+l.itemNo);
}
if(localStorage.getItem("floatS") != null){
	$("#li2Img").attr("src",'${path }/resources/upload/market/mainlabel/'+s.mainPic);
	$("#li2").attr("href",'${path}/market1/marketdetail.do?itemNo='+s.itemNo);
}
if(localStorage.getItem("floatF") != null){
	$("#li1Img").attr("src",'${path }/resources/upload/market/mainlabel/'+f.mainPic);
	$("#li1").attr("href",'${path}/market1/marketdetail.do?itemNo='+f.itemNo);
	
}



</script>
<style>
/* /.챗봇최근본상품위로가기 */
.floating {
    background-color: #f9f9f9;
    /* border: 2px solid #dddddd; */
    position: fixed;
    right: 36%;
    top: 380px;
    margin-right: -500px;
    text-align: center;
    height: 350px;
    width: 70px;
    border-radius: 30px;
    /* -webkit-border-radius: 8px;
position: absolute;
    width: 70px;
    height: 350px;
    right: 50px;
    border-radius: 70px;
    top: 250px;
    border: 1px solid #dddddd; */
}

.floating div:nth-child(1) {
    /* border: 1px solid blueviolet; */
    border-radius: 100%;
    height: 70px;
}

.floating div:nth-child(2) {
    border: 1px solid gray;
    border-radius: 8px;
    height: 278px;
}

.floating div:nth-child(3) button {
    /* border: 1px solid blueviolet; */
    border-radius: 100%;
    height: 70px;
}

.floating div:nth-child(2) ul {
     display: flex;
     flex-direction: column;
}
.floating div:nth-child(2) li {
    margin:9px;
}
/* 챗봇최근본상품위로가기./ */
</style>
</html>