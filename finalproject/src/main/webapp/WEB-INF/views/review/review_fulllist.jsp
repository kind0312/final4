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
	.reviewborder{
		border-radius:10px;
		box-shadow: rgb(235 235 235) 0px 2px 12px 0px;
	}
</style>

<body>

	<div class="container-fluid" style="height:100%;">
		<div class="row text-center mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mt-150">
				<h1>이용 후기<i class="fa-solid fa-rss wifi blue"></i>
				</h1>
			</div>
		</div>
		<div class="row mt-100">
			<div class="row mt-4">
				<div class="col-xl-3 offset-xl-2 col-lg-3 offset-lg-2 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
					<h3>${reviewList.size()}개의 후기</h3>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col-md-10 offset-md-1">
					<div class="row mt-4">
						<c:forEach var="reviewDto" items="${reviewList}">
							<div class="col-xl-5 offset-xl-1 col-lg-5 offset-lg-1 col-md-10 offset-md-1 col-sm-10 offset-sm-1 mt-4 reviewborder">
								<a href="${pageContext.request.contextPath}/review/fulldetail?reviewNo=${reviewDto.reviewNo}">
								<div class="row">
									<img class="col-xl-1 offset-xl-0 col-lg-1 offset-lg-0 col-md-4 offset-md-0 col-sm-4 offset-sm-0 mt-4" src="${pageContext.request.contextPath}/download/${reviewDto.filesNo}" style="width:100px; height: 85px; border-radius: 70%;">
									<div class="col-xl-8 offset-xl-0 col-lg-8 offset-lg-0 col-md-8 offset-md-0 col-sm-8 offset-sm-0 mt-4">

									<h3 class="text-dark">${reviewDto.reviewTitle}</h3>
										<div class="row">
											<div class="col">
												<div class="star-score" data-max="5" data-rate="${reviewDto.reviewGood}"></div>
											</div>
										</div>
										<div class="row mt-3 mb-4">
											<div class="col">
												<div>
													
														<h5 class="text-primary">${reviewDto.memberId}</h5>
													
												</div>
											</div>
										</div>
									</div>
								</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-100">
            <div class="col-md-10 offset-md-1 d-flex justify-content-center">
			  <ul class="pagination">
			    <li class="page-item disabled">
			      <a class="page-link" href="review_fullist?p=${vo.firstBlock()}&${vo.parameter()}">&laquo;</a>
			    </li>
			    <li class="page-item active">
			      <a class="page-link" href="#">1</a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#">2</a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#">3</a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#">4</a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#">5</a>
			    </li>
			    <li class="page-item">
			      <a class="page-link" href="#">&raquo;</a>
			    </li>
			  </ul>
		  	</div>
		</div>
	</div>
	
	<script type="text/javascript">
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
		
// 		$(".container-fluid").infiniteScroll({
// 			  // options
// 			  path: '.pagination',
// 			  append: '.post',
// 			  history: false,
// 		});
		
		$(window).scroll(function(){
            // console.log("스크롤!");
            // console.log($(window).scrollTop(), $(window).height(), $(document).height());

            //퍼센트 = (현재스크롤위치) / (문서높이 - 창높이) * 100
            var percent = $(window).scrollTop() / ($(document).height() - $(window).height()) * 100;
            console.log(percent);

            $(".reviewborder").css("height", percent+"%");
        });
		
// 		function fulllist(){
// 			$.ajax({
// 				url:"${pageContext.request.contextPath}/rest/member/confirmcert",
// 				method:"get",
// 				data:{
// 					emailcertEmail:email,
// 					emailcertSerial:serial
// 				},
// 				success:function(resp){
// 					console.log(resp);
// 					if(resp){
// 						$("[name=memberEmail]").attr("readonly", "readonly");
// 						$("#confirm-input").attr("readonly", "readonly");
// 						validChecker.emailConfirmValid = true;
// 						emailbtn.prop("disabled", true);
// 						confirmbtn.prop("disabled", true);
// 						$(".confirmResult").removeClass("possible impossible").addClass("possible").text("인증이 완료되었습니다");
//                    		$("#confirm-input").removeClass("is-valid is-invalid able disable").addClass("is-valid").addClass("able");
// 					}
// 					else{
// 						$(".confirmResult").removeClass("possible impossible").addClass("impossible").text("인증번호 다시 확인해주세요");
//                    		$("#confirm-input").removeClass("is-valid is-invalid able disable").addClass("is-invalid").addClass("disable");
// 					}
// 				}
// 			});
// 		}
		
	</script>

</body>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>