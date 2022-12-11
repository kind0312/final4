<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련요청디테일" name="title"/>
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
              				<c:forEach var="petList" items="${petList}">
                				<tr class="table-default align-middle">
	                 				<th width="30%">
	                 					<img src="http://localhost:8888/download/${petList.filesNo}" class="img-circle" width="100" height="100"><!-- 이미지에 번호들어가야함 -->
	                 				</th>
	                 				<th width="40%">
	                 				<p class="gender-font">${petList.petName} (${petList.petBirth }, ${petList.petGender})</p>
	                 				<p class="gender-font">중성화 : ${petList.petNeutralization }</p>
	                 				<p class="gender-font">${petList.petBreed }</p>
	                 				</th>
                 	</c:forEach>
                 		</thead>	
                 	
                 	
                 </table>
                 <table class="table table-hover pet-table text-center">
                 
	                 				<th width="40%">
	                 					<p class="gender-font">보호자 : ${trainingDto.memberId}</p>
	                 					<p class="gender-font">주소 : ${trainingDto.trainingBasicAddress}</p>
	                 					<p class="gender-font">상세주소 : ${trainingDto.trainingDetailAddress}</p>	                 				
	                 					<p class="gender-font">방문 일자 : ${trainingDto.trainingDate}</p>
	                 					<p class="gender-font">방문시간 : ${trainingDto.trainingStartTime}</p>	                 					
	                 				</th>      	      					  
                 
                 </table>
                 
                <div>
				      <label for="exampleTextarea" class="form-label mt-4">요청사항</label>
				      <textarea  class="form-control" rows="5"  readonly>${trainingDto.trainingMemo}</textarea>				      
				  </div>			
				  
				  <p class="gender-font">승인상태 : ${trainingDto.trainingStatus}</p>
				  
				  
				  <button type="button" onclick="location.href='${pageContext.request.contextPath}/trainer/training_approve?trainingNo=${trainingDto.trainingNo}'">승인</button>	  
				  <button type="button" onclick="location.href='${pageContext.request.contextPath}/trainer/request_list'">목록</button>	  
				  <button type="button" onclick="location.href='${pageContext.request.contextPath}/trainer/training_reject?trainingNo=${trainingDto.trainingNo}'">거절</button>	  
				  
			 </div>
		</div>
    </div>






</body>
























<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>