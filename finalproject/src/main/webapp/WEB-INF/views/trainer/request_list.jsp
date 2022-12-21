<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="" name=""/>
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
                 <h4 class="text-center">훈련 요청 목록</h4>
            </div>
        </div>
		
        <div class="row">
            <div class="col-md-6 offset-md-3">   
                 <table class="table table-hover pet-table text-center">
                 		<thead>
                 		
                 		<c:choose>
                 			<c:when test="${requestList.size()==0}">
					  			<tr class="table-default">
					  				<td colspan="3" height="130px" class="align-middle">내역이 존재하지 않습니다!</td>
					  			</tr>
					  		</c:when>
	                 		<c:otherwise>
	              				<c:forEach var="request" items="${requestList}">
	                				<tr class="table-default">
		                 				<th width="30%" class="align-middle">
		                 					<img src="http://localhost:8888/download/${request.filesNo}" class="img-circle" width="100" height="100"><!-- 이미지에 번호들어가야함 -->
		                 				</th>
		                 				<th width="40%" class="align-middle">
		                 					<p class="name-font">${request.petName }</p>
		                 					<p class="gender-font">주소 : ${request.trainingBasicAddress}</p>
		                 					<p class="gender-font">방문 일자 : ${request.trainingDate}</p>
		                 					<p class="gender-font">방문시간 : ${request.trainingStartTime}</p>
		                 				</th>
		                 				<th width="30%" class="align-middle">
		                 					<a href="${pageContext.request.contextPath}/trainer/request_detail?trainingNo=${request.trainingNo}" class="btn btn-blue">상세</a>
		                 				</th>
	                 				</tr>
			                	</c:forEach>
			                	</c:otherwise>
		                	</c:choose>
                 		</thead>					  				  
                 </table>
			 </div>
		</div>
    </div>

</body>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>