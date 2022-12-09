<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약 취소" name="title"/>
</jsp:include>

<style>
	.img-circle{
		border-radius: 70%;
	   	border:none;
	   	background-color:#81BDF1;
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
		//취소버튼 클릭시 모달창 표시
		$(".cancel-btn").click(function(){
			$('#btn-modal').modal('show');
		});
		
		//모달 안에 확인 버튼 클릭 시 submit 전송
		$(".confirm-btn").click(function(){
			this.submit();
		});
		
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
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">찜관리</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">후기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">정보수정</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link mypage-nav" href="${pageContext.request.contextPath}/#">펫시터로 전환</a>
	        </li>
     	 </ul>
    	</div>
  	</div>
</nav>
	
	<div class="container-fluid">
		<div class="row mt-80">
			<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2">
				<div class="text-center">
					<h3>예약 취소 신청</h3>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 ">   
				<table class="table point-table text-center">
					<tbody>
						<tr class="table-default"><td colspan="3"></td></tr>
						<!-- 예약 상세 내역 -->
						<tr class="table-default"><td colspan="2"></td></tr>
			  			<tr class="table-default underline-out" height="60px">
			  				<td class="title pt-sm-3" width="45%"><span class="ps-sm-4">날짜</span></td>
			  				<td width="55%" class="content pt-sm-3">
			  					<fmt:formatDate value="${training.trainingDate}" pattern="yyyy-MM-dd (E)"/>
			  					<span class="pe-sm-4">${training.trainingStartTime}</span>
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
			  				<td width="55%" class="content"><span class="pe-sm-4">${petName}</span></td>
			  			</tr>
			  			<tr class="table-default"  height="70px">
			  				<td class="title"  width="45%"><span class="ps-sm-4">방문주소</span></td>
			  				<td width="55%" class="content">
				  				<p class="pe-sm-4">${training.trainingBasicAddress}</p>
				  				<p class="pe-sm-4">${training.trainingDetailAddress}</p>
			  				</td>
			  			</tr>
			  				
						<tr class="table-default"><td colspan="2"></td></tr>
			  			<tr class="table-default align-middle underline-out" height="50px">
			  				<td colspan="2" width="45%"><span class="pay-title">환불 내역</span></td>
			  			</tr>
			  			<tr class="table-default align-middle underline-out"  height="50px">
			  				<td class="title"  width="45%"><span class="ps-sm-4">훈련 ${petCount}마리</span></td>
			  				<td width="55%" class="content">
			  					<c:choose>
			  						<c:when test="${petCount>1}">
			  							<span class="pe-sm-4">
			  								<fmt:formatNumber value="${purchase.trainingPurchasePrice-10000}" pattern="###,###"></fmt:formatNumber>
			  							</span>
			  						</c:when>
			  						<c:otherwise>
			  							<span class="pe-sm-4">
			  								<fmt:formatNumber value="${purchase.trainingPurchasePrice}" pattern="###,###"></fmt:formatNumber>
			  							</span>
			  						</c:otherwise>
			  					</c:choose>
			  				</td>
			  			</tr>
			  			<c:if test="${petCount > 1}">
			  				<tr class="table-default align-middle underline-out"  height="50px">
				  				<td class="title"  width="45%"><span class="ps-sm-4">추가 요금(+${(petCount-1)*10000})</span></td>
				  				<td width="55%" class="content">
					  				<span class="pe-sm-4">
									  	<fmt:formatNumber value="${(petCount-1)*10000}" pattern="###,###"></fmt:formatNumber>
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
			  					<span class="ps-sm-4">위 금액은 포인트로 환불됩니다.	</span>
			  				</td>
			  			</tr>
					</tbody>
				</table>
				
				<!-- form 전송을 위한 값 준비 -->
				<form action="/mypage/training_cancel" method="post">
					<div class="row mt-3">
						<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center mt-3">
							<input type="hidden" name="trainingNo" value="${training.trainingNo}">  
							<input type="hidden" name="trainingDetailPetName" value="${petName}">
							<button type="button" class="btn btn-blue cancel-btn" data-toggle="modal" data-target="#btn-modal">취소</button>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="btn-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">예약 취소 확인</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      
					      <!-- 예약 확정/대기 모달문구 다르게 표시 -->
					      <c:choose>
					      	<c:when test="${training.trainingStatus=='예약확정'}">
					      		<div class="modal-body">
						        	<p>예약 확정 상태입니다. 취소하시겠습니까?</p>
						      	</div>
					      	</c:when>
					      	<c:otherwise>
					      		<div class="modal-body">
						        	<p>예약 대기 상태입니다. 취소하시겠습니까?</p>
						      	</div>
					      	</c:otherwise>
					      </c:choose>
					      
					      <div class="modal-footer">
					      	<button type="submit" class="btn btn-blue confirm-btn">확인</button>
					        <button type="button" class="btn btn-yellow close-btn" data-bs-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>