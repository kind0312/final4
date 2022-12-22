<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    <jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련사 채팅리스트" name="title"/>
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
    	margin-top: 20px;
    	margin-bottom: 10px;
	}
	.pet-table {
	    border-top:1px solid rgba(0, 0, 0, 0.1);
	    height:130px;
	}
	
	.titleName {
	font-size: 17px;
	margin-bottom: 10px;
	}
	
	.mess {	
    margin-top: 10px;	
	}
	
	.icon{
		width: 40px;
		height: 40px;
		margin-left: 9px;
		}
	
</style>



<body>


<div class="container-fluid">
        <div class="row mt-80 mb-3">
            <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">트레이너 채팅목록<img src="/image/chat-box.png" class="icon"></h4>
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
              						<c:when test= "${chatList.memberId eq sessionId && chatList.chatMessageStatus eq 'N'}">
              						<tr class="table-default align-middle">
		                 				<th width="30%" class="align-middle">
		                 					<img src="${pageContext.request.contextPath}/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
		                 				</th>
		                 				<th width="40%" class="align-middle">	                 					
		                 					<p class="name-font titleName">${chatList.memberName} 회원</p>	                 					
		                 					<p class="gender-font">${chatList.chatMessage}</p>
		                 					<p class="gender-font">${chatList.chatCreateAt}</p>
		                 				</th>
		                 				<th width="30%" class="align-middle">
		                 					<a href="${pageContext.request.contextPath}/chat/room_trainer?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
		                 				</th>
                 					</tr>
              						</c:when>
              						
              						<c:when test= "${chatList.memberId eq sessionId && chatList.chatMessageStatus eq 'Y'}">
              						<tr class="table-default align-middle">
		                 				<th width="30%" class="align-middle">
		                 					<img src="${pageContext.request.contextPath}/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
		                 				</th>
		                 				<th width="40%" class="align-middle">	                 					
		                 					<p class="name-font titleName">${chatList.memberName} 회원</p>	                 					
		                 					<p class="gender-font">${chatList.chatMessage}</p>
		                 					<p class="gender-font">${chatList.chatCreateAt}</p>
		                 				</th>
		                 				<th width="30%" class="align-middle">
		                 					<a href="${pageContext.request.contextPath}/chat/room_trainer?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
		                 				</th>
                 					</tr>
              						</c:when>
              						
              						
              						
              						<c:when test= "${chatList.memberId ne sessionId && chatList.chatMessageStatus eq 'Y'}">
              						<tr class="table-default align-middle">
		                 				<th width="30%" class="align-middle">
		                 					<img src="${pageContext.request.contextPath}/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
		                 				</th>
		                 				<th width="40%" class="align-middle">	                 					
		                 					<p class="name-font titleName">${chatList.memberName} 회원</p>	                 					
		                 					<p class="gender-font">${chatList.chatMessage}</p>
		                 					<p class="gender-font">${chatList.chatCreateAt}</p>
		                 				</th>
		                 				<th width="30%" class="align-middle">
		                 					<a href="${pageContext.request.contextPath}/chat/room_trainer?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
		                 				</th>
                 					</tr>
              						</c:when>
              						 
              						
	              					<c:otherwise>
	              						<tr class="table-default align-middle">
			                 				<th width="30%" class="align-middle">
			                 					<img src="${pageContext.request.contextPath}/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
			                 				</th>
			                 				<th width="40%" class="align-middle">	                 					
			                 					<p class="name-font titleName">${chatList.memberName} 회원 <img class ="newMessage"  src="/image/circle.png"  style="width: 10px;height: 10px;margin-bottom: 8px;"></p>
			                 					<p class="gender-font mess">${chatList.chatMessage}</p>
			                 					<p class="gender-font">${chatList.chatCreateAt}</p>
			                 					<!-- <p class="gender-font" >new : ${chatList.chatMessageStatus}</p><!-- 마지막 채팅이 안읽은 상태면 null -->
			                 					<!-- <p class="gender-font"  hidden="">마지막 채팅 친사람 : ${chatList.memberId}</p> -->
			                 				</th>
			                 				<th width="30%" class="align-middle">
			                 					<a href="${pageContext.request.contextPath}/chat/room_trainer?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
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