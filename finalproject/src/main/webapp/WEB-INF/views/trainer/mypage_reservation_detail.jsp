<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약 확인" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
	   	border:none;
	   	background-color:#81BDF1;
	   	overflow: hidden;
	}
	.carousel-control-prev,
	.carousel-control-next{
		color:black;
		opacity: 0.3;
	}
	.underline-out{
		border-bottom:#fff;
	}
	.table > :not(caption) > * > *{
		padding: 0.6rem;
	}
	.memo-input{
		border:1px solid rgba(0, 0, 0, 0.1);
		width:95%;
		padding:0.5rem 1.1rem;
		outline:none;
		font-size:15px;
		border-radius: 0.5rem;
	}
	
	.price-font{
		color:#81BDF1;
		font-weight:bolder;
		font-size:17px;
	}
	
</style>

<script>
	$(function(){
		
		//하단 금액 부분 출력
		var payPrice1 = $(".pay-price").text();
		var payPrice2 = parseInt(commaDelete(payPrice1));
		var minusPrice = $(".minus-price").text(payPrice2*0.1);
		var totalPrice = $(".total-price").text(payPrice2*0.9);		
		$(".minus-price").text(comma(minusPrice.text()));
		$(".total-price").text(comma(totalPrice.text()));

		
		//완료 버튼 이벤트(해당 훈련서비스 상태를 이용완료로 변경처리)
		$(".change-btn").click(function(){
			var trainingNo = $("[name=trainingNo]").val();
			$.ajax({
				url:"http://localhost:8888/rest/training_status/"+trainingNo,
				method:"patch",
				data:trainingNo,
				success:function(resp){
					if(resp){
						$(".change-btn").hide(); //완료 버튼 숨김
						$(".status").text('이용완료');
					}
				}
			});			
		});
		
		//1000단위 콤마찍기
		function comma(price){
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
		
		//1000단위 콤마해제
		function commaDelete(price){
			return price.toString().replace(",","");
		}
		
	});
</script>

<body>
	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/trainer/mypage_reservation">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/trainer/mypage_reservation">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/trainer/mypage_profile">프로필관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">정산관리</a>
	        </li>
	        <li>
	          <a class="nav-link mypage-nav" href="#" data-bs-toggle="modal" data-bs-target="#change-modal">회원모드로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>

	<!-- Modal -->
	<div class="modal fade" id="change-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        회원 모드로 전환하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow mode-change" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="container-fluid">
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                <div class="text-center">
					<h3>예약 상세</h3>
				</div>
            </div>
        </div>
 
        <div class="row mt-12">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-2">
           		<table class="table text-center">
					<tbody>
						<!-- 펫 프로필, 정보 출력 -->
						<tr class="table-default"><td></td></tr>
						<c:choose>
							<c:when test="${detail.size()==1}">
								<tr class="table-default align-middle">
									<td class="py-3">
										<div>
					  						<img src="http://localhost:8888/download/${detail[0].filesNo}" class="img-circle" width="180" height="180">
					  					</div>
					  					<div class="mt-3">
					  						<span>${detail[0].petName}(${detail[0].petGender}/${detail[0].petWeight}kg)</span>
					  					</div>
					  					<div class="mt-2">
					  						<span>${detail[0].petBreed}</span>
					  					</div>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="text-center">
									<td height="200px" class="py-3">
										<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
										 	<div class="carousel-inner">
										 		<div class="carousel-item active">
										 			<div class="">
										 				<img src="http://localhost:8888/download/${detail[0].filesNo}" class="img-circle" width="180" height="180" alt="반려동물 사진">
										 			</div>
											   		<div class="carousel-caption">
												        <h6 style="color:white;">${detail[0].petName}(${detail[0].petGender}/${detail[0].petWeight}kg)</h6>
												        <p style="color:white;">${detail[0].petBreed}</p>
												    </div>
											    </div>
									    		<c:forEach var="detail" begin="1" items="${detail}">
											    	<div class="carousel-item">
											    		<div class="">
											    			<img src="http://localhost:8888/download/${detail.filesNo}" class="img-circle" width="180" height="180" alt="반려동물 사진">
											    		</div>
											    		<div class="carousel-caption">
													        <h6 style="color:white;">${detail.petName}(${detail.petGender}/${detail.petWeight}kg)</h6>
													        <p style="color:white;">${detail.petBreed}</p>
													    </div>
											    	</div>
											    </c:forEach>
										  	</div>
											<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
											    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Previous</span>
											  </button>
											  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
											    <span class="carousel-control-next-icon" aria-hidden="true"></span>
											    <span class="visually-hidden">Next</span>
											  </button>
										</div>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>	
				
				<!-- 회원정보/훈련서비스 정보 -->
				<table class="table text-center">
					<tbody>
						<tr class="table-default"><th></th><td></td></tr>
						<tr class="table-default align-middle underline-out">
							<th>보호자</th>
							<td>${detail[0].memberName}</td>
						</tr>
						<tr class="table-default align-middle underline-out">
							<th>반려동물(총 ${detail.size()}마리)</th>
							<c:choose>
								<c:when test="${detail.size()>1}">
									<td>${detail[0].petName} 외 ${detail.size()-1}마리</td>
								</c:when>
								<c:otherwise>
									<td>${detail[0].petName}</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr class="table-default align-middle underline-out">
							<th>주소</th>
							<td>${detail[0].trainingBasicAddress} ${detail[0].trainingDetailAddress}</td>
						</tr>	
						<tr class="table-default align-middle underline-out">
							<th>돌봄날짜</th>
							<td>${detail[0].trainingDate}</td>
						</tr>
						<tr class="table-default align-middle underline-out">
							<th>방문시간</th>
							<td>${detail[0].trainingStartTime}</td>
						</tr>
						<tr class="table-default align-middle">
							<th>상태</th>
							<td><span class="status">${detail[0].trainingStatus}</span></td>
						</tr>
					</tbody>
				</table>		
			 </div>
        </div>	
        
		<!-- 요청사항 -->
		<div class="row mt-3">
          		<div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
				<div class="row text-start">
					<h6>요청사항</h6>
				</div>
				<div class="row mt-2 justify-content-center">
					<input type="text" class="memo-input" value="${detail[0].trainingMemo}" readonly>
				</div>
			</div>
		</div>
		
		<!-- 이용완료 상태일 경우에만 수익금 내역 출력 -->
		<c:if test="${detail[0].trainingStatus=='이용완료'}">
			<div class="row mt-5">
           		<div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-2">
					<div class="text-center">
						<h5>수익내역</h5>
					</div>
					<table class="table text-center">
						<tbody>
							<tr class="table-default"><th></th><td></td></tr>
							<tr class="table-default align-middle underline-out">
								<th>금액</th>
								<td>
									<span class="pay-price">
										<fmt:formatNumber value="${detail[0].trainingPurchasePrice}" pattern="###,###"></fmt:formatNumber>
									</span>
								</td>
							</tr>
							<tr class="table-default align-middle underline-out">
								<th>수수료(10%)</th>
								<td>
									<span class="minus-price">0</span>
								</td>
							</tr>
							<tr class="table-default align-middle">
								<th>금액</th>
								<td>
									<span class="total-price price-font">0</span>
								</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>
		</c:if>
				
        <div class="row mt-4">
          	<div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
				<div class="text-center">
					<c:if test="${detail[0].trainingStatus=='예약확정'}">
						<button type="button" class="btn btn-blue change-btn">완료</button>
       				</c:if>
       				<a type="button" href="${pageContext.request.contextPath}/trainer/mypage_reservation" class="btn btn-yellow">목록</a>
				</div>
			</div>
		</div>
		
		<!-- 비동기화를 위한 훈련번호 -->
		<input type="hidden" name="trainingNo" value="${detail[0].trainingNo}">
    </div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>