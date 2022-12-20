<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="CareMainPage" name="title"/>
</jsp:include>

<style>
	.carousel-caption {
	  color: #fff;
	  text-align: right;
	  margin-bottom:250px;
	}
	.btn-blue{
		padding-top:15px;
		padding-bottom:15px;
		padding-left:30px;
		padding-right:30px;
		font-size:17px;
	}
	.box-design{
		display:inline-block;
	}
	.price-info{
		background-color:#F7F8FA;
		width:100%;
		height:400px;
		padding:100px;
	}
	
	.timg{
width: 50px;
height: 50px;
margin-left: 9px;
margin-bottom: 17px;
}
</style>
<body>

	<div class="mt-4">
		<!-- 메인 슬라이더 시작 -->
		<div class="main">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">	
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${pageContext.request.contextPath}/image/main.jpg" class="d-block w-100" style="height:770px;">
						<div class="carousel-caption ">
					        <h1>훈련사가 집으로 와요</h1>
					        <a href="${pageContext.request.contextPath}/trainer/list" class="btn btn-blue mt-4">예약하기</a>
					    </div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/image/main2.jpg" class="d-block w-100" style="height:770px;">
						<div class="carousel-caption ">
					        <h1>훈련사가 집으로 와요</h1>
					        <a href="${pageContext.request.contextPath}/trainer/list" class="btn btn-blue mt-4">예약하기</a>
					    </div>
					</div>
					<div class="carousel-item">
						<img src="${pageContext.request.contextPath}/image/main3.jpg" class="d-block w-100" style="height:770px;">
						<div class="carousel-caption ">
					        <h1>훈련사가 집으로 와요</h1>
					        <a href="${pageContext.request.contextPath}/trainer/list" class="btn btn-blue mt-4">예약하기</a>
					    </div>
					</div>
				</div>
				
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- 메인 슬라이더 끝 -->
		
		
		<!-- 트레이너 정보 시작 -->
		<div class="trainer-info">
			<h2 class="mt-100 text-center">언제 어디서든 펫훈련사를 부르세요!<img src="/image/trainer.png" class="timg"></h2>
			<p class="mt-4 text-center" style="font-size:15px;">
				CarePet의 모든 훈련사는 신분증 사본, 등초본, 실제면접 몇 자격증까지 4단계로 까다롭게 신원을 검증하며,<br>
				훈련사로서 필요한 지식과 실력을 갖출 수 있도록 3주간의 교육 및 연수를 이행합니다!
            </p>
            
            <div class="trainer">
            	<div style="width:1040px; margin-left:auto; margin-right:auto;" class="mt-5">
					<!-- 후기 많은 순 트레이너 3위까지 출력(반복문 돌리기)-->
					<div>
						<c:forEach var="list" items="${trainerList}">
							<div class="box-design shadow rounded" style="margin-right:30px; border:1px solid #fff;">
								<img src="${pageContext.request.contextPath}/download/${list.filesNo}" width="310" height="170">
								<h6 style="margin-top:24px; margin-left:24px;">${list.memberName} 훈련사</h6>
								<div style="display:flex; margin-top:21px; margin-left:24px; margin-bottom:13px;">
									<div style="display:flex; flex-direction:row; align-items:center; margin-right:18px;">
										<i class="fa-solid fa-message fa-xs blue me-1"></i>
										<p style="font-size:13px; font-weight:bolder; display:inline-block;">후기<span class="blue">${list.cnt}</span>개</p>
									</div>
									<div style="display:flex; flex-direction:row; align-items:center;">
										<i class="fa-solid fa-heart fa-xs blue me-1"></i>
										<p style="font-size:13px; font-weight:bolder; display:inline-block;">찜<span class="blue">${list.trainerLike}</span>개</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
            	</div>
            	
            	<div class="text-center mt-5">
            		<a href="${pageContext.request.contextPath}/trainer/list"
            		class="btn btn-outline-blue btn-md">더 보기</a>
            	</div>
            	
            </div>
		</div>
		<!-- 트레이너 정보 끝 -->
		
		
		<!-- 요금 정보 시작 -->
		<div class="price-info mt-100 mb-3">
			<div class="text-center">
				<h2>포인트 구매 후 ‘CarePet’ 방문 서비스를 예약할 수 있어요!<img src="/image/booking.png" class="timg"></h2>
				<p class="mt-5" style="font-size:15px; colof:#4D5055;">
					<i class="fa-solid fa-check blue"></i><span style="font-weight:bolder;"> 이용 요금</span> : 하루 훈련 (₩100,000)<br>
					<i class="fa-solid fa-check blue"></i><span style="font-weight:bolder;"> 추가 요금</span> : 반려동물 추가시 추가요금이 발생할 수 있습니다(1마리 추가 시 ₩50,000)
	            </p>
	            
	            <a class="btn btn-yellow btn-md mt-5" 
	            	href="${pageContext.request.contextPath}/pay/point_select">포인트 구매 바로가기</a>
			</div>
 
		</div>
		<!-- 요금 정보 끝 -->
		
	</div>  
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>