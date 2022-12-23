<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약 상세" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
	   	border:none;
	   	background-color:#fff;
	   	overflow: hidden;
	}
	.underline-out{
		border-bottom:#fff;
	}
	.title{
		 font-weight:bolder;
		 font-size:15px;
		 text-align: left;
	}
	.content{
		 font-size:15px;
		 text-align: right;
	}
	.pay-title{
		 font-weight:bolder;
		 font-size:18px;
	}
	.cancel-font{
		color:#81BDF1;
		font-weight:bolder;
		font-size:13px;
	}
	.price-font{
		color:#81BDF1;
		font-weight:bolder;
		font-size:17px;
	}
	.cancel-font:hover{
		text-decoration: underline;
		color:#81BDF1;
	}
	
	
	
</style>

<script>
	$(function(){
		//훈련사 전환 이벤트
		$(".trainer-change").click(function(e){
			e.preventDefault();
			$("#change-modal").modal('hide');
			//1. 회원의 훈련사 여부 비동기로 확인
			//2. y를 반환할 경우 훈련사 메인화면으로 이동
			//3. n을 반환할 경우 훈련사 전환이 불가능한 회원입니다. 라는 문구 모달로 출력
			var memberId = $("[name=memberId]").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/rest/member/trainer_change/"+memberId,
				method:"get",
				data:memberId,
				success:function(resp){
					if(resp=='N'){
						$("#change-modal").modal('show');
					}else if(resp=='Y'){
						location.href="${pageContext.request.contextPath}/trainer/main";
						$("#change-modal").modal('hide');
					}
				}
			});
		});
		
		//펫 이름 + 추가 요금 출력
		var petName = $("[name=petName]").val();
		var cnt = $("[name=cnt]").val();
		if(cnt>1){
			$(".petName").text(petName+" 외 "+(cnt-1)+"마리");
			$(".plus-price").text((cnt-1)*50000);
		}else{
			$(".petName").text(petName);
			$(".plus-price").text(0);
		}
		

	});
</script>

