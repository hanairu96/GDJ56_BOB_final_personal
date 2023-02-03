<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="floating">
	<div>챗봇위치</div>
	<div>최근본상품위치</div>
	<div><button type="button" onclick="toHTMLTop()">위로가기위치</button></div>
</div>
<script>
	function toHTMLTop() {
		
		console.log($('html'));
		
        $('html').scrollTop(0);
    }
</script>
<style>
/* /.챗봇최근본상품위로가기 */
.floating {
    background-color: #f9f9f9;
    border: 2px solid #dddddd;
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
    border: 1px solid blueviolet;
    border-radius: 100%;
    height: 70px;
}

.floating div:nth-child(2) {
    border: 1px solid blueviolet;
    border-radius: 8px;
    height: 278px;
}

.floating div:nth-child(3) button {
    border: 1px solid blueviolet;
    border-radius: 100%;
    height: 70px;
}
/* 챗봇최근본상품위로가기./ */
</style>
</html>