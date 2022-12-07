<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약 상세" name="title"/>
</jsp:include>

<style>
	.training-table {
	    border-top:1px solid rgba(0, 0, 0, 0.1);
	    height:130px;
	}
	.training-zero-font{
		color:#303030;
		font-size:15px;
	}
	.training-btn{
		background-color:#fff;
		border:none;
		font-weight:bolder;
		color:#303030;
		margin:0 4.5rem;
		font-size:19px;
	}
	.unselect-btn{
		color:#7B7B7B;
	}
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
</style>

<script>
	$(function(){
		//시작시 진행예약화면 고정
		ingClick();
		
		//진행 예약 버튼 이벤트
		$(".ing-btn").click(function(){
			ingClick();
		});
		
		//지난 예약 버튼 이벤트
		$(".end-btn").click(function(){
			endClick();
		});

	function ingClick(){
		//버튼 색상 변경
		$(".end-btn").removeClass("unselect-btn");
		$(".ing-btn").removeClass("unselect-btn");
		$(".end-btn").addClass("unselect-btn");
		//진행 예약만 출력
		$(".training-end").children().hide();
		$(".training-ing").children().show();
	}
	
	function endClick(){
		//버튼 색상 변경
		$(".ing-btn").removeClass("unselect-btn");
		$(".end-btn").removeClass("unselect-btn");
		$(".ing-btn").addClass("unselect-btn");
		//지난 예약만 출력
		$(".training-end").children().show();
		$(".training-ing").children().hide();
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
					<h3>예약 상세</h3>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-6 offset-md-3 col-sm-8 offset-sm-2 ">   
				<table class="table table-hover point-table text-center">
					<tbody>
						<tr class="table-default"><td colspan="3"></td></tr>
						<!-- 예약이 없으면 표시 -->
						<tr class="table-default align-middle">
			  				<td colspan="2" height="200px">
			  					<div class="mt-3">
			  						<img src=# class="img-circle" width="100" height="100">
			  					</div>
			  					<div class="mt-4">
			  						<c:choose>
			  							<c:when test="${training.trainingStatus=='예약대기'}">
			  								<span>훈련사 님의 승인을 기다리고 있습니다.</span>
			  							</c:when>
			  							<c:otherwise>
			  								<span>훈련사 님이 방문 예정입니다.</span>
			  							</c:otherwise>
			  						</c:choose>
			  					</div>
			  					<div class="mt-4 mb-3">
				  					<a href="#" class="btn btn-blue">프로필 보기</a>
				  					<a href="#" class="btn btn-yellow">연락 하기</a>
			  					</div>
			  				</td>
			  			</tr>

			  			<!-- 상세내역(+예약취소버튼) -->
			  			<tr class="table-default"><td colspan="2"></td></tr>
			  			<tr class="table-default underline-out" height="60px">
			  				<td class="title pt-sm-3" width="45%"><span class="ps-sm-4">날짜</span></td>
			  				<td width="55%" class="content pe-sm-4 pt-sm-3">
			  					<fmt:formatDate value="${training.trainingDate}" pattern="yyyy-MM-dd (E)"/>
			  					<span>${training.trainingStartTime}</span>
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
			  			<tr class="table-default underline-out"  height="70px">
			  				<td class="title"  width="45%"><span class="ps-sm-4">방문주소</span></td>
			  				<td width="55%" class="content">
				  				<p class="pe-sm-4">${training.trainingBasicAddress}</p>
				  				<p class="pe-sm-4">${training.trainingDetailAddress}</p>
			  				</td>
			  			</tr>
			  			<tr class="table-default" height="50px">
			  				<td colspan="2"><span class="cancel-font pb-sm-2">예약 취소</span></td>
			  			</tr>
			  			
						<!-- 결제내역 -->
						<tr class="table-default"><td colspan="2"></td></tr>
			  			<tr class="table-default align-middle underline-out" height="50px">
			  				<td colspan="2" width="45%"><span class="pay-title">결제내역</span></td>
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
				  				<td class="title"  width="45%"><span class="ps-sm-4">추가 요금(+10,000)</span></td>
				  				<td width="55%" class="content"><span class="pe-sm-4">10,000</span></td>
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
			  				<td class="text-start"  colspan="2">
			  					<span class="ps-sm-4">
			  						${purchase.trainingPurchasePayment} 결제 
			  						<fmt:formatDate value="${purchase.trainingPurchaseDate}" pattern="(yy.MM.dd)"/>
			  					</span>
			  				</td>
			  			</tr>
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

</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>