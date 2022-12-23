<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<jsp:include page="/WEB-INF/views/template/trainerHeader.jsp">
	<jsp:param value="훈련요청 상세" name="title"/>
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
	.underline-out{
		border-bottom:#fff;
	}
	
	.title {
		 font-weight:bolder;
		 font-size:15px;
		 text-align: left;
	}
	
	.content{
		 font-size:15px;
		 text-align: right;
	}
	
	.icon {
	width: 35px;
	height: 35px;
	margin-left: 10px;
	}
	
</style>

<body>

	<div class="container-fluid">
        <div class="row mt-80 mb-3">
            <div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
                 <h4 class="text-center">훈련 요청 상세<img src ="${pageContext.request.contextPath}/image/owner.png" class="icon"></h4>
            </div>
        </div>
		
        <div class="row">
            <div class="col-md-6 offset-md-3">   
            <table class="table  pet-table text-center" style="margin-bottom:0px;">
				      <thead>
                <c:forEach var="petList" items="${petList}">
                  <tr  class="table-default align-middle underline-out">
                    <td rowspan="3" class="align-middle"><img src="${pageContext.request.contextPath}/download/${petList.filesNo}" class="img-circle align-middle" width="100" height="100"></td>
                    <td >
                    <p class="ps-sm-4 title align-middle" >${petList.petName} (${petList.petBirth }, ${petList.petGender})</p>
                    </td>
                  </tr>
                  <tr  class="table-default align-middle underline-out">
                    <td>
                    <p class="ps-sm-4 title">${petList.petBreed }</p>
                    </td>
                  </tr>
                  <tr  class="table-default align-middle underline-out">
                    <td>
                    <p class="ps-sm-4 title">중성화 : ${petList.petNeutralization }</p>
                    </td>
                  </tr>
                </c:forEach>
				      </thead>
			      </table>

           	<table class="table pet-table text-center">
				      <tbody>
                <tr class="table-default align-middle underline-out">
                  <td class="ps-sm-4 title">보호자</td>
                  <td class="pe-sm-4 content">${trainingDto.memberId}</td>
                </tr>

                <tr class="table-default align-middle underline-out">
                  <td class="ps-sm-4 title">주소</td>
                  <td class="pe-sm-4 content"> ${trainingDto.trainingBasicAddress}</td>
                </tr>
                <tr class="table-default align-middle underline-out">
                  <td class="ps-sm-4 title">상세주소</td>
                  <td class="pe-sm-4 content">${trainingDto.trainingDetailAddress}</td>
                </tr>
                <tr class="table-default align-middle underline-out">
                  <td class="ps-sm-4 title">방문일자</td>
                  <td class="pe-sm-4 content"> ${trainingDto.trainingDate}</td>
                </tr>
                <tr class="table-default align-middle ">
                  <td class="ps-sm-4 title">방문시간</td>
                  <td class="pe-sm-4 content"> ${trainingDto.trainingStartTime}</td>
                </tr>
              </tbody>
            </table>

                 
            <div>
				      <label for="exampleTextarea" class="form-label mt-4">요청사항</label>
				      <textarea  class="form-control" rows="5" readonly 
				      	style="background-color:white; font-size:16px;">${trainingDto.trainingMemo}</textarea>				      
				    </div>			
				  
				<!--  <p class="gender-font mt-3" style="font-size:16px; font-weight:bolder;">승인상태 : ${trainingDto.trainingStatus}</p> -->   
				  
				    <div class="center mt-4">
              <button type="button" class="btn btn-blue" id="a-btn" >승인</button>	  
              <button type="button" class="btn btn-outline-blue"  onclick="location.href='${pageContext.request.contextPath}/trainer/request_list'">목록</button>	  
              <button type="button" class="btn btn-yellow"  id="r-btn" >거절</button>	  
				    </div>
			 </div>
		</div>
  </div>


	<!-- Modal -->
	<div class="modal fade" id="approve-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        예약이 확정됩니다. 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-blue" data-bs-dismiss="modal" 
	        onclick="location.href='${pageContext.request.contextPath}/trainer/training_approve?trainingNo=${trainingDto.trainingNo}'">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="reject-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        예약이 취소됩니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal" 
	        onclick="location.href='${pageContext.request.contextPath}/trainer/training_reject?trainingNo=${trainingDto.trainingNo}'">확인</button>
	      </div>
	    </div>
	  </div>
	</div>





</body>


<script>
	$(function(){
		$("#a-btn").click(function(e){ 
			e.preventDefault();
			$("#approve-modal").modal('show');			
		});
		
		$("#r-btn").click(function(e){ 
			e.preventDefault();
			$("#reject-modal").modal('show');			
		});
		
		
	
	});
</script>













<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>