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
	<c:forEach var="q" items="${qna }">
		<div style="display: flex; height:40px;margin-bottom: 7px;">
		    <img src="${path }/resources/images/logo-icon.png" alt="" style="height:40px;width: 40px;border-radius: 50%;">
		    <div>
		    	<h5 style="margin-left:10px; margin-top: 10px;">${q.memberId }</h5>
		    </div>
		    <span style="margin-left:10px;color:rgb(207, 207, 207);margin-top: 8px;"><fmt:formatDate type="date" value="${q.iqDate }"/></span>
		</div>
		<c:if test="${q.iqSecret eq 'N' or loginMember.memberId eq q.memberId or loginMember.memberId eq 'admin'}">
		<div style="margin-left:20px;">
		    <h5>${q.iqContent }</h5>
		</div>
		</c:if>
		
		<c:if test="${q.iqSecret eq 'Y'}">
			<c:if test="${loginMember.memberId != q.memberId and loginMember.memberId != 'admin'}">
				<div style="margin-left:20px;">
				    <h5 style="color:gray;">비밀글입니다.</h5>
				</div>
			</c:if>
		</c:if>
		<br>
		<div style="display: flex;">
		    <div class="col-2">
		        <span style="color:orange; font-weight: bold; font-size: 20px;">답글 ${q.answer_count }</span>
		    </div>
		    <div>
		        <button id="togglereply" class="primary-btn" type="button" name="reply" style="background-color:#07d448;border: none;color: white;"
		        onclick="togglererere(event)">답글 보기</button>
				
		    </div>
		    <div>
		    	<c:if test="${q.memberId eq loginMember.memberId }">
			        <button id="" class="primary-btn" type="button" style="background-color:magenta;border: none;color: white;margin-left:10px;"
			         onclick="deleteQna(${q.iqNo},${itemNo });">삭제</button>
		    	</c:if>
		    </div>
		</div>
		<hr/>
		
		<!-- 답변 -->
		<div class="toggleadmin">
			<div class="ttt" style="margin-left: 50px;display:none;">
			
			
			<!-- <form method="post"> -->
			<c:if test="${loginMember.memberId eq 'admin' }">
			<form method="post"  action="${path }/itemQna/qnaAnswerAdmin.do">
			    <div style="display:flex;margin-bottom: 7px;">
			        <img src="${path }/resources/images/logo-icon.png" alt="" style="width:40px; height: 40px;border-radius: 50%;">
			        <h5 style="margin:10px;">오늘의 밥</h5>
			    </div>
			    <div style="display:flex">
			        <div id="answerAdnim">
			            <textarea name="iqaContent" id="iqaContent" cols="100" rows="2" placeholder="답글을 입력해주세요" required></textarea>
			        	<input type="hidden" name="itemNo" value="${itemNo }"/>
			        	<input type="hidden" name="iqNo" value="${q.iqNo }"/>
			        </div>
			        <div>
			            <input class="primary-btn" type="submit" value="답변하기" style="height: 55px;margin-left: 5%; background-color: #07d448;border: none;color: white;"
			            onclick="">
			        </div>
			    </div>
	        <hr/>
		    </form>
		  	</c:if>
		    
		    
	        <!-- 답글 리스트 출력 -->
	        <c:if test="${an!=null }">
		        <c:forEach var="aa" items="${an }">
			        <c:if test="${q.iqNo == aa.iqNo }">
			        	<c:if test="${q.iqSecret eq 'N' or loginMember.memberId eq q.memberId or loginMember.memberId eq 'admin'}">
					        <div style="display:flex;margin-bottom: 7px;">
					        	<img src="${path }/resources/images/logo-icon.png" alt="" style="width:40px; height: 40px;border-radius: 50%;">
					        	<h5 style="margin:10px;">오늘의 밥</h5>
								<span style="margin-left:10px;color:rgb(207, 207, 207);margin-top: 8px;"><fmt:formatDate type="date" value="${aa.iqaDate }"/></span>
					        </div>
					    	<div style="display:flex;">
						        <div style="margin-left:20px;">
									${aa.iqaContent }
						        </div>
						        <div>
						        <c:if test="${loginMember eq 'admin' }">
					       			<button id="" class="primary-btn" type="button" 
					       			style="background-color:magenta;border: none;color: white;margin-left:50px;"
					       			 onclick="deleteAnswer(${aa.iqaNo },${itemNo });">삭제</button>
					       		</c:if>
					    		</div>
					    	</div>
							<hr/>
						</c:if>
						<c:if test="${q.iqSecret eq 'Y' }">
							<c:if test="${loginMember.memberId != q.memberId and loginMember.memberId != 'admin'}">
								<div style="margin:20px;">
								    <h5 style="color:gray;">비밀답변입니다.</h5>
								</div>
								<hr/>
							</c:if>
						</c:if>
			        </c:if>
				</c:forEach>
			</c:if>
			</div>
		</div>
	</c:forEach>
