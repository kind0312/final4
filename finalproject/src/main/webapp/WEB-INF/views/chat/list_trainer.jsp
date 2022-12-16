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
                 <h4 class="text-center">훈련사 채팅목록</h4>
            </div>
        </div>
		
        <div class="row">
            <div class="col-md-6 offset-md-3">   
                 <table class="table table-hover pet-table text-center">
                 		<thead>
              				<c:forEach var="chatList" items="${chatList}">
                				<tr class="table-default align-middle">
	                 				<th width="30%">
	                 				<img src="http://localhost:8888/download/${chatList.filesNo}" class="img-circle" width="100" height="100"> 
	                 				</th>
	                 				<th width="40%">
	                 					
	                 					<p class="name-font">${chatList.memberName} 회원</p>
	                 					
	                 					<p class="gender-font">${chatList.chatMessage}</p>
	                 					<p class="gender-font">${chatList.chatCreateAt}</p>
	                 				</th>
	                 				<th width="30%">
	                 					<a href="${pageContext.request.contextPath}/chat/room_trainer?roomNo=${chatList.roomNo}" class="btn btn-blue">채팅</a>
	                 				</th>
                 				</tr>
		                	</c:forEach>
                 		</thead>					  	
					  
                 </table>
			 </div>
		</div>
    </div>





</body>


<script>
	
</script>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>