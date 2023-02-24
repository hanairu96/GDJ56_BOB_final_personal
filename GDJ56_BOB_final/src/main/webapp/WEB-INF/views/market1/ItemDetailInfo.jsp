<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
	<div id="explain">
		<div class="tab-content" >
			<div class="tab-pane active" id="tabs-1" role="tabpanel">
			    <div class="product__details__tab__desc" >
			        <br>
			        <h3 style="text-align: center;font-weight:bold;" >
			        <c:if test="${de.itemBrand!=null }">
			        	[${de.itemBrand }]
			        </c:if>
			        ${de.itemName }
			        </h3>
			        <br>
			        <div style="text-align: center;"> 
			            <p style="font-size:20px;">
							${de.itemContent }
			            </p>
			        </div>
			        <br>
			        <div  style="text-align: center;flex-wrap: wrap;width:510px;margin:0 auto;">
			        <c:if test="${not empty de.ipic }">
	                       <c:forEach var="file" items="${de.ipic }">
								 <img src="${path }/resources/upload/market/detail/${file.picName}" style="margin:15px;">
						</c:forEach>                         
	                     	</c:if>
			        </div>
			        <br><br>
			        <div style="font-size:20px;">
			            <span class="col-1" style="font-weight:bold;">용량 </span><span style="margin-left:2%">${de.weight }</span><br>
			            <span class="col-1" style="font-weight:bold;">특징 </span><span style="margin-left:2%">${de.itemPoint }</span><br>
			            <span class="col-1" style="font-weight:bold;">보관법</span><span class="col-3">${de.itemKeep }</span><br>
			            <span class="col-1" style="font-weight:bold;">활용팁</span><span class="col-3">${de.itemTip }</span><br>
			        </div>
			        <br>
			        <div style="text-align: center;">
			            <img src="${path }/resources/upload/market/mainlabel/${de.itemLabel }" alt="" >
		            </div>
		            <br><br><br>
		        </div>
		    </div>
		</div>
	</div>



