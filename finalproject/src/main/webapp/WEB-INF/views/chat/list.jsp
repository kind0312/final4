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
</style>



<body>


<div class="container-fluid">
        <div class="row mt-80 mb-3">
            <div class="col-md-6 offset-md-3">
                 <h4 class="text-center">일반회원 채팅목록</h4>
            </div>
        </div>
		test : ${chatList}
        <div class="row">
            <div class="col-md-6 offset-md-3">   
                 <table class="table table-hover pet-table text-center">
                 		<thead>
              				<c:forEach var="chatList" items="${chatList}" >
                				<tr class="table-default align-middle">
	                 				<th width="30%">
	                 				<img src="http://localhost:8888/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
	                 				</th>
	                 				<th width="40%">
	                 					
	                 					<p class="name-font">${chatList.memberName} 훈련사</p>
	                 					
	                 					<p class="gender-font">${chatList.chatMessage}</p>
	                 					<p class="gender-font">${chatList.chatCreateAt}</p>
	                 					<p class="gender-font" >new : ${chatList.chatMessageStatus}</p><!-- 마지막 채팅이 안읽은 상태면 null -->
	                 					<p class="gender-font" >마지막 채팅 친사람 : ${chatList.memberId}</p>
	                 					<p class ="newMessage" >★</p>
	                 				</th>
	                 				<th width="30%">
	                 					<a href="${pageContext.request.contextPath}/chat/room?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
	                 				</th>
                 				</tr>
		                	</c:forEach>
                 		</thead>					  	
					  
                 </table>
			 </div>
		</div>
    </div>

<h4 id = "hh4">${sessionId}</h4>



</body>


<script >
	
$(document).ready(function(){
	 
var sessionId =  "<c:out value="${sessionId}"/>";



let nameList = [];
<c:forEach var="chatList" items="${chatList}" varStatus="status">
nameList.push("${chatList.memberId}");
</c:forEach>

console.log(sessionId);
console.log(nameList); 


let statusList = [];
<c:forEach var="chatList" items="${chatList}" varStatus="status">
statusList.push("${chatList.chatMessageStatus}");
</c:forEach>

console.log(statusList); 

for(var i = 0; i < nameList.length; i++){
	console.log(nameList[i] == sessionId);
	console.log(statusList[i] == 'N');
	if(nameList[i] == sessionId && statusList[i] == 'N'){
		 $(".newMessage").hide();
	}
}

});
	
	
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>