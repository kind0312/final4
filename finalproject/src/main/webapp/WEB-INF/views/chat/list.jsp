<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 채팅 리스트" name="title"/>
</jsp:include>

<style>
	.pet-table>tbody{
		height:130px;
	}
	.insert-font{
		color:black;
		font-weight:bolder;
		font-size:15px;
	}
	.name-font{
		font-weight:bolder;
	}
	.gender-font{
		color:#7B7B7B;
	}
	.img-circle{
		border-radius: 70%;
    	border:none;
    	background-color:#81BDF1;
    	overflow: hidden;
	}
	.pet-table {
	    border-top:1px solid rgba(0, 0, 0, 0.1);
	    height:130px;
	}
	
	.titleName {
	font-size: 17px;
	}
	
	.mess {	
    margin-top: 10px;	
	}
	
	.one-index {
	display: none;
	}
	
	.icon{
		width: 40px;
		height: 40px;
		margin-left: 9px;
		}
	
</style>

<script >
	
$(document).ready(function(){
	 


});
	
	
</script>





<body>


<div class="container-fluid">
        <div class="row mt-80 mb-3">
            <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">일반회원 채팅목록<img src="/image/chat-box.png" class="icon"></h4>
            </div>
        </div>
	
        <div class="row">
            <div class="col-md-6 offset-md-3">   
                 <table class="table table-hover pet-table text-center">
                 
                 		<thead>
                 		
                 		<c:if test="${chatList.size()==0}">
                 				<tr class="table-default">
					  				<td colspan="3" height="130px" class="align-middle">대화가 존재하지 않습니다!</td>
					  			</tr>
                 		</c:if>
                 		
                 		
              				<c:forEach var="chatList" items="${chatList}" >
              					<c:choose> 
              					
              						<c:when test="${chatList.memberName eq memDto.memberName}">
	              						<tr class="table-default one-index" >
							  				<td colspan="3" height="130px" class="align-middle">대화가 존재하지 않습니다!</td>
							  			</tr>
              						</c:when>
              					
              					     
              					
              						<c:when test= "${chatList.memberId eq sessionId && chatList.chatMessageStatus eq 'N'}">
              						<tr class="table-default align-middle">
	                 				<th width="30%">
	                 				<img src="http://localhost:8888/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
	                 				</th>
	                 				<th width="40%">
	                 					
	                 					<p class="name-font titleName">${chatList.memberName} 훈련사</p>	                 					
	                 					<p class="gender-font">${chatList.chatMessage}</p>
	                 					<p class="gender-font">${chatList.chatCreateAt}</p>
	                 						                 				
	                 					
	                 				</th>
	                 				<th width="30%">
	                 					<a href="${pageContext.request.contextPath}/chat/room?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
	                 				</th>
                 				</tr>
              						</c:when>
              						
              						<c:when test= "${chatList.memberId ne sessionId && chatList.chatMessageStatus eq 'Y'}">
              						<tr class="table-default align-middle">
	                 				<th width="30%">
	                 				<img src="http://localhost:8888/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
	                 				</th>
	                 				<th width="40%">
	                 					
	                 					<p class="name-font titleName">${chatList.memberName} 훈련사</p>
	                 					
	                 					<p class="gender-font">${chatList.chatMessage}</p>
	                 					<p class="gender-font">${chatList.chatCreateAt}</p>
	                 					
	                 				
	                 					
	                 				</th>
	                 				<th width="30%">
	                 					<a href="${pageContext.request.contextPath}/chat/room?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
	                 				</th>
                 				</tr>
              						</c:when>
              						
              						
              					<c:otherwise>
              						<tr class="table-default align-middle">
	                 				<th width="30%">
	                 				<img src="http://localhost:8888/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
	                 				</th>
	                 				<th width="40%">
	                 					
	                 					<p class="name-font titleName">${chatList.memberName} 훈련사 <img class ="newMessage"  src="/image/circle.png"  style="width: 10px;height: 10px;margin-bottom: 8px;"></p>
	                 					
	                 					
	                 					<p class="gender-font mess">${chatList.chatMessage}</p>
	                 					<p class="gender-font">${chatList.chatCreateAt}</p>
	                 					<!-- <p class="gender-font" >new : ${chatList.chatMessageStatus}</p><!-- 마지막 채팅이 안읽은 상태면 null -->
	                 					<!-- <p class="gender-font"  hidden="">마지막 채팅 친사람 : ${chatList.memberId}</p> -->
	                 				</th>
	                 				<th width="30%">
	                 					<a href="${pageContext.request.contextPath}/chat/room?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
	                 				</th>
                 				</tr>
              					</c:otherwise>
              					
              					
              					</c:choose>
              				
                				
		                	</c:forEach>
                 		</thead>					  	
					  
                 </table>
			 </div>
		</div>
    </div>





</body>




<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>