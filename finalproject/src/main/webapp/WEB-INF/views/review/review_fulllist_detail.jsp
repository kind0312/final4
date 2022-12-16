<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareReviewList" name="title"/>
</jsp:include>
<style>
/* 	<!-- div 확인 점선 --> 1200이상 xl, 1200이하 lg, 990이하 md, 768이하 sm  */
/*   	div{ */
/*   		border: 1px dotted gray; */
/*   	} */
	.reviewborder{
		border-radius:10px;
		box-shadow: rgb(235 235 235) 0px 2px 12px 0px;
	}
</style>

<body>

	<div class="container-fluid" style="height:100%;">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>후기를 자세히 살펴보세요!</h1>
			</div>
		</div>
		<div class="row mt-100">
			<div class="row mt-4">
				<div class="col-md-10 offset-md-1">
					<div class="row mt-4">
						<div class="col-xl-10 offset-xl-1 col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-sm-10 offset-sm-1 mt-4 reviewborder">
							<div class="row">
								<img class="col-xl-2 offset-xl-1 col-lg-2 offset-lg-1 col-md-4 offset-md-0 col-sm-4 offset-sm-0 mt-4" src="${pageContext.request.contextPath}/download/${reviewDto.filesNo}" style="width:100px; height: 85px; border-radius: 70%;">
								<div class="col-xl-9 offset-xl-0 col-lg-9 offset-lg-0 col-md-8 offset-md-0 col-sm-8 offset-sm-0 mt-4">
								<h3>${reviewDto.reviewTitle}</h3>
									<div class="row">
										<div class="col">
											<div><h5 class="text-muted">${reviewDto.memberId}</h5></div>
											<div class="star-score" data-max="5" data-rate="${reviewDto.reviewGood}"></div>
										</div>
									</div>
									<div class="row mt-3 mb-4">
										<div class="col">
											<div>${reviewDto.reviewContent}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-100 mb-5">
			<div class="col" align="center">
				<a href="${pageContext.request.contextPath}/review/fulllist" class="btn btn-lg btn-outline-blue text-center">
					<i class="fa-solid fa-plus"></i>
					&nbsp;전체 후기 보기
				</a>
			</div>
		</div>
	</div>
	
	<script>
		$(function(){
			 $(".star-score").score({
	                starColor: "#81BDF1",
	                backgroundColor: "transparent", //배경 색상
	                editable: false, //점수 변경 가능 여부
	                integerOnly: false, //정수만 설정 가능 여부(false면 소수점 가능)
	                zeroAvailable:true,//0 설정 가능 여부
	                display: {
	                    showNumber: true, //설정된 숫자 표시 가능 여부(false면 숫자 off, true면 숫자 on)
	                    placeLimit: 1, //소수점 자리수 표시 길이
	                    textColor:"#81BDF1",
	                },
	                point: {
	                    max: 5,//최대 점수(data-max로 대체 가능)
	                    rate: 0,//실제 점수(data-rate로 대체 가능)
	                }
	         });
		});
	</script>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>