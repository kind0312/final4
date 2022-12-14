<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="CareReviewList" name="title"/>
</jsp:include>
<style>
	.wifi{
		vertical-align:super;
	}
/* 	<!-- div 확인 점선 --> 1200이상 xl, 1200이하 lg, 990이하 md, 768이하 sm  */
/*   	div{ */
/*   		border: 1px dotted gray; */
/*   	} */
/* 	<!-- 별점 공백 없애는 스타일 --> 0.0.6 사용으로 더이상 사용 X */
/* 	.star-score { */
/* 		white-space: nowrap; */
/* 	} */

</style>
<body>

	<div class="container-fluid" style="height:100%;">
		<div class="row text-center mt-100">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>이용 후기<i class="fa-solid fa-rss wifi blue"></i>
				</h1>
			</div>
		</div>
		<div class="row mt-100">
			<div class="row mt-4">
				<div class="col-xl-3 offset-xl-3 col-lg-3 offset-lg-3 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<h3>${reviewList.size()}개의 후기</h3>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-md-8 offset-md-3">
					<div class="row mt-4">
						<c:forEach var="reviewDto" items="${reviewList}">
							<div>
							<div class="col-xl-1 offset-xl-0 col-lg-1 offset-lg-0 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
								<img src="${pageContext.request.contextPath}/download/${reviewDto.filesNo}" style="width:75px; height: 75px; border-radius: 70%;">
							</div>
							<div class="col-xl-4 offset-xl-0 col-lg-4 offset-lg-0 col-md-6 offset-md-4 col-sm-8 offset-sm-4">
								<h3>${reviewDto.memberId}</h3>
								<div class="row">
									<div class="col">
										<div class="star-score" data-max="5" data-rate="${reviewDto.reviewGood}"></div>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<p class="card-text">${reviewDto.reviewContent}</p>
									</div>
								</div>
							</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-100 mb-5">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 text-center">
			<a href="${pageContext.request.contextPath}/" class="btn btn-blue btn-md">홈으로</a>
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
<%-- <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include> --%>