<body>
	<nav class="navbar navbar-expand-lg navbar-expand-lg-re navbar-dark bg-blue mypage-top-nav">
	  <div class="container-fluid">
	    <a class="navbar-brand-re footer-link" href="${pageContext.request.contextPath}/mypage/training">마이페이지</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse justify-content-end" id="navbarColor01">
	      <ul class="navbar-nav me-0">
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" style="color:white;" href="${pageContext.request.contextPath}/mypage/training">예약확인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/pet">반려동물</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/point">포인트</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/like">찜관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/review">후기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/mypage/profile">정보수정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav trainer-change" href="#">훈련사로 전환</a>
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
	        훈련사 전환이 불가능한 회원입니다.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-yellow" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="container-fluid">
		<div class="row mt-80">
			<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="text-center">
					<h3>예약 상세</h3>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 ">   
				<table class="table point-table text-center">
					<tbody>
						<tr class="table-default"><td colspan="3"></td></tr>
						<!-- 훈련사 프로필 및 현재 예약상태 표시 -->
						<tr class="table-default align-middle">
			  				<td colspan="2" height="200px">
			  					<div class="mt-3">
			  						<img src="${pageContext.request.contextPath}/download/${trainer.filesNo}" class="img-circle" width="100" height="100">
			  					</div>
			  					<div class="mt-4">
			  						<c:choose>
			  							<c:when test="${training[0].trainingStatus=='예약대기'}">
			  								<span>${trainer.memberName} 훈련사 님의 승인을 기다리고 있습니다.</span>
			  							</c:when>
			  							<c:when test="${training[0].trainingStatus=='예약취소'}">
			  								<span>예약이 취소되었습니다.</span>
			  							</c:when>
			  							<c:when test="${training[0].trainingStatus=='이용완료'}">
			  								<span>훈련이 종료되었습니다.</span>
			  							</c:when>
			  							<c:otherwise>
			  								<span>${trainer.memberName} 훈련사 님이 방문 예정입니다.</span>
			  							</c:otherwise>
			  						</c:choose>
			  					</div>
			  					<div class="mt-4 mb-3">
				  					<c:choose>
				  						<c:when test="${training[0].trainingStatus=='이용완료'}">
				  							<a href="${pageContext.request.contextPath}/trainer/detail?trainerNo=${training[0].trainerNo}" class="btn btn-blue" style="margin-right:10px;">프로필 보기</a>
				  							<c:choose>
				  								<c:when test="${reviewDto == null}">
							  						<a href="${pageContext.request.contextPath}/review/write?trainingNo=${training[0].trainingNo}" class="btn btn-outline-yellow" style="margin-left:10px;">후기 작성</a>
				  								</c:when>
				  								<c:otherwise>
				  									<a href="${pageContext.request.contextPath}/review/write?trainingNo=${training[0].trainingNo}" class="btn btn-yellow" style="margin-left:10px;">작성 완료</a>
				  								</c:otherwise>
				  							</c:choose>
				  						</c:when>
				  						<c:otherwise>
				  							<a href="${pageContext.request.contextPath}/trainer/detail?trainerNo=${training[0].trainerNo}" class="btn btn-blue" style="margin-right:10px;">프로필 보기</a>
					  						<a href="${pageContext.request.contextPath}/chat/enter?trainerNo=${training[0].trainerNo}" class="btn btn-yellow" style="margin-left:10px;">연락 하기</a>
				  						</c:otherwise>
				  					</c:choose>
			  					</div>
			  				</td>
			  			</tr>

			  			<!-- 상세내역(+예약취소버튼)  예약상태에 따라서 다르게 표시하기 -->
			  			<c:choose>
			  				<c:when test="${training[0].trainingStatus!='예약취소'}">
			  					<tr class="table-default"><td colspan="2"></td></tr>
						  			<tr class="table-default underline-out" height="60px">
						  				<td class="title pt-sm-3" width="45%"><span class="ps-sm-4">날짜</span></td>
						  				<td width="55%" class="content pt-sm-3">
						  					<fmt:formatDate value="${training[0].trainingDate}" pattern="yyyy-MM-dd (E)"/>
						  					<span class="pe-sm-4">${training[0].trainingStartTime}</span>
						  				</td>
						  			</tr>
						  			<tr class="table-default underline-out"  height="50px">
						  				<td class="title"  width="45%"><span class="ps-sm-4">이용요금</span></td>
						  				<td width="55%" class="content">
						  				<span class="pe-sm-4 price-font">
						  					<fmt:formatNumber value="${purchase.trainingPurchasePrice}" pattern="###,###"></fmt:formatNumber>
						  				</span> 
						  				</td>
						  			</tr>

						  			<tr class="table-default underline-out"  height="50px">
						  				<td class="title"  width="45%"><span class="ps-sm-4">반려동물</span></td>
						  				<td width="55%" class="content"><span class="pe-sm-4 petName"></span></td>
						  			</tr>
						  			<tr class="table-default underline-out"  height="70px">
						  				<td class="title"  width="45%"><span class="ps-sm-4">방문주소</span></td>
						  				<td width="55%" class="content">
							  				<p class="pe-sm-4">${training[0].trainingBasicAddress}</p>
							  				<p class="pe-sm-4">${training[0].trainingDetailAddress}</p>
						  				</td>
						  			</tr>
						  			<!-- 이용완료일 경우에 예약 취소 버튼 제거 -->
						  			<c:choose>
						  				<c:when test="${training[0].trainingStatus=='이용완료'}">
						  					<tr class="table-default">
								  				<td colspan="2"></td>
								  			</tr>
						  				</c:when>
						  				<c:otherwise>
						  					<tr class="table-default" height="50px">
								  				<td colspan="2">
								  					<a class="cancel-font pb-sm-2" 
								  						href="${pageContext.request.contextPath}/mypage/training_cancel?trainingNo=${training[0].trainingNo}">예약 취소
								  					</a>
								  				</td>
								  			</tr>
						  				</c:otherwise>
						  			</c:choose>
							  		
									<!-- 결제내역 -->
									<tr class="table-default"><td colspan="2"></td></tr>
						  			<tr class="table-default align-middle underline-out" height="50px">
						  				<td colspan="2" width="45%"><span class="pay-title">결제내역</span></td>
						  			</tr>
						  			<tr class="table-default align-middle underline-out"  height="50px">
						  				<td class="title"  width="45%"><span class="ps-sm-4">훈련 ${training.size()}마리</span></td>
						  				<td width="55%" class="content">
				  							<span class="pe-sm-4 ">
				  								<fmt:formatNumber value="100000" pattern="###,###"></fmt:formatNumber>
				  							</span>
						  				</td>
						  			</tr>
						  			<c:if test="${training.size() > 1}">
						  				<tr class="table-default align-middle underline-out"  height="50px">
							  				<td class="title "  width="45%">
							  					<span class="ps-sm-4">추가 요금(+</span>
							  					<span class="plus-price"></span>)
							  				</td>
							  				<td width="55%" class="content">
								  				<span class="pe-sm-4 plus-price">
								  					<fmt:formatNumber value="" pattern="###,###"></fmt:formatNumber>
								  				</span>
							  				</td>
						  				</tr>
						  			</c:if>
						  			<tr class="table-default align-middle underline-out"  height="50px">
						  				<td class="title"  width="45%"><span class="ps-sm-4">총 이용 요금</span></td>
						  				<td width="55%" class="content">
							  				<span class="pe-sm-4 price-font">
							  					<fmt:formatNumber value="${purchase.trainingPurchasePrice}" pattern="###,###"></fmt:formatNumber>
							  				</span>
						  				</td>
						  			</tr>
						  			<tr class="table-default align-middle"  height="50px">
						  				<td class="text-start pb-sm-3"  colspan="2">
						  					<span class="ps-sm-4">
						  						${purchase.trainingPurchasePayment} 결제 
						  						<fmt:formatDate value="${purchase.trainingPurchaseDate}" pattern="(yy.MM.dd)"/>
						  					</span>
						  				</td>
						  			</tr>
			  				</c:when>
			  				<c:otherwise>
			  				
			  					<!-- 예약취소일 경우 표시되는 화면 - 환불내역 -->
								<tr class="table-default"><td colspan="2"></td></tr>
					  			<tr class="table-default align-middle underline-out" height="50px">
					  				<td colspan="2" width="45%"><span class="pay-title">환불 내역</span></td>
					  			</tr>
					  			<tr class="table-default align-middle underline-out"  height="50px">
					  				<td class="title"  width="45%"><span class="ps-sm-4">훈련 ${training.size()}마리</span></td>
					  				<td width="55%" class="content">
			  							<span class="pe-sm-4">
			  								<fmt:formatNumber value="100000" pattern="###,###"></fmt:formatNumber>
			  							</span>
					  				</td>
					  			</tr>
					  			<c:if test="${training.size() > 1}">
					  				<tr class="table-default align-middle underline-out"  height="50px">
						  				<td class="title "  width="45%">
						  					<span class="ps-sm-4">추가 요금(+</span>
						  					<span class="plus-price"></span>)
						  				</td>
						  				<td width="55%" class="content">
							  				<span class="pe-sm-4 plus-price">
							  					<fmt:formatNumber value="" pattern="###,###"></fmt:formatNumber>
							  				</span>
						  				</td>
					  				</tr>
					  			</c:if>
					  			<tr class="table-default align-middle underline-out"  height="50px">
					  				<td class="title"  width="45%"><span class="ps-sm-4">총 환불 금액</span></td>
					  				<td width="55%" class="content">
						  				<span class="pe-sm-4 price-font">
						  					<fmt:formatNumber value="${purchase.trainingPurchasePrice}" pattern="###,###"></fmt:formatNumber>
						  				</span>
					  				</td>
					  			</tr>
					  			<tr class="table-default align-middle"  height="50px">
					  				<td class="text-start pb-sm-3"  colspan="2">
					  					<span class="ps-sm-4">
					  						환불 완료
					  						<fmt:formatDate value="${training[0].trainingChangeDate}" pattern="(yy.MM.dd)"/>
					  					</span>
					  				</td>
					  			</tr>
			  				</c:otherwise>
			  			</c:choose>
			  			
					</tbody>
				</table>
				
				<div class="row mt-3">
					<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center mt-3">  
						<a class="btn btn-blue" href="${pageContext.request.contextPath}/mypage/training">목록</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 정보 출력을 위한 hidden값 -->
	<input type="hidden" name="petName" value="${training[0].trainingDetailPetName}">
	<input type="hidden" name="cnt" value="${training.size()}">
	<input type="hidden" name="memberId" value="${training[0].memberId}">
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>